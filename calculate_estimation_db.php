<?php
/**
 * Price Estimation Endpoint using Python Linear Regression with Database Historical Data
 * This PHP script fetches similar properties from the database and passes the data to Python
 * Updated to use barangay and street columns
 */

session_start();
require_once 'config/database.php';

header('Content-Type: application/json');

// Enable error reporting for debugging (disable in production)
ini_set('display_errors', 0);
error_reporting(E_ALL);

try {
    // Check if request method is POST
    if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
        throw new Exception('Invalid request method. Use POST.');
    }
    
    $database = new Database();
    $db = $database->getConnection();
    
    // Get POST data
    $input = json_decode(file_get_contents('php://input'), true);
    
    // Validate input
    if (!isset($input['current_price']) || !isset($input['property_size'])) {
        throw new Exception('Missing required parameters: current_price and property_size');
    }
    
    $current_price = floatval($input['current_price']);
    $property_size = floatval($input['property_size']);
    $property_name = isset($input['name']) ? $input['name'] : '';
    $property_barangay = isset($input['barangay']) ? $input['barangay'] : '';
    $property_street = isset($input['street']) ? $input['street'] : '';
    $property_type = isset($input['property_type']) ? $input['property_type'] : '';
    $property_class = isset($input['property_class']) ? $input['property_class'] : '';
    
    // Validate numerical inputs
    if ($current_price <= 0 || $property_size <= 0) {
        throw new Exception('Price and size must be positive numbers');
    }
    
    // Step 1: Fetch historical data from database for similar properties
    $historical_data = fetchHistoricalData($db, $property_type, $property_class, $property_barangay);
    
    // Step 2: Prepare Python command with historical data
    $python_path = 'python'; // or 'python3' on Linux/Mac, or full path on Windows
    $script_path = __DIR__ . '/python/linear_regression_db.py';
    
    // Check if Python script exists
    if (!file_exists($script_path)) {
        throw new Exception('Python script not found. Please ensure linear_regression_db.py is in the python/ directory');
    }
    
    // Prepare command with escaped arguments
    if (!empty($historical_data['aggregated_prices'])) {
        // Pass historical data as JSON string
        $historical_json = json_encode($historical_data['aggregated_prices']);
        $command = sprintf(
            '%s %s %f %f %s 2>&1',
            $python_path,
            escapeshellarg($script_path),
            $current_price,
            $property_size,
            escapeshellarg($historical_json)
        );
    } else {
        // No historical data, Python will use defaults
        $command = sprintf(
            '%s %s %f %f 2>&1',
            $python_path,
            escapeshellarg($script_path),
            $current_price,
            $property_size
        );
    }
    
    // Execute Python script
    $output = shell_exec($command);
    
    if ($output === null) {
        throw new Exception('Failed to execute Python script. Please ensure Python is installed and accessible.');
    }
    
    // Parse Python output
    $result = json_decode($output, true);
    
    if (json_last_error() !== JSON_ERROR_NONE) {
        throw new Exception('Invalid response from Python script: ' . $output);
    }
    
    // Check if Python script returned an error
    if (!$result['success']) {
        throw new Exception($result['message'] ?? 'Calculation failed');
    }
    
    // Build full address from street, barangay
    $address_parts = array_filter([$property_street, $property_barangay]);
    $full_address = implode(', ', $address_parts);
    
    // Add property information to result
    $result['property_info'] = [
        'name' => $property_name,
        'address' => $full_address,
        'barangay' => $property_barangay,
        'street' => $property_street,
        'type' => $property_type,
        'class' => $property_class,
        'size' => $property_size,
        'current_price' => $current_price
    ];
    
    // Add database match information
    $result['data_quality'] = [
        'source' => $historical_data['source'] ?? 'default',
        'matches_found' => $historical_data['match_count'] ?? 0,
        'confidence' => $historical_data['confidence'] ?? 50,
        'similar_properties' => $historical_data['property_count'] ?? 0
    ];
    
    // Log estimation for analytics
    logEstimation($db, $result);
    
    // Return successful response
    echo json_encode($result);
    
} catch (Exception $e) {
    // Return error response
    $error_response = [
        'success' => false,
        'message' => $e->getMessage(),
        'error' => true
    ];
    
    error_log('Estimation Error: ' . $e->getMessage());
    
    http_response_code(400);
    echo json_encode($error_response);
}

/**
 * Fetch historical data from database for similar properties
 * Updated to use barangay instead of address
 */
function fetchHistoricalData($db, $property_type, $property_class, $barangay) {
    try {
        // Query to fetch similar historical properties
        $query = "
            SELECT 
                hp.*,
                CASE 
                    WHEN hp.property_class = :exact_class 
                        AND hp.property_type = :exact_type 
                        AND (hp.address LIKE :barangay_match OR hp.vicinity LIKE :barangay_match) THEN 100
                    WHEN hp.property_class = :exact_class 
                        AND hp.property_type = :exact_type THEN 80
                    WHEN hp.property_class = :exact_class 
                        AND (hp.address LIKE :barangay_match OR hp.vicinity LIKE :barangay_match) THEN 70
                    WHEN hp.property_type = :exact_type 
                        AND (hp.address LIKE :barangay_match OR hp.vicinity LIKE :barangay_match) THEN 70
                    WHEN hp.address LIKE :barangay_match OR hp.vicinity LIKE :barangay_match THEN 60
                    WHEN hp.property_class = :exact_class THEN 50
                    WHEN hp.property_type = :exact_type THEN 40
                    ELSE 30
                END as similarity_score
            FROM 
                `historical_price_2020-2024` hp
            WHERE 
                (
                    hp.property_class = :exact_class 
                    OR hp.property_type = :exact_type
                    OR hp.address LIKE :barangay_match
                    OR hp.vicinity LIKE :barangay_match
                )
                AND hp.price_2020 > 0
            ORDER BY 
                similarity_score DESC,
                hp.id DESC
            LIMIT 20
        ";
        
        $stmt = $db->prepare($query);
        
        // Bind parameters
        $barangay_pattern = '%' . trim($barangay) . '%';
        
        $stmt->bindParam(':exact_class', $property_class);
        $stmt->bindParam(':exact_type', $property_type);
        $stmt->bindParam(':barangay_match', $barangay_pattern);
        
        $stmt->execute();
        
        $historical_properties = $stmt->fetchAll(PDO::FETCH_ASSOC);
        
        // Aggregate price data
        $aggregated = aggregatePriceData($historical_properties);
        
        // Calculate confidence
        $confidence = calculateDataConfidence($historical_properties);
        
        return [
            'aggregated_prices' => $aggregated,
            'match_count' => count($historical_properties),
            'property_count' => count($historical_properties),
            'confidence' => $confidence,
            'source' => count($historical_properties) > 0 ? 'database' : 'default'
        ];
        
    } catch (Exception $e) {
        error_log("Failed to fetch historical data: " . $e->getMessage());
        // Return empty array on failure (Python will use defaults)
        return [
            'aggregated_prices' => [],
            'match_count' => 0,
            'property_count' => 0,
            'confidence' => 30,
            'source' => 'default'
        ];
    }
}

/**
 * Aggregate price data from historical properties
 */
function aggregatePriceData($properties) {
    if (empty($properties)) {
        return [];
    }
    
    $years = ['2020', '2021', '2022', '2023', '2024'];
    $aggregated = [];
    
    foreach ($years as $year) {
        $prices = [];
        $weighted_prices = [];
        $weights = [];
        $price_field = 'price_' . $year;
        
        foreach ($properties as $property) {
            if (isset($property[$price_field]) && $property[$price_field] > 0) {
                // Calculate price per sqm if we have lot area
                if (isset($property['lot_area']) && $property['lot_area'] > 0) {
                    $price_per_sqm = $property[$price_field] / $property['lot_area'];
                } else {
                    // If no lot area, assume the price is already per sqm
                    $price_per_sqm = $property[$price_field];
                }
                
                // Use similarity score as weight if available
                $weight = isset($property['similarity_score']) ? $property['similarity_score'] / 100 : 1;
                
                $weighted_prices[] = $price_per_sqm * $weight;
                $weights[] = $weight;
                $prices[] = $price_per_sqm;
            }
        }
        
        if (!empty($weighted_prices)) {
            // Calculate weighted average
            $weighted_avg = array_sum($weighted_prices) / array_sum($weights);
            $aggregated[$year] = round($weighted_avg, 2);
        }
    }
    
    return $aggregated;
}

/**
 * Calculate confidence score based on data quality
 */
function calculateDataConfidence($properties) {
    if (empty($properties)) {
        return 30;
    }
    
    $count = count($properties);
    $total_score = 0;
    $data_completeness = 0;
    
    foreach ($properties as $property) {
        if (isset($property['similarity_score'])) {
            $total_score += $property['similarity_score'];
        }
        
        // Check data completeness
        $complete_years = 0;
        for ($year = 2020; $year <= 2024; $year++) {
            if (isset($property['price_' . $year]) && $property['price_' . $year] > 0) {
                $complete_years++;
            }
        }
        $data_completeness += ($complete_years / 5);
    }
    
    // Calculate average similarity score
    $avg_similarity = $total_score / $count;
    
    // Calculate data completeness percentage
    $avg_completeness = ($data_completeness / $count) * 100;
    
    // Factor in the number of matches
    $count_factor = min($count / 10, 1) * 20;
    
    // Final confidence score
    $confidence = ($avg_similarity * 0.5) + ($avg_completeness * 0.3) + $count_factor;
    
    return round(min(100, max(30, $confidence)));
}

/**
 * Log estimation for analytics
 * Updated to use barangay and street
 */
function logEstimation($db, $data) {
    try {
        // Build full address from street and barangay
        $address_parts = array_filter([
            $data['property_info']['street'] ?? '',
            $data['property_info']['barangay'] ?? ''
        ]);
        $full_address = implode(', ', $address_parts);
        
        $query = "INSERT INTO estimation_logs 
                  (property_name, property_address, property_type, property_class, 
                   current_price, estimated_price, profit_projection, percentage_growth, 
                   confidence_score, data_source, created_at) 
                  VALUES 
                  (:name, :address, :type, :class, :current, :estimated, 
                   :profit, :growth, :confidence, :source, NOW())";
        
        $stmt = $db->prepare($query);
        
        $stmt->bindParam(':name', $data['property_info']['name']);
        $stmt->bindParam(':address', $full_address);
        $stmt->bindParam(':type', $data['property_info']['type']);
        $stmt->bindParam(':class', $data['property_info']['class']);
        $stmt->bindParam(':current', $data['estimation']['current_price']);
        $stmt->bindParam(':estimated', $data['estimation']['estimated_price']);
        $stmt->bindParam(':profit', $data['estimation']['profit_projection']);
        $stmt->bindParam(':growth', $data['estimation']['percentage_growth']);
        $stmt->bindParam(':confidence', $data['estimation']['confidence_score']);
        $stmt->bindParam(':source', $data['data_quality']['source']);
        
        $stmt->execute();
        
    } catch (Exception $e) {
        // Silently fail - logging shouldn't break the main functionality
        error_log('Failed to log estimation: ' . $e->getMessage());
    }
}
?>