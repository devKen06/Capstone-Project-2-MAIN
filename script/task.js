function openCreateTaskModal() {
            document.getElementById('createTaskModal').classList.add('show');
            document.body.style.overflow = 'hidden';
        }

        function closeCreateTaskModal() {
            document.getElementById('createTaskModal').classList.remove('show');
            document.body.style.overflow = 'auto';
        }

        // Handle form submission
        document.getElementById('createTaskForm').addEventListener('submit', function(e) {
            e.preventDefault();
            
            // Get form data (you can process this data as needed)
            const formData = new FormData(this);
            console.log('Task created with data:', Object.fromEntries(formData));
            
            // Close modal and reset form
            closeCreateTaskModal();
            this.reset();
            
            // You can add code here to actually create the task
            alert('Task created successfully!');
        });

        // Close modal when clicking outside
        document.getElementById('createTaskModal').addEventListener('click', function(e) {
            if (e.target === this) {
                closeCreateTaskModal();
            }
        });