// Profile Management JavaScript
let userProfile = {};
let isEditing = false;

// Available languages
const availableLanguages = [
    { code: 'en-US', name: 'English - United States' },
    { code: 'en-GB', name: 'English - United Kingdom' },
    { code: 'es', name: 'Spanish' },
    { code: 'fr', name: 'French' },
    { code: 'de', name: 'German' },
    { code: 'it', name: 'Italian' },
    { code: 'pt', name: 'Portuguese' },
    { code: 'zh', name: 'Chinese' },
    { code: 'ja', name: 'Japanese' },
    { code: 'ko', name: 'Korean' },
    { code: 'fil', name: 'Filipino' },
    { code: 'tl', name: 'Tagalog' }
];

document.addEventListener('DOMContentLoaded', function() {
    // Load user profile directly - let PHP handle session checking
    loadUserProfile();
});

// Function to capitalize first letter of each word
function capitalizeWords(str) {
    if (!str) return '';
    return str.toLowerCase().split(' ').map(word => 
        word.charAt(0).toUpperCase() + word.slice(1)
    ).join(' ');
}

// Function to format full name
function formatFullName(firstName, lastName) {
    const formattedFirst = capitalizeWords(firstName);
    const formattedLast = capitalizeWords(lastName);
    return `${formattedFirst} ${formattedLast}`;
}

// Load user profile from database
function loadUserProfile() {
    console.log('Loading profile...');
    
    fetch('get_profile.php') 
    .then(response => {
        if (!response.ok) {
            throw new Error('Network response was not ok');
        }
        return response.text();
    })
    .then(text => {
        console.log('Raw response:', text);
        try {
            const data = JSON.parse(text);
            console.log('Parsed data:', data);
            
            if (data.success) {
                // Format names with proper capitalization
                data.profile.first_name = capitalizeWords(data.profile.first_name);
                data.profile.last_name = capitalizeWords(data.profile.last_name);
                data.profile.full_name = formatFullName(data.profile.first_name, data.profile.last_name);
                
                userProfile = data.profile;
                displayProfile(data.profile);
                console.log('Profile loaded successfully:', data.profile);
            } else {
                console.error('Failed to load profile:', data);
                if (data.message === 'Not authenticated') {
                    alert('Session expired. Please log in again.');
                    window.location.href = 'index.html';
                } else {
                    alert('Error loading profile: ' + data.message);
                }
            }
        } catch (e) {
            console.error('JSON parse error:', e);
            console.error('Response was not valid JSON:', text);
            alert('Server returned invalid response. Check console for details.');
        }
    })
    .catch(error => {
        console.error('Network error loading profile:', error);
        alert('Network error occurred while loading your profile.');
    });
}

// Display profile data in the HTML
function displayProfile(profile) {
    // Update header section with full name
    document.getElementById('userName').textContent = profile.full_name;
    document.getElementById('userEmail').textContent = profile.email;
    
    // Update profile details
    document.getElementById('fullName').textContent = profile.full_name;
    document.getElementById('phoneNumber').textContent = profile.phone_number || 'Not provided';
    document.getElementById('gender').textContent = profile.gender;
    document.getElementById('country').textContent = profile.country;
    document.getElementById('language').textContent = profile.language;
    document.getElementById('timezone').textContent = profile.timezone;
    
    // Update email list
    updateEmailList([profile.email]);
    
    // Update phone list
    if (profile.phone_number && profile.phone_number !== 'Not provided') {
        updatePhoneList([profile.phone_number]);
    } else {
        updatePhoneList([]);
    }
}

// Update email list display
function updateEmailList(emails) {
    const emailList = document.getElementById('emailList');
    emailList.innerHTML = '';
    
    emails.forEach(email => {
        const listItem = document.createElement('li');
        listItem.innerHTML = `
            <i class="fas fa-envelope"></i>
            <span>${email}</span>
            <button class="delete-contact" onclick="deleteEmail(this)" style="display: none;">
                <i class="fas fa-trash"></i> Remove
            </button>
        `;
        emailList.appendChild(listItem);
    });
}

// Update phone list display
function updatePhoneList(phones) {
    const phoneList = document.getElementById('phoneList');
    phoneList.innerHTML = '';
    
    if (phones.length === 0) {
        const listItem = document.createElement('li');
        listItem.innerHTML = `
            <i class="fas fa-phone"></i>
            <span style="color: #999;">No phone number added</span>
        `;
        phoneList.appendChild(listItem);
    } else {
        phones.forEach(phone => {
            const listItem = document.createElement('li');
            listItem.innerHTML = `
                <i class="fas fa-phone"></i>
                <span>${phone}</span>
                <button class="delete-contact" onclick="deletePhone(this)" style="display: none;">
                    <i class="fas fa-trash"></i> Remove
                </button>
            `;
            phoneList.appendChild(listItem);
        });
    }
}

// Edit profile function
function editProfile() {
    if (isEditing) {
        cancelEdit();
        return;
    }
    
    // Show edit form modal
    showEditForm();
}

// Show edit form modal
function showEditForm() {
    // Create language options
    const languageOptions = availableLanguages.map(lang => {
        const selected = lang.name === userProfile.language ? 'selected' : '';
        return `<option value="${lang.name}" ${selected}>${lang.name}</option>`;
    }).join('');
    
    const modal = document.createElement('div');
    modal.className = 'modal-overlay';
    modal.id = 'editProfileModal';
    modal.innerHTML = `
        <div class="modal" style="max-width: 500px; max-height: 90vh; overflow-y: auto;">
            <div class="modal-header">
                <h3>Edit Profile</h3>
                <button class="close-modal" onclick="cancelEdit()">&times;</button>
            </div>
            <form id="editProfileForm" onsubmit="updateProfile(event)">
                <div class="form-group">
                    <label for="editFirstName">First Name</label>
                    <input type="text" id="editFirstName" name="first_name" 
                           value="${userProfile.first_name}" 
                           oninput="this.value = capitalizeWords(this.value)"
                           required>
                </div>
                <div class="form-group">
                    <label for="editLastName">Last Name</label>
                    <input type="text" id="editLastName" name="last_name" 
                           value="${userProfile.last_name}" 
                           oninput="this.value = capitalizeWords(this.value)"
                           required>
                </div>
                <div class="form-group">
                    <label for="editEmail">Email</label>
                    <input type="email" id="editEmail" name="email" 
                           value="${userProfile.email}" required>
                </div>
                <div class="form-group">
                    <label for="editPhone">Phone Number</label>
                    <input type="tel" id="editPhone" name="contact_number" 
                           value="${userProfile.phone_number === 'Not provided' ? '' : userProfile.phone_number || ''}"
                           placeholder="+63 912 345 6789">
                </div>
                <div class="form-group">
                    <label for="editLanguage">Language</label>
                    <select id="editLanguage" name="language" required>
                        ${languageOptions}
                    </select>
                </div>
                <div class="form-group">
                    <label for="editGender">Gender</label>
                    <select id="editGender" name="gender">
                        <option value="Not specified" ${userProfile.gender === 'Not specified' ? 'selected' : ''}>Prefer not to say</option>
                        <option value="Male" ${userProfile.gender === 'Male' ? 'selected' : ''}>Male</option>
                        <option value="Female" ${userProfile.gender === 'Female' ? 'selected' : ''}>Female</option>
                        <option value="Other" ${userProfile.gender === 'Other' ? 'selected' : ''}>Other</option>
                    </select>
                </div>
                <div class="modal-actions">
                    <button type="button" class="btn-secondary" onclick="cancelEdit()">Cancel</button>
                    <button type="submit" class="btn-primary">Update Profile</button>
                </div>
            </form>
        </div>
    `;
    
    document.body.appendChild(modal);
    // Force reflow before adding active class for animation
    modal.offsetHeight;
    modal.classList.add('active');
    isEditing = true;
}

// Update profile via API
function updateProfile(event) {
    event.preventDefault();
    
    const form = document.getElementById('editProfileForm');
    const formData = new FormData(form);
    
    // Format names before sending
    const firstName = capitalizeWords(formData.get('first_name'));
    const lastName = capitalizeWords(formData.get('last_name'));
    formData.set('first_name', firstName);
    formData.set('last_name', lastName);
    
    const submitBtn = form.querySelector('.btn-primary');
    const originalText = submitBtn.textContent;
    submitBtn.textContent = 'Updating...';
    submitBtn.disabled = true;
    
    fetch('update_profile.php', {
        method: 'POST',
        body: formData
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            alert('Profile updated successfully!');
            cancelEdit();
            loadUserProfile(); // Reload profile data
        } else {
            alert('Error: ' + data.message);
        }
    })
    .catch(error => {
        console.error('Error updating profile:', error);
        alert('An error occurred while updating your profile.');
    })
    .finally(() => {
        submitBtn.textContent = originalText;
        submitBtn.disabled = false;
    });
}

// Cancel edit mode
function cancelEdit() {
    isEditing = false;
    
    // Remove edit modal if exists
    const modal = document.getElementById('editProfileModal');
    if (modal) {
        modal.classList.remove('active');
        setTimeout(() => {
            modal.remove();
        }, 300);
    }
}

// ========== MODAL CONTROL FUNCTIONS ==========

function openEmailModal() {
    const modal = document.getElementById('emailModal');
    modal.classList.add('active');
    setTimeout(() => {
        document.getElementById('newEmail').focus();
    }, 100);
}

function closeEmailModal() {
    const modal = document.getElementById('emailModal');
    modal.classList.remove('active');
    document.getElementById('emailForm').reset();
}

function openPhoneModal() {
    const modal = document.getElementById('phoneModal');
    modal.classList.add('active');
    setTimeout(() => {
        document.getElementById('newPhone').focus();
    }, 100);
}

function closePhoneModal() {
    const modal = document.getElementById('phoneModal');
    modal.classList.remove('active');
    document.getElementById('phoneForm').reset();
}

// ========== ADD EMAIL/PHONE FUNCTIONS ==========

function addEmail(event) {
    event.preventDefault();
    
    const email = document.getElementById('newEmail').value;
    
    // Check for duplicates
    const existingEmails = document.querySelectorAll('#emailList li span');
    for (let emailSpan of existingEmails) {
        if (emailSpan.textContent === email) {
            alert('This email address already exists!');
            return;
        }
    }
    
    // For now, just add to the display
    const emailList = document.getElementById('emailList');
    const newEmailItem = document.createElement('li');
    newEmailItem.innerHTML = `
        <i class="fas fa-envelope"></i>
        <span>${email}</span>
        <button class="delete-contact" onclick="deleteEmail(this)">
            <i class="fas fa-trash"></i> Remove
        </button>
    `;
    
    emailList.appendChild(newEmailItem);
    closeEmailModal();
    
    alert('Email added successfully! (Note: This is a demo - in production, this would be saved to your profile)');
}

function addPhone(event) {
    event.preventDefault();
    
    const phone = document.getElementById('newPhone').value;
    
    // Check for duplicates
    const existingPhones = document.querySelectorAll('#phoneList li span');
    for (let phoneSpan of existingPhones) {
        if (phoneSpan.textContent === phone) {
            alert('This phone number already exists!');
            return;
        }
    }
    
    // For now, just add to the display
    const phoneList = document.getElementById('phoneList');
    const newPhoneItem = document.createElement('li');
    newPhoneItem.innerHTML = `
        <i class="fas fa-phone"></i>
        <span>${phone}</span>
        <button class="delete-contact" onclick="deletePhone(this)">
            <i class="fas fa-trash"></i> Remove
        </button>
    `;
    
    phoneList.appendChild(newPhoneItem);
    closePhoneModal();
    
    alert('Phone added successfully! (Note: This is a demo - in production, this would be saved to your profile)');
}

// ========== DELETE FUNCTIONS ==========

function deleteEmail(button) {
    alert('Email deletion is disabled in this demo to prevent removing your login email.');
}

function deletePhone(button) {
    if (confirm('Are you sure you want to remove this phone number?')) {
        const listItem = button.closest('li');
        listItem.remove();
        alert('Phone number removed! (Note: This is a demo - in production, this would be saved to your profile)');
    }
}
