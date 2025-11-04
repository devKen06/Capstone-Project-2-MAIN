<?php
/**
 * Get User Settings Data
 * Returns user information for the settings page
 */

session_start();
require_once 'config/database.php';

header('Content-Type: application/json');

// Check if user is logged in
if (!isset($_SESSION['logged_in']) || $_SESSION['logged_in'] !== true) {
    echo json_encode(['success' => false, 'message' => 'Not authenticated']);
    exit;
}

try {
    $database = new Database();
    $db = $database->getConnection();
    
    $user_id = $_SESSION['user_id'];
    
    // Get user data
    $query = "SELECT id, email, first_name, last_name, contact_number, user_type, gender, language, created_at 
              FROM users 
              WHERE id = :user_id AND is_active = 1";
    $stmt = $db->prepare($query);
    $stmt->bindParam(':user_id', $user_id);
    $stmt->execute();
    
    $user = $stmt->fetch(PDO::FETCH_ASSOC);
    
    if (!$user) {
        echo json_encode(['success' => false, 'message' => 'User not found']);
        exit;
    }
    
    // Format user data
    $user_data = [
        'id' => $user['id'],
        'email' => $user['email'],
        'first_name' => ucwords(strtolower($user['first_name'])),
        'last_name' => ucwords(strtolower($user['last_name'])),
        'full_name' => ucwords(strtolower($user['first_name'])) . ' ' . ucwords(strtolower($user['last_name'])),
        'contact_number' => $user['contact_number'] ?: 'Not provided',
        'user_type' => ucfirst($user['user_type']),
        'gender' => $user['gender'] ?? 'Not specified',
        'language' => $user['language'] ?? 'English - United States',
        'member_since' => date('F Y', strtotime($user['created_at']))
    ];
    
    echo json_encode([
        'success' => true,
        'user' => $user_data
    ]);
    
} catch (Exception $e) {
    error_log("Get user settings error: " . $e->getMessage());
    echo json_encode([
        'success' => false,
        'message' => 'An error occurred while loading settings'
    ]);
}
?>