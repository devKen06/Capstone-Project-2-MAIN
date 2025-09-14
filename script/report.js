function downloadReport() {
            // Simulate download functionality
            alert('Report download started!');
        }

        // Add click functionality for report items
        document.querySelectorAll('.report-item').forEach(item => {
            item.addEventListener('click', function() {
                const clientName = this.querySelector('.client-name').textContent;
                const reportType = this.querySelector('.report-type').textContent;
                const price = this.querySelector('.price').textContent;
                console.log(`Clicked on: ${clientName} - ${reportType} - ${price}`);
                
                // You can add more functionality here, like opening a modal or navigating to details
            });
        });

        // Add hover effect for better interactivity
        document.querySelectorAll('.report-item').forEach(item => {
            item.style.cursor = 'pointer';
            item.addEventListener('mouseenter', function() {
                this.style.backgroundColor = '#f8f9fa';
            });
            item.addEventListener('mouseleave', function() {
                this.style.backgroundColor = 'white';
            });
        });