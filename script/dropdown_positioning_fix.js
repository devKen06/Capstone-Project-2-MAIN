// Enhanced Tags Dropdown Positioning Fix
// Add this to your management.js or create a separate file

// Function to ensure dropdown is properly positioned and visible
function ensureDropdownVisible() {
    const sortBtn = document.querySelector('.sort-btn');
    const dropdown = document.getElementById('sortDropdown');
    
    if (sortBtn && dropdown) {
        // Calculate position to ensure dropdown is fully visible
        sortBtn.addEventListener('click', function(e) {
            e.stopPropagation();
            
            // Toggle dropdown
            dropdown.classList.toggle('show');
            
            if (dropdown.classList.contains('show')) {
                // Get button position
                const btnRect = sortBtn.getBoundingClientRect();
                const dropdownRect = dropdown.getBoundingClientRect();
                const windowHeight = window.innerHeight;
                const windowWidth = window.innerWidth;
                
                // Reset positioning
                dropdown.style.position = 'absolute';
                dropdown.style.top = 'auto';
                dropdown.style.bottom = 'auto';
                dropdown.style.left = 'auto';
                dropdown.style.right = '0';
                
                // Check if dropdown goes below viewport
                if (btnRect.bottom + dropdownRect.height > windowHeight) {
                    // Position above the button
                    dropdown.style.bottom = '100%';
                    dropdown.style.top = 'auto';
                    dropdown.style.marginBottom = '5px';
                } else {
                    // Position below the button (default)
                    dropdown.style.top = '100%';
                    dropdown.style.bottom = 'auto';
                    dropdown.style.marginTop = '5px';
                }
                
                // Check if dropdown goes beyond right edge
                if (btnRect.right - dropdownRect.width < 0) {
                    dropdown.style.left = '0';
                    dropdown.style.right = 'auto';
                }
                
                // Ensure dropdown is visible
                dropdown.style.zIndex = '9999';
                
                // Make parent elements overflow visible
                let parent = dropdown.parentElement;
                while (parent && parent !== document.body) {
                    if (parent.style) {
                        parent.style.overflow = 'visible';
                    }
                    parent = parent.parentElement;
                }
            }
        });
    }
}

// Call this function when the page loads
if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', ensureDropdownVisible);
} else {
    ensureDropdownVisible();
}

// Alternative: Modify the existing toggleSortDropdown function
// Replace your existing toggleSortDropdown with this enhanced version:

function toggleSortDropdown() {
    const dropdown = document.getElementById('sortDropdown');
    const sortBtn = document.querySelector('.sort-btn');
    
    dropdown.classList.toggle('show');
    
    if (dropdown.classList.contains('show')) {
        // Ensure proper positioning
        const btnRect = sortBtn.getBoundingClientRect();
        const dropdownRect = dropdown.getBoundingClientRect();
        const windowHeight = window.innerHeight;
        
        // Position dropdown to avoid being cut off
        if (btnRect.bottom + 300 > windowHeight) {
            // Not enough space below, show above
            dropdown.style.bottom = '100%';
            dropdown.style.top = 'auto';
            dropdown.style.marginBottom = '5px';
            dropdown.style.marginTop = '0';
        } else {
            // Enough space below, show below
            dropdown.style.top = '100%';
            dropdown.style.bottom = 'auto';
            dropdown.style.marginTop = '5px';
            dropdown.style.marginBottom = '0';
        }
        
        // Ensure high z-index
        dropdown.style.zIndex = '9999';
        
        // Close dropdown when clicking outside
        setTimeout(() => {
            document.addEventListener('click', function closeDropdown(e) {
                if (!e.target.closest('.dropdown-sort')) {
                    dropdown.classList.remove('show');
                    document.removeEventListener('click', closeDropdown);
                }
            });
        }, 0);
    }
}