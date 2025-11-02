<?php
/**
 * Price Estimation Endpoint using Python Linear Regression
 * This PHP script interfaces with the Python linear regression model
 */

session_start();
header('Content-Type: application/json');

// Enable error reporting for debugging (disable in production)
ini_set('display_errors', 0);
error_reporting(E_ALL);

// Check if user is logged in (optional - remove if not needed)
// if (!isset($_SESSION['logged_in']) || $_SESSION['logged_in'] !== true) {
//     echo json_encode(['success' => false, 'message' => 'Not authenticated']);
//     exit;
// }

try {
    // Check if request method is POST
    if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
        throw new Exception('Invalid request method. Use POST.');
    }
    
    // Get POST data
    $input = json_decode(file_get_contents('php://input'), true);
    
    // Validate input
    if (!isset($input['current_price']) || !isset($input['property_size'])) {
        throw new Exception('Missing required parameters: current_price and property_size');
    }
    
    $current_price = floatval($input['current_price']);
    $property_size = floatval($input['property_size']);
    
    // Additional property information (for report generation)
    $property_name = isset($input['name']) ? $input['name'] : '';
    $property_address = isset($input['address']) ? $input['address'] : '';
    
    // Validate numerical inputs
    if ($current_price <= 0 || $property_size <= 0) {
        throw new Exception('Price and size must be positive numbers');
    }
    
    // Path to Python executable and script
    // For Windows XAMPP, you might need to use the full path to python.exe
    // Example: C:\\Python39\\python.exe
    $python_path = 'python'; // or 'python3' on Linux/Mac
    
    // Path to the Python script (adjust this path as needed)
    $script_path = __DIR__ . '/python/linear_regression.py';
    
    // Check if Python script exists
    if (!file_exists($script_path)) {
        throw new Exception('Python script not found. Please ensure linear_regression.py is in the python/ directory');
    }
    
    // Prepare command with escaped arguments
    $command = sprintf(
        '%s %s %f %f 2>&1',
        $python_path,
        escapeshellarg($script_path),
        $current_price,
        $property_size
    );
    
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
    
    // Add property information to result
    $result['property_info'] = [
        'name' => $property_name,
        'address' => $property_address,
        'size' => $property_size,
        'current_price' => $current_price
    ];
    
    // Log estimation for analytics (optional)
    logEstimation($result);
    
    // Return successful response
    echo json_encode($result);
    
} catch (Exception $e) {
    // Return error response
    $error_response = [
        'success' => false,
        'message' => $e->getMessage(),
        'error' => true
    ];
    
    // Log error for debugging
    error_log('Estimation Error: ' . $e->getMessage());
    
    http_response_code(400);
    echo json_encode($error_response);
}

/**
 * Optional: Log estimation data for analytics
 */
function logEstimation($data) {
    try {
        $log_file = __DIR__ . '/logs/estimations.log';
        $log_dir = dirname($log_file);
        
        // Create log directory if it doesn't exist
        if (!is_dir($log_dir)) {
            mkdir($log_dir, 0777, true);
        }
        
        $log_entry = [
            'timestamp' => date('Y-m-d H:i:s'),
            'property_name' => $data['property_info']['name'] ?? '',
            'current_price' => $data['estimation']['current_price'],
            'estimated_price' => $data['estimation']['estimated_price'],
            'profit_projection' => $data['estimation']['profit_projection'],
            'percentage_growth' => $data['estimation']['percentage_growth'],
            'confidence_score' => $data['estimation']['confidence_score']
        ];
        
        // Append to log file
        file_put_contents(
            $log_file,
            json_encode($log_entry) . PHP_EOL,
            FILE_APPEND | LOCK_EX
        );
        
    } catch (Exception $e) {
        // Silently fail - logging shouldn't break the main functionality
        error_log('Failed to log estimation: ' . $e->getMessage());
    }
}
?>