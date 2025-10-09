<?php
session_start();
require_once 'config/database.php';

// Check if user is logged in
if (!isset($_SESSION['logged_in']) || $_SESSION['logged_in'] !== true) {
    echo json_encode(['success' => false, 'message' => 'Not authenticated']);
    exit;
}

header('Content-Type: application/json');

try {
    $database = new Database();
    $db = $database->getConnection();
    
    $agent_id = $_SESSION['user_id'];
    
    // Handle POST request (Add new property)
    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        // Get form data - REMOVED: property_title, listing_type, parking_spaces, furnished
        $description = trim($_POST['description'] ?? '');
        $address = trim($_POST['address'] ?? '');
        $city = trim($_POST['city'] ?? '');
        $province = trim($_POST['province'] ?? '');
        $price = $_POST['price'] ?? null;
        $property_type = trim($_POST['property_type'] ?? '');
        $bedrooms = $_POST['bedrooms'] ?? null;
        $bathrooms = $_POST['bathrooms'] ?? null;
        $floor_area = $_POST['floor_area'] ?? null;
        $lot_area = $_POST['lot_area'] ?? null;
        $owner_name = trim($_POST['owner_name'] ?? '');
        $contact_number = trim($_POST['contact_number'] ?? '');
        $email = trim($_POST['email'] ?? '');
        $status = trim($_POST['status'] ?? 'New Lead');
        
        // Validate required fields
        $errors = [];
        if (empty($address)) $errors[] = 'Address is required';
        if (empty($city)) $errors[] = 'City is required';
        if (empty($province)) $errors[] = 'Province is required';
        if (empty($price) || $price <= 0) $errors[] = 'Valid price is required';
        if (empty($property_type)) $errors[] = 'Property type is required';
        if (empty($owner_name)) $errors[] = 'Owner name is required';
        if (empty($contact_number)) $errors[] = 'Contact number is required';
        if (empty($email)) $errors[] = 'Email is required';
        
        if (!empty($errors)) {
            echo json_encode(['success' => false, 'message' => implode(', ', $errors)]);
            exit;
        }
        
        // Validate email format
        if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
            echo json_encode(['success' => false, 'message' => 'Invalid email format']);
            exit;
        }
        
        // Convert empty strings to null for numeric fields
        $bedrooms = $bedrooms === '' ? null : $bedrooms;
        $bathrooms = $bathrooms === '' ? null : $bathrooms;
        $floor_area = $floor_area === '' ? null : $floor_area;
        $lot_area = $lot_area === '' ? null : $lot_area;
        
        // Insert property - REMOVED: property_title, listing_type, parking_spaces, furnished
        $query = "INSERT INTO properties (
            agent_id, description, address, city, province, price, 
            property_type, bedrooms, bathrooms, floor_area, lot_area, 
            owner_name, contact_number, email, status
        ) VALUES (
            :agent_id, :description, :address, :city, :province, :price,
            :property_type, :bedrooms, :bathrooms, :floor_area, :lot_area,
            :owner_name, :contact_number, :email, :status
        )";
        
        $stmt = $db->prepare($query);
        $stmt->bindParam(':agent_id', $agent_id);
        $stmt->bindParam(':description', $description);
        $stmt->bindParam(':address', $address);
        $stmt->bindParam(':city', $city);
        $stmt->bindParam(':province', $province);
        $stmt->bindParam(':price', $price);
        $stmt->bindParam(':property_type', $property_type);
        $stmt->bindParam(':bedrooms', $bedrooms);
        $stmt->bindParam(':bathrooms', $bathrooms);
        $stmt->bindParam(':floor_area', $floor_area);
        $stmt->bindParam(':lot_area', $lot_area);
        $stmt->bindParam(':owner_name', $owner_name);
        $stmt->bindParam(':contact_number', $contact_number);
        $stmt->bindParam(':email', $email);
        $stmt->bindParam(':status', $status);
        
        if ($stmt->execute()) {
            echo json_encode([
                'success' => true, 
                'message' => 'Property added successfully!',
                'property_id' => $db->lastInsertId()
            ]);
        } else {
            echo json_encode(['success' => false, 'message' => 'Failed to add property']);
        }
        exit;
    }
    
    // Handle GET request (Fetch properties)
    // Get search and filter parameters
    $search = $_GET['search'] ?? '';
    $status_filter = $_GET['status'] ?? '';
    
    // Build query
    $query = "SELECT * FROM properties WHERE agent_id = :agent_id";
    $params = [':agent_id' => $agent_id];
    
    // Add search filter
    if (!empty($search)) {
        $query .= " AND (address LIKE :search OR owner_name LIKE :search OR email LIKE :search OR city LIKE :search OR property_type LIKE :search)";
        $params[':search'] = '%' . $search . '%';
    }
    
    // Add status filter
    if (!empty($status_filter)) {
        $query .= " AND status = :status";
        $params[':status'] = $status_filter;
    }
    
    $query .= " ORDER BY created_at DESC";
    
    $stmt = $db->prepare($query);
    foreach ($params as $key => $value) {
        $stmt->bindValue($key, $value);
    }
    $stmt->execute();
    
    $properties = $stmt->fetchAll();
    
    echo json_encode([
        'success' => true,
        'properties' => $properties
    ]);
    
} catch (Exception $e) {
    error_log("Get properties error: " . $e->getMessage());
    echo json_encode(['success' => false, 'message' => 'An error occurred']);
}
?>