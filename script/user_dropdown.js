// user_dropdown.js - Loads user data and updates dropdown on all pages
// This script should be included on every page that has the user dropdown

// Function to capitalize first letter of each word
function capitalizeWords(str) {
    if (!str) return '';
    return str.toLowerCase().split(' ').map(word => 
        word.charAt(0).toUpperCase() + word.slice(1)
    ).join(' ');
}

// Function to format full name
function formatFullName(firstName, lastName) {
    const formattedFirst = capitalizeWords(firstName);
    const formattedLast = capitalizeWords(lastName);
    return `${formattedFirst} ${formattedLast}`;
}

// Load and display user data in dropdown
function loadUserDropdownData() {
    console.log('Loading user dropdown data...');
    
    fetch('get_profile.php')
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.json();
        })
        .then(data => {
            console.log('User dropdown data received:', data);
            
            if (data.success) {
                // Format names with proper capitalization
                const fullName = formatFullName(data.profile.first_name, data.profile.last_name);
                const email = data.profile.email;
                
                // Update dropdown elements
                const userNameElement = document.querySelector('.dropdown-user-name');
                const userEmailElement = document.querySelector('.dropdown-user-email');
                
                if (userNameElement) {
                    userNameElement.textContent = fullName;
                    console.log('Updated dropdown name:', fullName);
                }
                
                if (userEmailElement) {
                    userEmailElement.textContent = email;
                    console.log('Updated dropdown email:', email);
                }
                
                // Store user data in localStorage for other scripts to use
                localStorage.setItem('currentUser', JSON.stringify({
                    name: fullName,
                    email: email,
                    firstName: data.profile.first_name,
                    lastName: data.profile.last_name
                }));
                
            } else {
                console.error('Failed to load user data:', data.message);
                if (data.message === 'Not authenticated') {
                    // Clear localStorage and redirect to login
                    localStorage.removeItem('loggedIn');
                    localStorage.removeItem('user');
                    localStorage.removeItem('currentUser');
                    window.location.href = 'index.html';
                }
            }
        })
        .catch(error => {
            console.error('Error loading user dropdown data:', error);
            // Don't redirect on error, just log it
            // The user might still be able to use the page
        });
}

// Toggle User Dropdown
function toggleUserDropdown() {
    const dropdown = document.getElementById('userDropdown');
    if (dropdown) {
        dropdown.classList.toggle('show');
    }
}

// Close dropdown when clicking outside
document.addEventListener('click', function(event) {
    const dropdown = document.getElementById('userDropdown');
    const userBtn = event.target.closest('.user-dropdown');
    
    if (!userBtn && dropdown) {
        dropdown.classList.remove('show');
    }
});

// Load user data when page loads
// Use a slight delay to ensure DOM is fully ready
if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', function() {
        console.log('DOM loaded - initializing user dropdown');
        // Small delay to ensure all elements are rendered
        setTimeout(loadUserDropdownData, 100);
    });
} else {
    // DOM is already ready
    console.log('DOM already loaded - initializing user dropdown');
    setTimeout(loadUserDropdownData, 100);
}