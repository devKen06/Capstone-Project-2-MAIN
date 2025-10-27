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
    
    // Get property ID
    $property_id = $_POST['property_id'] ?? null;
    
    if (!$property_id) {
        echo json_encode(['success' => false, 'message' => 'Property ID is required']);
        exit;
    }
    
    // Verify property belongs to this agent
    $check_query = "SELECT id FROM properties WHERE id = :property_id AND agent_id = :agent_id";
    $check_stmt = $db->prepare($check_query);
    $check_stmt->bindParam(':property_id', $property_id);
    $check_stmt->bindParam(':agent_id', $agent_id);
    $check_stmt->execute();
    
    if ($check_stmt->rowCount() === 0) {
        echo json_encode(['success' => false, 'message' => 'Property not found or access denied']);
        exit;
    }
    
    // Get form data
    $description = trim($_POST['description'] ?? '');
    $barangay = trim($_POST['barangay'] ?? '');
    $street = trim($_POST['street'] ?? '');
    $city = trim($_POST['city'] ?? 'Tarlac City');
    $province = trim($_POST['province'] ?? 'Tarlac');
    $price = $_POST['price'] ?? null;
    $property_type = trim($_POST['property_type'] ?? '');
    $class = trim($_POST['class'] ?? '');
    $bedrooms = $_POST['bedrooms'] ?? null;
    $bathrooms = $_POST['bathrooms'] ?? null;
    $floor_area = $_POST['floor_area'] ?? null;
    $lot_area = $_POST['lot_area'] ?? null;
    $first_name = trim($_POST['first_name'] ?? '');
    $last_name = trim($_POST['last_name'] ?? '');
    $contact_number = trim($_POST['contact_number'] ?? '');
    $email = trim($_POST['email'] ?? '');
    
    // Combine first name and last name for owner_name field
    $owner_name = trim($first_name . ' ' . $last_name);
    
    // Validate required fields
    $errors = [];
    if (empty($barangay)) $errors[] = 'Barangay is required';
    if (empty($street)) $errors[] = 'Street is required';
    if (empty($city)) $errors[] = 'City is required';
    if (empty($province)) $errors[] = 'Province is required';
    if (empty($price) || $price <= 0) $errors[] = 'Valid price is required';
    if (empty($property_type)) $errors[] = 'Property type is required';
    if (empty($class)) $errors[] = 'Property class is required';
    if (empty($first_name)) $errors[] = 'First name is required';
    if (empty($last_name)) $errors[] = 'Last name is required';
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
    
    // Create combined address for backward compatibility
    $address = $street . ', ' . $barangay;
    
    // Update property
    $query = "UPDATE properties SET 
        description = :description,
        barangay = :barangay,
        street = :street,
        address = :address,
        city = :city,
        province = :province,
        price = :price,
        property_type = :property_type,
        class = :class,
        bedrooms = :bedrooms,
        bathrooms = :bathrooms,
        floor_area = :floor_area,
        lot_area = :lot_area,
        owner_name = :owner_name,
        contact_number = :contact_number,
        email = :email,
        updated_at = CURRENT_TIMESTAMP
    WHERE id = :property_id AND agent_id = :agent_id";
    
    $stmt = $db->prepare($query);
    $stmt->bindParam(':description', $description);
    $stmt->bindParam(':barangay', $barangay);
    $stmt->bindParam(':street', $street);
    $stmt->bindParam(':address', $address);
    $stmt->bindParam(':city', $city);
    $stmt->bindParam(':province', $province);
    $stmt->bindParam(':price', $price);
    $stmt->bindParam(':property_type', $property_type);
    $stmt->bindParam(':class', $class);
    $stmt->bindParam(':bedrooms', $bedrooms);
    $stmt->bindParam(':bathrooms', $bathrooms);
    $stmt->bindParam(':floor_area', $floor_area);
    $stmt->bindParam(':lot_area', $lot_area);
    $stmt->bindParam(':owner_name', $owner_name);
    $stmt->bindParam(':contact_number', $contact_number);
    $stmt->bindParam(':email', $email);
    $stmt->bindParam(':property_id', $property_id);
    $stmt->bindParam(':agent_id', $agent_id);
    
    if ($stmt->execute()) {
        echo json_encode([
            'success' => true, 
            'message' => 'Property updated successfully!',
            'property_id' => $property_id
        ]);
    } else {
        echo json_encode(['success' => false, 'message' => 'Failed to update property']);
    }
    
} catch (Exception $e) {
    error_log("Update property error: " . $e->getMessage());
    echo json_encode(['success' => false, 'message' => 'An error occurred: ' . $e->getMessage()]);
}
?>