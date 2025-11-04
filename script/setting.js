// Settings Page JavaScript
// Handles user settings, password changes, theme preferences, and logout

// Load user profile data on page load
document.addEventListener('DOMContentLoaded', function() {
    loadUserSettings();
    setupPasswordForm();
    setupThemeSelection();
});

// ========== USER SETTINGS ==========

function loadUserSettings() {
    fetch('get_user_settings.php')
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            // Update dropdown with user info
            document.getElementById('dropdownUserName').textContent = data.user.full_name;
            document.getElementById('dropdownUserEmail').textContent = data.user.email;
            
            console.log('User settings loaded:', data.user);
        } else {
            console.error('Failed to load user settings:', data.message);
            if (data.message === 'Not authenticated') {
                // Redirect to login if not authenticated
                window.location.href = 'index.html';
            }
        }
    })
    .catch(error => {
        console.error('Error loading user settings:', error);
    });
}

// ========== USER DROPDOWN ==========

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

// ========== LOGOUT MODAL ==========

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

function closeLogoutModal() {
    const modal = document.getElementById('logoutModal');
    if (modal) {
        modal.classList.remove('show');
        modal.style.display = 'none';
        document.body.style.overflow = 'auto';
    }
}

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
        // Still redirect even if request fails
        localStorage.clear();
        sessionStorage.clear();
        window.location.href = 'index.html';
    });
}

// ========== PASSWORD CHANGE ==========

function setupPasswordForm() {
    const passwordForm = document.getElementById('passwordForm');
    if (!passwordForm) return;
    
    passwordForm.addEventListener('submit', function(e) {
        e.preventDefault();
        
        const currentPassword = document.getElementById('currentPassword').value;
        const newPassword = document.getElementById('newPassword').value;
        const confirmPassword = document.getElementById('confirmPassword').value;
        
        // Client-side validation
        if (!currentPassword || !newPassword || !confirmPassword) {
            alert('All fields are required');
            return;
        }
        
        if (newPassword !== confirmPassword) {
            alert('New passwords do not match!');
            return;
        }
        
        if (newPassword.length < 8) {
            alert('Password must be at least 8 characters long!');
            return;
        }
        
        // Check password strength
        const hasUppercase = /[A-Z]/.test(newPassword);
        const hasLowercase = /[a-z]/.test(newPassword);
        const hasNumber = /[0-9]/.test(newPassword);
        
        if (!hasUppercase || !hasLowercase || !hasNumber) {
            alert('Password must contain at least one uppercase letter, one lowercase letter, and one number!');
            return;
        }
        
        if (newPassword === currentPassword) {
            alert('New password must be different from current password!');
            return;
        }
        
        // Send to server
        const formData = new FormData();
        formData.append('current_password', currentPassword);
        formData.append('new_password', newPassword);
        formData.append('confirm_password', confirmPassword);
        
        const submitBtn = passwordForm.querySelector('.btn-primary');
        const originalText = submitBtn.textContent;
        submitBtn.textContent = 'Updating...';
        submitBtn.disabled = true;
        
        fetch('update_password.php', {
            method: 'POST',
            body: formData
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                showSuccessMessage('Password updated successfully!');
                passwordForm.reset();
            } else {
                alert('Error: ' + data.message);
            }
        })
        .catch(error => {
            console.error('Password update error:', error);
            alert('An error occurred while updating your password.');
        })
        .finally(() => {
            submitBtn.textContent = originalText;
            submitBtn.disabled = false;
        });
    });
    
    // Cancel button
    const cancelBtn = passwordForm.querySelector('.btn-secondary');
    if (cancelBtn) {
        cancelBtn.addEventListener('click', function() {
            passwordForm.reset();
        });
    }
}

// ========== APPEARANCE SETTINGS ==========

function setupThemeSelection() {
    const themeOptions = document.querySelectorAll('.theme-option');
    
    // Load saved theme
    const savedTheme = localStorage.getItem('theme') || 'light';
    themeOptions.forEach(option => {
        if (option.dataset.theme === savedTheme) {
            option.classList.add('active');
        } else {
            option.classList.remove('active');
        }
    });
    
    // Theme selection click handlers
    themeOptions.forEach(option => {
        option.addEventListener('click', function() {
            themeOptions.forEach(opt => opt.classList.remove('active'));
            this.classList.add('active');
        });
    });
}

function saveAppearance() {
    const selectedTheme = document.querySelector('.theme-option.active');
    
    if (selectedTheme) {
        const theme = selectedTheme.dataset.theme;
        
        // Save to localStorage
        localStorage.setItem('theme', theme);
        
        // Apply theme (for future implementation)
        if (theme === 'dark') {
            document.body.classList.add('dark-theme');
        } else {
            document.body.classList.remove('dark-theme');
        }
        
        showSuccessMessage('Appearance settings saved!');
    }
}

// ========== SUCCESS MESSAGE ==========

function showSuccessMessage(message = 'Settings saved successfully!') {
    const successMsg = document.getElementById('successMessage');
    if (!successMsg) return;
    
    // Update message text
    const icon = successMsg.querySelector('i');
    successMsg.textContent = ' ' + message;
    if (icon) {
        successMsg.insertBefore(icon, successMsg.firstChild);
    }
    
    // Show message
    successMsg.classList.add('show');
    
    // Hide after 3 seconds
    setTimeout(() => {
        successMsg.classList.remove('show');
    }, 3000);
    
    // Scroll to top to show message
    window.scrollTo({ top: 0, behavior: 'smooth' });
}

// ========== UTILITY FUNCTIONS ==========

function scrollToSection(sectionId) {
    const section = document.getElementById(sectionId);
    if (section) {
        section.scrollIntoView({ behavior: 'smooth' });
    }
}