// ========== MODAL CONTROL FUNCTIONS ==========
        
        /**
         * Opens the email modal dialog
         * Makes the overlay visible and displays the form
         */
        function openEmailModal() {
            document.getElementById('emailModal').classList.add('active');
            // Focus on input field for better UX
            setTimeout(() => {
                document.getElementById('newEmail').focus();
            }, 100);
        }

        /**
         * Closes the email modal dialog
         * Hides the overlay and resets the form
         */
        function closeEmailModal() {
            document.getElementById('emailModal').classList.remove('active');
            document.getElementById('emailForm').reset();
        }

        /**
         * Opens the phone modal dialog
         * Makes the overlay visible and displays the form
         */
        function openPhoneModal() {
            document.getElementById('phoneModal').classList.add('active');
            // Focus on input field for better UX
            setTimeout(() => {
                document.getElementById('newPhone').focus();
            }, 100);
        }

        /**
         * Closes the phone modal dialog
         * Hides the overlay and resets the form
         */
        function closePhoneModal() {
            document.getElementById('phoneModal').classList.remove('active');
            document.getElementById('phoneForm').reset();
        }

        // ========== FORM SUBMISSION HANDLERS ==========
        
        /**
         * Handles email form submission
         * @param {Event} event - Form submission event
         */
        function addEmail(event) {
            event.preventDefault(); // Prevent default form submission
            
            // Get the email value from input
            const email = document.getElementById('newEmail').value;
            
            // Check for duplicates
            const existingEmails = document.querySelectorAll('#emailList li span');
            for (let emailSpan of existingEmails) {
                if (emailSpan.textContent === email) {
                    alert('This email address already exists!');
                    return;
                }
            }
            
            // Create new list item for the email
            const emailList = document.getElementById('emailList');
            const newEmailItem = document.createElement('li');
            newEmailItem.innerHTML = `
                <i class="fas fa-envelope"></i>
                <span>${email}</span>
                <button class="delete-contact" onclick="deleteEmail(this)">
                    <i class="fas fa-trash"></i> Remove
                </button>
            `;
            
            // Add to the list
            emailList.appendChild(newEmailItem);
            
            // Close modal and show success message
            closeEmailModal();
            
            // In production, you would save this to database
            saveToDatabase('email', email);
        }

        /**
         * Handles phone form submission
         * @param {Event} event - Form submission event
         */
        function addPhone(event) {
            event.preventDefault(); // Prevent default form submission
            
            // Get the phone value from input
            const phone = document.getElementById('newPhone').value;
            
            // Check for duplicates
            const existingPhones = document.querySelectorAll('#phoneList li span');
            for (let phoneSpan of existingPhones) {
                if (phoneSpan.textContent === phone) {
                    alert('This phone number already exists!');
                    return;
                }
            }
            
            // Create new list item for the phone
            const phoneList = document.getElementById('phoneList');
            const newPhoneItem = document.createElement('li');
            newPhoneItem.innerHTML = `
                <i class="fas fa-phone"></i>
                <span>${phone}</span>
                <button class="delete-contact" onclick="deletePhone(this)">
                    <i class="fas fa-trash"></i> Remove
                </button>
            `;
            
            // Add to the list
            phoneList.appendChild(newPhoneItem);
            
            // Close modal and show success message
            closePhoneModal();
            
            // In production, you would save this to database
            saveToDatabase('phone', phone);
        }

        // ========== DELETE FUNCTIONS ==========
        
        /**
         * Deletes an email from the list
         * @param {HTMLElement} button - The delete button clicked
         */
        function deleteEmail(button) {
            if (confirm('Are you sure you want to remove this email address?')) {
                const listItem = button.closest('li');
                const email = listItem.querySelector('span').textContent;
                
                // Check if it's the last email
                const emailCount = document.querySelectorAll('#emailList li').length;
                if (emailCount === 1) {
                    alert('You must have at least one email address.');
                    return;
                }
                
                listItem.remove();
                
                // In production, remove from database
                removeFromDatabase('email', email);
            }
        }

        /**
         * Deletes a phone number from the list
         * @param {HTMLElement} button - The delete button clicked
         */
        function deletePhone(button) {
            if (confirm('Are you sure you want to remove this phone number?')) {
                const listItem = button.closest('li');
                const phone = listItem.querySelector('span').textContent;
                
                // Check if it's the last phone
                const phoneCount = document.querySelectorAll('#phoneList li').length;
                if (phoneCount === 1) {
                    alert('You must have at least one phone number.');
                    return;
                }
                
                listItem.remove();
                
                // In production, remove from database
                removeFromDatabase('phone', phone);
            }
        }

        // ========== PROFILE MANAGEMENT FUNCTIONS ==========
        
        /**
         * Opens edit profile mode
         * This would typically switch to an editable form view
         */
        function editProfile() {
            // In production, this would enable editing of profile fields
            console.log('Edit profile clicked');
            
            // Example implementation for inline editing
            const detailValues = document.querySelectorAll('.detail-value');
            detailValues.forEach(value => {
                // Convert to input fields for editing
                const currentValue = value.textContent;
                const input = document.createElement('input');
                input.type = 'text';
                input.value = currentValue;
                input.className = 'edit-input';
                // Replace text with input
                // value.innerHTML = '';
                // value.appendChild(input);
            });
            
            alert('Edit functionality would be implemented here');
        }

        /**
         * Quick access to profile from top navigation
         * Could show a dropdown or quick view
         */
        function quickProfileAccess() {
            console.log('Quick profile access clicked');
            // Could show a dropdown with profile summary
        }

        /**
         * Opens system settings
         * Would navigate to settings page or open settings modal
         */
        function openSettings() {
            console.log('Settings clicked');
            alert('Settings page would open here');
            // window.location.href = 'settings.html';
        }

        // ========== DATABASE FUNCTIONS (SIMULATION) ==========