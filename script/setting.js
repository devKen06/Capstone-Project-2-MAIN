// Load user profile data
function loadUserProfile() {
    fetch('get_profile.php')
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            // Update dropdown with user info
            document.getElementById('dropdownUserName').textContent = data.profile.full_name;
            document.getElementById('dropdownUserEmail').textContent = data.profile.email;
        } else {
            console.error('Failed to load profile:', data);
        }
    })
    .catch(error => {
        console.error('Error loading profile:', error);
    });
}

// Toggle User Dropdown
function toggleUserDropdown() {
    const dropdown = document.getElementById('userDropdown');
    dropdown.classList.toggle('show');
}

// Close dropdown when clicking outside
document.addEventListener('click', function(event) {
    const dropdown = document.getElementById('userDropdown');
    const userBtn = event.target.closest('.user-dropdown');
    
    if (!userBtn && dropdown) {
        dropdown.classList.remove('show');
    }
});

// Show Logout Modal
function showLogoutModal() {
    const modal = document.getElementById('logoutModal');
    if (modal) {
        modal.classList.add('show');
        modal.style.display = 'flex';
        document.body.style.overflow = 'hidden';
    }
    // Close the user dropdown
    const dropdown = document.getElementById('userDropdown');
    if (dropdown) {
        dropdown.classList.remove('show');
    }
}

// Close Logout Modal
function closeLogoutModal() {
    const modal = document.getElementById('logoutModal');
    if (modal) {
        modal.classList.remove('show');
        modal.style.display = 'none';
        document.body.style.overflow = 'auto';
    }
}

// Confirm Logout
function confirmLogout() {
    fetch('logout.php', {
        method: 'POST'
    })
    .then(response => response.json())
    .then(data => {
        // Clear any local storage
        localStorage.clear();
        sessionStorage.clear();
        
        // Redirect to login page
        window.location.href = 'index.html';
    })
    .catch(error => {
        console.error('Logout error:', error);
        // Still logout locally even if server request fails
        localStorage.clear();
        sessionStorage.clear();
        window.location.href = 'index.html';
    });
}

// Password Form Handler
document.addEventListener('DOMContentLoaded', function() {
    // Load user profile on page load
    loadUserProfile();

    // Password form handler
    const passwordForm = document.getElementById('passwordForm');
    if (passwordForm) {
        passwordForm.addEventListener('submit', function(e) {
            e.preventDefault();
            
            const currentPassword = document.getElementById('currentPassword').value;
            const newPassword = document.getElementById('newPassword').value;
            const confirmPassword = document.getElementById('confirmPassword').value;

            // Validation
            if (newPassword !== confirmPassword) {
                alert('New passwords do not match!');
                return;
            }

            if (newPassword.length < 8) {
                alert('Password must be at least 8 characters long!');
                return;
            }

            // Check if new password is same as current
            if (newPassword === currentPassword) {
                alert('New password must be different from current password!');
                return;
            }

            // Send to server to update password
            const formData = new FormData();
            formData.append('current_password', currentPassword);
            formData.append('new_password', newPassword);

            fetch('update_password.php', {
                method: 'POST',
                body: formData
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    showSuccessMessage('Password updated successfully!');
                    this.reset();
                } else {
                    alert('Error: ' + (data.message || 'Failed to update password'));
                }
            })
            .catch(error => {
                console.error('Password update error:', error);
                alert('An error occurred while updating password.');
            });
        });
    }

    // Theme Selection
    document.querySelectorAll('.theme-option').forEach(option => {
        option.addEventListener('click', function() {
            document.querySelectorAll('.theme-option').forEach(opt => opt.classList.remove('active'));
            this.classList.add('active');
        });
    });

    // Load saved theme preference
    const savedTheme = localStorage.getItem('theme') || 'light';
    document.querySelectorAll('.theme-option').forEach(option => {
        if (option.dataset.theme === savedTheme) {
            option.classList.add('active');
        } else {
            option.classList.remove('active');
        }
    });
});

// Save Appearance
function saveAppearance() {
    const selectedTheme = document.querySelector('.theme-option.active').dataset.theme;
    
    // Save to localStorage
    localStorage.setItem('theme', selectedTheme);
    
    // Apply theme (for future implementation)
    if (selectedTheme === 'dark') {
        document.body.classList.add('dark-theme');
    } else {
        document.body.classList.remove('dark-theme');
    }
    
    showSuccessMessage('Appearance settings saved!');
}

// Show Success Message
function showSuccessMessage(message = 'Settings saved successfully!') {
    const successMsg = document.getElementById('successMessage');
    if (successMsg) {
        // Update message text if custom message provided
        const msgContent = successMsg.innerHTML;
        if (message !== 'Settings saved successfully!') {
            successMsg.innerHTML = '<i class="fas fa-check-circle"></i> ' + message;
        }
        
        successMsg.classList.add('show');
        
        setTimeout(() => {
            successMsg.classList.remove('show');
            // Restore original message
            successMsg.innerHTML = msgContent;
        }, 3000);

        // Scroll to top to show message
        window.scrollTo({ top: 0, behavior: 'smooth' });
    }
}

// Smooth scroll to sections
function scrollToSection(sectionId) {
    const section = document.getElementById(sectionId);
    if (section) {
        section.scrollIntoView({ behavior: 'smooth' });
    }
}