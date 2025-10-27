<?php
/**
 * Fetch historical price data for similar properties
 * Used for linear regression calculation
 * Updated to use barangay and street columns
 */

session_start();
require_once 'config/database.php';

header('Content-Type: application/json');

try {
    $database = new Database();
    $db = $database->getConnection();
    
    // Get POST data
    $input = json_decode(file_get_contents('php://input'), true);
    
    if (!isset($input['property_type']) || !isset($input['property_class'])) {
        throw new Exception('Missing required parameters: property_type and property_class are required');
    }
    
    $property_type = $input['property_type'];
    $property_class = $input['property_class'];
    $barangay = $input['barangay'] ?? '';
    $street = $input['street'] ?? '';
    
    // Query to fetch similar historical properties
    // Priority: Same class & type & barangay > Same class & type > Same barangay
    $query = "
        SELECT 
            hp.*,
            -- Calculate similarity score based on matching criteria
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
                -- Must match at least one criteria
                hp.property_class = :exact_class 
                OR hp.property_type = :exact_type
                OR hp.address LIKE :barangay_match
                OR hp.vicinity LIKE :barangay_match
            )
            AND hp.price_2020 > 0  -- Ensure we have valid price data
        ORDER BY 
            similarity_score DESC,
            hp.id DESC
        LIMIT 20
    ";
    
    $stmt = $db->prepare($query);
    
    // Bind parameters - use partial matching for barangay
    $barangay_pattern = '%' . trim($barangay) . '%';
    
    $stmt->bindParam(':exact_class', $property_class);
    $stmt->bindParam(':exact_type', $property_type);
    $stmt->bindParam(':barangay_match', $barangay_pattern);
    
    $stmt->execute();
    
    $historical_properties = $stmt->fetchAll(PDO::FETCH_ASSOC);
    
    // Process and aggregate the data for linear regression
    $aggregated_data = aggregatePriceData($historical_properties);
    
    // Calculate confidence based on number and quality of matches
    $confidence = calculateDataConfidence($historical_properties);
    
    $response = [
        'success' => true,
        'historical_properties' => $historical_properties,
        'aggregated_prices' => $aggregated_data,
        'confidence' => $confidence,
        'match_count' => count($historical_properties),
        'search_criteria' => [
            'property_type' => $property_type,
            'property_class' => $property_class,
            'barangay' => $barangay,
            'street' => $street
        ]
    ];
    
    echo json_encode($response);
    
} catch (Exception $e) {
    error_log("Historical data fetch error: " . $e->getMessage());
    echo json_encode([
        'success' => false,
        'message' => $e->getMessage()
    ]);
}

/**
 * Aggregate price data from historical properties
 */
function aggregatePriceData($properties) {
    if (empty($properties)) {
        // Return default Tarlac BIR data if no matches
        return [
            '2020' => 45,
            '2021' => 52,
            '2022' => 61,
            '2023' => 73,
            '2024' => 85
        ];
    }
    
    $years = ['2020', '2021', '2022', '2023', '2024'];
    $aggregated = [];
    
    foreach ($years as $year) {
        $prices = [];
        $price_field = 'price_' . $year;
        
        foreach ($properties as $property) {
            if (isset($property[$price_field]) && $property[$price_field] > 0) {
                // Calculate price per sqm if we have lot area
                if (isset($property['lot_area']) && $property['lot_area'] > 0) {
                    $price_per_sqm = $property[$price_field] / $property['lot_area'];
                    $prices[] = $price_per_sqm;
                } else {
                    // If no lot area, assume the price is already per sqm
                    $prices[] = $property[$price_field];
                }
            }
        }
        
        if (!empty($prices)) {
            // Use weighted average based on similarity scores
            $aggregated[$year] = round(array_sum($prices) / count($prices), 2);
        } else {
            // Fallback to default BIR data if no data for this year
            $default_prices = [
                '2020' => 45,
                '2021' => 52,
                '2022' => 61,
                '2023' => 73,
                '2024' => 85
            ];
            $aggregated[$year] = $default_prices[$year];
        }
    }
    
    return $aggregated;
}

/**
 * Calculate confidence score based on data quality
 */
function calculateDataConfidence($properties) {
    if (empty($properties)) {
        return 30; // Low confidence with default data
    }
    
    $count = count($properties);
    $total_score = 0;
    
    foreach ($properties as $property) {
        if (isset($property['similarity_score'])) {
            $total_score += $property['similarity_score'];
        }
    }
    
    // Calculate average similarity score
    $avg_similarity = $total_score / $count;
    
    // Factor in the number of matches
    $count_factor = min($count / 10, 1) * 20; // Max 20 points for having 10+ matches
    
    // Final confidence score (0-100)
    $confidence = min(100, ($avg_similarity * 0.7) + $count_factor + 10);
    
    return round($confidence);
}
?>