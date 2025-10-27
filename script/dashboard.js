// Dashboard connection and authentication
document.addEventListener('DOMContentLoaded', function() {
    // Check if user is logged in
    if (!checkAuthentication()) {
        return;
    }
    loadDashboardData();
});

function checkAuthentication() {
    // Check localStorage first (from login)
    const loggedIn = localStorage.getItem('loggedIn');
    const userData = localStorage.getItem('user');
    
    if (!loggedIn || !userData) {
        // Redirect to login if not authenticated
        window.location.href = 'index.html';
        return false;
    }
    return true;
}

function loadDashboardData() {
    // Show loading state
    showLoadingState();
    
    // Get dashboard data from server
    fetch('dashboard_data.php')
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            // Update UI with user data
            updateUserDisplay(data.user);
            // Update statistics
            updateStatistics(data.stats);
            // Update tasks
            updateTasks(data.tasks, data.tasks_count);
        } else {
            // Session expired, redirect to login
            localStorage.removeItem('loggedIn');
            localStorage.removeItem('user');
            if (data.redirect) {
                window.location.href = data.redirect;
            } else {
                window.location.href = 'index.html';
            }
        }
    })
    .catch(error => {
        console.error('Error loading dashboard data:', error);
        showErrorState();
    });
}

function showLoadingState() {
    // Add loading indicators to stats
    const statNumbers = document.querySelectorAll('.stat-number');
    statNumbers.forEach(element => {
        element.innerHTML = '<i class="fas fa-spinner fa-spin"></i>';
    });
}

function showErrorState() {
    const statNumbers = document.querySelectorAll('.stat-number');
    statNumbers.forEach(element => {
        element.textContent = '—';
    });
}

function updateUserDisplay(user) {
    // Update user name in dropdown
    const userNameElement = document.querySelector('.dropdown-user-name');
    const userEmailElement = document.querySelector('.dropdown-user-email');
    
    if (userNameElement) {
        userNameElement.textContent = user.name;
    }
    
    if (userEmailElement) {
        userEmailElement.textContent = user.email;
    }
    
    // Store updated user data
    localStorage.setItem('user', JSON.stringify(user));
}

function updateStatistics(stats) {
    // Update each statistic with animation
    const statItems = document.querySelectorAll('.stat-item');
    
    // Map stats to their positions
    const statsMapping = [
        { value: stats.total_leads, label: 'Leads' },
        { value: stats.open_deals, label: 'Open Deal' },
        { value: stats.new_leads, label: 'New Leads' },
        { value: stats.on_progress, label: 'On Progress' },
        { value: stats.signing_contract, label: 'Signing Contract' },
        { value: stats.closed_deals, label: 'Closed Deal' }
    ];
    
    statItems.forEach((item, index) => {
        const numberElement = item.querySelector('.stat-number');
        const labelElement = item.querySelector('.stat-label');
        
        if (statsMapping[index]) {
            // Animate number
            animateNumber(numberElement, 0, statsMapping[index].value, 1000);
            
            // Update label (in case it needs updating)
            if (labelElement) {
                labelElement.textContent = statsMapping[index].label;
            }
        }
    });
}

function animateNumber(element, start, end, duration) {
    const startTime = performance.now();
    const difference = end - start;
    
    function update(currentTime) {
        const elapsed = currentTime - startTime;
        const progress = Math.min(elapsed / duration, 1);
        
        const current = Math.floor(start + difference * easeOutQuart(progress));
        element.textContent = current.toLocaleString();
        
        if (progress < 1) {
            requestAnimationFrame(update);
        }
    }
    
    requestAnimationFrame(update);
}

function easeOutQuart(x) {
    return 1 - Math.pow(1 - x, 4);
}

function updateTasks(tasks, tasks_count) {
    // Update To-do tasks
    updateTaskCard('todo', tasks.todo, tasks_count.todo, 'To-do');
    
    // Update Call tasks
    updateTaskCard('call', tasks.call, tasks_count.call, 'Calls');
    
    // Update Email tasks
    updateTaskCard('email', tasks.email, tasks_count.email, 'Email');
}

function updateTaskCard(taskType, taskList, count, title) {
    const taskCards = document.querySelectorAll('.task-card');
    let targetCard = null;
    
    // Find the correct card by its title
    taskCards.forEach(card => {
        const cardTitle = card.querySelector('.task-title');
        if (cardTitle && cardTitle.textContent.trim() === title) {
            targetCard = card;
        }
    });
    
    if (!targetCard) return;
    
    // Update badge count
    const badge = targetCard.querySelector('.task-badge');
    if (badge) {
        badge.textContent = count;
        badge.style.backgroundColor = count > 0 ? 'red' : '#999';
    }
    
    // Update task list
    const taskListElement = targetCard.querySelector('.task-list');
    if (taskListElement) {
        if (taskList.length === 0) {
            taskListElement.innerHTML = '<li style="list-style: none; color: #999; font-style: italic;">No tasks</li>';
        } else {
            taskListElement.innerHTML = taskList.map(task => {
                let taskText = '';
                
                if (task.property_name) {
                    taskText = `${task.title} - ${task.property_name}`;
                } else if (task.assigned_to) {
                    taskText = `${task.title} - ${task.assigned_to}`;
                } else {
                    taskText = task.title;
                }
                
                // Add date if available
                if (task.due_date) {
                    const date = new Date(task.due_date);
                    const formattedDate = date.toLocaleDateString('en-US', { 
                        month: 'long', 
                        day: 'numeric', 
                        year: 'numeric' 
                    });
                    taskText += `<br><small style="color: #666;">${formattedDate}</small>`;
                }
                
                // Add priority indicator for todo tasks
                if (taskType === 'todo' && task.priority) {
                    const priorityColors = {
                        'High': '#dc3545',
                        'Medium': '#ffc107',
                        'Low': '#28a745'
                    };
                    const color = priorityColors[task.priority] || '#999';
                    taskText = `<span style="display: inline-block; width: 8px; height: 8px; border-radius: 50%; background-color: ${color}; margin-right: 6px;"></span>` + taskText;
                }
                
                return `<li>${taskText}</li>`;
            }).join('');
        }
    }
}

// Refresh dashboard data every 5 minutes
setInterval(() => {
    if (checkAuthentication()) {
        loadDashboardData();
    }
}, 300000); // 5 minutes
// Function to filter management page by clicking on stats
function filterManagement(filter) {
    // Store filter in localStorage
    localStorage.setItem('managementFilter', filter);
    
    // Navigate to management page
    window.location.href = 'management.html';
}