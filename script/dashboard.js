// Dashboard connection and authentication
document.addEventListener('DOMContentLoaded', function() {
    // Check if user is logged in
    checkAuthentication();
    loadUserData();
});

function checkAuthentication() {
    // Check localStorage first (from login)
    const loggedIn = localStorage.getItem('loggedIn');
    const userData = localStorage.getItem('user');
    
    if (!loggedIn || !userData) {
        // Redirect to login if not authenticated
        window.location.href = 'index.html';
        return;
    }
}

function loadUserData() {
    // Get user data from server to verify session
    fetch('dashboard_data.php')
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            // Update UI with user data
            updateUserDisplay(data.user);
        } else {
            // Session expired, redirect to login
            localStorage.removeItem('loggedIn');
            localStorage.removeItem('user');
            if (data.redirect) {
                window.location.href = data.redirect;
            } else {
                window.location.href = 'index.html';
            }
        }
    })
    .catch(error => {
        console.error('Error loading user data:', error);
        // On error, still allow access but log the issue
    });
}

function updateUserDisplay(user) {
    // Update any user-specific content on the dashboard
    // You can expand this based on where you want to show user info
    
    // Example: If you have elements to show user name/email
    const userNameElements = document.querySelectorAll('.user-name');
    const userEmailElements = document.querySelectorAll('.user-email');
    
    userNameElements.forEach(element => {
        element.textContent = user.name;
    });
    
    userEmailElements.forEach(element => {
        element.textContent = user.email;
    });
    
    // Store updated user data
    localStorage.setItem('user', JSON.stringify(user));
}
