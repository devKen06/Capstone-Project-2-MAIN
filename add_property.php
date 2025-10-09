<?php
session_start();
require_once 'config/database.php';

// Check if user is logged in
if (!isset($_SESSION['logged_in']) || $_SESSION['logged_in'] !== true) {
    echo json_encode(['success' => false, 'message' => 'Not authenticated']);
    exit;
}

header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    echo json_encode(['success' => false, 'message' => 'Method not allowed']);
    exit;
}

try {
    $database = new Database();
    $db = $database->getConnection();
    
    $agent_id = $_SESSION['user_id'];
    
    // Get form data
    $property_title = trim($_POST['property_title'] ?? '');
    $description = trim($_POST['description'] ?? '');
    $address = trim($_POST['address'] ?? '');
    $city = trim($_POST['city'] ?? '');
    $province = trim($_POST['province'] ?? '');
    $price = $_POST['price'] ?? null;
    $property_type = trim($_POST['property_type'] ?? '');
    $listing_type = $_POST['listing_type'] ?? '';
    $bedrooms = $_POST['bedrooms'] ?? null;
    $bathrooms = $_POST['bathrooms'] ?? null;
    $floor_area = $_POST['floor_area'] ?? null;
    $lot_area = $_POST['lot_area'] ?? null;
    $parking_spaces = $_POST['parking_spaces'] ?? 0;
    $furnished = $_POST['furnished'] ?? 'Unfurnished';
    $owner_name = trim($_POST['owner_name'] ?? '');
    $contact_number = trim($_POST['contact_number'] ?? '');
    $email = trim($_POST['email'] ?? '');
    
    // Validate required fields
    $errors = [];
    if (empty($property_title)) $errors[] = 'Property title is required';
    if (empty($address)) $errors[] = 'Address is required';
    if (empty($city)) $errors[] = 'City is required';
    if (empty($province)) $errors[] = 'Province is required';
    if (empty($price) || $price <= 0) $errors[] = 'Valid price is required';
    if (empty($property_type)) $errors[] = 'Property type is required';
    if (empty($listing_type)) $errors[] = 'Listing type is required';
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
    $parking_spaces = $parking_spaces === '' ? 0 : $parking_spaces;
    
    // Insert property
    $query = "INSERT INTO properties (
        agent_id, property_title, description, address, city, province, price, 
        property_type, listing_type, bedrooms, bathrooms, floor_area, lot_area, 
        parking_spaces, furnished, owner_name, contact_number, email, status
    ) VALUES (
        :agent_id, :property_title, :description, :address, :city, :province, :price,
        :property_type, :listing_type, :bedrooms, :bathrooms, :floor_area, :lot_area,
        :parking_spaces, :furnished, :owner_name, :contact_number, :email, 'Available'
    )";
    
    $stmt = $db->prepare($query);
    $stmt->bindParam(':agent_id', $agent_id);
    $stmt->bindParam(':property_title', $property_title);
    $stmt->bindParam(':description', $description);
    $stmt->bindParam(':address', $address);
    $stmt->bindParam(':city', $city);
    $stmt->bindParam(':province', $province);
    $stmt->bindParam(':price', $price);
    $stmt->bindParam(':property_type', $property_type);
    $stmt->bindParam(':listing_type', $listing_type);
    $stmt->bindParam(':bedrooms', $bedrooms);
    $stmt->bindParam(':bathrooms', $bathrooms);
    $stmt->bindParam(':floor_area', $floor_area);
    $stmt->bindParam(':lot_area', $lot_area);
    $stmt->bindParam(':parking_spaces', $parking_spaces);
    $stmt->bindParam(':furnished', $furnished);
    $stmt->bindParam(':owner_name', $owner_name);
    $stmt->bindParam(':contact_number', $contact_number);
    $stmt->bindParam(':email', $email);
    
    if ($stmt->execute()) {
        echo json_encode([
            'success' => true, 
            'message' => 'Property added successfully!',
            'property_id' => $db->lastInsertId()
        ]);
    } else {
        echo json_encode(['success' => false, 'message' => 'Failed to add property']);
    }
    
} catch (Exception $e) {
    error_log("Add property error: " . $e->getMessage());
    echo json_encode(['success' => false, 'message' => 'An error occurred']);
}
?>