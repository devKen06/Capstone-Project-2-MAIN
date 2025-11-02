// Global variables
let selectedProperty = null;
let chartInstance = null;
let currentEstimationData = null;

// Initialize on page load
window.addEventListener('DOMContentLoaded', function() {
    initializeSearch();
    initializeEventListeners();
});

// Initialize search functionality
function initializeSearch() {
    const searchInput = document.getElementById('propertySearch');
    if (searchInput) {
        searchInput.addEventListener('input', debounce(handleSearch, 300));
        
        // Close dropdown when clicking outside
        document.addEventListener('click', function(e) {
            if (!e.target.closest('.search-container')) {
                closeSearchDropdown();
            }
        });
    }
}

// Initialize other event listeners
function initializeEventListeners() {
    // User dropdown toggle
    window.toggleUserDropdown = function() {
        const dropdown = document.getElementById('userDropdown');
        if (dropdown) {
            dropdown.classList.toggle('show');
        }
    };
    
    // Logout modal functions
    window.showLogoutModal = function() {
        const modal = document.getElementById('logoutModal');
        if (modal) {
            modal.classList.add('active');
        }
    };
    
    window.closeLogoutModal = function() {
        const modal = document.getElementById('logoutModal');
        if (modal) {
            modal.classList.remove('active');
        }
    };
    
    window.confirmLogout = function() {
        window.location.href = 'login.html';
    };
}

// Debounce function
function debounce(func, wait) {
    let timeout;
    return function executedFunction(...args) {
        const later = () => {
            clearTimeout(timeout);
            func(...args);
        };
        clearTimeout(timeout);
        timeout = setTimeout(later, wait);
    };
}

// Handle search input
function handleSearch(event) {
    const query = event.target.value.trim();
    
    if (query.length < 2) {
        closeSearchDropdown();
        return;
    }
    
    showSearchLoading();
    
    fetch(`search_properties.php?query=${encodeURIComponent(query)}`)
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                displaySearchResults(data.properties);
            } else {
                showSearchError(data.message || 'Error searching properties');
            }
        })
        .catch(error => {
            console.error('Search error:', error);
            showSearchError('Failed to search properties');
        });
}

// Display search results dropdown
function displaySearchResults(properties) {
    let dropdown = document.getElementById('searchDropdown');
    
    if (!dropdown) {
        dropdown = document.createElement('div');
        dropdown.id = 'searchDropdown';
        dropdown.className = 'search-dropdown';
        document.querySelector('.search-field-wrapper').appendChild(dropdown);
    }
    
    dropdown.innerHTML = '';
    
    if (properties.length === 0) {
        dropdown.innerHTML = '<div class="search-item-empty">No properties found</div>';
        dropdown.style.display = 'block';
        return;
    }
    
    properties.forEach(property => {
        const item = document.createElement('div');
        item.className = 'search-item';
        item.innerHTML = `
            <div class="search-item-name">${property.owner_name}</div>
            <div class="search-item-address">${property.full_address}</div>
            <div class="search-item-type">${property.property_type} - ${property.property_class || 'N/A'}</div>
        `;
        
        item.addEventListener('click', function() {
            selectProperty(property);
        });
        
        dropdown.appendChild(item);
    });
    
    dropdown.style.display = 'block';
}

// Select property from search - Now includes property type and class
function selectProperty(property) {
    selectedProperty = property;
    
    const searchInput = document.getElementById('propertySearch');
    if (searchInput) {
        searchInput.value = property.display_text || `${property.owner_name} - ${property.full_address}`;
    }
    
    closeSearchDropdown();
    
    // Update hidden input fields - INCLUDING TYPE, CLASS, BARANGAY, AND STREET
    document.getElementById('name').value = property.owner_name || '';
    document.getElementById('barangay').value = property.barangay || '';
    document.getElementById('street').value = property.street || '';
    document.getElementById('property-size').value = property.lot_area || '';
    document.getElementById('current-price').value = property.price || '';
    
    // Store property type and class in hidden fields
    if (document.getElementById('property-type')) {
        document.getElementById('property-type').value = property.property_type || '';
    }
    if (document.getElementById('property-class')) {
        document.getElementById('property-class').value = property.property_class || '';
    }
    
    // Update visible display fields
    document.getElementById('name-display').textContent = `: ${property.owner_name || '---'}`;
    document.getElementById('barangay-display').textContent = `: ${property.barangay || '---'}`;
    document.getElementById('street-display').textContent = `: ${property.street || '---'}`;
    document.getElementById('size-display').textContent = `: ${property.lot_area ? property.lot_area + ' sqm' : '---'}`;
    document.getElementById('price-display').textContent = `: ${property.price ? '₱' + parseFloat(property.price).toLocaleString() : '---'}`;
}

// Close search dropdown
function closeSearchDropdown() {
    const dropdown = document.getElementById('searchDropdown');
    if (dropdown) {
        dropdown.style.display = 'none';
    }
}

// Show loading state
function showSearchLoading() {
    let dropdown = document.getElementById('searchDropdown');
    
    if (!dropdown) {
        dropdown = document.createElement('div');
        dropdown.id = 'searchDropdown';
        dropdown.className = 'search-dropdown';
        document.querySelector('.search-field-wrapper').appendChild(dropdown);
    }
    
    dropdown.innerHTML = '<div class="search-item-loading">Searching...</div>';
    dropdown.style.display = 'block';
}

// Show error in dropdown
function showSearchError(message) {
    let dropdown = document.getElementById('searchDropdown');
    
    if (!dropdown) {
        dropdown = document.createElement('div');
        dropdown.id = 'searchDropdown';
        dropdown.className = 'search-dropdown';
        document.querySelector('.search-field-wrapper').appendChild(dropdown);
    }
    
    dropdown.innerHTML = `<div class="search-item-error">${message}</div>`;
    dropdown.style.display = 'block';
}

// ENHANCED: Perform estimation using database-driven Python backend
async function performEstimation() {
    const name = document.getElementById('name').value;
    const barangay = document.getElementById('barangay').value;
    const street = document.getElementById('street').value;
    const propertySize = parseFloat(document.getElementById('property-size').value);
    const currentPrice = parseFloat(document.getElementById('current-price').value);
    
    // Get property type and class from selected property or hidden fields
    const propertyType = selectedProperty?.property_type || 
                        document.getElementById('property-type')?.value || '';
    const propertyClass = selectedProperty?.property_class || 
                         document.getElementById('property-class')?.value || '';
    
    if (!name || !barangay || !propertySize || !currentPrice) {
        alert('Please fill in all required fields (name, barangay, size, and price) before estimating');
        return;
    }
    
    // Show loading state with message
    showEstimationLoading('Analyzing similar properties in database...');
    
    try {
        // Call enhanced PHP endpoint with property details (using zonal values)
        const response = await fetch('calculate_estimation_zonal.php', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({
                name: name,
                barangay: barangay,
                street: street,
                property_size: propertySize,
                property_type: propertyType,
                property_class: propertyClass
            })
        });
        
        const data = await response.json();
        
        if (!data.success) {
            throw new Error(data.message || 'Estimation failed');
        }
        
        // Store estimation data globally
        currentEstimationData = data;
        
        // Display estimation results with data source info
        displayEstimationResults(data);
        
    } catch (error) {
        console.error('Estimation error:', error);
        alert('Error calculating estimation: ' + error.message);
        hideEstimationLoading();
    }
}

// Display estimation results with enhanced data
function displayEstimationResults(data) {
    const estimation = data.estimation;
    
    // Update display values
    document.getElementById('current-price-display').textContent = 
        '₱ ' + estimation.current_price.toLocaleString();
    document.getElementById('estimated-price-display').textContent = 
        '₱ ' + estimation.estimated_price.toLocaleString();
    document.getElementById('profit-projection-display').textContent = 
        '₱ ' + estimation.profit_projection.toLocaleString();
    
    // Update property info
    document.getElementById('info-name').textContent = ': ' + data.property_info.name;
    document.getElementById('info-address').textContent = ': ' + data.property_info.address;
    document.getElementById('info-size').textContent = ': ' + estimation.property_size.toLocaleString() + ' sqm';
    document.getElementById('current-price-sqm').textContent = ': ₱' + estimation.current_price_per_sqm.toLocaleString() + '/sqm';
    document.getElementById('price-2026').textContent = ': ₱' + estimation.predicted_2026_price_per_sqm.toLocaleString() + '/sqm (Predicted)';
    
    // Update historical prices (from zonal_value price_per_sqm)
    if (data.price_per_sqm_history) {
        // Display 2020-2024 price per sqm
        for (let year = 2020; year <= 2024; year++) {
            const yearElement = document.getElementById(`price-${year}`);
            if (yearElement && data.price_per_sqm_history[year]) {
                yearElement.textContent = ': ₱' + Math.round(data.price_per_sqm_history[year]) + '/sqm';
            }
        }
        // 2025 current price per sqm
        const price2025 = document.getElementById('price-2025');
        if (price2025 && data.price_per_sqm_history['2025']) {
            price2025.textContent = ': ₱' + Math.round(data.price_per_sqm_history['2025']) + '/sqm (Current)';
        }
    } else if (data.historical_data) {
        // Fallback to old historical_data format
        for (let year = 2020; year <= 2024; year++) {
            const yearElement = document.getElementById(`price-${year}`);
            if (yearElement && data.historical_data[year]) {
                yearElement.textContent = ': ₱' + Math.round(data.historical_data[year]) + '/sqm';
            }
        }
        const price2025 = document.getElementById('price-2025');
        if (price2025 && data.historical_data['2025']) {
            price2025.textContent = ': ₱' + Math.round(data.historical_data['2025']) + '/sqm (Current)';
        }
    }
    
    // Display data source and confidence
    displayDataQuality(data);
    
    // Draw enhanced chart
    drawChart(data.chart_data, data.data_source);
    
    // Hide loading and show results
    hideEstimationLoading();
    document.getElementById('form-page').classList.add('hidden');
    document.getElementById('results-section').classList.add('active');
    
    window.scrollTo({ top: 0, behavior: 'smooth' });
}

// Display data quality indicators
function displayDataQuality(data) {
    // Add a data quality indicator to the page (you can add this element to your HTML)
    const qualityHtml = `
        <div class="data-quality-indicator">
            <div class="quality-badge ${data.data_source === 'database' ? 'high-quality' : 'default-quality'}">
                ${data.data_source === 'database' ? '📊 Database Analysis' : '📈 BIR Default Rates'}
            </div>
            <div class="quality-details">
                <span>Confidence: ${data.estimation.confidence_score}%</span>
                ${data.data_quality ? `<span>Similar Properties: ${data.data_quality.matches_found}</span>` : ''}
                ${data.regression ? `<span>Model: ${data.regression.model_type}</span>` : ''}
            </div>
        </div>
    `;
    
    // You can insert this where appropriate in your results section
    console.log('Data Quality:', {
        source: data.data_source,
        confidence: data.estimation.confidence_score + '%',
        matches: data.data_quality?.matches_found || 0,
        model: data.regression?.model_type || 'linear'
    });
}

// Enhanced chart drawing with data source indication
function drawChart(chartData, dataSource) {
    const ctx = document.getElementById('priceChart');
    if (!ctx) return;
    
    if (chartInstance) {
        chartInstance.destroy();
    }
    
    const labels = chartData.map(d => d.year.toString());
    const prices = chartData.map(d => d.price_per_sqm);
    
    // Different colors based on data source
    const lineColor = dataSource === 'database' ? '#001d9e' : '#0066cc';
    const pointColor = dataSource === 'database' ? '#001d9e' : '#0066cc';
    
    chartInstance = new Chart(ctx, {
        type: 'line',
        data: {
            labels: labels,
            datasets: [{
                label: `Price per sqm (₱) - ${dataSource === 'database' ? 'Actual Data' : 'BIR Rates'}`,
                data: prices,
                borderColor: lineColor,
                backgroundColor: `${lineColor}20`,
                borderWidth: 3,
                fill: true,
                tension: 0.4,
                pointRadius: 5,
                pointBackgroundColor: function(context) {
                    return context.dataIndex === labels.length - 1 ? '#ff4444' : pointColor;
                },
                pointBorderColor: '#fff',
                pointBorderWidth: 2,
                pointHoverRadius: 7
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
                legend: {
                    display: true,
                    position: 'top',
                    labels: {
                        font: {
                            size: 12
                        }
                    }
                },
                tooltip: {
                    callbacks: {
                        label: function(context) {
                            const year = context.label;
                            const value = context.parsed.y;
                            const isHistorical = chartData[context.dataIndex]?.is_historical;
                            const label = year === '2026' ? ' (Predicted)' : isHistorical ? '' : ' (Estimated)';
                            return `₱${value.toFixed(2)} per sqm${label}`;
                        }
                    }
                }
            },
            scales: {
                y: {
                    beginAtZero: false,
                    ticks: {
                        callback: function(value) {
                            return '₱' + value.toFixed(0);
                        }
                    },
                    grid: {
                        color: 'rgba(0, 0, 0, 0.05)'
                    }
                },
                x: {
                    grid: {
                        display: false
                    }
                }
            }
        }
    });
}

// Show loading state with custom message
function showEstimationLoading(message = 'Calculating...') {
    const estimateBtn = document.querySelector('.btn-estimate');
    if (estimateBtn) {
        estimateBtn.disabled = true;
        estimateBtn.innerHTML = `<i class="fas fa-spinner fa-spin"></i> ${message}`;
    }
}

// Hide loading state
function hideEstimationLoading() {
    const estimateBtn = document.querySelector('.btn-estimate');
    if (estimateBtn) {
        estimateBtn.disabled = false;
        estimateBtn.innerHTML = 'Estimate 2026 Price';
    }
}

// Clear form
function clearForm() {
    const searchInput = document.getElementById('propertySearch');
    if (searchInput) {
        searchInput.value = '';
    }
    
    // Clear all inputs
    document.getElementById('name').value = '';
    document.getElementById('barangay').value = '';
    document.getElementById('street').value = '';
    document.getElementById('property-size').value = '';
    document.getElementById('current-price').value = '';
    
    // Clear property type and class if they exist
    if (document.getElementById('property-type')) {
        document.getElementById('property-type').value = '';
    }
    if (document.getElementById('property-class')) {
        document.getElementById('property-class').value = '';
    }
    
    // Clear display fields
    document.getElementById('name-display').textContent = ': ---';
    document.getElementById('barangay-display').textContent = ': ---';
    document.getElementById('street-display').textContent = ': ---';
    document.getElementById('size-display').textContent = ': ---';
    document.getElementById('price-display').textContent = ': ---';
    
    // Clear selected property
    selectedProperty = null;
    currentEstimationData = null;
}

// Clear results
function clearResults() {
    document.getElementById('results-section').classList.remove('active');
    document.getElementById('form-page').classList.remove('hidden');
    clearForm();
    window.scrollTo({ top: 0, behavior: 'smooth' });
}

// Enhanced download report with database information
function downloadReport() {
    if (!currentEstimationData) {
        alert('No estimation data available');
        return;
    }
    
    const data = currentEstimationData;
    const est = data.estimation;
    const reg = data.regression;
    const quality = data.data_quality;
    
    const report = `
REAL ESTATE PRICE ESTIMATION REPORT
===================================
Generated: ${new Date().toLocaleDateString()}
Analysis Method: ${data.data_source === 'database' ? 'Database-Driven Linear Regression' : 'Default BIR Rates Linear Regression'}

PROPERTY INFORMATION:
--------------------
Owner Name: ${data.property_info.name}
Property Address: ${data.property_info.address}
Property Type: ${data.property_info.type || 'N/A'}
Property Class: ${data.property_info.class || 'N/A'}
Property Size: ${est.property_size} sqm
Current Price per sqm: ₱${est.current_price_per_sqm.toLocaleString()}

PRICE ANALYSIS:
--------------
Current Market Price (2025): ₱${est.current_price.toLocaleString()}
Estimated Price (2026): ₱${est.estimated_price.toLocaleString()}
Projected Profit: ₱${est.profit_projection.toLocaleString()}
Expected Growth: ${est.percentage_growth}%
Annual Growth Rate: ${est.annual_growth_rate || 'N/A'}%

MODEL STATISTICS:
----------------
Model Type: ${reg.model_type}
Confidence Score: ${est.confidence_score}%
R-Squared Value: ${reg.r_squared}
Regression Equation: ${reg.equation}

DATA QUALITY:
------------
Data Source: ${data.data_source === 'database' ? 'Historical Database' : 'BIR Default Rates'}
Similar Properties Analyzed: ${quality?.matches_found || 0}
Data Confidence: ${quality?.confidence || est.confidence_score}%

HISTORICAL PRICE DATA (Per SQM):
--------------------------------
${Object.entries(data.historical_data || {}).map(([year, price]) => 
    `${year}: ₱${Math.round(price).toLocaleString()}`
).join('\n')}

METHODOLOGY:
-----------
${data.data_source === 'database' ? 
'This estimation uses actual historical data from similar properties in the database. ' +
'Properties were matched based on type, class, and location similarity. ' +
'The Python scikit-learn model analyzed ' + (quality?.matches_found || 0) + ' similar properties ' +
'to generate accurate predictions based on real market trends.'
:
'This estimation uses standard Bureau of Internal Revenue (BIR) pricing data ' +
'for Tarlac City as historical data was not available for similar properties.'}

The ${reg.model_type} regression model was selected based on data patterns,
with an R-squared value of ${reg.r_squared} indicating ${
    reg.r_squared > 0.9 ? 'excellent' : 
    reg.r_squared > 0.7 ? 'good' : 
    reg.r_squared > 0.5 ? 'moderate' : 'limited'
} model fit.

DISCLAIMER:
-----------
This estimation is for reference purposes only. Actual market conditions
may vary due to economic factors, location specifics, and market dynamics.
Please consult with real estate professionals for investment decisions.

Generated by Real Estate Management System
Powered by Python Linear Regression with Database Integration
    `;
    
    // Create downloadable file
    const blob = new Blob([report], { type: 'text/plain' });
    const url = window.URL.createObjectURL(blob);
    const a = document.createElement('a');
    a.href = url;
    a.download = `Price_Estimation_${data.property_info.name.replace(/\s+/g, '_')}_${new Date().getTime()}.txt`;
    document.body.appendChild(a);
    a.click();
    document.body.removeChild(a);
    window.URL.revokeObjectURL(url);
    
    alert('Enhanced estimation report downloaded successfully!');
}