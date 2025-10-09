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
        localStorage.removeItem('loggedIn');
        localStorage.removeItem('user');
        window.location.href = 'index.html';
    })
    .catch(error => {
        console.error('Logout error:', error);
        // Still logout locally even if server request fails
        localStorage.removeItem('loggedIn');
        localStorage.removeItem('user');
        window.location.href = 'index.html';
    });
}

// Password Form Handler
document.addEventListener('DOMContentLoaded', function() {
    const passwordForm = document.getElementById('passwordForm');
    if (passwordForm) {
        passwordForm.addEventListener('submit', function(e) {
            e.preventDefault();
            
            const currentPassword = document.getElementById('currentPassword').value;
            const newPassword = document.getElementById('newPassword').value;
            const confirmPassword = document.getElementById('confirmPassword').value;

            if (newPassword !== confirmPassword) {
                alert('New passwords do not match!');
                return;
            }

            if (newPassword.length < 8) {
                alert('Password must be at least 8 characters long!');
                return;
            }

            // Show success message
            showSuccessMessage();
            
            // Reset form
            this.reset();
        });
    }

    // Theme Selection
    document.querySelectorAll('.theme-option').forEach(option => {
        option.addEventListener('click', function() {
            document.querySelectorAll('.theme-option').forEach(opt => opt.classList.remove('active'));
            this.classList.add('active');
        });
    });
});

// Save Appearance
function saveAppearance() {
    const selectedTheme = document.querySelector('.theme-option.active').dataset.theme;
    
    showSuccessMessage();
}

// Save Notifications
function saveNotifications() {
    const emailNotif = document.getElementById('emailNotif').checked;
    const pushNotif = document.getElementById('pushNotif').checked;
    const taskReminders = document.getElementById('taskReminders').checked;
    const leadAlerts = document.getElementById('leadAlerts').checked;
    const dealUpdates = document.getElementById('dealUpdates').checked;
    
    showSuccessMessage();
}

// Show Success Message
function showSuccessMessage() {
    const successMsg = document.getElementById('successMessage');
    if (successMsg) {
        successMsg.classList.add('show');
        
        setTimeout(() => {
            successMsg.classList.remove('show');
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