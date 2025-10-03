// Your existing functions...

// ADD THESE SETTINGS DROPDOWN FUNCTIONS:
function toggleSettingsDropdown() {
    const dropdown = document.getElementById('settingsDropdown');
    const isActive = dropdown.classList.contains('active');
    
    if (isActive) {
        dropdown.classList.remove('active');
    } else {
        dropdown.classList.add('active');
    }
}

function closeSettingsDropdown() {
    document.getElementById('settingsDropdown').classList.remove('active');
}

function openSettings() {
    closeSettingsDropdown();
    alert('Settings would open here');
}

function openPasswordSettings() {
    closeSettingsDropdown();
    alert('Password settings would open here');
}

function openAppearanceSettings() {
    closeSettingsDropdown();
    alert('Appearance settings would open here');
}

function openNotificationSettings() {
    closeSettingsDropdown();
    alert('Notification settings would open here');
}

function openAboutUs() {
    closeSettingsDropdown();
    alert('Real Estate Management System v1.0\nBy: Arvin, Mark, Elmerson, Angelo');
}

function confirmLogout() {
    if (confirm('Are you sure you want to log out?')) {
        closeSettingsDropdown();
        alert('Logging out...');
        // window.location.href = 'login.html';
    } else {
        closeSettingsDropdown();
    }
}

// Close dropdown when clicking outside
document.addEventListener('click', function(event) {
    const settingsButton = document.getElementById('settingsButton');
    const dropdown = document.getElementById('settingsDropdown');
    
    if (!settingsButton.contains(event.target) && dropdown.classList.contains('active')) {
        closeSettingsDropdown();
    }
});