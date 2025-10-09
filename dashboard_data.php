<?php
session_start();
require_once 'config/database.php';

// Check if user is logged in
if (!isset($_SESSION['logged_in']) || $_SESSION['logged_in'] !== true) {
    header('Location: index.html');
    exit;
}

// Set content type to JSON
header('Content-Type: application/json');

try {
    // Get database connection
    $database = new Database();
    $db = $database->getConnection();
    
    // Get current user data
    $user_id = $_SESSION['user_id'];
    $query = "SELECT first_name, last_name, email, user_type FROM users WHERE id = :user_id";
    $stmt = $db->prepare($query);
    $stmt->bindParam(':user_id', $user_id);
    $stmt->execute();
    
    $user = $stmt->fetch();
    
    if (!$user) {
        session_destroy();
        echo json_encode(['success' => false, 'message' => 'User not found', 'redirect' => 'index.html']);
        exit;
    }
    
    // Return user data for dashboard
    echo json_encode([
        'success' => true,
        'user' => [
            'id' => $user_id,
            'name' => $user['first_name'] . ' ' . $user['last_name'],
            'email' => $user['email'],
            'type' => $user['user_type']
        ]
    ]);
    
} catch (Exception $e) {
    error_log("Dashboard error: " . $e->getMessage());
    echo json_encode(['success' => false, 'message' => 'An error occurred']);
}
?>