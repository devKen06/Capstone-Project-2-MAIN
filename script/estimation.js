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

// ENHANCED: Perform estimation using zonal value data
async function performEstimation() {
    const name = document.getElementById('name').value;
    const barangay = document.getElementById('barangay').value;
    const street = document.getElementById('street').value;
    const propertySize = parseFloat(document.getElementById('property-size').value);
    
    // Get property type and class from selected property or hidden fields
    const propertyType = selectedProperty?.property_type || 
                        document.getElementById('property-type')?.value || '';
    const propertyClass = selectedProperty?.property_class || 
                         document.getElementById('property-class')?.value || '';
    
    // Validate required fields (no current price needed - calculated from zonal values)
    if (!name || !barangay || !street || !propertySize) {
        alert('Please fill in all required fields (name, barangay, street, and property size) before estimating');
        return;
    }
    
    if (!propertyType || !propertyClass) {
        alert('Please select a property that has Property Type and Class information');
        return;
    }
    
    // Show loading state with message
    showEstimationLoading('Fetching zonal values and calculating price estimation...');
    
    try {
        // Call zonal value PHP endpoint (uses zonal_value table for price data)
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
    const zonalInfo = data.zonal_value_info || {};
    const quality = data.data_quality || {};
    
    // Add a data quality indicator to the page
    const qualityHtml = `
        <div class="data-quality-indicator" style="background: linear-gradient(135deg, #001d9e, #0033ff); color: white; padding: 15px; border-radius: 8px; margin-bottom: 20px;">
            <div class="quality-badge" style="display: flex; align-items: center; gap: 10px; margin-bottom: 10px;">
                <span style="font-size: 24px;">📊</span>
                <div>
                    <div style="font-weight: 600; font-size: 16px;">Zonal Value Based Analysis</div>
                    <div style="font-size: 12px; opacity: 0.9;">Using Official BIR Zonal Values</div>
                </div>
            </div>
            <div class="quality-details" style="display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 10px; font-size: 13px;">
                <div>
                    <strong>Confidence Score:</strong> ${data.estimation.confidence_score}%
                </div>
                ${zonalInfo.best_match ? `
                    <div>
                        <strong>Match Quality:</strong> ${zonalInfo.best_match.similarity_score}% ${quality.exact_match ? '(Exact)' : ''}
                    </div>
                    <div>
                        <strong>Data Source:</strong> ${zonalInfo.best_match.data_source || 'BIR'}
                    </div>
                    <div>
                        <strong>Location:</strong> ${zonalInfo.best_match.barangay}, ${zonalInfo.best_match.street || zonalInfo.best_match.vicinity}
                    </div>
                ` : ''}
            </div>
        </div>
    `;
    
    // Insert before the results container
    const resultsSection = document.getElementById('results-section');
    let qualityIndicator = resultsSection.querySelector('.data-quality-indicator');
    
    if (qualityIndicator) {
        qualityIndicator.outerHTML = qualityHtml;
    } else {
        const resultsContainer = resultsSection.querySelector('.results-container');
        if (resultsContainer) {
            resultsContainer.insertAdjacentHTML('beforebegin', qualityHtml);
        }
    }
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
    
    // Use consistent blue color for zonal values
    const lineColor = '#001d9e';
    const pointColor = '#001d9e';
    
    chartInstance = new Chart(ctx, {
        type: 'line',
        data: {
            labels: labels,
            datasets: [{
                label: 'Price per sqm (₱) - BIR Zonal Values',
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

// Enhanced download report with zonal value information
function downloadReport() {
    if (!currentEstimationData) {
        alert('No estimation data available');
        return;
    }
    
    const data = currentEstimationData;
    const est = data.estimation;
    const reg = data.regression;
    const quality = data.data_quality;
    const zonalInfo = data.zonal_value_info || {};
    
    const report = `
REAL ESTATE PRICE ESTIMATION REPORT
===================================
Generated: ${new Date().toLocaleDateString()}
Analysis Method: Zonal Value Based Linear Regression

PROPERTY INFORMATION:
--------------------
Owner Name: ${data.property_info.name}
Property Address: ${data.property_info.address}
Property Type: ${data.property_info.type || 'N/A'}
Property Class: ${data.property_info.class || 'N/A'}
Property Size: ${est.property_size} sqm
Current Price per sqm (2025): ₱${est.current_price_per_sqm.toLocaleString()}

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
Data Source: Zonal Value Table
Match Quality: ${zonalInfo.best_match ? zonalInfo.best_match.similarity_score + '%' : 'N/A'}
Data Confidence: ${quality?.confidence || est.confidence_score}%
${zonalInfo.best_match ? `Zonal Source: ${zonalInfo.best_match.data_source || 'BIR'}` : ''}
Exact Match: ${quality?.exact_match ? 'Yes' : 'No'}

ZONAL VALUE MATCH DETAILS:
--------------------------
${zonalInfo.best_match ? `
Matched Barangay: ${zonalInfo.best_match.barangay || 'N/A'}
Matched Street: ${zonalInfo.best_match.street || 'N/A'}
Matched Vicinity: ${zonalInfo.best_match.vicinity || 'N/A'}
Matched Property Type: ${zonalInfo.best_match.property_type || 'N/A'}
Matched Class: ${zonalInfo.best_match.class || 'N/A'}
Similarity Score: ${zonalInfo.best_match.similarity_score}%
` : 'No match details available'}

HISTORICAL PRICE DATA (Per SQM from Zonal Values):
--------------------------------------------------
${data.price_per_sqm_history ? Object.entries(data.price_per_sqm_history).map(([year, price]) => 
    `${year}: ₱${Math.round(price).toLocaleString()}`
).join('\n') : 'Historical data not available'}

CALCULATED TOTAL PRICES (Property Size × Zonal Price per SQM):
--------------------------------------------------------------
${data.calculated_total_prices ? Object.entries(data.calculated_total_prices).map(([year, price]) => 
    `${year}: ₱${Math.round(price).toLocaleString()}`
).join('\n') : 'Calculated prices not available'}

METHODOLOGY:
-----------
This estimation uses official zonal values from the Bureau of Internal Revenue (BIR)
and local government records. The system found the best matching zonal value based on:
- Property location (Barangay and Street)
- Property type (${data.property_info.type || 'N/A'})
- Property classification (${data.property_info.class || 'N/A'})

The zonal value provides the official price per square meter for years 2020-2025.
The current price (2025) is calculated as: Property Size (${est.property_size} sqm) × 
Zonal Price per SQM (₱${est.current_price_per_sqm.toLocaleString()}) = ₱${est.current_price.toLocaleString()}

Historical zonal values (2020-2024) were analyzed using Python's scikit-learn 
${reg.model_type} regression model to predict the 2026 zonal value and estimate 
future property price. The R-squared value of ${reg.r_squared} indicates ${
    reg.r_squared > 0.9 ? 'excellent' : 
    reg.r_squared > 0.7 ? 'good' : 
    reg.r_squared > 0.5 ? 'moderate' : 'limited'
} model fit.

DISCLAIMER:
-----------
This estimation is based on official zonal values and is for reference purposes only. 
Actual market prices may differ from zonal values due to:
- Property condition and improvements
- Market demand and supply dynamics
- Location-specific premium factors
- Economic conditions and inflation
- Negotiation and individual circumstances

Please consult with licensed real estate professionals and conduct proper 
property appraisal for investment and transaction decisions.

Generated by Real Estate Management System
Powered by Python Linear Regression with BIR Zonal Value Data
    `;
    
    // Create downloadable file
    const blob = new Blob([report], { type: 'text/plain' });
    const url = window.URL.createObjectURL(blob);
    const a = document.createElement('a');
    a.href = url;
    a.download = `Zonal_Price_Estimation_${data.property_info.name.replace(/\s+/g, '_')}_${new Date().getTime()}.txt`;
    document.body.appendChild(a);
    a.click();
    document.body.removeChild(a);
    window.URL.revokeObjectURL(url);
    
    alert('Zonal value estimation report downloaded successfully!');
}