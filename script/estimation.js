   // Historical price data for Tarlac City (based on your research) - CORRECTED
        const TARLAC_PRICE_DATA = {
            2021: 52,  // ₱52 per sqm
            2022: 61,  // ₱61 per sqm
            2023: 73,  // ₱73 per sqm
            2024: 85,  // ₱85 per sqm
            2025: 100  // ₱100 per sqm (current BIR rate)
        };

        // Linear Regression Implementation - FIXED CALCULATION
        function calculateLinearRegression(data) {
            const n = data.length;
            let sumX = 0, sumY = 0, sumXY = 0, sumXX = 0;
            
            // Calculate sums for linear regression formula: Y = a + bX
            data.forEach((point, index) => {
                const x = index; // Year index (0, 1, 2, 3, 4 for 2021-2025)
                const y = point.value; // Price per sqm value
                sumX += x;
                sumY += y;
                sumXY += x * y;
                sumXX += x * x;
            });
            
            // Calculate slope (b) and intercept (a) using proper linear regression formula
            const slope = (n * sumXY - sumX * sumY) / (n * sumXX - sumX * sumX);
            const intercept = (sumY - slope * sumX) / n;
            
            return { slope, intercept };
        }

        // Estimate future price using linear regression - CORRECTED LOGIC
        function estimatePrice(currentPrice, propertySize, address) {
            // Convert historical data to regression format (2021-2025)
            const years = Object.keys(TARLAC_PRICE_DATA);
            const regressionData = years.map((year, index) => ({
                year: parseInt(year),
                value: TARLAC_PRICE_DATA[year] // Price per sqm
            }));
            
            // Calculate linear regression for price per sqm trend
            const regression = calculateLinearRegression(regressionData);
            
            // Predict 2026 price per sqm using regression
            const nextYearIndex = 5; // 2026 would be index 5 (after 0,1,2,3,4)
            const predicted2026PricePerSqm = regression.intercept + (regression.slope * nextYearIndex);
            
            // Calculate CURRENT price per sqm from user input
            const currentPricePerSqm = currentPrice / propertySize;
            
            // Calculate estimated TOTAL property price for 2026
            const estimatedTotalPrice = predicted2026PricePerSqm * propertySize;
            
            // Calculate profit projection (difference between estimated and current total price)
            const profitProjection = estimatedTotalPrice - currentPrice;
            
            // Calculate percentage growth
            const percentageGrowth = ((estimatedTotalPrice - currentPrice) / currentPrice) * 100;
            
            return {
                estimatedPrice: Math.round(estimatedTotalPrice),
                profitProjection: Math.round(profitProjection),
                predicted2026PricePerSqm: Math.round(predicted2026PricePerSqm),
                currentPricePerSqm: Math.round(currentPricePerSqm),
                percentageGrowth: Math.round(percentageGrowth * 100) / 100, // Round to 2 decimal places
                regressionData: regressionData
            };
        }

        // Draw the price chart - PERFECT ALIGNMENT WITH YEAR LABELS
        function drawChart(data, estimationResult, propertySize) {
            const svg = document.querySelector('.chart-svg');
            const priceLine = document.getElementById('price-line');
            const priceArea = document.getElementById('price-area');
            const pointsContainer = document.getElementById('chart-points');
            
            // Clear existing points
            pointsContainer.innerHTML = '';
            
            // Get actual container dimensions for responsive sizing
            const chartContainer = document.querySelector('.price-chart');
            const containerWidth = chartContainer.offsetWidth;
            const containerHeight = chartContainer.offsetHeight; /* NO REDUCTION - use full height */
            
            // Chart dimensions - FIXED CHART SIZE
            const width = containerWidth;
            const height = 300; // FIXED HEIGHT, not dependent on container
            const paddingLeft = 15;   // MATCH CHART CONTENT PADDING
            const paddingRight = 15;  // MATCH CHART CONTENT PADDING
            const paddingTop = 20;    
            const paddingBottom = 20; 
            const chartWidth = width - paddingLeft - paddingRight;
            const chartHeight = height - paddingTop - paddingBottom;
            
            // Get price range for scaling
            const prices = data.map(d => d.value);
            prices.push(estimationResult.predicted2026PricePerSqm);
            prices.push(estimationResult.currentPricePerSqm);
            
            const minPrice = Math.min(...prices) * 0.9;
            const maxPrice = Math.max(...prices) * 1.1;
            
            // PERFECT ALIGNMENT: Calculate exact positions to match year labels
            // Year labels use justify-content: space-between, so we match that exactly
            const totalPoints = 6; // 2021, 2022, 2023, 2024, 2025, 2026
            const positions = [];
            
            // First point at left edge, last point at right edge, others evenly spaced
            for (let i = 0; i < totalPoints; i++) {
                if (i === 0) {
                    positions.push(paddingLeft); // First point at left edge
                } else if (i === totalPoints - 1) {
                    positions.push(width - paddingRight); // Last point at right edge
                } else {
                    // Evenly distribute middle points
                    const progress = i / (totalPoints - 1);
                    positions.push(paddingLeft + (progress * chartWidth));
                }
            }
            
            // Generate path coordinates - HISTORICAL DATA POINTS
            let pathD = '';
            let areaD = '';
            const points = [];
            
            data.forEach((point, index) => {
                const x = positions[index]; // Use calculated exact positions
                const y = paddingTop + (chartHeight - ((point.value - minPrice) / (maxPrice - minPrice)) * chartHeight);
                
                if (index === 0) {
                    pathD += `M ${x} ${y}`;
                    areaD += `M ${x} ${y}`;
                } else {
                    pathD += ` L ${x} ${y}`;
                    areaD += ` L ${x} ${y}`;
                }
                
                points.push({ x, y, value: point.value, year: point.year });
            });
            
            // Add projected point for 2026 - PERFECTLY ALIGNED WITH LAST LABEL
            const projX = positions[5]; // Use exact last position
            const projY = paddingTop + (chartHeight - ((estimationResult.predicted2026PricePerSqm - minPrice) / (maxPrice - minPrice)) * chartHeight);
            pathD += ` L ${projX} ${projY}`;
            areaD += ` L ${projX} ${projY} L ${projX} ${height - paddingBottom} L ${paddingLeft} ${height - paddingBottom} Z`;
            
            // Update SVG to use actual container dimensions
            svg.setAttribute('viewBox', `0 0 ${width} ${height}`);
            svg.setAttribute('width', width);
            svg.setAttribute('height', height);
            
            // Update SVG elements
            priceLine.setAttribute('d', pathD);
            priceArea.setAttribute('d', areaD);
            
            // Add data points - PERFECTLY POSITIONED
            const pointRadius = Math.max(4, Math.min(8, containerWidth / 100));
            
            points.forEach(point => {
                const circle = document.createElementNS('http://www.w3.org/2000/svg', 'circle');
                circle.setAttribute('cx', point.x);
                circle.setAttribute('cy', point.y);
                circle.setAttribute('r', pointRadius);
                circle.classList.add('chart-point');
                circle.innerHTML = `<title>${point.year}: ₱${point.value}/sqm</title>`;
                pointsContainer.appendChild(circle);
            });
            
            // Add projected point for 2026 - EXACTLY ALIGNED
            const projCircle = document.createElementNS('http://www.w3.org/2000/svg', 'circle');
            projCircle.setAttribute('cx', projX);
            projCircle.setAttribute('cy', projY);
            projCircle.setAttribute('r', pointRadius + 2);
            projCircle.classList.add('projected-point');
            projCircle.innerHTML = `<title>2026 Projected: ₱${estimationResult.predicted2026PricePerSqm}/sqm</title>`;
            pointsContainer.appendChild(projCircle);
            
            // Debug: Log positions for verification
            console.log('Chart alignment debug:', {
                containerWidth: containerWidth,
                positions: positions,
                yearLabels: ['2021', '2022', '2023', '2024', '2025', '2026']
            });
        }

        // Clear form function
        function clearForm() {
            document.getElementById('name').value = '';
            document.getElementById('address').value = '';
            document.getElementById('property-size').value = '';
            document.getElementById('current-price').value = '';
        }

        // Perform estimation with linear regression
        function performEstimation() {
            // Get input values
            const name = document.getElementById('name').value;
            const address = document.getElementById('address').value;
            const propertySize = parseFloat(document.getElementById('property-size').value);
            const currentPrice = parseFloat(document.getElementById('current-price').value);
            
            // Validate inputs
            if (!name || !address || !propertySize || !currentPrice) {
                alert('Please fill in all fields before estimating');
                return;
            }
            
            // Perform linear regression estimation - FIXED CALCULATION
            const estimation = estimatePrice(currentPrice, propertySize, address);
            
            // Validate estimation results
            if (estimation.estimatedPrice <= 0 || isNaN(estimation.estimatedPrice)) {
                alert('Error in price calculation. Please check your input values.');
                return;
            }
            
            // Update display values - SHOW CORRECT AMOUNTS
            document.getElementById('current-price-display').textContent = 
                '₱ ' + currentPrice.toLocaleString();
            document.getElementById('estimated-price-display').textContent = 
                '₱ ' + estimation.estimatedPrice.toLocaleString();
            document.getElementById('profit-projection-display').textContent = 
                '₱ ' + estimation.profitProjection.toLocaleString();
            
            // Update property info - CORRECTED TO SHOW PROPER VALUES
            document.getElementById('info-name').textContent = ': ' + name;
            document.getElementById('info-address').textContent = ': ' + address;
            document.getElementById('info-size').textContent = ': ' + propertySize.toLocaleString();
            document.getElementById('current-price-sqm').textContent = ': ₱' + estimation.currentPricePerSqm + '/sqm';
            document.getElementById('price-2026').textContent = ': ₱' + estimation.predicted2026PricePerSqm + '/sqm (Projected)';
            document.getElementById('price-2025').textContent = ': ₱' + TARLAC_PRICE_DATA[2025] + '/sqm';
            document.getElementById('price-2024').textContent = ': ₱' + TARLAC_PRICE_DATA[2024] + '/sqm';
            
            // Draw the chart with correct estimation data
            drawChart(estimation.regressionData, estimation, propertySize);
            
            // REDRAW ON WINDOW RESIZE FOR RESPONSIVENESS  
            window.addEventListener('resize', function() {
                drawChart(estimation.regressionData, estimation, propertySize);
            });
            
            console.log('Estimation Details:', {
                currentPrice: currentPrice,
                propertySize: propertySize,
                currentPricePerSqm: estimation.currentPricePerSqm,
                predicted2026PricePerSqm: estimation.predicted2026PricePerSqm,
                estimatedTotalPrice: estimation.estimatedPrice,
                profitProjection: estimation.profitProjection,
                percentageGrowth: estimation.percentageGrowth + '%'
            });
            
            // Show results
            document.getElementById('form-page').classList.add('hidden');
            document.getElementById('results-section').classList.add('active');
            
            // Scroll to top
            window.scrollTo({ top: 0, behavior: 'smooth' });
        }

        // Clear results function
        function clearResults() {
            document.getElementById('results-section').classList.remove('active');
            document.getElementById('form-page').classList.remove('hidden');
            clearForm();
            window.scrollTo({ top: 0, behavior: 'smooth' });
        }

        // Download report function
        function downloadReport() {
            const name = document.getElementById('info-name').textContent.replace(': ', '');
            const address = document.getElementById('info-address').textContent.replace(': ', '');
            const currentPrice = document.getElementById('current-price-display').textContent;
            const estimatedPrice = document.getElementById('estimated-price-display').textContent;
            const profit = document.getElementById('profit-projection-display').textContent;
            
            const report = `
REAL ESTATE PRICE ESTIMATION REPORT
===================================
Generated: ${new Date().toLocaleDateString()}
System: Linear Regression Analysis

PROPERTY INFORMATION:
--------------------
Owner Name: ${name}
Property Address: ${address}
Property Size: ${document.getElementById('info-size').textContent.replace(': ', '')} sqm

PRICE ANALYSIS:
--------------
Current Market Price: ${currentPrice}
Estimated Price (2026): ${estimatedPrice}
Projected Profit: ${profit}

HISTORICAL PRICE DATA (Tarlac City BIR):
---------------------------------------
2021 Price/sqm: ₱${TARLAC_PRICE_DATA[2021]}
2022 Price/sqm: ₱${TARLAC_PRICE_DATA[2022]}
2023 Price/sqm: ₱${TARLAC_PRICE_DATA[2023]}
2024 Price/sqm: ₱${TARLAC_PRICE_DATA[2024]}
2025 Price/sqm: ₱${TARLAC_PRICE_DATA[2025]}

METHODOLOGY:
-----------
This estimation uses Linear Regression analysis based on historical
Bureau of Internal Revenue (BIR) pricing data for Tarlac City.
The algorithm calculates future price trends using the formula:
Y = a + bX (where Y = price, X = time, a = intercept, b = slope)

DISCLAIMER:
-----------
This estimation is for reference only and actual market conditions
may vary. Please consult with real estate professionals for
investment decisions.

Generated by Real Estate Management System with Price Estimation Module
            `;
            
            // Create downloadable file
            const blob = new Blob([report], { type: 'text/plain' });
            const url = window.URL.createObjectURL(blob);
            const a = document.createElement('a');
            a.href = url;
            a.download = `Price_Estimation_Report_${name.replace(/\s+/g, '_')}_${new Date().getTime()}.txt`;
            document.body.appendChild(a);
            a.click();
            document.body.removeChild(a);
            window.URL.revokeObjectURL(url);
            
            alert('Price estimation report downloaded successfully!');
        }

        // Initialize chart on page load
        window.addEventListener('load', function() {
            // Pre-populate with sample data for demonstration
            const sampleData = Object.keys(TARLAC_PRICE_DATA).map(year => ({
                year: parseInt(year),
                value: TARLAC_PRICE_DATA[year]
            }));
            
            // You can uncomment this to show a default chart
            // drawChart(sampleData, 170000, 1230);
        });

        // Settings and utility functions (if needed)
        function toggleSettingsDropdown() {
            console.log('Settings clicked');
        }