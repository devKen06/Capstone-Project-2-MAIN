        function toggleDropdown() {
            const dropdown = document.getElementById('dropdownMenu');
            dropdown.classList.toggle('show');
        }

        function handleContactMethod(method) {
            console.log('Selected contact method:', method);
            // Add your logic here for handling different contact methods
            switch(method) {
                case 'sms':
                    alert('SMS integration coming soon!');
                    break;
                case 'calls':
                    alert('Call integration coming soon!');
                    break;
                case 'email':
                    alert('Email integration coming soon!');
                    break;
            }
        }

        // Close dropdown when clicking outside
        window.addEventListener('click', function(event) {
            const dropdown = document.getElementById('dropdownMenu');
            const button = document.querySelector('.add-contacts-btn');
            
            if (!button.contains(event.target)) {
                dropdown.classList.remove('show');
            }
        });