let currentPage = 1;
        let allContacts = [];
        let filteredContacts = [];
        let currentLead = {};

        // Show detail view
        function showDetailView(name, email, phone, mobile, status) {
            currentLead = { name, email, phone, mobile, status };
            
            // Update overview with lead data
            document.getElementById('leadName').textContent = name;
            document.getElementById('leadEmail').textContent = email;
            document.getElementById('leadPhone').textContent = phone;
            document.getElementById('leadMobile').textContent = mobile;
            document.getElementById('leadStatus').textContent = status;
            
            // Hide main view and show detail view
            document.getElementById('mainView').style.display = 'none';
            document.getElementById('tabNavigation').style.display = 'flex';
            document.getElementById('overviewView').classList.add('active');
            
            // Reset tabs
            showOverview();
        }

        // Show main management view
        function showMainView() {
            document.getElementById('mainView').style.display = 'block';
            document.getElementById('tabNavigation').style.display = 'none';
            document.getElementById('overviewView').classList.remove('active');
            document.getElementById('activitiesView').classList.remove('active');
        }

        // Show overview tab
        function showOverview() {
            // Update tab buttons
            document.querySelectorAll('.tab-button').forEach(btn => btn.classList.remove('active'));
            document.querySelectorAll('.tab-button')[0].classList.add('active');
            
            // Show overview content
            document.getElementById('overviewView').classList.add('active');
            document.getElementById('activitiesView').classList.remove('active');
        }

        // Show activities tab
        function showActivities() {
            // Update tab buttons
            document.querySelectorAll('.tab-button').forEach(btn => btn.classList.remove('active'));
            document.querySelectorAll('.tab-button')[1].classList.add('active');
            
            // Show activities content
            document.getElementById('overviewView').classList.remove('active');
            document.getElementById('activitiesView').classList.add('active');
        }

        // Initialize contacts data
        function initializeContacts() {
            const tableBody = document.getElementById('contactTableBody');
            const rows = tableBody.querySelectorAll('tr');
            allContacts = [];
            
            rows.forEach(row => {
                const cells = row.querySelectorAll('td');
                allContacts.push({
                    name: cells[0].textContent,
                    address: cells[1].textContent,
                    number: cells[2].textContent,
                    email: cells[3].textContent,
                    tag: cells[4].querySelector('.status-tag').textContent,
                    element: row
                });
            });
            
            filteredContacts = [...allContacts];
        }

        // Search functionality
        function searchContacts() {
            const searchTerm = document.getElementById('searchInput').value.toLowerCase();
            const statusFilter = document.getElementById('statusFilter').value;
            
            filteredContacts = allContacts.filter(contact => {
                const matchesSearch = contact.name.toLowerCase().includes(searchTerm) ||
                                    contact.address.toLowerCase().includes(searchTerm) ||
                                    contact.email.toLowerCase().includes(searchTerm);
                const matchesStatus = !statusFilter || contact.tag === statusFilter;
                
                return matchesSearch && matchesStatus;
            });
            
            updateTable();
        }

        // Filter by status
        function filterByStatus() {
            searchContacts(); // Reuse search function with current search term
        }

        // Sort table
        function sortTable(columnIndex) {
            const isAscending = !this.ascending;
            this.ascending = isAscending;
            
            filteredContacts.sort((a, b) => {
                let aVal, bVal;
                switch(columnIndex) {
                    case 0: aVal = a.name; bVal = b.name; break;
                    case 1: aVal = a.address; bVal = b.address; break;
                    case 2: aVal = a.number; bVal = b.number; break;
                    case 3: aVal = a.email; bVal = b.email; break;
                    case 4: aVal = a.tag; bVal = b.tag; break;
                }
                
                if (aVal < bVal) return isAscending ? -1 : 1;
                if (aVal > bVal) return isAscending ? 1 : -1;
                return 0;
            });
            
            updateTable();
        }

        // Update table display
        function updateTable() {
            const tableBody = document.getElementById('contactTableBody');
            tableBody.innerHTML = '';
            
            filteredContacts.forEach(contact => {
                const row = contact.element.cloneNode(true);
                tableBody.appendChild(row);
            });
        }

        // Pagination functions
        function previousPage() {
            if (currentPage > 1) {
                currentPage--;
                updatePagination();
            }
        }

        function nextPage() {
            currentPage++;
            updatePagination();
        }

        function goToPage(page) {
            currentPage = page;
            updatePagination();
        }

        function updatePagination() {
            // Update active page button
            document.querySelectorAll('.pagination button').forEach(btn => {
                btn.classList.remove('active');
            });
            
            const pageButtons = document.querySelectorAll('.pagination button');
            if (pageButtons[currentPage]) {
                pageButtons[currentPage].classList.add('active');
            }
            
            // Update prev/next button states
            document.getElementById('prevBtn').disabled = currentPage === 1;
        }

        // Initialize the page
        document.addEventListener('DOMContentLoaded', function() {
            initializeContacts();
            
            // Add search on Enter key
            document.getElementById('searchInput').addEventListener('keypress', function(e) {
                if (e.key === 'Enter') {
                    searchContacts();
                }
            });
        });