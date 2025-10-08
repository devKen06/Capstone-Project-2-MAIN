       // Toggle User Dropdown
        function toggleUserDropdown() {
            const dropdown = document.getElementById('userDropdown');
            dropdown.classList.toggle('show');
        }

        // Close dropdown when clicking outside
        window.onclick = function(event) {
            if (!event.target.matches('.icon-btn') && !event.target.matches('.fa-user-circle')) {
                const dropdown = document.getElementById('userDropdown');
                if (dropdown.classList.contains('show')) {
                    dropdown.classList.remove('show');
                }
            }
        }

        // Show Logout Modal
        function showLogoutModal() {
            const modal = document.getElementById('logoutModal');
            modal.classList.add('show');
            // Close the dropdown
            document.getElementById('userDropdown').classList.remove('show');
        }

        // Close Logout Modal
        function closeLogoutModal() {
            const modal = document.getElementById('logoutModal');
            modal.classList.remove('show');
        }

        // Confirm Logout
        function confirmLogout() {
            // Add your logout logic here
            // For example: redirect to login page
            window.location.href = 'login.html';
        }

        // Password Form Handler
        document.getElementById('passwordForm').addEventListener('submit', function(e) {
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

        // Theme Selection
        document.querySelectorAll('.theme-option').forEach(option => {
            option.addEventListener('click', function() {
                document.querySelectorAll('.theme-option').forEach(opt => opt.classList.remove('active'));
                this.classList.add('active');
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
            successMsg.classList.add('show');
            
            setTimeout(() => {
                successMsg.classList.remove('show');
            }, 3000);

            // Scroll to top to show message
            window.scrollTo({ top: 0, behavior: 'smooth' });
        }

        // Smooth scroll to sections
        function scrollToSection(sectionId) {
            const section = document.getElementById(sectionId);
            section.scrollIntoView({ behavior: 'smooth' });
        }