let allProperties = [];
let currentPropertyId = null;
let currentActivityTasks = { todo: [], call: [], email: [] };
let currentActiveTaskType = 'todo';
let sortDirection = 'asc'; // Track sort direction for tags

document.addEventListener('DOMContentLoaded', function() {
    if (!localStorage.getItem('loggedIn')) {
        window.location.href = 'index.html';
        return;
    }
    
    loadProperties();
    
    document.getElementById('searchProperties').addEventListener('keypress', function(e) {
        if (e.key === 'Enter') {
            searchProperties();
        }
    });
});

function showAddPropertyForm() {
    document.getElementById('addPropertyBtn').style.display = 'none';
    document.getElementById('cancelBtn').style.display = 'flex';
    document.getElementById('propertyList').style.display = 'none';
    document.getElementById('addPropertyForm').style.display = 'block';
}

function cancelAddProperty() {
    document.getElementById('addPropertyBtn').style.display = 'flex';
    document.getElementById('cancelBtn').style.display = 'none';
    document.getElementById('propertyList').style.display = 'block';
    document.getElementById('addPropertyForm').style.display = 'none';
    document.getElementById('propertyForm').reset();
}

function goBack() {
    const detailView = document.getElementById('detailView');
    if (detailView && detailView.style.display === 'block') {
        showListView();
    } else {
        cancelAddProperty();
    }
}

function showListView() {
    document.getElementById('addPropertyBtn').style.display = 'flex';
    document.getElementById('cancelBtn').style.display = 'none';
    document.getElementById('propertyList').style.display = 'block';
    document.getElementById('addPropertyForm').style.display = 'none';
    
    const detailView = document.getElementById('detailView');
    if (detailView) {
        detailView.style.display = 'none';
    }
    
    currentPropertyId = null;
}

function showDetailView(propertyId) {
    const property = allProperties.find(p => p.id == propertyId);
    if (!property) return;
    
    currentPropertyId = propertyId;
    
    document.getElementById('addPropertyBtn').style.display = 'none';
    document.getElementById('cancelBtn').style.display = 'flex';
    document.getElementById('propertyList').style.display = 'none';
    document.getElementById('addPropertyForm').style.display = 'none';
    
    let detailView = document.getElementById('detailView');
    if (!detailView) {
        detailView = document.createElement('div');
        detailView.id = 'detailView';
        detailView.className = 'detail-view';
        document.querySelector('.property-content').appendChild(detailView);
    }
    
    const statusValue = property.status || 'New Lead';
    const statusClass = statusValue.toLowerCase().replace(/ /g, '-');
    
    // Format price safely
    const formattedPrice = property.price ? parseFloat(property.price).toLocaleString() : '0';
    
    // Safe display values
    const ownerName = property.owner_name || 'N/A';
    const email = property.email || 'N/A';
    const contactNumber = property.contact_number || 'N/A';
    const address = property.address || 'N/A';
    const city = property.city || 'N/A';
    const province = property.province || 'N/A';
    const propertyType = property.property_type || 'N/A';
    const floorArea = property.floor_area ? `${property.floor_area} sqm` : 'N/A';
    const lotArea = property.lot_area ? `${property.lot_area} sqm` : 'N/A';
    const bedrooms = property.bedrooms || 'N/A';
    const bathrooms = property.bathrooms || 'N/A';
    
    detailView.innerHTML = `
        <div class="tab-navigation">
            <button class="btn-back-detail" onclick="showListView()" title="Back to List">
                <i class="fas fa-arrow-left"></i>
            </button>
            <div class="tab-container">
                <button class="tab-button active" data-tab="overview">Overview</button>
                <button class="tab-button" data-tab="activities">Activities</button>
            </div>
            <button class="btn-add-task" id="addTaskBtn" style="display: none;">
                <i class="fas fa-plus"></i> Add Task
            </button>
        </div>
        
        <div id="overviewTab" class="tab-content">
            <div class="lead-info-container">
                <div class="lead-info-row">
                    <span class="lead-info-label">Owner name :</span>
                    <span class="lead-info-value">${ownerName}</span>
                </div>
                <div class="lead-info-row">
                    <span class="lead-info-label">Email :</span>
                    <span class="lead-info-value">${email}</span>
                </div>
                <div class="lead-info-row">
                    <span class="lead-info-label">Contact number :</span>
                    <span class="lead-info-value">${contactNumber}</span>
                </div>
                <div class="lead-info-row">
                    <span class="lead-info-label">Tag :</span>
                    <span class="lead-info-value"><span class="status-badge status-${statusClass}">${statusValue}</span></span>
                </div>
            </div>
            
            <div class="property-info-section">
                <h3 class="property-info-title">Property Information</h3>
                <div class="property-info-container">
                    <div class="property-info-grid">
                        <div class="property-info-item">
                            <label>Address :</label>
                            <span>${address}, ${city}, ${province}</span>
                        </div>
                        <div class="property-info-item">
                            <label>Price :</label>
                            <span>₱${formattedPrice}</span>
                        </div>
                        <div class="property-info-item">
                            <label>Floor Area :</label>
                            <span>${floorArea}</span>
                        </div>
                        <div class="property-info-item">
                            <label>Lot Area :</label>
                            <span>${lotArea}</span>
                        </div>
                        <div class="property-info-item">
                            <label>Bedrooms :</label>
                            <span>${bedrooms}</span>
                        </div>
                        <div class="property-info-item">
                            <label>Bathrooms :</label>
                            <span>${bathrooms}</span>
                        </div>
                        <div class="property-info-item">
                            <label>Property type :</label>
                            <span>${propertyType}</span>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="notes-section">
                <h3 class="notes-title">Notes</h3>
                <textarea class="notes-textarea-editable" id="notesTextarea-${property.id}" placeholder="Click here to add notes...">${property.description || ''}</textarea>
                <div class="notes-save-indicator" id="saveIndicator-${property.id}" style="display: none;">
                    <i class="fas fa-check-circle"></i> Saved
                </div>
            </div>
        </div>
        
        <div id="activitiesTab" class="tab-content" style="display: none;">
            <div class="activities-content">
                <p class="task-assigned-info">Tasks for <strong id="clientNameDisplay">${property.owner_name}</strong></p>
                
                <!-- All Tasks Section -->
                <div class="all-tasks-section" id="allTasksSection">
                    <h3 class="activities-section-title">Activities</h3>
                    <div class="all-tasks-container" id="allTasksContainer">
                        <p style="text-align: center; color: #6c757d; padding: 20px;">Loading tasks...</p>
                    </div>
                </div>
                
                <div class="task-type-tabs">
                    <div class="task-type-tab active" data-type="todo">
                        To-do
                        <span class="task-count-badge" id="todoCount">0</span>
                    </div>
                    <div class="task-type-tab" data-type="call">
                        Calls
                        <span class="task-count-badge" id="callCount">0</span>
                    </div>
                    <div class="task-type-tab" data-type="email">
                        Email
                        <span class="task-count-badge" id="emailCount">0</span>
                    </div>
                </div>
                
                <div class="activity-tasks-container" id="activityTasksContainer">
                    <p style="text-align: center; color: #6c757d; padding: 40px;">Loading tasks...</p>
                </div>
            </div>
            
            <div class="modal-overlay" id="activityTaskModal">
                <div class="activity-task-modal">
                    <div class="modal-header">Create Task</div>
                    
                    <form id="activityTaskForm">
                        <input type="hidden" name="property_id" id="taskPropertyId">
                        
                        <div class="form-group">
                            <label class="form-label">Task Title *</label>
                            <input type="text" name="title" class="form-input" placeholder="Meeting with client" required>
                        </div>

                        <div class="form-row">
                            <div class="form-group">
                                <label class="form-label">Task Type *</label>
                                <select name="task_type" class="form-select" required id="activityTaskType">
                                    <option value="todo">To-do</option>
                                    <option value="call">Call</option>
                                    <option value="email">Email</option>
                                </select>
                            </div>
                            <div class="form-group" id="activity-priority-group">
                                <label class="form-label">Priority *</label>
                                <select name="priority" class="form-select" required>
                                    <option value="High">High</option>
                                    <option value="Medium">Medium</option>
                                    <option value="Low">Low</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="form-group" id="activity-status-group">
                                <label class="form-label">Status *</label>
                                <select name="status" class="form-select">
                                    <option value="Not Started">Not Started</option>
                                    <option value="Upcoming">Upcoming</option>
                                    <option value="On Progress">On Progress</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label class="form-label">Assigned to:</label>
                                <input type="text" name="assigned_to" class="form-input" placeholder="Name">
                            </div>
                        </div>

                        <div class="date-time-row">
                            <div class="form-group">
                                <label class="form-label">Date:</label>
                                <input type="date" name="due_date" class="form-input">
                            </div>
                            <div class="form-group">
                                <label class="form-label">Time:</label>
                                <input type="time" name="due_time" class="form-input">
                            </div>
                            <div class="form-group">
                                <label class="form-label">Queue:</label>
                                <input type="number" name="queue_number" class="form-input" value="1" min="1">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="form-label">Notes</label>
                            <textarea name="notes" class="form-textarea" placeholder="Add task notes..."></textarea>
                        </div>

                        <div class="modal-buttons">
                            <button type="submit" class="btn-create">Create</button>
                            <button type="button" class="btn-cancel-modal">Cancel</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    `;
    
    detailView.style.display = 'block';
    
    const tabButtons = detailView.querySelectorAll('.tab-button');
    tabButtons.forEach(button => {
        button.addEventListener('click', function() {
            switchTab(this.getAttribute('data-tab'));
        });
    });
    
    const addTaskBtn = document.getElementById('addTaskBtn');
    if (addTaskBtn) {
        addTaskBtn.addEventListener('click', openActivityTaskModal);
    }
    
    const taskTypeTabs = detailView.querySelectorAll('.task-type-tab');
    taskTypeTabs.forEach(tab => {
        tab.addEventListener('click', function() {
            switchTaskTypeTab(this.getAttribute('data-type'));
        });
    });
    
    const activityTaskForm = document.getElementById('activityTaskForm');
    if (activityTaskForm) {
        activityTaskForm.addEventListener('submit', function(e) {
            e.preventDefault();
            createActivityTask();
        });
    }
    
    const cancelModalBtn = detailView.querySelector('.btn-cancel-modal');
    if (cancelModalBtn) {
        cancelModalBtn.addEventListener('click', closeActivityTaskModal);
    }
    
    const activityTaskType = document.getElementById('activityTaskType');
    if (activityTaskType) {
        activityTaskType.addEventListener('change', toggleActivityTaskFields);
    }
    
    const activityModal = document.getElementById('activityTaskModal');
    if (activityModal) {
        activityModal.addEventListener('click', function(e) {
            if (e.target === this) {
                closeActivityTaskModal();
            }
        });
    }
    
    const notesTextarea = detailView.querySelector('.notes-textarea-editable');
    if (notesTextarea) {
        let saveTimeout;
        notesTextarea.addEventListener('input', function() {
            clearTimeout(saveTimeout);
            saveTimeout = setTimeout(() => {
                autoSaveNotes(propertyId, this.value);
            }, 1000);
        });
    }
}

function switchTab(tabName) {
    const tabButtons = document.querySelectorAll('.tab-button');
    tabButtons.forEach(btn => btn.classList.remove('active'));
    
    const activeButton = document.querySelector(`[data-tab="${tabName}"]`);
    if (activeButton) {
        activeButton.classList.add('active');
    }
    
    const addTaskBtn = document.getElementById('addTaskBtn');
    
    if (tabName === 'overview') {
        document.getElementById('overviewTab').style.display = 'block';
        document.getElementById('activitiesTab').style.display = 'none';
        if (addTaskBtn) addTaskBtn.style.display = 'none';
    } else if (tabName === 'activities') {
        document.getElementById('overviewTab').style.display = 'none';
        document.getElementById('activitiesTab').style.display = 'block';
        if (addTaskBtn) addTaskBtn.style.display = 'flex';
        loadActivities(currentPropertyId);
    }
}

function loadActivities(propertyId) {
    if (!propertyId) return;
    
    currentActiveTaskType = 'todo';
    
    fetch(`get_property_tasks.php?property_id=${propertyId}`)
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            displayActivityTasks(data.tasks, data.counts);
        } else {
            document.getElementById('activityTasksContainer').innerHTML = 
                '<p style="text-align: center; color: #dc3545; padding: 40px;">Failed to load tasks</p>';
        }
    })
    .catch(error => {
        console.error('Error loading tasks:', error);
        document.getElementById('activityTasksContainer').innerHTML = 
            '<p style="text-align: center; color: #dc3545; padding: 40px;">Error loading tasks</p>';
    });
}

function displayActivityTasks(tasks, counts) {
    currentActivityTasks = tasks;
    
    document.getElementById('todoCount').textContent = counts.todo || 0;
    document.getElementById('callCount').textContent = counts.call || 0;
    document.getElementById('emailCount').textContent = counts.email || 0;
    
    // Display all tasks in the Activities section
    displayAllTasks(tasks);
    
    // Display tasks by type in the tabbed section
    displayTasksByType(currentActiveTaskType);
}

function displayAllTasks(tasks) {
    const allTasksContainer = document.getElementById('allTasksContainer');
    
    // Combine all tasks from all types
    const allTasks = [...tasks.todo, ...tasks.call, ...tasks.email];
    
    // Filter to show only property-specific tasks (tasks with property_id)
    const propertyTasks = allTasks.filter(task => task.property_id != null);
    
    if (propertyTasks.length === 0) {
        allTasksContainer.innerHTML = '<p style="text-align: center; color: #6c757d; padding: 20px;">No tasks for this property yet. Click "Add Task" to create one.</p>';
        return;
    }
    
    allTasksContainer.innerHTML = '';
    
    propertyTasks.forEach(task => {
        const taskItem = document.createElement('div');
        taskItem.className = 'all-task-item';
        taskItem.setAttribute('data-task-id', task.id);
        
        const taskDate = task.due_date ? new Date(task.due_date).toLocaleDateString('en-US', {
            month: 'long',
            day: 'numeric',
            year: 'numeric'
        }) : '';
        
        let taskContent = `
            <input type="checkbox" class="task-checkbox-all" data-task-id="${task.id}">
            <div class="task-content-all">
                <div class="task-title-all">${task.title}</div>
                ${taskDate ? `<div class="task-date-all">${taskDate}</div>` : ''}
                ${task.assigned_to ? `<div class="task-assignee-all">${task.assigned_to}</div>` : ''}
        `;
        
        if (task.task_type === 'todo' && task.status && task.priority) {
            const statusClass = task.status.toLowerCase().replace(' ', '-');
            const priorityClass = task.priority.toLowerCase();
            
            taskContent += `
                <div class="task-details-all">
                    <span class="task-status-all status-${statusClass}">Status: ${task.status}</span>
                    <span class="task-priority-all priority-${priorityClass}">Priority: ${task.priority}</span>
                </div>
            `;
        }
        
        taskContent += '</div>';
        taskItem.innerHTML = taskContent;
        
        const checkbox = taskItem.querySelector('.task-checkbox-all');
        checkbox.addEventListener('change', function() {
            if (this.checked) {
                handleActivityTaskComplete(task.id);
            }
        });
        
        allTasksContainer.appendChild(taskItem);
    });
}

function displayTasksByType(type) {
    const container = document.getElementById('activityTasksContainer');
    const tasks = currentActivityTasks[type] || [];
    
    if (tasks.length === 0) {
        container.innerHTML = '<p style="text-align: center; color: #6c757d; padding: 40px;">No tasks found</p>';
        return;
    }
    
    container.innerHTML = '';
    
    tasks.forEach(task => {
        container.appendChild(createActivityTaskElement(task));
    });
}

function createActivityTaskElement(task) {
    const taskItem = document.createElement('div');
    taskItem.className = 'activity-task-item';
    taskItem.setAttribute('data-task-id', task.id);
    
    const taskDate = task.due_date ? new Date(task.due_date).toLocaleDateString('en-US', {
        month: 'long',
        day: 'numeric',
        year: 'numeric'
    }) : '';
    
    let taskContent = `
        <input type="checkbox" class="task-checkbox" data-task-id="${task.id}">
        <div class="task-content-activity">
            <div class="task-title-activity">${task.title}</div>
    `;
    
    if (taskDate) {
        taskContent += `<div class="task-date-activity">${taskDate}</div>`;
    }
    
    if (task.assigned_to) {
        taskContent += `
            <div class="task-assignee-activity">
                <i class="fas fa-user"></i>
                <span>${task.assigned_to}</span>
            </div>
        `;
    }
    
    if (task.task_type === 'todo' && task.status && task.priority) {
        const statusClass = task.status.toLowerCase().replace(' ', '-');
        const priorityClass = task.priority.toLowerCase();
        
        taskContent += `
            <div class="task-details-activity">
                <div class="task-status-activity status-${statusClass}">Status: ${task.status}</div>
                <div class="task-priority-activity priority-${priorityClass}">Priority: ${task.priority}</div>
            </div>
        `;
    }
    
    if (task.notes) {
        taskContent += `<div class="task-notes-activity"><i class="fas fa-sticky-note"></i> ${task.notes}</div>`;
    }
    
    taskContent += '</div>';
    taskItem.innerHTML = taskContent;
    
    const checkbox = taskItem.querySelector('.task-checkbox');
    checkbox.addEventListener('change', function() {
        if (this.checked) {
            handleActivityTaskComplete(task.id);
        }
    });
    
    return taskItem;
}

function handleActivityTaskComplete(taskId) {
    if (!confirm('Mark this task as completed?')) {
        const checkbox = document.querySelector(`[data-task-id="${taskId}"] .task-checkbox`);
        if (checkbox) checkbox.checked = false;
        const checkboxAll = document.querySelector(`[data-task-id="${taskId}"] .task-checkbox-all`);
        if (checkboxAll) checkboxAll.checked = false;
        return;
    }
    
    fetch('complete_task.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({ task_id: taskId })
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            loadActivities(currentPropertyId);
        } else {
            alert('Error: ' + data.message);
            const checkbox = document.querySelector(`[data-task-id="${taskId}"] .task-checkbox`);
            if (checkbox) checkbox.checked = false;
            const checkboxAll = document.querySelector(`[data-task-id="${taskId}"] .task-checkbox-all`);
            if (checkboxAll) checkboxAll.checked = false;
        }
    })
    .catch(error => {
        console.error('Error completing task:', error);
        alert('An error occurred. Please try again.');
        const checkbox = document.querySelector(`[data-task-id="${taskId}"] .task-checkbox`);
        if (checkbox) checkbox.checked = false;
        const checkboxAll = document.querySelector(`[data-task-id="${taskId}"] .task-checkbox-all`);
        if (checkboxAll) checkboxAll.checked = false;
    });
}

function switchTaskTypeTab(type) {
    currentActiveTaskType = type;
    
    document.querySelectorAll('.task-type-tab').forEach(tab => {
        tab.classList.remove('active');
    });
    document.querySelector(`[data-type="${type}"]`).classList.add('active');
    
    displayTasksByType(type);
}

function openActivityTaskModal() {
    document.getElementById('taskPropertyId').value = currentPropertyId;
    document.getElementById('activityTaskModal').classList.add('show');
    document.body.style.overflow = 'hidden';
    toggleActivityTaskFields();
}

function closeActivityTaskModal() {
    document.getElementById('activityTaskModal').classList.remove('show');
    document.body.style.overflow = 'auto';
    document.getElementById('activityTaskForm').reset();
    toggleActivityTaskFields();
}

function toggleActivityTaskFields() {
    const taskType = document.getElementById('activityTaskType').value;
    const statusGroup = document.getElementById('activity-status-group');
    const priorityGroup = document.getElementById('activity-priority-group');
    
    if (taskType === 'todo') {
        if (statusGroup) statusGroup.style.display = 'block';
        if (priorityGroup) priorityGroup.style.display = 'block';
    } else {
        if (statusGroup) statusGroup.style.display = 'none';
        if (priorityGroup) priorityGroup.style.display = 'none';
    }
}

function createActivityTask() {
    const form = document.getElementById('activityTaskForm');
    const formData = new FormData(form);
    
    const createBtn = document.querySelector('#activityTaskForm .btn-create');
    const originalText = createBtn.textContent;
    createBtn.textContent = 'Creating...';
    createBtn.disabled = true;
    
    fetch('add_property_task.php', {
        method: 'POST',
        body: formData
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            alert('Task created successfully!');
            closeActivityTaskModal();
            loadActivities(currentPropertyId);
        } else {
            alert('Error: ' + data.message);
        }
    })
    .catch(error => {
        console.error('Error creating task:', error);
        alert('An error occurred. Please try again.');
    })
    .finally(() => {
        createBtn.textContent = originalText;
        createBtn.disabled = false;
    });
}

function addProperty() {
    const form = document.getElementById('propertyForm');
    const formData = new FormData(form);
    
    const submitBtn = document.querySelector('.btn-save');
    const originalText = submitBtn.innerHTML;
    submitBtn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Saving...';
    submitBtn.disabled = true;
    
    fetch('get_properties.php', {
        method: 'POST',
        body: formData
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            alert('Property added successfully!');
            cancelAddProperty();
            loadProperties();
        } else {
            alert('Error: ' + data.message);
        }
    })
    .catch(error => {
        console.error('Error adding property:', error);
        alert('An error occurred. Please try again.');
    })
    .finally(() => {
        submitBtn.innerHTML = originalText;
        submitBtn.disabled = false;
    });
}

function loadProperties() {
    const searchTerm = document.getElementById('searchProperties').value;
    
    let url = 'get_properties.php?';
    if (searchTerm) url += 'search=' + encodeURIComponent(searchTerm);
    
    fetch(url)
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            allProperties = data.properties;
            displayProperties(data.properties);
        } else {
            document.getElementById('propertyTableBody').innerHTML = 
                '<tr><td colspan="6" style="text-align: center; color: #dc3545;">Failed to load properties</td></tr>';
        }
    })
    .catch(error => {
        console.error('Error loading properties:', error);
        document.getElementById('propertyTableBody').innerHTML = 
            '<tr><td colspan="6" style="text-align: center; color: #dc3545;">Error loading properties</td></tr>';
    });
}

function displayProperties(properties) {
    const tableBody = document.getElementById('propertyTableBody');
    
    if (properties.length === 0) {
        tableBody.innerHTML = '<tr><td colspan="6" style="text-align: center; padding: 40px; color: #6c757d;">No properties found</td></tr>';
        return;
    }
    
    tableBody.innerHTML = '';
    
    properties.forEach(property => {
        const row = document.createElement('tr');
        row.style.cursor = 'pointer';
        
        const statusValue = property.status || 'New Lead';
        const statusClass = 'status-' + statusValue.toLowerCase().replace(/ /g, '-');
        const fullAddress = `${property.address}, ${property.city}, ${property.province}`;
        
        // Format price safely
        const formattedPrice = property.price ? parseFloat(property.price).toLocaleString() : '0';
        
        row.innerHTML = `
            <td><strong>${property.owner_name || ''}</strong></td>
            <td>${fullAddress}<br>
                <small>₱${formattedPrice}</small></td>
            <td>${property.contact_number || ''}</td>
            <td>${property.email || ''}</td>
            <td>
                <select class="tag-dropdown ${statusClass}" onchange="updatePropertyTag(${property.id}, this.value)" onclick="event.stopPropagation()">
                    <option value="New Lead" ${statusValue === 'New Lead' ? 'selected' : ''}>New Lead</option>
                    <option value="Proposal" ${statusValue === 'Proposal' ? 'selected' : ''}>Proposal</option>
                    <option value="Follow Up" ${statusValue === 'Follow Up' ? 'selected' : ''}>Follow Up</option>
                    <option value="On Progress" ${statusValue === 'On Progress' ? 'selected' : ''}>On Progress</option>
                    <option value="Negotiation" ${statusValue === 'Negotiation' ? 'selected' : ''}>Negotiation</option>
                    <option value="Signing Contract" ${statusValue === 'Signing Contract' ? 'selected' : ''}>Signing Contract</option>
                    <option value="Not Interested" ${statusValue === 'Not Interested' ? 'selected' : ''}>Not Interested</option>
                    <option value="Closed Deal" ${statusValue === 'Closed Deal' ? 'selected' : ''}>Closed Deal</option>
                </select>
            </td>
            <td>
                <div class="action-buttons">
                    <button class="btn-action btn-edit" onclick="event.stopPropagation(); editProperty(${property.id})" title="Edit">
                        <i class="fas fa-edit"></i>
                    </button>
                    <button class="btn-action btn-delete" onclick="event.stopPropagation(); deleteProperty(${property.id})" title="Delete">
                        <i class="fas fa-trash"></i>
                    </button>
                </div>
            </td>
        `;
        
        row.addEventListener('click', function(e) {
            if (!e.target.classList.contains('tag-dropdown')) {
                showDetailView(property.id);
            }
        });
        
        tableBody.appendChild(row);
    });
}

function updatePropertyTag(propertyId, newTag) {
    fetch('update_property_tag.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({
            property_id: propertyId,
            tag: newTag
        })
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            const property = allProperties.find(p => p.id == propertyId);
            if (property) {
                property.status = newTag;
            }
            
            const dropdown = document.querySelector(`select[onchange*="${propertyId}"]`);
            if (dropdown) {
                dropdown.className = 'tag-dropdown';
                const statusClass = 'status-' + newTag.toLowerCase().replace(/ /g, '-');
                dropdown.classList.add(statusClass);
            }
        } else {
            alert('Error: ' + data.message);
            loadProperties();
        }
    })
    .catch(error => {
        console.error('Error updating tag:', error);
        alert('An error occurred. Please try again.');
        loadProperties();
    });
}

function searchProperties() {
    loadProperties();
}

function toggleSortDropdown() {
    const dropdown = document.getElementById('sortDropdown');
    dropdown.classList.toggle('show');
    
    // Close dropdown when clicking outside
    document.addEventListener('click', function closeDropdown(e) {
        if (!e.target.closest('.dropdown-sort')) {
            dropdown.classList.remove('show');
            document.removeEventListener('click', closeDropdown);
        }
    });
}

function sortByTag(tagName) {
    const dropdown = document.getElementById('sortDropdown');
    dropdown.classList.remove('show');
    
    if (tagName === 'all') {
        // Show all properties in original order
        displayProperties(allProperties);
    } else {
        // Filter properties by selected tag
        const filteredProperties = allProperties.filter(property => {
            const status = property.status || 'New Lead';
            return status === tagName;
        });
        displayProperties(filteredProperties);
    }
}

function editProperty(propertyId) {
    const property = allProperties.find(p => p.id == propertyId);
    if (property) {
        alert('Edit property: ' + property.property_type + '\n(Edit functionality will be implemented)');
    }
}

function deleteProperty(propertyId) {
    const property = allProperties.find(p => p.id == propertyId);
    if (!property) return;
    
    if (!confirm(`Are you sure you want to delete this property?`)) {
        return;
    }
    
    fetch('delete_property.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({ property_id: propertyId })
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            alert('Property deleted successfully!');
            loadProperties();
        } else {
            alert('Error: ' + data.message);
        }
    })
    .catch(error => {
        console.error('Error deleting property:', error);
        alert('An error occurred. Please try again.');
    });
}

function autoSaveNotes(propertyId, notes) {
    const saveIndicator = document.getElementById(`saveIndicator-${propertyId}`);
    
    fetch('update_notes.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({
            property_id: propertyId,
            notes: notes
        })
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            const property = allProperties.find(p => p.id == propertyId);
            if (property) {
                property.description = notes;
            }
            
            if (saveIndicator) {
                saveIndicator.style.display = 'flex';
                setTimeout(() => {
                    saveIndicator.style.display = 'none';
                }, 2000);
            }
        }
    })
    .catch(error => {
        console.error('Error saving notes:', error);
    });
}
