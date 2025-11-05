-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 05, 2025 at 01:59 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `real_estate_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `estimation_logs`
--

CREATE TABLE `estimation_logs` (
  `id` int(11) NOT NULL,
  `property_name` varchar(255) DEFAULT NULL,
  `property_address` text DEFAULT NULL,
  `property_type` varchar(100) DEFAULT NULL,
  `property_class` varchar(50) DEFAULT NULL,
  `current_price` decimal(15,2) DEFAULT NULL,
  `estimated_price` decimal(15,2) DEFAULT NULL,
  `profit_projection` decimal(15,2) DEFAULT NULL,
  `percentage_growth` decimal(5,2) DEFAULT NULL,
  `confidence_score` int(11) DEFAULT NULL,
  `data_source` varchar(50) DEFAULT NULL COMMENT 'database or default',
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `estimation_logs`
--

INSERT INTO `estimation_logs` (`id`, `property_name`, `property_address`, `property_type`, `property_class`, `current_price`, `estimated_price`, `profit_projection`, `percentage_growth`, `confidence_score`, `data_source`, `user_id`, `created_at`) VALUES
(1, 'Ana Garcia', 'Binauganan, Tarlac City, Tarlac City, Tarlac', 'Vacant lot', '', 1800000.00, 2829739.50, 1029739.50, 57.21, 72, 'default_bir', NULL, '2025-10-24 16:35:47'),
(2, 'Ana Garcia', 'Binauganan, Tarlac City, Tarlac City, Tarlac', 'Vacant lot', '', 1800000.00, 2829739.50, 1029739.50, 57.21, 72, 'default_bir', NULL, '2025-10-24 16:35:54'),
(3, 'Antonio Villanueva', 'San Roque, Tarlac City, Tarlac City, Tarlac', 'Residential', '', 1900000.00, 2988993.00, 1088993.00, 57.32, 72, 'default', NULL, '2025-10-25 03:49:05'),
(4, 'arvin coronel', 'wagayway, Tarlac City, Tarlac', 'Industrial', '', 125000.00, 192666.60, 67666.60, 54.13, 73, 'default', NULL, '2025-10-25 04:10:06'),
(5, 'Carlos Valdez', 'Culipat, Tarlac City, Tarlac City, Tarlac', 'Agricultural', '', 4000000.00, 6036975.00, 2036975.00, 50.92, 74, 'default', NULL, '2025-10-25 04:11:19'),
(6, 'Ana Garcia', 'Binauganan, Tarlac City, Tarlac City, Tarlac', 'Vacant lot', '', 1800000.00, 2829739.50, 1029739.50, 57.21, 72, 'default', NULL, '2025-10-25 04:18:48'),
(7, 'Elmer Steves', 'Balibago, Tarlac City, Tarlac', 'Residential', '', 1000000.00, 1567986.00, 567986.00, 56.80, 72, 'default', NULL, '2025-10-25 14:35:28'),
(8, 'Maria Santos', 'San Nicolas, Tarlac City, Tarlac City, Tarlac', 'Residential', '', 2500000.00, 3930486.00, 1430486.00, 57.22, 72, 'default', NULL, '2025-10-25 15:06:52'),
(9, 'Kenneth James', 'Matatalaib, Tarlac City, Tarlac', 'Industrial', '', 1200000.00, 1883336.70, 683336.70, 56.94, 72, 'default', NULL, '2025-10-25 15:07:49'),
(10, 'Antonio Villanueva', 'Main Road, San Roque, Tarlac City', 'Residential', 'A40', 1900000.00, 2988993.00, 1088993.00, 57.32, 72, 'default', NULL, '2025-10-27 11:27:17'),
(11, 'Ana Garcia', 'Main Road, Binauganan, Tarlac City', 'Vacant lot', 'A2', 1800000.00, 2829739.50, 1029739.50, 57.21, 72, 'default', NULL, '2025-10-27 12:10:22'),
(12, 'Linda Martinez', 'Main Road, Lourdes, Tarlac City', 'Residential', 'A17', 2800000.00, 4403687.40, 1603687.40, 57.27, 72, 'default', NULL, '2025-10-27 13:42:59'),
(13, 'Ana Garcia', 'BINAUGANAN ROAD, BINAUGANAN', 'RESIDENTIAL', 'A2', 8100.00, 7140.00, -960.00, -11.85, 79, 'zonal_value', NULL, '2025-10-27 15:02:58'),
(14, 'Fernando Santiago', 'PROVINCIAL ROAD, SAN SEBASTIAN', 'AGRICULTURE', 'A1', 666000.00, 726180.00, 60180.00, 9.04, 87, 'zonal_value', NULL, '2025-10-27 15:04:17'),
(15, 'Ana Garcia', 'ALL LOTS, BINAUGANAN', 'Agricultural', 'A2', 108000.00, 95200.00, -12800.00, -11.85, 79, 'zonal_value', NULL, '2025-10-27 15:11:16'),
(16, 'Nill Valencio', 'DON BENITO SUBD., SAN RAFAEL', 'Residential', 'RR', 722400.00, 1129363.20, 406963.20, 56.33, 72, 'zonal_value', NULL, '2025-10-27 15:39:35'),
(17, 'Ana Garcia', 'BINAUGANAN ROAD, BINAUGANAN', 'RESIDENTIAL', 'A2', 8100.00, 7140.00, -960.00, -11.85, 79, 'zonal_value', NULL, '2025-11-02 03:13:13'),
(18, 'Benjamin Reyes', 'INDUSTRIAL ROAD, PARAISO', 'INDUSTRIAL', 'I', 210000.00, 306201.00, 96201.00, 45.81, 76, 'zonal_value', NULL, '2025-11-02 03:14:32'),
(19, 'arvin coronel', 'MAIN ROAD, SAN VICENTE', 'INDUSTRIAL', 'I', 36000.00, 52491.60, 16491.60, 45.81, 76, 'zonal_value', NULL, '2025-11-02 03:17:09'),
(20, 'arvin coronel', 'MAC ARTHUR HIGHWAY, POBLACION', 'COMMERCIAL', 'RR', 2531750.00, 3982947.15, 1451197.15, 57.32, 72, 'zonal_value', NULL, '2025-11-02 03:17:44'),
(21, 'Ana Garcia', 'BINAUGANAN ROAD, BINAUGANAN', 'RESIDENTIAL', 'A2', 8100.00, 7140.00, -960.00, -11.85, 79, 'zonal_value', NULL, '2025-11-02 05:37:52'),
(22, 'Ana Garcia', 'BINAUGANAN ROAD, BINAUGANAN', 'RESIDENTIAL', 'A2', 8100.00, 7140.00, -960.00, -11.85, 79, 'zonal_value', NULL, '2025-11-02 09:55:04'),
(23, 'Ana Garcia', 'BINAUGANAN ROAD, BINAUGANAN', 'RESIDENTIAL', 'A2', 8100.00, 7140.00, -960.00, -11.85, 79, 'zonal_value', NULL, '2025-11-02 09:55:32'),
(24, 'arvin coronel', 'MAIN ROAD, SAN VICENTE', 'INDUSTRIAL', 'I', 36000.00, 52491.60, 16491.60, 45.81, 76, 'zonal_value', NULL, '2025-11-02 09:56:47'),
(25, 'Jose Ramos', 'MAC ARTHUR HIGHWAY, DOLORES', 'COMMERCIAL', 'CR', 550000.00, 858534.60, 308534.60, 56.10, 73, 'zonal_value', NULL, '2025-11-02 10:16:22'),
(26, 'Ana Garcia', 'ALL LOTS, BINAUGANAN', 'Agricultural', 'A2', 108000.00, 95200.00, -12800.00, -11.85, 79, 'zonal_value', NULL, '2025-11-03 01:07:58'),
(27, 'arvin coronel', 'MAC ARTHUR HIGHWAY, POBLACION', 'COMMERCIAL', 'RR', 2531750.00, 3982947.15, 1451197.15, 57.32, 72, 'zonal_value', NULL, '2025-11-03 01:08:47'),
(28, 'arvin coronel', 'MAIN ROAD, SAN VICENTE', 'INDUSTRIAL', 'I', 36000.00, 52491.60, 16491.60, 45.81, 76, 'zonal_value', NULL, '2025-11-03 01:10:10'),
(29, 'Ana Garcia', 'ALL LOTS, BINAUGANAN', 'Agricultural', 'A2', 108000.00, 95200.00, -12800.00, -11.85, 79, 'zonal_value', NULL, '2025-11-03 01:13:17'),
(30, 'Diana Pascual', 'MAIN ROAD, BALINGCANAWAY', 'RESIDENTIAL', 'A41', 7480.00, 3794.56, -3685.44, -49.27, 63, 'zonal_value', NULL, '2025-11-03 01:23:40'),
(31, 'arvin coronel', 'MAIN ROAD, SAN VICENTE', 'INDUSTRIAL', 'I', 36000.00, 52491.60, 16491.60, 45.81, 76, 'zonal_value', NULL, '2025-11-04 06:25:03'),
(32, 'Ana Garcia', 'BINAUGANAN ROAD, BINAUGANAN', 'RESIDENTIAL', 'A2', 8100.00, 7140.00, -960.00, -11.85, 79, 'zonal_value', NULL, '2025-11-04 08:15:33'),
(33, 'Ana Garcia', 'ALL LOTS, BINAUGANAN', 'Agricultural', 'A2', 108000.00, 95200.00, -12800.00, -11.85, 79, 'zonal_value', NULL, '2025-11-04 10:47:24'),
(34, 'arvin coronel', 'MAIN ROAD, SAN VICENTE', 'INDUSTRIAL', 'I', 36000.00, 52491.60, 16491.60, 45.81, 76, 'zonal_value', NULL, '2025-11-04 11:31:15'),
(35, 'Jose Ramos', 'MAC ARTHUR HIGHWAY, DOLORES', 'COMMERCIAL', 'CR', 550000.00, 858534.60, 308534.60, 56.10, 73, 'zonal_value', NULL, '2025-11-04 11:32:32'),
(36, 'Antonio Villanueva', 'SAN ROQUE MAIN ROAD, SAN ROQUE', 'RESIDENTIAL', 'A40', 309500.00, 483955.50, 174455.50, 56.37, 72, 'zonal_value', NULL, '2025-11-04 12:07:42'),
(37, 'Ana Garcia', 'ALL LOTS, BINAUGANAN', 'Agricultural', 'A2', 108000.00, 95200.00, -12800.00, -11.85, 79, 'zonal_value', NULL, '2025-11-04 12:21:52'),
(38, 'Diana Pascual', 'MAIN ROAD, BALINGCANAWAY', 'RESIDENTIAL', 'A41', 7480.00, 3794.56, -3685.44, -49.27, 63, 'zonal_value', NULL, '2025-11-04 12:36:56'),
(39, 'arvin coronel', 'MAIN ROAD, SAN VICENTE', 'INDUSTRIAL', 'I', 36000.00, 52491.60, 16491.60, 45.81, 76, 'zonal_value', NULL, '2025-11-04 12:38:06'),
(40, 'Ana Garcia', 'ALL LOTS, BINAUGANAN', 'Agricultural', 'A2', 108000.00, 95200.00, -12800.00, -11.85, 79, 'zonal_value', NULL, '2025-11-04 13:44:50'),
(41, 'Antonio Villanueva', 'SAN ROQUE MAIN ROAD, SAN ROQUE', 'RESIDENTIAL', 'A40', 309500.00, 483955.50, 174455.50, 56.37, 72, 'zonal_value', NULL, '2025-11-04 13:56:45'),
(42, 'Ana Garcia', 'BINAUGANAN ROAD, BINAUGANAN', 'RESIDENTIAL', 'A2', 8100.00, 7140.00, -960.00, -11.85, 79, 'zonal_value', NULL, '2025-11-05 01:28:04'),
(43, 'Carmen Lopez', 'ROMULO BOULEVARD, CENTRAL', 'RESIDENTIAL', 'A15', 9250.00, 5414.50, -3835.50, -41.46, 63, 'zonal_value', NULL, '2025-11-05 01:28:50');

-- --------------------------------------------------------

--
-- Table structure for table `historical_prices_2020`
--

CREATE TABLE `historical_prices_2020` (
  `id` int(11) NOT NULL,
  `class` varchar(50) NOT NULL COMMENT 'Property classification (e.g., Residential, Commercial, Agricultural)',
  `property_type` varchar(100) NOT NULL COMMENT 'Type of property (e.g., House, Condominium, Lot)',
  `property_size` decimal(10,2) DEFAULT NULL COMMENT 'Property size in square meters (optional for general data)',
  `price_per_sqm` decimal(10,2) NOT NULL COMMENT 'Price per square meter in PHP',
  `address` varchar(100) DEFAULT NULL,
  `source` varchar(100) DEFAULT 'BIR' COMMENT 'Data source (e.g., BIR, Market Data)',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `street` varchar(150) DEFAULT NULL,
  `vicinity` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Historical price data for 2020';

--
-- Dumping data for table `historical_prices_2020`
--

INSERT INTO `historical_prices_2020` (`id`, `class`, `property_type`, `property_size`, `price_per_sqm`, `address`, `source`, `created_at`, `updated_at`, `street`, `vicinity`) VALUES
(1, 'AGRI', 'Industrial', 233.00, 6000.00, 'Poblacion', 'BIR', '2025-10-21 16:04:52', '2025-10-24 15:35:45', 'F. Tanedo Street', 'Commercial District'),
(2, 'I', 'Commercial', 414.00, 4500.00, 'Poblacion', 'BIR', '2025-10-21 16:04:52', '2025-10-24 15:35:45', 'F. Tanedo Street', 'Residential Area'),
(3, 'A6', 'Residential', 421.00, 6800.00, 'Poblacion', 'BIR', '2025-10-21 16:04:52', '2025-10-24 15:35:45', 'McArthur Highway', 'Commercial Strip'),
(4, 'A41', 'Industrial', 361.00, 5500.00, 'Poblacion', 'BIR', '2025-10-21 16:04:52', '2025-10-24 15:35:45', 'Romulo Boulevard', 'Near Capitol Building'),
(5, 'A6', 'Residential', 495.00, 5000.00, 'Maligaya', 'BIR', '2025-10-21 16:04:52', '2025-10-24 15:21:20', 'Zamora Street', 'Near Public Market'),
(6, 'I', 'Commercial', 440.00, 3800.00, 'Santo Cristo', 'BIR', '2025-10-21 16:04:52', '2025-10-24 15:21:20', 'Gen. Luna Street', 'Near Schools'),
(7, 'RR', 'Industrial', 212.00, 5600.00, 'Balibago', 'BIR', '2025-10-21 16:04:52', '2025-10-24 15:35:45', 'McArthur Highway', 'Commercial Area'),
(8, 'A6', 'Commercial', 144.00, 3300.00, 'Balibago', 'BIR', '2025-10-21 16:04:52', '2025-10-24 15:35:45', 'Balibago Road', 'Residential Subdivision Area'),
(9, 'AGRI', 'Vacant lot', 486.00, 2900.00, 'Balibago', 'BIR', '2025-10-21 16:04:52', '2025-10-24 15:35:45', 'Villa Bacolor Street', 'Near Holy Cross College'),
(10, 'A6', 'Vacant lot', 143.00, 4500.00, 'Balibago', 'BIR', '2025-10-21 16:04:52', '2025-10-24 15:35:45', 'Main Road', 'Near Public Market'),
(11, 'A37', 'Vacant lot', 108.00, 5200.00, 'Culipat', 'BIR', '2025-10-21 16:04:52', '2025-10-24 15:21:20', 'McArthur Highway', 'Commercial Strip'),
(12, 'CR', 'Vacant lot', 63.00, 2600.00, 'Salapungan', 'BIR', '2025-10-21 16:04:52', '2025-10-24 15:35:45', 'Interior Roads', 'Residential Subdivision'),
(13, 'I', 'Vacant lot', 392.00, 2800.00, 'Salapungan', 'BIR', '2025-10-21 16:04:52', '2025-10-24 15:35:45', 'Main Access Road', 'Near Schools and Churches'),
(14, 'A40', 'Vacant lot', 368.00, 3100.00, 'San Vicente', 'BIR', '2025-10-21 16:04:52', '2025-10-24 15:35:45', 'San Vicente Road', 'Near Hospital'),
(15, 'A37', 'Industrial', 162.00, 2400.00, 'San Vicente', 'BIR', '2025-10-21 16:04:52', '2025-10-24 15:35:45', 'Interior Streets', 'Quiet Residential Zone'),
(16, 'AGRI', 'Residential', 110.00, 4700.00, 'San Vicente', 'BIR', '2025-10-21 16:04:52', '2025-10-24 15:35:45', 'Main Highway Access', 'Commercial Frontage'),
(17, 'AGRI', 'Agricultural', 464.00, 2200.00, 'San Roque', 'BIR', '2025-10-21 16:04:52', '2025-10-24 15:35:45', 'San Roque Main Road', 'Residential Area'),
(18, 'A50', 'Commercial', 139.00, 1700.00, 'San Roque', 'BIR', '2025-10-21 16:04:52', '2025-10-24 15:35:45', 'Interior Roads', 'Rural Residential'),
(19, 'A6', 'Industrial', 153.00, 550.00, 'San Roque', 'BIR', '2025-10-21 16:04:52', '2025-10-24 15:21:20', 'Agricultural Areas', 'Rice Fields'),
(20, 'CR', 'Industrial', 299.00, 4900.00, 'Matatalaib', 'BIR', '2025-10-21 16:04:52', '2025-10-24 15:35:45', 'Romulo Highway', 'Along Main Highway'),
(21, 'I', 'Vacant lot', 86.00, 2800.00, 'Matatalaib', 'BIR', '2025-10-21 16:04:52', '2025-10-24 15:35:45', 'Subdivision Roads', 'Residential Subdivision'),
(22, 'A40', 'Commercial', 383.00, 1900.00, 'Matatalaib', 'BIR', '2025-10-21 16:04:52', '2025-10-24 15:35:45', 'Interior Barangay Roads', 'Rural Residential Area'),
(23, 'A37', 'Industrial', 257.00, 3300.00, 'Lourdes', 'BIR', '2025-10-21 16:04:52', '2025-10-24 15:35:45', 'Lourdes Street', 'Near Tarlac State University'),
(24, 'A6', 'Agricultural', 85.00, 4500.00, 'Lourdes', 'BIR', '2025-10-21 16:04:52', '2025-10-24 15:35:45', 'University Road', 'Commercial'),
(25, 'A17', 'Residential', 54.00, 2900.00, 'Lourdes', 'BIR', '2025-10-21 16:04:52', '2025-10-24 15:35:45', 'Interior Streets', 'Student Boarding Houses Area'),
(26, 'A15', 'Residential', 420.00, 1500.00, 'Cut-cut', 'BIR', '2025-10-21 16:04:52', '2025-10-24 15:35:45', 'Cut-cut Main Road', 'Rural Residential Area'),
(27, 'A1', 'Agricultural', 82.00, 1200.00, 'Cut-cut', 'BIR', '2025-10-21 16:04:52', '2025-10-24 15:35:45', 'Interior Barangay Roads', 'Rural Residential'),
(28, 'A1', 'Industrial', 453.00, 400.00, 'Cut-cut', 'BIR', '2025-10-21 16:04:52', '2025-10-24 15:35:45', 'Agricultural Lands', 'Farmland and Rice Fields'),
(29, 'I', 'Residential', 165.00, 3800.00, 'San Nicolas', 'BIR', '2025-10-21 16:04:52', '2025-10-24 15:35:45', 'Airport Road', 'Near Tarlac Airport'),
(30, 'RR', 'Agricultural', 318.00, 2400.00, 'San Nicolas', 'BIR', '2025-10-21 16:04:52', '2025-10-24 15:35:45', 'San Nicolas Main Road', 'Residential Area'),
(31, 'A40', 'Residential', 144.00, 1900.00, 'San Nicolas', 'BIR', '2025-10-21 16:04:52', '2025-10-24 15:35:45', 'Interior Streets', 'Quiet Residential'),
(32, 'I', 'Industrial', 168.00, 2100.00, 'Binauganan', 'BIR', '2025-10-21 16:04:52', '2025-10-24 15:35:45', 'Binauganan Road', 'Suburban Residential'),
(33, 'A37', 'Industrial', 358.00, 1500.00, 'Binauganan', 'BIR', '2025-10-21 16:04:52', '2025-10-24 15:35:45', 'Interior Roads', 'Rural Residential Area'),
(34, 'A1', 'Agricultural', 334.00, 480.00, 'Binauganan', 'BIR', '2025-10-21 16:04:52', '2025-10-24 15:35:45', 'Agricultural Areas', 'Farmland'),
(35, 'A15', 'Vacant lot', 97.00, 1200.00, 'Aguso', 'BIR', '2025-10-21 16:04:52', '2025-10-24 15:35:45', 'Aguso Main Road', 'Rural Residential'),
(36, 'A37', 'Vacant lot', 335.00, 350.00, 'Aguso', 'BIR', '2025-10-21 16:04:52', '2025-10-24 15:35:45', 'Agricultural Lands', 'Farmland and Rice Fields'),
(37, 'CR', 'Agricultural', 431.00, 1700.00, 'Aguso', 'BIR', '2025-10-21 16:04:52', '2025-10-24 15:35:45', 'Atioc Main Road', 'Residential Area'),
(38, 'A1', 'Agricultural', 201.00, 450.00, 'Atioc', 'BIR', '2025-10-21 16:04:52', '2025-10-24 15:35:45', 'Agricultural Zone', 'Farmland'),
(39, 'A6', 'Residential', 114.00, 2200.00, 'Atioc', 'BIR', '2025-10-21 16:04:52', '2025-10-24 15:35:45', 'Carangian Main Road', 'Residential Area'),
(40, 'A2', 'Agricultural', 369.00, 1700.00, 'Carangian', 'BIR', '2025-10-21 16:04:52', '2025-10-24 15:35:45', 'Sitio Paninaan', 'Rural Residential'),
(41, 'A40', 'Residential', 101.00, 1400.00, 'Carangian', 'BIR', '2025-10-21 16:04:52', '2025-10-24 15:35:45', 'Interior Roads', 'Quiet Residential Zone');

-- --------------------------------------------------------

--
-- Table structure for table `historical_prices_2021`
--

CREATE TABLE `historical_prices_2021` (
  `id` int(11) NOT NULL,
  `class` varchar(50) NOT NULL COMMENT 'Property classification (e.g., Residential, Commercial, Agricultural)',
  `property_type` varchar(100) NOT NULL COMMENT 'Type of property (e.g., House, Condominium, Lot)',
  `property_size` decimal(10,2) DEFAULT NULL COMMENT 'Property size in square meters (optional for general data)',
  `price_per_sqm` decimal(10,2) NOT NULL COMMENT 'Price per square meter in PHP',
  `address` varchar(100) DEFAULT NULL,
  `source` varchar(100) DEFAULT 'BIR' COMMENT 'Data source (e.g., BIR, Market Data)',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `street` varchar(150) DEFAULT NULL,
  `vicinity` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Historical price data for 2021';

--
-- Dumping data for table `historical_prices_2021`
--

INSERT INTO `historical_prices_2021` (`id`, `class`, `property_type`, `property_size`, `price_per_sqm`, `address`, `source`, `created_at`, `updated_at`, `street`, `vicinity`) VALUES
(1, 'A3', 'Residential', 250.00, 6900.00, 'Poblacion', 'BIR', '2025-10-21 16:05:06', '2025-10-24 15:35:45', 'F. Tanedo Street', 'Commercial District'),
(2, 'I', 'Commercial', 445.00, 5200.00, 'Poblacion', 'BIR', '2025-10-21 16:05:06', '2025-10-24 15:35:45', 'F. Tanedo Street', 'Residential Area'),
(3, 'CR', 'Industrial', 72.00, 7800.00, 'Poblacion', 'BIR', '2025-10-21 16:05:06', '2025-10-24 15:35:45', 'McArthur Highway', 'Commercial Strip'),
(4, 'A3', 'Vacant lot', 329.00, 6300.00, 'Poblacion', 'BIR', '2025-10-21 16:05:06', '2025-10-24 15:35:45', 'Romulo Boulevard', 'Near Capitol Building'),
(5, 'A3', 'Agricultural', 478.00, 5800.00, 'Poblacion', 'BIR', '2025-10-21 16:05:06', '2025-10-24 15:35:45', 'Zamora Street', 'Near Public Market'),
(6, 'AGRI', 'Vacant lot', 452.00, 4400.00, 'Poblacion', 'BIR', '2025-10-21 16:05:06', '2025-10-24 15:35:45', 'Gen. Luna Street', 'Near Schools'),
(7, 'RR', 'Industrial', 326.00, 6400.00, 'Balibago', 'BIR', '2025-10-21 16:05:06', '2025-10-24 15:35:45', 'McArthur Highway', 'Commercial Area'),
(8, 'A17', 'Industrial', 222.00, 3800.00, 'Balibago', 'BIR', '2025-10-21 16:05:06', '2025-10-24 15:35:45', 'Balibago Road', 'Residential Subdivision Area'),
(9, 'A3', 'Agricultural', 83.00, 3300.00, 'Balibago', 'BIR', '2025-10-21 16:05:06', '2025-10-24 15:35:45', 'Villa Bacolor Street', 'Near Holy Cross College'),
(10, 'A3', 'Agricultural', 149.00, 5200.00, 'Binauganan', 'BIR', '2025-10-21 16:05:06', '2025-10-24 15:21:20', 'Main Road', 'Near Public Market'),
(11, 'A40', 'Agricultural', 449.00, 6000.00, 'Binauganan', 'BIR', '2025-10-21 16:05:07', '2025-10-24 15:21:20', 'McArthur Highway', 'Commercial Strip'),
(12, 'A37', 'Residential', 394.00, 3000.00, 'Laoang', 'BIR', '2025-10-21 16:05:07', '2025-10-24 15:21:20', 'Interior Roads', 'Residential Subdivision'),
(13, 'AGRI', 'Commercial', 123.00, 3200.00, 'Binauganan', 'BIR', '2025-10-21 16:05:07', '2025-10-24 15:21:20', 'Main Access Road', 'Near Schools and Churches'),
(14, 'A50', 'Agricultural', 284.00, 3600.00, 'Cut-cut I', 'BIR', '2025-10-21 16:05:07', '2025-10-24 15:21:20', 'San Vicente Road', 'Near Hospital'),
(15, 'I', 'Vacant lot', 101.00, 2800.00, 'Paraiso', 'BIR', '2025-10-21 16:05:07', '2025-10-24 15:21:20', 'Interior Streets', 'Quiet Residential Zone'),
(16, 'I', 'Agricultural', 54.00, 5400.00, 'Balingcanaway', 'BIR', '2025-10-21 16:05:07', '2025-10-24 15:21:20', 'Main Highway Access', 'Commercial Frontage'),
(17, 'I', 'Vacant lot', 369.00, 2500.00, 'Laoang', 'BIR', '2025-10-21 16:05:07', '2025-10-24 15:21:20', 'San Roque Main Road', 'Residential Area'),
(18, 'A15', 'Commercial', 279.00, 2000.00, 'Laoang', 'BIR', '2025-10-21 16:05:07', '2025-10-24 15:21:20', 'Interior Roads', 'Rural Residential'),
(19, 'CR', 'Agricultural', 241.00, 630.00, 'Balibago II', 'BIR', '2025-10-21 16:05:07', '2025-10-24 15:21:20', 'Agricultural Areas', 'Rice Fields'),
(20, 'A6', 'Commercial', 319.00, 5600.00, 'San Nicolas', 'BIR', '2025-10-21 16:05:07', '2025-10-24 15:21:20', 'Romulo Highway', 'Along Main Highway'),
(21, 'RR', 'Industrial', 370.00, 3200.00, 'Santo Cristo', 'BIR', '2025-10-21 16:05:07', '2025-10-24 15:21:20', 'Subdivision Roads', 'Residential Subdivision'),
(22, 'A6', 'Agricultural', 393.00, 2200.00, 'Asturias', 'BIR', '2025-10-21 16:05:07', '2025-10-24 15:21:20', 'Interior Barangay Roads', 'Rural Residential Area'),
(23, 'CR', 'Vacant lot', 353.00, 3800.00, 'Ligtasan', 'BIR', '2025-10-21 16:05:07', '2025-10-24 15:21:20', 'Lourdes Street', 'Near Tarlac State University'),
(24, 'I', 'Residential', 88.00, 5200.00, 'Aguso', 'BIR', '2025-10-21 16:05:07', '2025-10-24 15:21:20', 'University Road', 'Commercial'),
(25, 'A50', 'Residential', 231.00, 3300.00, 'Balibago II', 'BIR', '2025-10-21 16:05:07', '2025-10-24 15:21:20', 'Interior Streets', 'Student Boarding Houses Area'),
(26, 'A2', 'Residential', 392.00, 1700.00, 'Ligtasan', 'BIR', '2025-10-21 16:05:16', '2025-10-24 15:21:20', 'Cut-cut Main Road', 'Rural Residential Area'),
(27, 'A40', 'Commercial', 316.00, 1400.00, 'Paraiso', 'BIR', '2025-10-21 16:05:16', '2025-10-24 15:21:20', 'Interior Barangay Roads', 'Rural Residential'),
(28, 'A6', 'Vacant lot', 356.00, 460.00, 'San Roque', 'BIR', '2025-10-21 16:05:16', '2025-10-24 15:21:20', 'Agricultural Lands', 'Farmland and Rice Fields'),
(29, 'I', 'Industrial', 330.00, 4400.00, 'Banaba', 'BIR', '2025-10-21 16:05:16', '2025-10-24 15:21:20', 'Airport Road', 'Near Tarlac Airport'),
(30, 'AGRI', 'Agricultural', 80.00, 2800.00, 'Central', 'BIR', '2025-10-21 16:05:16', '2025-10-24 15:21:20', 'San Nicolas Main Road', 'Residential Area'),
(31, 'A15', 'Residential', 265.00, 2200.00, 'Cut-cut I', 'BIR', '2025-10-21 16:05:16', '2025-10-24 15:21:20', 'Interior Streets', 'Quiet Residential'),
(32, 'A17', 'Agricultural', 133.00, 2400.00, 'Banaba', 'BIR', '2025-10-21 16:05:16', '2025-10-24 15:21:20', 'Binauganan Road', 'Suburban Residential'),
(33, 'AGRI', 'Industrial', 271.00, 1700.00, 'Dolores', 'BIR', '2025-10-21 16:05:16', '2025-10-24 15:21:20', 'Interior Roads', 'Rural Residential Area'),
(34, 'A17', 'Vacant lot', 456.00, 550.00, 'Bantog', 'BIR', '2025-10-21 16:05:16', '2025-10-24 15:21:20', 'Agricultural Areas', 'Farmland'),
(35, 'CR', 'Commercial', 66.00, 1400.00, 'Dolores', 'BIR', '2025-10-21 16:05:16', '2025-10-24 15:21:20', 'Aguso Main Road', 'Rural Residential'),
(36, 'AGRI', 'Commercial', 264.00, 400.00, 'Armenia', 'BIR', '2025-10-21 16:05:16', '2025-10-24 15:21:20', 'Agricultural Lands', 'Farmland and Rice Fields'),
(37, 'A2', 'Residential', 171.00, 2000.00, 'Dolores', 'BIR', '2025-10-21 16:05:16', '2025-10-24 15:21:20', 'Atioc Main Road', 'Residential Area'),
(38, 'A15', 'Agricultural', 463.00, 520.00, 'Matatalaib', 'BIR', '2025-10-21 16:05:16', '2025-10-24 15:21:20', 'Agricultural Zone', 'Farmland'),
(39, 'AGRI', 'Agricultural', 401.00, 2500.00, 'Salapungan', 'BIR', '2025-10-21 16:05:16', '2025-10-24 15:21:20', 'Carangian Main Road', 'Residential Area'),
(40, 'A41', 'Vacant lot', 117.00, 2000.00, 'San Miguel', 'BIR', '2025-10-21 16:05:16', '2025-10-24 15:21:20', 'Sitio Paninaan', 'Rural Residential'),
(41, 'A50', 'Residential', 233.00, 1600.00, 'San Miguel', 'BIR', '2025-10-21 16:05:16', '2025-10-24 15:21:20', 'Interior Roads', 'Quiet Residential Zone');

-- --------------------------------------------------------

--
-- Table structure for table `historical_prices_2022`
--

CREATE TABLE `historical_prices_2022` (
  `id` int(11) NOT NULL,
  `class` varchar(50) NOT NULL COMMENT 'Property classification (e.g., Residential, Commercial, Agricultural)',
  `property_type` varchar(100) NOT NULL COMMENT 'Type of property (e.g., House, Condominium, Lot)',
  `property_size` decimal(10,2) DEFAULT NULL COMMENT 'Property size in square meters (optional for general data)',
  `price_per_sqm` decimal(10,2) NOT NULL COMMENT 'Price per square meter in PHP',
  `address` varchar(100) DEFAULT NULL,
  `source` varchar(100) DEFAULT 'BIR' COMMENT 'Data source (e.g., BIR, Market Data)',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `street` varchar(150) DEFAULT NULL,
  `vicinity` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Historical price data for 2022';

--
-- Dumping data for table `historical_prices_2022`
--

INSERT INTO `historical_prices_2022` (`id`, `class`, `property_type`, `property_size`, `price_per_sqm`, `address`, `source`, `created_at`, `updated_at`, `street`, `vicinity`) VALUES
(1, 'A1', 'Agricultural', 315.00, 7800.00, 'Poblacion', 'BIR', '2025-10-21 16:05:34', '2025-10-24 15:40:05', 'F. Tanedo Street', 'Commercial District'),
(2, 'CR', 'Agricultural', 376.00, 5900.00, 'Poblacion', 'BIR', '2025-10-21 16:05:34', '2025-10-24 15:40:05', 'F. Tanedo Street', 'Residential Area'),
(3, 'A15', 'Commercial', 435.00, 8800.00, 'Poblacion', 'BIR', '2025-10-21 16:05:34', '2025-10-24 15:40:05', 'McArthur Highway', 'Commercial Strip'),
(4, 'A2', 'Agricultural', 96.00, 7100.00, 'Poblacion', 'BIR', '2025-10-21 16:05:34', '2025-10-24 15:40:05', 'Romulo Boulevard', 'Near Capitol Building'),
(5, 'CR', 'Commercial', 477.00, 6600.00, 'Poblacion', 'BIR', '2025-10-21 16:05:34', '2025-10-24 15:40:05', 'Zamora Street', 'Near Public Market'),
(6, 'A50', 'Industrial', 245.00, 5000.00, 'Poblacion', 'BIR', '2025-10-21 16:05:34', '2025-10-24 15:40:05', 'Gen. Luna Street', 'Near Schools'),
(7, 'A50', 'Commercial', 196.00, 7200.00, 'Balibago', 'BIR', '2025-10-21 16:05:34', '2025-10-24 15:40:05', 'McArthur Highway', 'Commercial Area'),
(8, 'A2', 'Vacant lot', 195.00, 4300.00, 'Balibago', 'BIR', '2025-10-21 16:05:34', '2025-10-24 15:40:05', 'Balibago Road', 'Residential Subdivision Area'),
(9, 'A37', 'Commercial', 337.00, 3700.00, 'Balibago', 'BIR', '2025-10-21 16:05:34', '2025-10-24 15:40:05', 'Villa Bacolor Street', 'Near Holy Cross College'),
(10, 'A37', 'Industrial', 148.00, 5900.00, 'Balibago', 'BIR', '2025-10-21 16:05:34', '2025-10-24 15:40:05', 'Main Road', 'Near Public Market'),
(11, 'AGRI', 'Commercial', 132.00, 6800.00, 'Salapungan', 'BIR', '2025-10-21 16:05:34', '2025-10-24 15:40:05', 'McArthur Highway', 'Commercial Strip'),
(12, 'A50', 'Residential', 166.00, 3400.00, 'Salapungan', 'BIR', '2025-10-21 16:05:34', '2025-10-24 15:40:05', 'Interior Roads', 'Residential Subdivision'),
(13, 'RR', 'Vacant lot', 386.00, 3600.00, 'Salapungan', 'BIR', '2025-10-21 16:05:34', '2025-10-24 15:40:05', 'Main Access Road', 'Near Schools and Churches'),
(14, 'A6', 'Vacant lot', 481.00, 4100.00, 'San Vicente', 'BIR', '2025-10-21 16:05:34', '2025-10-24 15:40:05', 'San Vicente Road', 'Near Hospital'),
(15, 'A6', 'Agricultural', 296.00, 3200.00, 'San Vicente', 'BIR', '2025-10-21 16:05:34', '2025-10-24 15:40:05', 'Interior Streets', 'Quiet Residential Zone'),
(16, 'A41', 'Residential', 436.00, 6100.00, 'San Vicente', 'BIR', '2025-10-21 16:05:34', '2025-10-24 15:40:05', 'Main Highway Access', 'Commercial Frontage'),
(17, 'A50', 'Industrial', 343.00, 2800.00, 'San Roque', 'BIR', '2025-10-21 16:05:34', '2025-10-24 15:40:05', 'San Roque Main Road', 'Residential Area'),
(18, 'A50', 'Industrial', 355.00, 2300.00, 'San Roque, Interior Roads, Rural Residential', 'BIR', '2025-10-21 16:05:34', '2025-10-24 15:09:17', 'Interior Roads', 'Rural Residential'),
(19, 'A17', 'Commercial', 246.00, 710.00, 'San Roque', 'BIR', '2025-10-21 16:05:34', '2025-10-24 15:40:05', 'Agricultural Areas', 'Rice Fields'),
(20, 'A3', 'Residential', 117.00, 6300.00, 'Matatalaib', 'BIR', '2025-10-21 16:05:34', '2025-10-24 15:40:05', 'Romulo Highway', 'Along Main Highway'),
(21, 'I', 'Vacant lot', 247.00, 3600.00, 'Matatalaib', 'BIR', '2025-10-21 16:05:34', '2025-10-24 15:40:05', 'Subdivision Roads', 'Residential Subdivision'),
(22, 'I', 'Residential', 382.00, 2500.00, 'Matatalaib', 'BIR', '2025-10-21 16:05:34', '2025-10-24 15:40:05', 'Interior Barangay Roads', 'Rural Residential Area'),
(23, 'I', 'Residential', 221.00, 4300.00, 'Lourdes', 'BIR', '2025-10-21 16:05:35', '2025-10-24 15:40:05', 'Lourdes Street', 'Near Tarlac State University'),
(24, 'RR', 'Industrial', 359.00, 5900.00, 'Lourdes', 'BIR', '2025-10-21 16:05:35', '2025-10-24 15:40:05', 'University Road', 'Commercial'),
(25, 'AGRI', 'Vacant lot', 179.00, 3700.00, 'Lourdes', 'BIR', '2025-10-21 16:05:35', '2025-10-24 15:40:05', 'Interior Streets', 'Student Boarding Houses Area'),
(26, 'A17', 'Agricultural', 219.00, 1900.00, 'Cut-cut', 'BIR', '2025-10-21 16:05:35', '2025-10-24 15:40:05', 'Cut-cut Main Road', 'Rural Residential Area'),
(27, 'CR', 'Residential', 58.00, 1600.00, 'Cut-cut', 'BIR', '2025-10-21 16:05:35', '2025-10-24 15:40:05', 'Interior Barangay Roads', 'Rural Residential'),
(28, 'A50', 'Residential', 484.00, 520.00, 'Cut-cut', 'BIR', '2025-10-21 16:05:35', '2025-10-24 15:40:05', 'Agricultural Lands', 'Farmland and Rice Fields'),
(29, 'A50', 'Vacant lot', 393.00, 5000.00, 'San Nicolas', 'BIR', '2025-10-21 16:05:35', '2025-10-24 15:40:05', 'Airport Road', 'Near Tarlac Airport'),
(30, 'A17', 'Vacant lot', 465.00, 3200.00, 'San Nicolas', 'BIR', '2025-10-21 16:05:35', '2025-10-24 15:40:05', 'San Nicolas Main Road', 'Residential Area'),
(31, 'A15', 'Commercial', 193.00, 2500.00, 'San Nicolas', 'BIR', '2025-10-21 16:05:35', '2025-10-24 15:40:05', 'Interior Streets', 'Quiet Residential'),
(32, 'A1', 'Residential', 422.00, 2700.00, 'Binauganan', 'BIR', '2025-10-21 16:05:35', '2025-10-24 15:40:05', 'Binauganan Road', 'Suburban Residential'),
(33, 'A15', 'Agricultural', 130.00, 1900.00, 'Binauganan', 'BIR', '2025-10-21 16:05:35', '2025-10-24 15:40:05', 'Interior Roads', 'Rural Residential Area'),
(34, 'A41', 'Agricultural', 237.00, 620.00, 'Binauganan', 'BIR', '2025-10-21 16:05:35', '2025-10-24 15:40:05', 'Agricultural Areas', 'Farmland'),
(35, 'A40', 'Agricultural', 292.00, 1600.00, 'Aguso', 'BIR', '2025-10-21 16:05:35', '2025-10-24 15:40:05', 'Aguso Main Road', 'Rural Residential'),
(36, 'AGRI', 'Commercial', 249.00, 450.00, 'Aguso', 'BIR', '2025-10-21 16:05:35', '2025-10-24 15:40:05', 'Agricultural Lands', 'Farmland and Rice Fields'),
(37, 'A2', 'Residential', 320.00, 2300.00, 'Aguso', 'BIR', '2025-10-21 16:05:35', '2025-10-24 15:40:05', 'Atioc Main Road', 'Residential Area'),
(38, 'A17', 'Industrial', 352.00, 590.00, 'Atioc', 'BIR', '2025-10-21 16:05:35', '2025-10-24 15:40:05', 'Agricultural Zone', 'Farmland'),
(39, 'A17', 'Agricultural', 300.00, 2800.00, 'Atioc', 'BIR', '2025-10-21 16:05:35', '2025-10-24 15:40:05', 'Carangian Main Road', 'Residential Area'),
(40, 'A41', 'Agricultural', 395.00, 2300.00, 'Carangian', 'BIR', '2025-10-21 16:05:35', '2025-10-24 15:40:05', 'Sitio Paninaan', 'Rural Residential'),
(41, 'A3', 'Industrial', 122.00, 1800.00, 'Carangian', 'BIR', '2025-10-21 16:05:35', '2025-10-24 15:40:05', 'Interior Roads', 'Quiet Residential Zone');

-- --------------------------------------------------------

--
-- Table structure for table `historical_prices_2023`
--

CREATE TABLE `historical_prices_2023` (
  `id` int(11) NOT NULL,
  `class` varchar(50) NOT NULL COMMENT 'Property classification (e.g., Residential, Commercial, Agricultural)',
  `property_type` varchar(100) NOT NULL COMMENT 'Type of property (e.g., House, Condominium, Lot)',
  `property_size` decimal(10,2) DEFAULT NULL COMMENT 'Property size in square meters (optional for general data)',
  `price_per_sqm` decimal(10,2) NOT NULL COMMENT 'Price per square meter in PHP',
  `address` varchar(100) DEFAULT NULL,
  `source` varchar(100) DEFAULT 'BIR' COMMENT 'Data source (e.g., BIR, Market Data)',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `street` varchar(150) DEFAULT NULL,
  `vicinity` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Historical price data for 2023';

--
-- Dumping data for table `historical_prices_2023`
--

INSERT INTO `historical_prices_2023` (`id`, `class`, `property_type`, `property_size`, `price_per_sqm`, `address`, `source`, `created_at`, `updated_at`, `street`, `vicinity`) VALUES
(1, 'A37', 'Residential', 278.00, 8700.00, 'Poblacion', 'BIR', '2025-10-21 16:07:50', '2025-10-24 15:40:05', 'F. Tanedo Street', 'Commercial District'),
(2, 'A37', 'Vacant lot', 74.00, 6600.00, 'Poblacion', 'BIR', '2025-10-21 16:07:50', '2025-10-24 15:40:05', 'F. Tanedo Street', 'Residential Area'),
(3, 'A1', 'Industrial', 386.00, 9900.00, 'Poblacion', 'BIR', '2025-10-21 16:07:50', '2025-10-24 15:40:05', 'McArthur Highway', 'Commercial Strip'),
(4, 'I', 'Agricultural', 307.00, 8000.00, 'Poblacion', 'BIR', '2025-10-21 16:07:50', '2025-10-24 15:40:06', 'Romulo Boulevard', 'Near Capitol Building'),
(5, 'RR', 'Residential', 329.00, 7400.00, 'Poblacion', 'BIR', '2025-10-21 16:07:50', '2025-10-24 15:40:06', 'Zamora Street', 'Near Public Market'),
(6, 'A41', 'Residential', 223.00, 5600.00, 'Poblacion', 'BIR', '2025-10-21 16:07:50', '2025-10-24 15:40:06', 'Gen. Luna Street', 'Near Schools'),
(7, 'A17', 'Commercial', 78.00, 8100.00, 'Balibago', 'BIR', '2025-10-21 16:07:50', '2025-10-24 15:40:06', 'McArthur Highway', 'Commercial Area'),
(8, 'A2', 'Industrial', 121.00, 4800.00, 'Balibago', 'BIR', '2025-10-21 16:07:50', '2025-10-24 15:40:06', 'Balibago Road', 'Residential Subdivision Area'),
(9, 'CR', 'Industrial', 324.00, 4200.00, 'Balibago', 'BIR', '2025-10-21 16:07:50', '2025-10-24 15:40:06', 'Villa Bacolor Street', 'Near Holy Cross College'),
(10, 'A2', 'Residential', 306.00, 6600.00, 'Balibago', 'BIR', '2025-10-21 16:07:50', '2025-10-24 15:40:56', 'Main Road', 'Near Public Market'),
(11, 'A15', 'Agricultural', 55.00, 7600.00, 'Salapungan', 'BIR', '2025-10-21 16:07:50', '2025-10-24 15:40:56', 'McArthur Highway', 'Commercial Strip'),
(12, 'RR', 'Agricultural', 211.00, 3800.00, 'Salapungan', 'BIR', '2025-10-21 16:07:50', '2025-10-24 15:40:56', 'Interior Roads', 'Residential Subdivision'),
(13, 'A17', 'Vacant lot', 389.00, 4000.00, 'Salapungan', 'BIR', '2025-10-21 16:07:50', '2025-10-24 15:40:56', 'Main Access Road', 'Near Schools and Churches'),
(14, 'A2', 'Vacant lot', 359.00, 4600.00, 'San Vicente', 'BIR', '2025-10-21 16:07:50', '2025-10-24 15:40:56', 'San Vicente Road', 'Near Hospital'),
(15, 'AGRI', 'Commercial', 128.00, 3600.00, 'San Vicente', 'BIR', '2025-10-21 16:07:50', '2025-10-24 15:40:56', 'Interior Streets', 'Quiet Residential Zone'),
(16, 'A15', 'Residential', 415.00, 6800.00, 'San Vicente', 'BIR', '2025-10-21 16:07:50', '2025-10-24 15:40:56', 'Main Highway Access', 'Commercial Frontage'),
(17, 'A40', 'Agricultural', 290.00, 3100.00, 'San Roque', 'BIR', '2025-10-21 16:07:50', '2025-10-24 15:40:56', 'San Roque Main Road', 'Residential Area'),
(18, 'A15', 'Agricultural', 156.00, 2600.00, 'San Roque', 'BIR', '2025-10-21 16:07:50', '2025-10-24 15:40:56', 'Interior Roads', 'Rural Residential'),
(19, 'A15', 'Industrial', 312.00, 800.00, 'San Roque', 'BIR', '2025-10-21 16:07:50', '2025-10-24 15:40:56', 'Agricultural Areas', 'Rice Fields'),
(20, 'A2', 'Agricultural', 139.00, 7100.00, 'Matatalaib', 'BIR', '2025-10-21 16:07:50', '2025-10-24 15:40:56', 'Romulo Highway', 'Along Main Highway'),
(21, 'I', 'Residential', 162.00, 4000.00, 'Matatalaib', 'BIR', '2025-10-21 16:07:50', '2025-10-24 15:40:56', 'Subdivision Roads', 'Residential Subdivision'),
(22, 'A15', 'Residential', 344.00, 2800.00, 'Matatalaib', 'BIR', '2025-10-21 16:07:50', '2025-10-24 15:40:56', 'Interior Barangay Roads', 'Rural Residential Area'),
(23, 'CR', 'Industrial', 281.00, 4800.00, 'Lourdes', 'BIR', '2025-10-21 16:07:50', '2025-10-24 15:40:56', 'Lourdes Street', 'Near Tarlac State University'),
(24, 'CR', 'Agricultural', 322.00, 6600.00, 'Lourdes', 'BIR', '2025-10-21 16:07:50', '2025-10-24 15:40:56', 'University Road', 'Commercial'),
(25, 'A6', 'Industrial', 269.00, 4200.00, 'Lourdes', 'BIR', '2025-10-21 16:07:50', '2025-10-24 15:40:56', 'Interior Streets', 'Student Boarding Houses Area'),
(26, 'A15', 'Industrial', 327.00, 2100.00, 'Cut-cut', 'BIR', '2025-10-21 16:07:50', '2025-10-24 15:40:56', 'Cut-cut Main Road', 'Rural Residential Area'),
(27, 'A41', 'Residential', 327.00, 1800.00, 'Cut-cut', 'BIR', '2025-10-21 16:07:50', '2025-10-24 15:40:56', 'Interior Barangay Roads', 'Rural Residential'),
(28, 'A40', 'Industrial', 154.00, 580.00, 'Cut-cut', 'BIR', '2025-10-21 16:07:50', '2025-10-24 15:40:56', 'Agricultural Lands', 'Farmland and Rice Fields'),
(29, 'CR', 'Commercial', 191.00, 5600.00, 'San Nicolas', 'BIR', '2025-10-21 16:07:50', '2025-10-24 15:40:56', 'Airport Road', 'Near Tarlac Airport'),
(30, 'A6', 'Industrial', 444.00, 3600.00, 'San Nicolas', 'BIR', '2025-10-21 16:07:50', '2025-10-24 15:40:56', 'San Nicolas Main Road', 'Residential Area'),
(31, 'A1', 'Vacant lot', 244.00, 2800.00, 'San Nicolas', 'BIR', '2025-10-21 16:07:50', '2025-10-24 15:40:56', 'Interior Streets', 'Quiet Residential'),
(32, 'A17', 'Residential', 291.00, 3000.00, 'Binauganan', 'BIR', '2025-10-21 16:07:50', '2025-10-24 15:40:56', 'Binauganan Road', 'Suburban Residential'),
(33, 'CR', 'Commercial', 223.00, 2100.00, 'Binauganan', 'BIR', '2025-10-21 16:07:50', '2025-10-24 15:40:56', 'Interior Roads', 'Rural Residential Area'),
(34, 'AGRI', 'Vacant lot', 190.00, 690.00, 'Binauganan', 'BIR', '2025-10-21 16:07:50', '2025-10-24 15:40:56', 'Agricultural Areas', 'Farmland'),
(35, 'A37', 'Residential', 235.00, 1800.00, 'Aguso', 'BIR', '2025-10-21 16:07:50', '2025-10-24 15:40:56', 'Aguso Main Road', 'Rural Residential'),
(36, 'A6', 'Residential', 101.00, 500.00, 'Aguso', 'BIR', '2025-10-21 16:07:50', '2025-10-24 15:40:56', 'Agricultural Lands', 'Farmland and Rice Fields'),
(37, 'A2', 'Commercial', 204.00, 2600.00, 'Aguso', 'BIR', '2025-10-21 16:07:50', '2025-10-24 15:40:56', 'Atioc Main Road', 'Residential Area'),
(38, 'A3', 'Vacant lot', 215.00, 660.00, 'Atioc', 'BIR', '2025-10-21 16:07:50', '2025-10-24 15:40:56', 'Agricultural Zone', 'Farmland'),
(39, 'A1', 'Residential', 415.00, 3100.00, 'Atioc', 'BIR', '2025-10-21 16:07:50', '2025-10-24 15:40:56', 'Carangian Main Road', 'Residential Area'),
(40, 'A15', 'Agricultural', 478.00, 2600.00, 'Carangian', 'BIR', '2025-10-21 16:07:50', '2025-10-24 15:40:56', 'Sitio Paninaan', 'Rural Residential'),
(41, 'A41', 'Industrial', 195.00, 2000.00, 'Carangian', 'BIR', '2025-10-21 16:07:50', '2025-10-24 15:40:56', 'Interior Roads', 'Quiet Residential Zone');

-- --------------------------------------------------------

--
-- Table structure for table `historical_prices_2024`
--

CREATE TABLE `historical_prices_2024` (
  `id` int(11) NOT NULL,
  `class` varchar(50) NOT NULL COMMENT 'Property classification (e.g., Residential, Commercial, Agricultural)',
  `property_type` varchar(100) NOT NULL COMMENT 'Type of property (e.g., House, Condominium, Lot)',
  `property_size` decimal(10,2) DEFAULT NULL COMMENT 'Property size in square meters (optional for general data)',
  `price_per_sqm` decimal(10,2) NOT NULL COMMENT 'Price per square meter in PHP',
  `address` varchar(100) DEFAULT NULL,
  `source` varchar(100) DEFAULT 'BIR' COMMENT 'Data source (e.g., BIR, Market Data)',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `street` varchar(150) DEFAULT NULL,
  `vicinity` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Historical price data for 2024';

--
-- Dumping data for table `historical_prices_2024`
--

INSERT INTO `historical_prices_2024` (`id`, `class`, `property_type`, `property_size`, `price_per_sqm`, `address`, `source`, `created_at`, `updated_at`, `street`, `vicinity`) VALUES
(1, 'A40', 'Commercial', 392.00, 9600.00, 'Poblacion', 'BIR', '2025-10-21 16:07:50', '2025-10-24 15:37:09', 'F. Tanedo Street', 'Commercial District'),
(2, 'A1', 'Agricultural', 423.00, 7300.00, 'Poblacion', 'BIR', '2025-10-21 16:07:50', '2025-10-24 15:37:09', 'F. Tanedo Street', 'Residential Area'),
(3, 'CR', 'Residential', 437.00, 10900.00, 'Poblacion', 'BIR', '2025-10-21 16:07:50', '2025-10-24 15:37:09', 'McArthur Highway', 'Commercial Strip'),
(4, 'A15', 'Residential', 417.00, 8800.00, 'Poblacion', 'BIR', '2025-10-21 16:07:50', '2025-10-24 15:37:09', 'Romulo Boulevard', 'Near Capitol Building'),
(5, 'A1', 'Vacant lot', 273.00, 8100.00, 'Poblacion', 'BIR', '2025-10-21 16:07:50', '2025-10-24 15:37:09', 'Zamora Street', 'Near Public Market'),
(6, 'A1', 'Residential', 66.00, 6200.00, 'Poblacion', 'BIR', '2025-10-21 16:07:50', '2025-10-24 15:55:17', 'Gen. Luna Street', 'Near Schools'),
(7, 'A37', 'Commercial', 364.00, 8900.00, 'Balibago', 'BIR', '2025-10-21 16:07:50', '2025-10-24 15:40:56', 'McArthur Highway', 'Commercial Area'),
(8, 'A50', 'Industrial', 217.00, 5300.00, 'Balibago', 'BIR', '2025-10-21 16:07:50', '2025-10-24 15:40:56', 'Balibago Road', 'Residential Subdivision Area'),
(9, 'A15', 'Commercial', 397.00, 4600.00, 'Balibago', 'BIR', '2025-10-21 16:07:50', '2025-10-24 15:40:56', 'Villa Bacolor Street', 'Near Holy Cross College'),
(10, 'A6', 'Vacant lot', 381.00, 7300.00, 'Balibago', 'BIR', '2025-10-21 16:07:50', '2025-10-24 15:41:56', 'Main Road', 'Near Public Market'),
(11, 'A15', 'Commercial', 212.00, 8400.00, 'Salapungan', 'BIR', '2025-10-21 16:07:50', '2025-10-24 15:41:56', 'McArthur Highway', 'Commercial Strip'),
(12, 'A6', 'Vacant lot', 322.00, 4200.00, 'Salapungan', 'BIR', '2025-10-21 16:07:50', '2025-10-24 15:41:56', 'Interior Roads', 'Residential Subdivision'),
(13, 'A17', 'Agricultural', 471.00, 4400.00, 'Salapungan', 'BIR', '2025-10-21 16:07:50', '2025-10-24 15:41:56', 'Main Access Road', 'Near Schools and Churches'),
(14, 'RR', 'Industrial', 437.00, 5100.00, 'San Vicente', 'BIR', '2025-10-21 16:07:50', '2025-10-24 15:41:56', 'San Vicente Road', 'Near Hospital'),
(15, 'A15', 'Vacant lot', 271.00, 4000.00, 'San Vicente', 'BIR', '2025-10-21 16:07:50', '2025-10-24 15:41:56', 'Interior Streets', 'Quiet Residential Zone'),
(16, 'CR', 'Agricultural', 448.00, 7500.00, 'San Vicente', 'BIR', '2025-10-21 16:07:50', '2025-10-24 15:41:56', 'Main Highway Access', 'Commercial Frontage'),
(17, 'RR', 'Vacant lot', 474.00, 3400.00, 'San Roque', 'BIR', '2025-10-21 16:07:50', '2025-10-24 15:41:56', 'San Roque Main Road', 'Residential Area'),
(18, 'A15', 'Agricultural', 74.00, 2900.00, 'San Roque', 'BIR', '2025-10-21 16:07:50', '2025-10-24 15:41:56', 'Interior Roads', 'Rural Residential'),
(19, 'CR', 'Agricultural', 252.00, 880.00, 'San Roque', 'BIR', '2025-10-21 16:07:50', '2025-10-24 15:41:56', 'Agricultural Areas', 'Rice Fields'),
(20, 'I', 'Agricultural', 89.00, 7800.00, 'Matatalaib', 'BIR', '2025-10-21 16:07:50', '2025-10-24 15:41:56', 'Romulo Highway', 'Along Main Highway'),
(21, 'A3', 'Vacant lot', 87.00, 4400.00, 'Matatalaib', 'BIR', '2025-10-21 16:07:50', '2025-10-24 15:41:56', 'Subdivision Roads', 'Residential Subdivision'),
(22, 'A6', 'Vacant lot', 119.00, 3100.00, 'Matatalaib', 'BIR', '2025-10-21 16:07:50', '2025-10-24 15:41:56', 'Interior Barangay Roads', 'Rural Residential Area'),
(23, 'A6', 'Industrial', 285.00, 5300.00, 'Lourdes', 'BIR', '2025-10-21 16:07:50', '2025-10-24 15:41:56', 'Lourdes Street', 'Near Tarlac State University'),
(24, 'A40', 'Residential', 115.00, 7300.00, 'Lourdes', 'BIR', '2025-10-21 16:07:50', '2025-10-24 15:41:56', 'University Road', 'Commercial'),
(25, 'A17', 'Residential', 124.00, 4600.00, 'Lourdes', 'BIR', '2025-10-21 16:07:50', '2025-10-24 15:41:56', 'Interior Streets', 'Student Boarding Houses Area'),
(26, 'A6', 'Commercial', 224.00, 2300.00, 'Cut-cut', 'BIR', '2025-10-21 16:07:50', '2025-10-24 15:41:56', 'Cut-cut Main Road', 'Rural Residential Area'),
(27, 'I', 'Residential', 247.00, 2000.00, 'Cut-cut', 'BIR', '2025-10-21 16:07:50', '2025-10-24 15:41:56', 'Interior Barangay Roads', 'Rural Residential'),
(28, 'A6', 'Residential', 63.00, 640.00, 'Cut-cut', 'BIR', '2025-10-21 16:07:50', '2025-10-24 15:56:26', 'Agricultural Lands', 'Farmland and Rice Fields'),
(29, 'A6', 'Industrial', 428.00, 6200.00, 'San Nicolas', 'BIR', '2025-10-21 16:07:50', '2025-10-24 15:43:07', 'Airport Road', 'Near Tarlac Airport'),
(30, 'A3', 'Commercial', 95.00, 4000.00, 'San Nicolas', 'BIR', '2025-10-21 16:07:50', '2025-10-24 15:43:07', 'San Nicolas Main Road', 'Residential Area'),
(31, 'A41', 'Vacant lot', 495.00, 3100.00, 'San Nicolas', 'BIR', '2025-10-21 16:07:50', '2025-10-24 15:43:07', 'Interior Streets', 'Quiet Residential'),
(32, 'A1', 'Residential', 338.00, 3300.00, 'Binauganan', 'BIR', '2025-10-21 16:07:50', '2025-10-24 15:43:07', 'Binauganan Road', 'Suburban Residential'),
(33, 'A41', 'Commercial', 155.00, 2300.00, 'Binauganan', 'BIR', '2025-10-21 16:07:50', '2025-10-24 15:43:07', 'Interior Roads', 'Rural Residential Area'),
(34, 'A6', 'Residential', 161.00, 760.00, 'Binauganan', 'BIR', '2025-10-21 16:07:50', '2025-10-24 15:43:07', 'Agricultural Areas', 'Farmland'),
(35, 'A6', 'Industrial', 293.00, 2000.00, 'Aguso', 'BIR', '2025-10-21 16:07:50', '2025-10-24 15:43:07', 'Aguso Main Road', 'Rural Residential'),
(36, 'A6', 'Agricultural', 480.00, 550.00, 'Aguso', 'BIR', '2025-10-21 16:07:50', '2025-10-24 15:43:07', 'Agricultural Lands', 'Farmland and Rice Fields'),
(37, 'A2', 'Agricultural', 118.00, 2900.00, 'Aguso', 'BIR', '2025-10-21 16:07:50', '2025-10-24 15:43:07', 'Atioc Main Road', 'Residential Area'),
(38, 'A2', 'Agricultural', 454.00, 730.00, 'Atioc', 'BIR', '2025-10-21 16:07:50', '2025-10-24 15:43:07', 'Agricultural Zone', 'Farmland'),
(39, 'A41', 'Industrial', 61.00, 3400.00, 'Atioc', 'BIR', '2025-10-21 16:07:50', '2025-10-24 15:43:07', 'Carangian Main Road', 'Residential Area'),
(40, 'I', 'Residential', 249.00, 2900.00, 'Carangian', 'BIR', '2025-10-21 16:07:50', '2025-10-24 15:43:07', 'Sitio Paninaan', 'Rural Residential'),
(41, 'A2', 'Agricultural', 111.00, 2200.00, 'Carangian', 'BIR', '2025-10-21 16:07:50', '2025-10-24 15:43:07', 'Interior Roads', 'Quiet Residential Zone');

-- --------------------------------------------------------

--
-- Table structure for table `properties`
--

CREATE TABLE `properties` (
  `id` int(11) NOT NULL,
  `agent_id` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `barangay` varchar(100) DEFAULT NULL COMMENT 'Barangay name',
  `street` varchar(255) DEFAULT NULL COMMENT 'Street name',
  `city` varchar(100) NOT NULL,
  `province` varchar(100) NOT NULL,
  `price` decimal(12,2) NOT NULL,
  `property_type` varchar(100) NOT NULL,
  `class` varchar(10) DEFAULT NULL,
  `bedrooms` int(11) DEFAULT NULL,
  `bathrooms` int(11) DEFAULT NULL,
  `floor_area` int(11) DEFAULT NULL,
  `lot_area` int(11) DEFAULT NULL,
  `owner_name` varchar(100) NOT NULL,
  `contact_number` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `status` varchar(50) DEFAULT 'New Lead' COMMENT 'Lead status: New Lead, Proposal, Follow Up, On Progress, Negotiation, Signing Contract, Not Interested, Closed Deal',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `properties`
--

INSERT INTO `properties` (`id`, `agent_id`, `description`, `barangay`, `street`, `city`, `province`, `price`, `property_type`, `class`, `bedrooms`, `bathrooms`, `floor_area`, `lot_area`, `owner_name`, `contact_number`, `email`, `status`, `created_at`, `updated_at`) VALUES
(2, 1, 'Modern condominium unit', 'BALIBAGO 1ST', 'MC ARTHUR HIGHWAY', 'Tarlac City', 'Tarlac', 1223141423.00, 'INDUSTRIAL', 'I', 3, 23, 1234, 1234, 'elmerson dizon', '09296735489', 'elmer023gragasin@gmail.com', 'Proposal', '2025-09-17 14:40:54', '2025-10-27 14:22:11'),
(3, 2, 'Expensive property', 'POBLACION', 'F. TANEDO ST.', 'Tarlac City', 'Tarlac', 11000.00, 'AGRICULTURE', 'I', 3, NULL, 3000, NULL, 'arvin coronel', '09296735489', 'fsoriano_07@yahoo.com', 'Proposal', '2025-09-18 06:44:06', '2025-10-27 14:22:11'),
(4, 2, 'Nice location', 'BALIBAGO 1ST', 'BALIBAGO ROAD', 'Tarlac City', 'Tarlac', 155638.00, 'COMMERCIAL', 'CR', 1, 4, 123, 81, 'taka balibago', '09474837192', 'just@gmail.com', 'Proposal', '2025-10-03 06:55:01', '2025-10-27 14:22:11'),
(5, 1, 'Good property', 'SAN VICENTE', 'MAIN ROAD', 'Tarlac City', 'Tarlac', 125000.00, 'INDUSTRIAL', 'I', 1, 1, 120, 120, 'arvin coronel', '09296735489', 'i_catherine3@yahoo.com', 'Signing Contract', '2025-10-04 17:38:39', '2025-10-27 14:22:11'),
(6, 1, 'Nice house', 'SAN VICENTE', 'MAIN ROAD', 'Tarlac City', 'Tarlac', 102345.00, 'INDUSTRIAL', 'I', 1, 1, 122, 121, 'kenneth sta cruz', '09876543211', 'kenneth@gmail.com', 'Negotiation', '2025-10-08 04:32:00', '2025-10-27 14:22:11'),
(7, 1, 'happy lang', 'MATATALAIB', 'ROMULO HIGHWAY', 'Tarlac City', 'Tarlac', 1200000.00, 'INDUSTRIAL', 'I', 2, 1, 150, 190, 'Kenneth James', '09802344561', 'kenken@gmail.com', 'Closed Deal', '2025-10-08 18:07:02', '2025-10-27 14:22:11'),
(8, 1, 'Wahahahaha', 'CARANGIAN', 'CARANGIAN MAIN ROAD', 'Tarlac City', 'Tarlac', 1500.00, 'COMMERCIAL', 'A1', NULL, NULL, NULL, NULL, 'Elmer Gragasin', '09428975327', 'elmer@gmail.com', 'New Lead', '2025-10-21 13:56:12', '2025-10-27 14:22:11'),
(9, 1, 'hindi ko', 'POBLACION', 'MAC ARTHUR HIGHWAY', 'Tarlac City', 'Tarlac', 16999023.00, 'COMMERCIAL', 'RR', 1, 1, 124, 130, 'arvin coronel', '09296735489', 'arvincalapuz@gmail.com', 'Negotiation', '2025-10-23 10:25:12', '2025-10-27 14:22:11'),
(10, 1, 'Spacious residential property with modern amenities', 'SAN NICOLAS', 'AIRPORT ROAD', 'Tarlac City', 'Tarlac', 2500000.00, 'RESIDENTIAL', 'A1', 3, 2, 120, 200, 'Maria Santos', '09171234567', 'maria.santos@email.com', 'On Progress', '2025-10-23 13:40:10', '2025-10-31 18:41:21'),
(11, 1, 'Commercial building suitable for retail business', 'MALIGAYA', 'ZAMORA STREET', 'Tarlac City', 'Tarlac', 5000000.00, 'COMMERCIAL', 'CR', NULL, 3, 250, 300, 'Juan Dela Cruz', '09181234567', 'juan.delacruz@email.com', 'On Progress', '2025-10-23 13:40:10', '2025-10-27 14:22:11'),
(12, 1, 'Agricultural land with irrigation system', 'SALAPUNGAN', 'MC ARTHUR HIGHWAY', 'Tarlac City', 'Tarlac', 3500000.00, 'AGRICULTURE', 'A1', NULL, NULL, NULL, 5000, 'Pedro Reyes', '09191234567', 'pedro.reyes@email.com', 'Signing Contract', '2025-10-23 13:40:10', '2025-10-27 14:22:11'),
(13, 1, 'Vacant lot ready for development', 'BINAUGANAN', 'BINAUGANAN ROAD', 'Tarlac City', 'Tarlac', 1800000.00, 'RESIDENTIAL', 'A2', NULL, NULL, NULL, 150, 'Ana Garcia', '09201234567', 'ana.garcia@email.com', 'Proposal', '2025-10-23 13:40:10', '2025-10-27 14:22:11'),
(14, 1, 'Industrial warehouse with loading dock', 'MATATALAIB', 'SUBDIVISION ROADS', 'Tarlac City', 'Tarlac', 8000000.00, 'INDUSTRIAL', 'I', NULL, 2, 500, 800, 'Roberto Cruz', '09211234567', 'roberto.cruz@email.com', 'Proposal', '2025-10-23 13:40:10', '2025-10-27 14:22:11'),
(15, 1, 'Modern house with garage and garden', 'CENTRAL', 'ROMULO BOULEVARD', 'Tarlac City', 'Tarlac', 3200000.00, 'RESIDENTIAL', 'A15', 4, 3, 150, 250, 'Carmen Lopez', '09221234567', 'carmen.lopez@email.com', 'Follow Up', '2025-10-23 13:40:10', '2025-10-27 14:22:11'),
(16, 1, 'Commercial space along main highway', 'DOLORES', 'MAC ARTHUR HIGHWAY', 'Tarlac City', 'Tarlac', 4500000.00, 'COMMERCIAL', 'CR', NULL, 2, 180, 220, 'Jose Ramos', '09231234567', 'jose.ramos@email.com', 'Follow Up', '2025-10-23 13:40:10', '2025-10-27 14:22:11'),
(17, 1, 'Residential property near schools', 'LOURDES', 'LOURDES STREET', 'Tarlac City', 'Tarlac', 2800000.00, 'RESIDENTIAL', 'A17', 3, 2, 130, 180, 'Linda Martinez', '09241234567', 'linda.martinez@email.com', 'Not Interested', '2025-10-23 13:40:10', '2025-10-27 14:22:11'),
(18, 1, 'Agricultural farmland with fruit trees', 'CARANGIAN', 'SITIO PANINAAN', 'Tarlac City', 'Tarlac', 4200000.00, 'AGRICULTURE', 'A1', NULL, NULL, NULL, 8000, 'Miguel Torres', '09251234567', 'miguel.torres@email.com', 'Closed Deal', '2025-10-23 13:40:10', '2025-10-27 14:22:11'),
(19, 1, 'Corner lot ideal for commercial use', 'TIBAG', 'MAIN ROAD', 'Tarlac City', 'Tarlac', 2200000.00, 'RESIDENTIAL', 'A3', NULL, NULL, NULL, 200, 'Sofia Mendoza', '09261234567', 'sofia.mendoza@email.com', 'Negotiation', '2025-10-23 13:40:10', '2025-10-27 14:22:11'),
(20, 1, 'Residential house with swimming pool', 'SANTO DOMINGO', 'PROVINCIAL ROAD', 'Tarlac City', 'Tarlac', 4800000.00, 'RESIDENTIAL', 'A37', 5, 4, 250, 400, 'Ricardo Fernandez', '09271234567', 'ricardo.fernandez@email.com', 'Negotiation', '2025-10-23 13:40:10', '2025-10-27 14:22:11'),
(21, 1, 'Industrial property with office space', 'BALIBAGO 2ND', 'MC ARTHUR HIGHWAY', 'Tarlac City', 'Tarlac', 6500000.00, 'INDUSTRIAL', 'I', NULL, 2, 400, 600, 'Teresa Aquino', '09281234567', 'teresa.aquino@email.com', 'Proposal', '2025-10-23 13:40:10', '2025-10-27 14:22:11'),
(22, 1, 'Townhouse in residential subdivision', 'SAN ROQUE', 'SAN ROQUE MAIN ROAD', 'Tarlac City', 'Tarlac', 1900000.00, 'RESIDENTIAL', 'A40', 2, 2, 80, 100, 'Antonio Villanueva', '09291234567', 'antonio.villanueva@email.com', 'Not Interested', '2025-10-23 13:40:10', '2025-10-27 14:22:11'),
(23, 1, 'Commercial lot near public market', 'LIGTASAN', 'LIGTASAN-HILARIO ST.', 'Tarlac City', 'Tarlac', 3800000.00, 'COMMERCIAL', 'CR', NULL, NULL, NULL, 280, 'Gloria Castillo', '09301234567', 'gloria.castillo@email.com', 'On Progress', '2025-10-23 13:40:10', '2025-10-27 14:22:11'),
(24, 1, 'Vacant agricultural land', 'SAN SEBASTIAN', 'PROVINCIAL ROAD', 'Tarlac City', 'Tarlac', 3000000.00, 'AGRICULTURE', 'A1', NULL, NULL, NULL, 6000, 'Fernando Santiago', '09311234567', 'fernando.santiago@email.com', 'Negotiation', '2025-10-23 13:40:10', '2025-10-27 14:22:11'),
(25, 1, 'Single detached house with balcony', 'BALINGCANAWAY', 'MAIN ROAD', 'Tarlac City', 'Tarlac', 2600000.00, 'RESIDENTIAL', 'A41', 3, 2, 140, 220, 'Diana Pascual', '09321234567', 'diana.pascual@email.com', 'Follow Up', '2025-10-23 13:40:10', '2025-10-27 14:22:11'),
(26, 1, 'Warehouse facility with parking', 'PARAISO', 'INDUSTRIAL ROAD', 'Tarlac City', 'Tarlac', 7200000.00, 'INDUSTRIAL', 'I', NULL, 1, 450, 700, 'Benjamin Reyes', '09331234567', 'benjamin.reyes@email.com', 'Not Interested', '2025-10-23 13:40:10', '2025-10-27 14:22:11'),
(27, 1, 'Residential lot in quiet neighborhood', 'SANTO CRISTO', 'GEN. LUNA STREET', 'Tarlac City', 'Tarlac', 1600000.00, 'RESIDENTIAL', 'A50', NULL, NULL, NULL, 120, 'Patricia Diaz', '09341234567', 'patricia.diaz@email.com', 'Negotiation', '2025-10-23 13:40:10', '2025-10-27 14:22:11'),
(28, 1, 'Commercial building with parking area', 'AGUSO', 'MAIN ROAD', 'Tarlac City', 'Tarlac', 5500000.00, 'COMMERCIAL', 'CR', NULL, 3, 280, 350, 'Eduardo Santos', '09351234567', 'eduardo.santos@email.com', 'Closed Deal', '2025-10-23 13:40:10', '2025-10-27 14:22:11'),
(29, 1, 'Family home with spacious backyard', 'MALIWALO', 'RESIDENTIAL AREA', 'Tarlac City', 'Tarlac', 2900000.00, 'RESIDENTIAL', 'A6', 4, 3, 160, 280, 'Isabel Morales', '09361234567', 'isabel.morales@email.com', 'Closed Deal', '2025-10-23 13:40:10', '2025-10-27 14:22:11'),
(30, 1, 'Agricultural rice field with water access', 'CULIPAT', 'MC ARTHUR HIGHWAY', 'Tarlac City', 'Tarlac', 4000000.00, 'AGRICULTURE', 'A1', NULL, NULL, NULL, 7500, 'Carlos Valdez', '09371234567', 'carlos.valdez@email.com', 'On Progress', '2025-10-23 13:40:10', '2025-10-27 14:22:11'),
(31, 1, 'Prime vacant lot for commercial development', 'TARIJI', 'MAIN ROAD', 'Tarlac City', 'Tarlac', 2400000.00, 'RESIDENTIAL', 'RR', NULL, NULL, NULL, 180, 'Rosario Cruz', '09381234567', 'rosario.cruz@email.com', 'Signing Contract', '2025-10-23 13:40:10', '2025-10-27 14:22:11'),
(32, 1, 'Industrial complex with multiple units', 'MAPALACSIAO', 'INDUSTRIAL ZONE', 'Tarlac City', 'Tarlac', 9500000.00, 'INDUSTRIAL', 'I', NULL, 3, 600, 1000, 'Manuel Gonzales', '09391234567', 'manuel.gonzales@email.com', 'Signing Contract', '2025-10-23 13:40:10', '2025-10-27 14:22:11'),
(33, 1, 'Cozy bungalow with carport', 'MATADERO', 'RESIDENTIAL AREA', 'Tarlac City', 'Tarlac', 2100000.00, 'RESIDENTIAL', 'A1', 2, 1, 90, 150, 'Elena Velasco', '09401234567', 'elena.velasco@email.com', 'Negotiation', '2025-10-23 13:40:10', '2025-10-27 14:22:11'),
(34, 1, 'Commercial space with high foot traffic', 'ARMENIA', 'COMMERCIAL DISTRICT', 'Tarlac City', 'Tarlac', 4200000.00, 'COMMERCIAL', 'CR', NULL, 2, 200, 250, 'Rodrigo Manalo', '09411234567', 'rodrigo.manalo@email.com', 'Proposal', '2025-10-23 13:40:10', '2025-10-27 14:22:11'),
(35, 1, 'wa', 'BALIBAGO 1ST', 'MC ARTHUR HIGHWAY', 'Tarlac City', 'Tarlac', 1000000.00, 'RESIDENTIAL', 'RR', 2, 21, 100, 200, 'Elmer Steves', '09428975327', 'elmer@gmail.com', 'Proposal', '2025-10-25 14:34:53', '2025-10-27 14:22:11'),
(36, 1, 'Residential property near schools', 'AGUSO', 'AGRICULTURAL AREAS', 'Tarlac City', 'Tarlac', 2800000.00, 'AGRICULTURE', 'A17', 3, 2, 130, 180, 'Linda Martinez', '09241234567', 'linda.martinez@email.com', 'Proposal', '2025-10-26 15:50:50', '2025-10-27 14:22:11'),
(42, 1, 'Vacant lot ready for development', 'BINAUGANAN', 'ALL LOTS', 'Tarlac City', 'Tarlac', 1800000.00, 'AGRICULTURE', 'A37', NULL, NULL, NULL, 150, 'Ana Garcia', '09201234567', 'ana.garcia@email.com', 'Proposal', '2025-11-05 01:47:39', '2025-11-05 02:17:20'),
(48, 1, '123', 'SAN MIGUEL', 'MC. ARTHUR HIGHWAY', 'Tarlac City', 'Tarlac', 1200000.00, 'RESIDENTIAL', 'RR', 2, 2, 300, 350, 'wawa carvi', '09201234567', 'fsoriano_07@yahoo.com', 'On Progress', '2025-11-05 02:19:30', '2025-11-05 11:18:39');

-- --------------------------------------------------------

--
-- Table structure for table `properties_data_backup`
--

CREATE TABLE `properties_data_backup` (
  `id` int(11) NOT NULL DEFAULT 0,
  `agent_id` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `barangay` varchar(100) DEFAULT NULL COMMENT 'Barangay name',
  `street` varchar(255) DEFAULT NULL COMMENT 'Street name',
  `city` varchar(100) NOT NULL,
  `province` varchar(100) NOT NULL,
  `price` decimal(12,2) NOT NULL,
  `property_type` varchar(100) NOT NULL,
  `class` varchar(10) DEFAULT NULL,
  `bedrooms` int(11) DEFAULT NULL,
  `bathrooms` int(11) DEFAULT NULL,
  `floor_area` int(11) DEFAULT NULL,
  `lot_area` int(11) DEFAULT NULL,
  `owner_name` varchar(100) NOT NULL,
  `contact_number` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `status` varchar(50) DEFAULT 'New Lead' COMMENT 'Lead status: New Lead, Proposal, Follow Up, On Progress, Negotiation, Signing Contract, Not Interested, Closed Deal',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `properties_data_backup`
--

INSERT INTO `properties_data_backup` (`id`, `agent_id`, `description`, `barangay`, `street`, `city`, `province`, `price`, `property_type`, `class`, `bedrooms`, `bathrooms`, `floor_area`, `lot_area`, `owner_name`, `contact_number`, `email`, `status`, `created_at`, `updated_at`) VALUES
(2, 1, 'Modern condominium unit', 'Balibago', 'MC ARTHUR HIGHWAY', 'Tarlac City', 'Tarlac', 1223141423.00, 'Vacant lot', 'I', 3, 23, 1234, 1234, 'elmerson dizon', '09296735489', 'elmer023gragasin@gmail.com', 'Proposal', '2025-09-17 14:40:54', '2025-10-27 14:13:32'),
(3, 2, 'Expensive property', 'F. Tanedo St. Poblacion', 'F. TANEDO ST.', 'Tarlac City', 'Tarlac', 11000.00, 'Agricultural', 'I', 3, NULL, 3000, NULL, 'arvin coronel', '09296735489', 'fsoriano_07@yahoo.com', 'Proposal', '2025-09-18 06:44:06', '2025-10-27 14:13:32'),
(4, 2, 'Nice location', 'Balibago', 'BALIBAGO ROAD', 'Tarlac City', 'Tarlac', 155638.00, 'Commercial', 'I', 1, 4, 123, 81, 'taka balibago', '09474837192', 'just@gmail.com', 'Proposal', '2025-10-03 06:55:01', '2025-10-27 14:13:32'),
(5, 1, 'Good property', 'wagayway', 'MAIN ROAD', 'Tarlac City', 'Tarlac', 125000.00, 'Industrial', 'I', 1, 1, 120, 120, 'arvin coronel', '09296735489', 'i_catherine3@yahoo.com', 'Signing Contract', '2025-10-04 17:38:39', '2025-10-27 14:13:32'),
(6, 1, 'Nice house', 'palang', 'MAIN ROAD', 'Tarlac City', 'Tarlac', 102345.00, 'Industrial', 'I', 1, 1, 122, 121, 'kenneth sta cruz', '09876543211', 'kenneth@gmail.com', 'Negotiation', '2025-10-08 04:32:00', '2025-10-27 14:13:32'),
(7, 1, 'happy lang', 'Matatalaib', 'ROMULO HIGHWAY', 'Tarlac City', 'Tarlac', 1200000.00, 'Industrial', 'I', 2, 1, 150, 190, 'Kenneth James', '09802344561', 'kenken@gmail.com', 'Closed Deal', '2025-10-08 18:07:02', '2025-10-27 14:13:32'),
(8, 1, 'Wahahahaha', 'Carangian Tarlac City', 'CARANGIAN MAIN ROAD', 'Tarlac City', 'Tarlac', 1500.00, 'Commercial', 'A1', NULL, NULL, NULL, NULL, 'Elmer Gragasin', '09428975327', 'elmer@gmail.com', 'New Lead', '2025-10-21 13:56:12', '2025-10-27 14:13:32'),
(9, 1, 'hindi ko', 'F. Tanedo St. Poblacion', 'MAC ARTHUR HIGHWAY', 'Tarlac City', 'Tarlac', 16999023.00, 'Commercial', 'RR', 1, 1, 124, 130, 'arvin coronel', '09296735489', 'arvincalapuz@gmail.com', 'Negotiation', '2025-10-23 10:25:12', '2025-10-27 14:13:32'),
(10, 1, 'Spacious residential property with modern amenities', 'San Nicolas, Tarlac City', 'AIRPORT ROAD', 'Tarlac City', 'Tarlac', 2500000.00, 'Residential', 'A1', 3, 2, 120, 200, 'Maria Santos', '09171234567', 'maria.santos@email.com', 'New Lead', '2025-10-23 13:40:10', '2025-10-27 14:13:32'),
(11, 1, 'Commercial building suitable for retail business', 'Maligaya, Tarlac City', 'ZAMORA STREET', 'Tarlac City', 'Tarlac', 5000000.00, 'Commercial', 'CR', NULL, 3, 250, 300, 'Juan Dela Cruz', '09181234567', 'juan.delacruz@email.com', 'On Progress', '2025-10-23 13:40:10', '2025-10-27 14:13:32'),
(12, 1, 'Agricultural land with irrigation system', 'Salapungan, Tarlac City', 'MC ARTHUR HIGHWAY', 'Tarlac City', 'Tarlac', 3500000.00, 'Agricultural', 'AGRI', NULL, NULL, NULL, 5000, 'Pedro Reyes', '09191234567', 'pedro.reyes@email.com', 'Signing Contract', '2025-10-23 13:40:10', '2025-10-27 14:13:32'),
(13, 1, 'Vacant lot ready for development', 'Binauganan, Tarlac City', 'BINAUGANAN ROAD', 'Tarlac City', 'Tarlac', 1800000.00, 'Vacant lot', 'A2', NULL, NULL, NULL, 150, 'Ana Garcia', '09201234567', 'ana.garcia@email.com', 'Proposal', '2025-10-23 13:40:10', '2025-10-27 14:13:32'),
(14, 1, 'Industrial warehouse with loading dock', 'Matatalaib, Tarlac City', 'SUBDIVISION ROADS', 'Tarlac City', 'Tarlac', 8000000.00, 'Industrial', 'I', NULL, 2, 500, 800, 'Roberto Cruz', '09211234567', 'roberto.cruz@email.com', 'Proposal', '2025-10-23 13:40:10', '2025-10-27 14:13:32'),
(15, 1, 'Modern house with garage and garden', 'Central, Tarlac City', 'ROMULO BOULEVARD', 'Tarlac City', 'Tarlac', 3200000.00, 'Residential', 'A15', 4, 3, 150, 250, 'Carmen Lopez', '09221234567', 'carmen.lopez@email.com', 'Follow Up', '2025-10-23 13:40:10', '2025-10-27 14:13:32'),
(16, 1, 'Commercial space along main highway', 'Dolores, Tarlac City', 'MAC ARTHUR HIGHWAY', 'Tarlac City', 'Tarlac', 4500000.00, 'Commercial', 'CR', NULL, 2, 180, 220, 'Jose Ramos', '09231234567', 'jose.ramos@email.com', 'Follow Up', '2025-10-23 13:40:10', '2025-10-27 14:13:32'),
(17, 1, 'Residential property near schools', 'Lourdes, Tarlac City', 'LOURDES STREET', 'Tarlac City', 'Tarlac', 2800000.00, 'Residential', 'A17', 3, 2, 130, 180, 'Linda Martinez', '09241234567', 'linda.martinez@email.com', 'Not Interested', '2025-10-23 13:40:10', '2025-10-27 14:13:32'),
(18, 1, 'Agricultural farmland with fruit trees', 'Carangian, Tarlac City', 'SITIO PANINAAN', 'Tarlac City', 'Tarlac', 4200000.00, 'Agricultural', 'AGRI', NULL, NULL, NULL, 8000, 'Miguel Torres', '09251234567', 'miguel.torres@email.com', 'Closed Deal', '2025-10-23 13:40:10', '2025-10-27 14:13:32'),
(19, 1, 'Corner lot ideal for commercial use', 'Tibag, Tarlac City', 'MAIN ROAD', 'Tarlac City', 'Tarlac', 2200000.00, 'Vacant lot', 'A3', NULL, NULL, NULL, 200, 'Sofia Mendoza', '09261234567', 'sofia.mendoza@email.com', 'Negotiation', '2025-10-23 13:40:10', '2025-10-27 14:13:32'),
(20, 1, 'Residential house with swimming pool', 'Santo Domingo, Tarlac City', 'PROVINCIAL ROAD', 'Tarlac City', 'Tarlac', 4800000.00, 'Residential', 'A37', 5, 4, 250, 400, 'Ricardo Fernandez', '09271234567', 'ricardo.fernandez@email.com', 'Negotiation', '2025-10-23 13:40:10', '2025-10-27 14:13:32'),
(21, 1, 'Industrial property with office space', 'Balibago II, Tarlac City', 'MC ARTHUR HIGHWAY', 'Tarlac City', 'Tarlac', 6500000.00, 'Industrial', 'I', NULL, 2, 400, 600, 'Teresa Aquino', '09281234567', 'teresa.aquino@email.com', 'Proposal', '2025-10-23 13:40:10', '2025-10-27 14:13:32'),
(22, 1, 'Townhouse in residential subdivision', 'San Roque, Tarlac City', 'SAN ROQUE MAIN ROAD', 'Tarlac City', 'Tarlac', 1900000.00, 'Residential', 'A40', 2, 2, 80, 100, 'Antonio Villanueva', '09291234567', 'antonio.villanueva@email.com', 'Not Interested', '2025-10-23 13:40:10', '2025-10-27 14:13:32'),
(23, 1, 'Commercial lot near public market', 'Ligtasan, Tarlac City', 'LIGTASAN-HILARIO ST.', 'Tarlac City', 'Tarlac', 3800000.00, 'Commercial', 'CR', NULL, NULL, NULL, 280, 'Gloria Castillo', '09301234567', 'gloria.castillo@email.com', 'On Progress', '2025-10-23 13:40:10', '2025-10-27 14:13:32'),
(24, 1, 'Vacant agricultural land', 'San Sebastian, Tarlac City', 'PROVINCIAL ROAD', 'Tarlac City', 'Tarlac', 3000000.00, 'Agricultural', 'AGRI', NULL, NULL, NULL, 6000, 'Fernando Santiago', '09311234567', 'fernando.santiago@email.com', 'Negotiation', '2025-10-23 13:40:10', '2025-10-27 14:13:32'),
(25, 1, 'Single detached house with balcony', 'Balingcanaway, Tarlac City', 'MAIN ROAD', 'Tarlac City', 'Tarlac', 2600000.00, 'Residential', 'A41', 3, 2, 140, 220, 'Diana Pascual', '09321234567', 'diana.pascual@email.com', 'Follow Up', '2025-10-23 13:40:10', '2025-10-27 14:13:32'),
(26, 1, 'Warehouse facility with parking', 'Paraiso, Tarlac City', 'INDUSTRIAL ROAD', 'Tarlac City', 'Tarlac', 7200000.00, 'Industrial', 'I', NULL, 1, 450, 700, 'Benjamin Reyes', '09331234567', 'benjamin.reyes@email.com', 'Not Interested', '2025-10-23 13:40:10', '2025-10-27 14:13:32'),
(27, 1, 'Residential lot in quiet neighborhood', 'Santo Cristo, Tarlac City', 'GEN. LUNA STREET', 'Tarlac City', 'Tarlac', 1600000.00, 'Vacant lot', 'A50', NULL, NULL, NULL, 120, 'Patricia Diaz', '09341234567', 'patricia.diaz@email.com', 'Negotiation', '2025-10-23 13:40:10', '2025-10-27 14:13:32'),
(28, 1, 'Commercial building with parking area', 'Aguso, Tarlac City', 'MAIN ROAD', 'Tarlac City', 'Tarlac', 5500000.00, 'Commercial', 'CR', NULL, 3, 280, 350, 'Eduardo Santos', '09351234567', 'eduardo.santos@email.com', 'Closed Deal', '2025-10-23 13:40:10', '2025-10-27 14:13:32'),
(29, 1, 'Family home with spacious backyard', 'Maliwalo, Tarlac City', 'RESIDENTIAL AREA', 'Tarlac City', 'Tarlac', 2900000.00, 'Residential', 'A6', 4, 3, 160, 280, 'Isabel Morales', '09361234567', 'isabel.morales@email.com', 'Closed Deal', '2025-10-23 13:40:10', '2025-10-27 14:13:32'),
(30, 1, 'Agricultural rice field with water access', 'Culipat, Tarlac City', 'MC ARTHUR HIGHWAY', 'Tarlac City', 'Tarlac', 4000000.00, 'Agricultural', 'AGRI', NULL, NULL, NULL, 7500, 'Carlos Valdez', '09371234567', 'carlos.valdez@email.com', 'On Progress', '2025-10-23 13:40:10', '2025-10-27 14:13:32'),
(31, 1, 'Prime vacant lot for commercial development', 'Tariji, Tarlac City', 'MAIN ROAD', 'Tarlac City', 'Tarlac', 2400000.00, 'Vacant lot', 'RR', NULL, NULL, NULL, 180, 'Rosario Cruz', '09381234567', 'rosario.cruz@email.com', 'Signing Contract', '2025-10-23 13:40:10', '2025-10-27 14:13:32'),
(32, 1, 'Industrial complex with multiple units', 'Mapalacsiao, Tarlac City', 'INDUSTRIAL ZONE', 'Tarlac City', 'Tarlac', 9500000.00, 'Industrial', 'I', NULL, 3, 600, 1000, 'Manuel Gonzales', '09391234567', 'manuel.gonzales@email.com', 'Signing Contract', '2025-10-23 13:40:10', '2025-10-27 14:13:32'),
(33, 1, 'Cozy bungalow with carport', 'Matadero, Tarlac City', 'RESIDENTIAL AREA', 'Tarlac City', 'Tarlac', 2100000.00, 'Residential', 'A1', 2, 1, 90, 150, 'Elena Velasco', '09401234567', 'elena.velasco@email.com', 'Negotiation', '2025-10-23 13:40:10', '2025-10-27 14:13:32'),
(34, 1, 'Commercial space with high foot traffic', 'Armenia, Tarlac City', 'COMMERCIAL DISTRICT', 'Tarlac City', 'Tarlac', 4200000.00, 'Commercial', 'CR', NULL, 2, 200, 250, 'Rodrigo Manalo', '09411234567', 'rodrigo.manalo@email.com', 'Proposal', '2025-10-23 13:40:10', '2025-10-27 14:13:32'),
(35, 1, 'wa', 'Balibago', 'MAIN ROAD', 'Tarlac City', 'Tarlac', 1000000.00, 'Residential', 'RR', 2, 21, 100, 200, 'Elmer Steves', '09428975327', 'elmer@gmail.com', 'Proposal', '2025-10-25 14:34:53', '2025-10-27 14:13:32'),
(36, 1, 'Residential property near schools', 'Aguso', 'AGRICULTURAL AREAS', 'Tarlac City', 'Tarlac', 2800000.00, 'Agricultural', 'A17', 3, 2, 130, 180, 'Linda Martinez', '09241234567', 'linda.martinez@email.com', 'Proposal', '2025-10-26 15:50:50', '2025-10-27 14:13:32');

-- --------------------------------------------------------

--
-- Table structure for table `properties_street_backup`
--

CREATE TABLE `properties_street_backup` (
  `id` int(11) NOT NULL DEFAULT 0,
  `barangay` varchar(100) DEFAULT NULL COMMENT 'Barangay name',
  `street` varchar(255) DEFAULT NULL COMMENT 'Street name',
  `property_type` varchar(100) NOT NULL,
  `class` varchar(10) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `properties_street_backup`
--

INSERT INTO `properties_street_backup` (`id`, `barangay`, `street`, `property_type`, `class`, `updated_at`) VALUES
(2, 'Balibago', 'Main Road', 'Vacant lot', 'I', '2025-10-26 09:39:42'),
(3, 'F. Tanedo St. Poblacion', 'Main Road', 'Agricultural', 'I', '2025-10-26 09:39:42'),
(4, 'Balibago', 'Main Road', 'Commercial', 'I', '2025-10-26 09:39:42'),
(5, 'wagayway', 'Main Road', 'Industrial', 'I', '2025-10-26 09:39:42'),
(6, 'palang', 'Main Road', 'Industrial', 'I', '2025-10-26 09:39:42'),
(7, 'Matatalaib', 'Main Road', 'Industrial', 'I', '2025-10-26 09:39:42'),
(8, 'Carangian Tarlac City', 'Main Road', 'Commercial', 'A1', '2025-10-26 09:39:42'),
(9, 'F. Tanedo St. Poblacion', 'Main Road', 'Commercial', 'RR', '2025-10-26 09:39:42'),
(10, 'San Nicolas, Tarlac City', 'Main Road', 'Residential', 'A1', '2025-10-26 15:43:13'),
(11, 'Maligaya, Tarlac City', 'Main Road', 'Commercial', 'CR', '2025-10-26 11:58:45'),
(12, 'Salapungan, Tarlac City', 'Main Road', 'Agricultural', 'AGRI', '2025-10-26 16:47:46'),
(13, 'Binauganan, Tarlac City', 'Main Road', 'Vacant lot', 'A2', '2025-10-26 15:43:58'),
(14, 'Matatalaib, Tarlac City', 'Main Road', 'Industrial', 'I', '2025-10-26 15:44:01'),
(15, 'Central, Tarlac City', 'Main Road', 'Residential', 'A15', '2025-10-26 15:44:06'),
(16, 'Dolores, Tarlac City', 'Main Road', 'Commercial', 'CR', '2025-10-26 15:44:09'),
(17, 'Lourdes, Tarlac City', 'Main Road', 'Residential', 'A17', '2025-10-26 15:44:12'),
(18, 'Carangian, Tarlac City', 'Main Road', 'Agricultural', 'AGRI', '2025-10-26 15:44:15'),
(19, 'Tibag, Tarlac City', 'Main Road', 'Vacant lot', 'A3', '2025-10-26 15:44:20'),
(20, 'Santo Domingo, Tarlac City', 'Main Road', 'Residential', 'A37', '2025-10-26 15:44:23'),
(21, 'Balibago II, Tarlac City', 'Main Road', 'Industrial', 'I', '2025-10-26 15:44:26'),
(22, 'San Roque, Tarlac City', 'Main Road', 'Residential', 'A40', '2025-10-26 15:44:30'),
(23, 'Ligtasan, Tarlac City', 'Main Road', 'Commercial', 'CR', '2025-10-26 15:44:33'),
(24, 'San Sebastian, Tarlac City', 'Main Road', 'Agricultural', 'AGRI', '2025-10-26 15:44:37'),
(25, 'Balingcanaway, Tarlac City', 'Main Road', 'Residential', 'A41', '2025-10-26 15:44:40'),
(26, 'Paraiso, Tarlac City', 'Main Road', 'Industrial', 'I', '2025-10-26 15:44:51'),
(27, 'Santo Cristo, Tarlac City', 'Main Road', 'Vacant lot', 'A50', '2025-10-26 15:44:54'),
(28, 'Aguso, Tarlac City', 'Main Road', 'Commercial', 'CR', '2025-10-26 15:45:02'),
(29, 'Maliwalo, Tarlac City', 'Main Road', 'Residential', 'A6', '2025-10-26 15:45:06'),
(30, 'Culipat, Tarlac City', 'Main Road', 'Agricultural', 'AGRI', '2025-10-26 15:45:13'),
(31, 'Tariji, Tarlac City', 'Main Road', 'Vacant lot', 'RR', '2025-10-26 15:45:21'),
(32, 'Mapalacsiao, Tarlac City', 'Main Road', 'Industrial', 'I', '2025-10-26 15:45:26'),
(33, 'Matadero, Tarlac City', 'Main Road', 'Residential', 'A1', '2025-10-26 09:39:42'),
(34, 'Armenia, Tarlac City', 'Main Road', 'Commercial', 'CR', '2025-10-26 15:45:17'),
(35, 'Balibago', 'Main Road', 'Residential', 'RR', '2025-10-26 15:43:16'),
(36, 'Aguso', 'Agricultural Lands', 'Agricultural', 'A17', '2025-10-26 18:44:15');

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `property_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `task_type` enum('todo','call','email') NOT NULL,
  `status` enum('Upcoming','On Progress','Not Started','Completed') DEFAULT 'Not Started',
  `priority` enum('High','Medium','Low') DEFAULT 'Medium',
  `assigned_to` varchar(100) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `due_time` time DEFAULT NULL,
  `queue_number` int(11) DEFAULT 1,
  `notes` text DEFAULT NULL,
  `is_completed` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `user_id`, `property_id`, `title`, `task_type`, `status`, `priority`, `assigned_to`, `due_date`, `due_time`, `queue_number`, `notes`, `is_completed`, `created_at`, `updated_at`) VALUES
(1, 2, NULL, 'Follow up call', 'todo', 'Not Started', 'High', 'John', '2025-04-15', '08:00:00', 1, 'Important meeting', 1, '2025-09-21 14:24:06', '2025-09-22 16:07:12'),
(2, 2, NULL, 'Send email', 'todo', 'On Progress', 'High', 'Jane', '2025-04-15', '08:00:00', 1, 'Follow up email', 1, '2025-09-21 14:33:04', '2025-09-22 16:06:26'),
(3, 1, NULL, 'Client meeting', 'todo', 'Upcoming', 'High', 'Arvin', '2025-09-11', '23:02:00', 1, NULL, 1, '2025-09-21 15:01:01', '2025-10-03 07:32:54'),
(4, 1, NULL, 'Call client', 'call', NULL, NULL, 'Kenneth', NULL, NULL, 1, NULL, 1, '2025-09-21 15:14:30', '2025-10-26 16:40:33'),
(5, 1, NULL, 'Property viewing', 'todo', 'Upcoming', 'High', 'Angelo', '2025-09-18', '15:18:00', 2, 'Show property', 1, '2025-09-21 15:18:29', '2025-10-08 12:32:52'),
(8, 1, NULL, 'meet', 'todo', 'Upcoming', 'Medium', 'arvin', '2025-10-06', '20:37:00', 1, NULL, 0, '2025-10-08 12:34:21', '2025-10-08 12:34:21'),
(9, 1, 6, 'meet', 'todo', 'On Progress', 'Medium', 'arvin', '2025-10-16', '20:56:00', 1, NULL, 1, '2025-10-08 12:55:29', '2025-10-25 15:03:00'),
(10, 1, NULL, 'hi arvin', 'todo', 'Upcoming', 'Medium', 'arvin', '2025-10-01', '16:22:00', 2, '1000', 0, '2025-10-26 06:20:31', '2025-10-26 06:20:31'),
(11, 1, 35, 'gg', 'call', NULL, NULL, 'arvin', '2025-09-30', '19:59:00', 1, NULL, 0, '2025-10-26 11:57:23', '2025-10-26 11:57:23'),
(12, 1, 35, 'pogi ako', 'todo', 'Upcoming', 'Medium', 'elmer', '2025-10-02', '01:29:00', 2, 'hindi kaya', 1, '2025-10-26 17:26:54', '2025-11-02 02:07:37'),
(13, 1, NULL, 'asfaga', 'todo', 'Not Started', 'Low', 'vin', '2025-10-29', '00:07:00', 2, 'gagd', 0, '2025-11-02 02:07:29', '2025-11-02 02:07:29'),
(14, 1, NULL, 'me and me', 'todo', 'On Progress', 'Medium', 'vin', '2025-11-11', '14:40:00', 1, NULL, 0, '2025-11-02 06:39:05', '2025-11-02 06:39:05'),
(16, 1, 48, '911', 'todo', 'Upcoming', 'Medium', 'vin', '2025-11-26', '18:47:00', 1, 'aaa', 0, '2025-11-05 10:42:22', '2025-11-05 10:42:22');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `theme_preference` varchar(10) DEFAULT 'light',
  `task_reminders` tinyint(1) DEFAULT 1,
  `password_hash` varchar(255) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `contact_number` varchar(20) DEFAULT NULL,
  `user_type` enum('admin','agent','client') DEFAULT 'client',
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `gender` varchar(20) DEFAULT 'Not specified' COMMENT 'User gender preference',
  `language` varchar(50) DEFAULT 'English - United States' COMMENT 'User preferred language'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `theme_preference`, `task_reminders`, `password_hash`, `first_name`, `last_name`, `contact_number`, `user_type`, `is_active`, `created_at`, `updated_at`, `gender`, `language`) VALUES
(1, 'arvincalapuz@gmail.com', 'light', 1, '$2y$10$jFAEWznvkNi7fGp4.mJ66O07Rp3QJnC1QOm.D.QwQLLmVOJh8ite.', 'Arvin', 'Coronel', '09468539156', 'client', 1, '2025-09-17 10:44:17', '2025-11-05 11:23:30', 'Male', 'Korean'),
(2, 'angelo.vert.valencia@gmail.com', 'light', 1, '$2y$10$F6ywQaoK5hqCFJjRi8rTouEP414snagmY5hb965dLweAjorMS30yC', 'nill', 'Valencio', '09387984497', 'client', 1, '2025-09-17 12:23:38', '2025-09-24 07:39:20', 'Not specified', 'English - United States'),
(3, 'regutaro@gmail.com', 'light', 1, '$2y$10$5i2snc7Tj4tldD1vIqa64OyRKQWXuN25z6YxiUBIg7aqJ.TIdzwpa', 'regu', 'taro', '09098029269', 'client', 1, '2025-09-22 17:16:33', '2025-09-22 17:16:33', 'Not specified', 'English - United States'),
(4, 'mermer@gmail.com', 'light', 1, '$2y$10$nyZHZFux1qNSmYdFLWxMTe7v5i0gRLToAfMZhCtJDH9tWbA0TMhGi', 'Elmerson', 'Sta. Cruz', 'passme23', 'client', 1, '2025-10-21 14:11:53', '2025-10-21 14:11:53', 'Not specified', 'English - United States'),
(5, 'nill@gmail.com', 'light', 1, '$2y$10$XHaAQifJl6StG.T2ke/li.8L3RAO7pSSKO/xtsWBXVpPgvwnQ44eu', 'nill', 'Facun', '09669157612', 'client', 1, '2025-11-02 10:09:50', '2025-11-02 10:09:50', 'Not specified', 'English - United States'),
(6, 'mermermer@gmail.com', 'light', 1, '$2y$10$8Je4HDRn2XTDvju/uUKYS./gyLTMo.bpG4/VmEDFY7rzHG1XFzA5W', 'elmer', 'dizon', '09090929269', 'client', 1, '2025-11-04 14:10:24', '2025-11-04 14:10:24', 'Not specified', 'English - United States');

-- --------------------------------------------------------

--
-- Table structure for table `zonal_value`
--

CREATE TABLE `zonal_value` (
  `id` int(11) NOT NULL,
  `barangay` varchar(100) NOT NULL,
  `street` varchar(100) NOT NULL,
  `vicinity` varchar(100) NOT NULL,
  `property_type` varchar(100) NOT NULL,
  `class` varchar(10) NOT NULL,
  `price_2025` decimal(12,2) NOT NULL DEFAULT 0.00,
  `price_2024` decimal(12,2) NOT NULL DEFAULT 0.00,
  `price_2023` decimal(12,2) NOT NULL DEFAULT 0.00,
  `price_2022` decimal(12,2) NOT NULL DEFAULT 0.00,
  `price_2021` decimal(12,2) NOT NULL DEFAULT 0.00,
  `price_2020` decimal(12,2) NOT NULL DEFAULT 0.00,
  `data_source` varchar(50) DEFAULT 'BIR',
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `zonal_value`
--

INSERT INTO `zonal_value` (`id`, `barangay`, `street`, `vicinity`, `property_type`, `class`, `price_2025`, `price_2024`, `price_2023`, `price_2022`, `price_2021`, `price_2020`, `data_source`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'POBLACION', 'F. TANEDO ST.', 'BURGOS ST-PANGANIBAN ST', 'COMMERCIAL', 'CR', 24677.50, 23024.11, 21527.54, 19869.92, 18896.29, 18745.12, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(2, 'POBLACION', 'C. SANTOS ST.', 'TARLAC DIKE - M.H DEL PILAR ST.', 'COMMERCIAL', 'CR', 17875.00, 16677.38, 15593.35, 14392.66, 13687.42, 13577.92, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(3, 'POBLACION', 'C. SANTOS ST.', 'DEL PILAR ST-STO. CRISTO CHAPEL', 'RESIDENTIAL', 'RR', 9025.00, 8420.33, 7873.00, 7266.78, 6910.71, 6855.42, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(4, 'POBLACION', 'ANCHETA ST.', 'TARLAC DIKE - M.H DEL PILAR ST.', 'COMMERCIAL', 'CR', 18725.00, 17470.43, 16334.85, 15077.06, 14338.29, 14223.58, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(5, 'POBLACION', 'RIZAL ST.', 'BURGOS-PANGANIBAN ST.', 'COMMERCIAL', 'CR', 18725.00, 17470.43, 16334.85, 15077.06, 14338.29, 14223.58, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(6, 'POBLACION', 'RIZAL ST.', 'RIZAL EXT-PANGANIBAN NORTHWARD', 'RESIDENTIAL', 'RR', 8190.00, 7641.27, 7144.59, 6594.45, 6271.33, 6221.16, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(7, 'POBLACION', 'JUAN LUNA ST.', 'TANEDO DIKE - DEL PILAR ST.', 'COMMERCIAL', 'CR', 17912.50, 16712.36, 15626.06, 14422.85, 13716.13, 13606.40, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(8, 'POBLACION', 'JUAN LUNA ST.', 'None', 'RESIDENTIAL', 'RR', 8150.00, 7603.95, 7109.69, 6562.25, 6240.70, 6190.77, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(9, 'POBLACION', 'PANGANIBAN ST.', 'TARLAC DIKE - DEL PILAR', 'COMMERCIAL', 'CR', 16912.50, 15779.36, 14753.70, 13617.67, 12950.40, 12846.80, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(10, 'POBLACION', 'PANGANIBAN ST.', 'None', 'RESIDENTIAL', 'RR', 7589.00, 7080.54, 6620.30, 6110.54, 5811.12, 5764.63, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(11, 'POBLACION', 'DEL PILAR ST.', 'ZAMORA ST. -PANGANIBAN ST.', 'COMMERCIAL', 'CR', 15737.50, 14683.09, 13728.69, 12671.58, 12050.67, 11954.27, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(12, 'POBLACION', 'DEL PILAR ST.', 'None', 'RESIDENTIAL', 'RR', 7589.00, 7080.54, 6620.30, 6110.54, 5811.12, 5764.63, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(13, 'POBLACION', 'BESAMAIN ST.', 'None', 'COMMERCIAL', 'CR', 13950.00, 13015.35, 12169.35, 11232.31, 10681.93, 10596.47, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(14, 'POBLACION', 'BESAMAIN ST.', 'None', 'RESIDENTIAL', 'RR', 5678.00, 5297.57, 4953.23, 4571.83, 4347.81, 4313.03, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(15, 'POBLACION', 'MAC ARTHUR HIGHWAY', 'SEPUNG CALSADA - SOGO HOTEL', 'COMMERCIAL', 'CR', 19475.00, 18170.18, 16989.11, 15680.95, 14912.59, 14793.28, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(16, 'POBLACION', 'MAC ARTHUR HIGHWAY', 'None', 'RESIDENTIAL', 'RR', 7890.00, 7361.37, 6882.88, 6352.90, 6041.61, 5993.27, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(17, 'POBLACION', 'HILARIO ST.', 'RIZAL ST-DEL PILAR ST', 'COMMERCIAL', 'CR', 19025.00, 17750.33, 16596.55, 15318.62, 14568.01, 14451.46, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(18, 'POBLACION', 'LIGTASAN-HILARIO ST.', 'LIGTASAN-MC ARTHUR H-WAY', 'COMMERCIAL', 'CR', 14950.00, 13948.35, 13041.71, 12037.50, 11447.66, 11356.08, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(19, 'POBLACION', 'HILARIO ST.', 'None', 'RESIDENTIAL', 'RR', 9000.00, 8397.00, 7851.20, 7246.65, 6891.57, 6836.43, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(20, 'POBLACION', 'ESPINOSA ST.', 'MABINI ST. - DEL PILAR ST.', 'COMMERCIAL', 'CR', 19175.00, 17890.28, 16727.41, 15439.40, 14682.87, 14565.40, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(21, 'POBLACION', 'ESPINOSA ST.', 'None', 'RESIDENTIAL', 'RR', 7150.00, 6670.95, 6237.34, 5757.06, 5474.97, 5431.17, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(22, 'POBLACION', 'GUEVARRA ST.', 'None', 'RESIDENTIAL', 'RR', 6828.00, 6370.52, 5956.44, 5497.79, 5228.40, 5186.57, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(23, 'POBLACION', 'GUEVARRA ST.', 'None', 'COMMERCIAL', 'CR', 12950.00, 12082.35, 11297.00, 10427.13, 9916.20, 9836.87, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(24, 'POBLACION', 'CUT-CUT 1ST.', 'ZAMORA ST. - BURGOS ST.', 'COMMERCIAL', 'CR', 11320.00, 10561.56, 9875.06, 9114.68, 8668.06, 8598.72, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(25, 'POBLACION', 'CUT-CUT 1ST.', 'SIDE STREETS', 'RESIDENTIAL', 'RR', 5245.00, 4893.59, 4575.50, 4223.19, 4016.25, 3984.12, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(26, 'POBLACION', 'ZAMORA ST.', 'ROMULO BLVD.-MC ARTHUR HIGHWAY', 'COMMERCIAL', 'CR', 11320.00, 10561.56, 9875.06, 9114.68, 8668.06, 8598.72, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(27, 'POBLACION', 'ROMULO BLVD', 'ZAMORA ST-JUNCT NR MACABULOS MONUMENT', 'COMMERCIAL', 'CR', 12500.00, 11662.50, 10904.44, 10064.80, 9571.62, 9495.05, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(28, 'AGUSO', 'ALL LOTS', 'ALONG THE ROAD', 'COMMERCIAL', 'CR', 3390.00, 3162.87, 2957.28, 2729.57, 2595.82, 2575.06, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(29, 'AGUSO', 'MAIN ROAD', 'None', 'RESIDENTIAL', 'RR', 1470.00, 1371.51, 1282.36, 1183.62, 1125.62, 1116.62, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(30, 'AGUSO', 'ALL LOTS', 'INTERIOR', 'RESIDENTIAL', 'RR', 788.00, 735.20, 687.42, 634.48, 603.39, 598.57, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(31, 'AGUSO', 'ALL LOTS', 'None', 'AGRICULTURE', 'A1', 82.00, 76.51, 71.53, 66.03, 62.79, 62.29, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(32, 'AGUSO', 'ALL LOTS', 'None', 'AGRICULTURE', 'A2', 56.00, 52.25, 48.85, 45.09, 42.88, 42.54, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(33, 'AGUSO', 'ALL LOTS', 'None', 'AGRICULTURE', 'A3', 37.00, 34.52, 32.28, 29.79, 28.33, 28.11, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(34, 'AGUSO', 'ALL LOTS', 'None', 'AGRICULTURE', 'A6', 37.00, 34.52, 32.28, 29.79, 28.33, 28.11, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(35, 'AGUSO', 'ALL LOTS', 'None', 'AGRICULTURE', 'A15', 35.00, 32.66, 30.53, 28.18, 26.80, 26.59, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(36, 'AGUSO', 'ALL LOTS', 'None', 'AGRICULTURE', 'A17', 50.00, 46.65, 43.62, 40.26, 38.29, 37.98, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(37, 'AGUSO', 'ALL LOTS', 'None', 'AGRICULTURE', 'A37', 36.00, 33.59, 31.40, 28.99, 27.57, 27.35, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(38, 'AGUSO', 'ALL LOTS', 'None', 'AGRICULTURE', 'A41', 34.00, 31.72, 29.66, 27.38, 26.03, 25.83, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(39, 'AGUSO', 'ALL LOTS', 'AGRO-LIVESTOCK/POULTRY/PIGGERY', 'AGRICULTURE', 'A50', 275.00, 256.58, 239.90, 221.43, 210.58, 208.89, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(40, 'AGUSO', 'DUNGAN SUBD', 'None', 'RESIDENTIAL', 'RR', 2375.00, 2215.88, 2071.84, 1912.31, 1818.61, 1804.06, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(41, 'AGUSO', 'LEOCADIO SALVADOR SUBD', 'None', 'RESIDENTIAL', 'RR', 2375.00, 2215.88, 2071.84, 1912.31, 1818.61, 1804.06, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(42, 'AGUSO', 'LUZON VILLE', 'None', 'RESIDENTIAL', 'RR', 2355.00, 2197.22, 2054.40, 1896.21, 1803.29, 1788.87, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(43, 'ALVINDIA', 'ALL LOTS', 'None', 'RESIDENTIAL', 'RR', 657.00, 612.98, 573.14, 529.01, 503.08, 499.06, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(44, 'ALVINDIA', 'ALL LOTS', 'None', 'AGRICULTURE', 'A1', 83.00, 77.44, 72.41, 66.83, 63.56, 63.05, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(45, 'ALVINDIA', 'ALL LOTS', 'None', 'AGRICULTURE', 'A2', 56.00, 52.25, 48.85, 45.09, 42.88, 42.54, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(46, 'ALVINDIA', 'ALL LOTS', 'None', 'AGRICULTURE', 'A3', 37.00, 34.52, 32.28, 29.79, 28.33, 28.11, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(47, 'ALVINDIA', 'ALL LOTS', 'None', 'AGRICULTURE', 'A6', 50.00, 46.65, 43.62, 40.26, 38.29, 37.98, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(48, 'ALVINDIA', 'ALL LOTS', 'None', 'AGRICULTURE', 'A15', 33.00, 30.79, 28.79, 26.57, 25.27, 25.07, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(49, 'ALVINDIA', 'ALL LOTS', 'None', 'AGRICULTURE', 'A17', 49.00, 45.72, 42.75, 39.45, 37.52, 37.22, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(50, 'ALVINDIA', 'ALL LOTS', 'None', 'AGRICULTURE', 'A37', 48.00, 44.78, 41.87, 38.65, 36.76, 36.46, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(51, 'ALVINDIA', 'ALL LOTS', 'None', 'AGRICULTURE', 'A41', 34.00, 31.72, 29.66, 27.38, 26.03, 25.83, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(52, 'ALVINDIA', 'ALL LOTS', 'AGRO-LIVESTOCK/POULTRY/PIGGERY', 'AGRICULTURE', 'A50', 275.00, 256.58, 239.90, 221.43, 210.58, 208.89, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(53, 'AMUCAO', 'ALL LOTS', 'None', 'COMMERCIAL', 'CR', 1500.00, 1399.50, 1308.53, 1207.78, 1148.59, 1139.41, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(54, 'AMUCAO', 'ALL LOTS', 'None', 'RESIDENTIAL', 'RR', 665.00, 620.45, 580.12, 535.45, 509.21, 505.14, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(55, 'AMUCAO', 'ALL LOTS', 'None', 'AGRICULTURE', 'A1', 82.00, 76.51, 71.53, 66.03, 62.79, 62.29, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(56, 'AMUCAO', 'ALL LOTS', 'None', 'AGRICULTURE', 'A2', 53.00, 49.45, 46.23, 42.67, 40.58, 40.26, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(57, 'AMUCAO', 'ALL LOTS', 'None', 'AGRICULTURE', 'A3', 34.00, 31.72, 29.66, 27.38, 26.03, 25.83, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(58, 'AMUCAO', 'ALL LOTS', 'None', 'AGRICULTURE', 'A6', 54.00, 50.38, 47.11, 43.48, 41.35, 41.02, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(59, 'AMUCAO', 'ALL LOTS', 'None', 'AGRICULTURE', 'A15', 35.00, 32.66, 30.53, 28.18, 26.80, 26.59, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(60, 'AMUCAO', 'ALL LOTS', 'None', 'AGRICULTURE', 'A17', 49.00, 45.72, 42.75, 39.45, 37.52, 37.22, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(61, 'AMUCAO', 'ALL LOTS', 'None', 'AGRICULTURE', 'A37', 51.00, 47.58, 44.49, 41.06, 39.05, 38.74, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(62, 'AMUCAO', 'ALL LOTS', 'None', 'AGRICULTURE', 'A41', 34.00, 31.72, 29.66, 27.38, 26.03, 25.83, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(63, 'AMUCAO', 'ALL LOTS', 'AGRO-LIVESTOCK/POULTRY/PIGGERY', 'AGRICULTURE', 'A50', 275.00, 256.58, 239.90, 221.43, 210.58, 208.89, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(64, 'ARMENIA', 'ALL LOTS', 'None', 'RESIDENTIAL', 'RR', 608.00, 567.26, 530.39, 489.55, 465.56, 461.84, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(65, 'ARMENIA', 'ALL LOTS', 'None', 'AGRICULTURE', 'A1', 82.00, 76.51, 71.53, 66.03, 62.79, 62.29, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(66, 'ARMENIA', 'ALL LOTS', 'None', 'AGRICULTURE', 'A2', 55.00, 51.32, 47.98, 44.29, 42.12, 41.78, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(67, 'ARMENIA', 'ALL LOTS', 'None', 'AGRICULTURE', 'A3', 34.00, 31.72, 29.66, 27.38, 26.03, 25.83, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(68, 'ARMENIA', 'ALL LOTS', 'None', 'AGRICULTURE', 'A6', 49.00, 45.72, 42.75, 39.45, 37.52, 37.22, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(69, 'ARMENIA', 'ALL LOTS', 'None', 'AGRICULTURE', 'A15', 33.00, 30.79, 28.79, 26.57, 25.27, 25.07, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(70, 'ARMENIA', 'ALL LOTS', 'None', 'AGRICULTURE', 'A17', 49.00, 45.72, 42.75, 39.45, 37.52, 37.22, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(71, 'ARMENIA', 'ALL LOTS', 'None', 'AGRICULTURE', 'A37', 51.00, 47.58, 44.49, 41.06, 39.05, 38.74, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(72, 'ARMENIA', 'ALL LOTS', 'None', 'AGRICULTURE', 'A41', 34.00, 31.72, 29.66, 27.38, 26.03, 25.83, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(73, 'ARMENIA', 'ALL LOTS', 'AGRO-LIVESTOCK/POULTRY/PIGGERY', 'AGRICULTURE', 'A50', 225.00, 209.93, 196.28, 181.17, 172.29, 170.91, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(74, 'ARMENIA', 'VICTOR PASCUAL', 'None', 'RESIDENTIAL', 'RR', 2070.00, 1931.31, 1805.77, 1666.73, 1585.06, 1572.38, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(75, 'ASTURIAS', 'ALL LOTS', 'None', 'RESIDENTIAL', 'RR', 588.00, 548.60, 512.94, 473.45, 450.25, 446.65, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(76, 'ASTURIAS', 'ALL LOTS', 'None', 'AGRICULTURE', 'A1', 74.00, 69.04, 64.55, 59.58, 56.66, 56.21, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(77, 'ASTURIAS', 'ALL LOTS', 'None', 'AGRICULTURE', 'A2', 50.00, 46.65, 43.62, 40.26, 38.29, 37.98, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(78, 'ASTURIAS', 'ALL LOTS', 'None', 'AGRICULTURE', 'A3', 35.00, 32.66, 30.53, 28.18, 26.80, 26.59, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(79, 'ASTURIAS', 'ALL LOTS', 'None', 'AGRICULTURE', 'A6', 50.00, 46.65, 43.62, 40.26, 38.29, 37.98, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(80, 'ASTURIAS', 'ALL LOTS', 'None', 'AGRICULTURE', 'A15', 34.00, 31.72, 29.66, 27.38, 26.03, 25.83, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(81, 'ASTURIAS', 'ALL LOTS', 'None', 'AGRICULTURE', 'A17', 49.00, 45.72, 42.75, 39.45, 37.52, 37.22, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(82, 'ASTURIAS', 'ALL LOTS', 'None', 'AGRICULTURE', 'A37', 67.00, 62.51, 58.45, 53.95, 51.30, 50.89, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(83, 'ASTURIAS', 'ALL LOTS', 'None', 'AGRICULTURE', 'A41', 34.00, 31.72, 29.66, 27.38, 26.03, 25.83, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(84, 'ASTURIAS', 'ALL LOTS', 'AGRO-LIVESTOCK/POULTRY/PIGGERY', 'AGRICULTURE', 'A50', 225.00, 209.93, 196.28, 181.17, 172.29, 170.91, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(85, 'ATIOC', 'ALL LOTS', 'None', 'RESIDENTIAL', 'RR', 573.00, 534.61, 499.86, 461.37, 438.76, 435.25, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(86, 'ATIOC', 'ALL LOTS', 'None', 'AGRICULTURE', 'A1', 74.00, 69.04, 64.55, 59.58, 56.66, 56.21, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(87, 'ATIOC', 'ALL LOTS', 'None', 'AGRICULTURE', 'A2', 51.00, 47.58, 44.49, 41.06, 39.05, 38.74, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(88, 'ATIOC', 'ALL LOTS', 'None', 'AGRICULTURE', 'A3', 35.00, 32.66, 30.53, 28.18, 26.80, 26.59, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(89, 'ATIOC', 'ALL LOTS', 'None', 'AGRICULTURE', 'A6', 50.00, 46.65, 43.62, 40.26, 38.29, 37.98, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(90, 'ATIOC', 'ALL LOTS', 'None', 'AGRICULTURE', 'A15', 34.00, 31.72, 29.66, 27.38, 26.03, 25.83, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(91, 'ATIOC', 'ALL LOTS', 'None', 'AGRICULTURE', 'A17', 50.00, 46.65, 43.62, 40.26, 38.29, 37.98, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(92, 'ATIOC', 'ALL LOTS', 'None', 'AGRICULTURE', 'A37', 36.00, 33.59, 31.40, 28.99, 27.57, 27.35, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(93, 'ATIOC', 'ALL LOTS', 'None', 'AGRICULTURE', 'A41', 34.00, 31.72, 29.66, 27.38, 26.03, 25.83, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(94, 'ATIOC', 'ALL LOTS', 'AGRO-LIVESTOCK/POULTRY/PIGGERY', 'AGRICULTURE', 'A50', 200.00, 186.60, 174.47, 161.04, 153.15, 151.92, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(95, 'BALANTI', 'ALL LOTS', 'None', 'RESIDENTIAL', 'RR', 380.00, 354.54, 331.49, 305.97, 290.98, 288.65, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(96, 'BALANTI', 'ALL LOTS', 'None', 'AGRICULTURE', 'A1', 71.00, 66.24, 61.94, 57.17, 54.37, 53.93, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(97, 'BALANTI', 'ALL LOTS', 'None', 'AGRICULTURE', 'A2', 49.00, 45.72, 42.75, 39.45, 37.52, 37.22, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(98, 'BALANTI', 'ALL LOTS', 'None', 'AGRICULTURE', 'A3', 35.00, 32.66, 30.53, 28.18, 26.80, 26.59, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(99, 'BALANTI', 'ALL LOTS', 'None', 'AGRICULTURE', 'A6', 51.00, 47.58, 44.49, 41.06, 39.05, 38.74, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(100, 'BALANTI', 'ALL LOTS', 'None', 'AGRICULTURE', 'A15', 34.00, 31.72, 29.66, 27.38, 26.03, 25.83, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(101, 'BALANTI', 'ALL LOTS', 'None', 'AGRICULTURE', 'A17', 35.00, 32.66, 30.53, 28.18, 26.80, 26.59, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(102, 'BALANTI', 'ALL LOTS', 'None', 'AGRICULTURE', 'A37', 48.00, 44.78, 41.87, 38.65, 36.76, 36.46, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(103, 'BALANTI', 'ALL LOTS', 'None', 'AGRICULTURE', 'A41', 33.00, 30.79, 28.79, 26.57, 25.27, 25.07, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(104, 'BALANTI', 'ALL LOTS', 'AGRO-LIVESTOCK/POULTRY/PIGGERY', 'AGRICULTURE', 'A50', 175.00, 163.28, 152.66, 140.91, 134.00, 132.93, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(105, 'BALETE', 'ALL LOTS', 'None', 'RESIDENTIAL', 'RR', 708.00, 660.56, 617.63, 570.07, 542.14, 537.80, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(106, 'BALETE', 'ALL LOTS', 'None', 'AGRICULTURE', 'A1', 74.00, 69.04, 64.55, 59.58, 56.66, 56.21, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(107, 'BALETE', 'ALL LOTS', 'None', 'AGRICULTURE', 'A2', 51.00, 47.58, 44.49, 41.06, 39.05, 38.74, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(108, 'BALETE', 'ALL LOTS', 'None', 'AGRICULTURE', 'A3', 35.00, 32.66, 30.53, 28.18, 26.80, 26.59, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(109, 'BALETE', 'ALL LOTS', 'None', 'AGRICULTURE', 'A6', 50.00, 46.65, 43.62, 40.26, 38.29, 37.98, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(110, 'BALETE', 'ALL LOTS', 'None', 'AGRICULTURE', 'A15', 34.00, 31.72, 29.66, 27.38, 26.03, 25.83, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(111, 'BALETE', 'ALL LOTS', 'None', 'AGRICULTURE', 'A17', 52.00, 48.52, 45.36, 41.87, 39.82, 39.50, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(112, 'BALETE', 'ALL LOTS', 'None', 'AGRICULTURE', 'A37', 50.00, 46.65, 43.62, 40.26, 38.29, 37.98, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(113, 'BALETE', 'ALL LOTS', 'None', 'AGRICULTURE', 'A41', 33.00, 30.79, 28.79, 26.57, 25.27, 25.07, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(114, 'BALETE', 'ALL LOTS', 'AGRO-LIVESTOCK/POULTRY/PIGGERY', 'AGRICULTURE', 'A50', 225.00, 209.93, 196.28, 181.17, 172.29, 170.91, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(115, 'BALETE', 'ALL LOTS', 'Within LIP 1', 'INDUSTRIAL', 'I', 2500.00, 2332.50, 2180.89, 2012.96, 1914.32, 1899.01, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(116, 'BALETE', 'ALL LOTS', 'Within LIP 2', 'INDUSTRIAL', 'I', 1250.00, 1166.25, 1090.44, 1006.48, 957.16, 949.50, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(117, 'BALETE', 'TARLAC DEV. CORP', 'None', 'RESIDENTIAL', 'RR', 1650.00, 1539.45, 1439.39, 1328.55, 1263.45, 1253.35, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(118, 'BALIBAGO 1ST', 'MAIN ROAD', 'FRONTAL', 'RESIDENTIAL', 'RR', 1183.00, 1103.74, 1032.00, 952.53, 905.86, 898.61, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(119, 'BALIBAGO 1ST', 'ALL LOTS', 'INTERIOR', 'RESIDENTIAL', 'RR', 778.00, 725.87, 678.69, 626.43, 595.74, 590.97, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(120, 'BALIBAGO 1ST', 'ALL LOTS', 'None', 'AGRICULTURE', 'A1', 82.00, 76.51, 71.53, 66.03, 62.79, 62.29, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(121, 'BALIBAGO 1ST', 'ALL LOTS', 'None', 'AGRICULTURE', 'A2', 55.00, 51.32, 47.98, 44.29, 42.12, 41.78, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(122, 'BALIBAGO 1ST', 'ALL LOTS', 'None', 'AGRICULTURE', 'A3', 35.00, 32.66, 30.53, 28.18, 26.80, 26.59, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(123, 'BALIBAGO 1ST', 'ALL LOTS', 'None', 'AGRICULTURE', 'A6', 60.00, 55.98, 52.34, 48.31, 45.94, 45.58, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(124, 'BALIBAGO 1ST', 'ALL LOTS', 'None', 'AGRICULTURE', 'A15', 34.00, 31.72, 29.66, 27.38, 26.03, 25.83, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(125, 'BALIBAGO 1ST', 'ALL LOTS', 'None', 'AGRICULTURE', 'A17', 53.00, 49.45, 46.23, 42.67, 40.58, 40.26, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(126, 'BALIBAGO 1ST', 'ALL LOTS', 'None', 'AGRICULTURE', 'A37', 38.00, 35.45, 33.15, 30.60, 29.10, 28.86, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(127, 'BALIBAGO 1ST', 'ALL LOTS', 'None', 'AGRICULTURE', 'A41', 32.00, 29.86, 27.92, 25.77, 24.50, 24.31, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(128, 'BALIBAGO 1ST', 'ALL LOTS', 'AGRO-LIVESTOCK/POULTRY/PIGGERY', 'AGRICULTURE', 'A50', 275.00, 256.58, 239.90, 221.43, 210.58, 208.89, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(129, 'BALIBAGO 2ND', 'ALL LOTS', 'FRONTAL', 'COMMERCIAL', 'CR', 1183.00, 1103.74, 1032.00, 952.53, 905.86, 898.61, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(130, 'BALIBAGO 2ND', 'ALL LOTS', 'INTERIOR', 'RESIDENTIAL', 'RR', 778.00, 725.87, 678.69, 626.43, 595.74, 590.97, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(131, 'BALIBAGO 2ND', 'ALL LOTS', 'None', 'AGRICULTURE', 'A1', 82.00, 76.51, 71.53, 66.03, 62.79, 62.29, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(132, 'BALIBAGO 2ND', 'ALL LOTS', 'None', 'AGRICULTURE', 'A2', 55.00, 51.32, 47.98, 44.29, 42.12, 41.78, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(133, 'BALIBAGO 2ND', 'ALL LOTS', 'None', 'AGRICULTURE', 'A3', 35.00, 32.66, 30.53, 28.18, 26.80, 26.59, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(134, 'BALIBAGO 2ND', 'ALL LOTS', 'None', 'AGRICULTURE', 'A6', 58.00, 54.11, 50.60, 46.70, 44.41, 44.06, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(135, 'BALIBAGO 2ND', 'ALL LOTS', 'None', 'AGRICULTURE', 'A15', 34.00, 31.72, 29.66, 27.38, 26.03, 25.83, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(136, 'BALIBAGO 2ND', 'ALL LOTS', 'None', 'AGRICULTURE', 'A17', 48.00, 44.78, 41.87, 38.65, 36.76, 36.46, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(137, 'BALIBAGO 2ND', 'ALL LOTS', 'None', 'AGRICULTURE', 'A37', 53.00, 49.45, 46.23, 42.67, 40.58, 40.26, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(138, 'BALIBAGO 2ND', 'ALL LOTS', 'None', 'AGRICULTURE', 'A41', 34.00, 31.72, 29.66, 27.38, 26.03, 25.83, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(139, 'BALIBAGO 2ND', 'ALL LOTS', 'AGRO-LIVESTOCK/POULTRY/PIGGERY', 'AGRICULTURE', 'A50', 275.00, 256.58, 239.90, 221.43, 210.58, 208.89, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(140, 'BALINGCANAWAY', 'ALL LOTS', 'PROVINCIAL ROAD', 'COMMERCIAL', 'CR', 1625.00, 1516.13, 1417.58, 1308.42, 1244.31, 1234.36, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(141, 'BALINGCANAWAY', 'ALL LOTS', 'None', 'RESIDENTIAL', 'RR', 1274.00, 1188.64, 1111.38, 1025.80, 975.54, 967.74, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(142, 'BALINGCANAWAY', 'ALL LOTS', 'None', 'AGRICULTURE', 'A1', 82.00, 76.51, 71.53, 66.03, 62.79, 62.29, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(143, 'BALINGCANAWAY', 'ALL LOTS', 'None', 'AGRICULTURE', 'A2', 56.00, 52.25, 48.85, 45.09, 42.88, 42.54, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(144, 'BALINGCANAWAY', 'ALL LOTS', 'None', 'AGRICULTURE', 'A3', 34.00, 31.72, 29.66, 27.38, 26.03, 25.83, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(145, 'BALINGCANAWAY', 'ALL LOTS', 'None', 'AGRICULTURE', 'A6', 52.00, 48.52, 45.36, 41.87, 39.82, 39.50, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(146, 'BALINGCANAWAY', 'ALL LOTS', 'None', 'AGRICULTURE', 'A15', 34.00, 31.72, 29.66, 27.38, 26.03, 25.83, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(147, 'BALINGCANAWAY', 'ALL LOTS', 'None', 'AGRICULTURE', 'A17', 52.00, 48.52, 45.36, 41.87, 39.82, 39.50, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(148, 'BALINGCANAWAY', 'ALL LOTS', 'None', 'AGRICULTURE', 'A37', 36.00, 33.59, 31.40, 28.99, 27.57, 27.35, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(149, 'BALINGCANAWAY', 'ALL LOTS', 'None', 'AGRICULTURE', 'A41', 34.00, 31.72, 29.66, 27.38, 26.03, 25.83, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(150, 'BALINGCANAWAY', 'ALL LOTS', 'AGRO-LIVESTOCK/POULTRY/PIGGERY', 'AGRICULTURE', 'A50', 275.00, 256.58, 239.90, 221.43, 210.58, 208.89, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(151, 'BANABA', 'ALL LOTS', 'None', 'RESIDENTIAL', 'RR', 443.00, 413.32, 386.45, 356.70, 339.22, 336.50, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(152, 'BANABA', 'ALL LOTS', 'None', 'AGRICULTURE', 'A1', 73.00, 68.11, 63.68, 58.78, 55.90, 55.45, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(153, 'BANABA', 'ALL LOTS', 'None', 'AGRICULTURE', 'A2', 51.00, 47.58, 44.49, 41.06, 39.05, 38.74, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(154, 'BANABA', 'ALL LOTS', 'None', 'AGRICULTURE', 'A3', 34.00, 31.72, 29.66, 27.38, 26.03, 25.83, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(155, 'BANABA', 'ALL LOTS', 'None', 'AGRICULTURE', 'A6', 51.00, 47.58, 44.49, 41.06, 39.05, 38.74, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(156, 'BANABA', 'ALL LOTS', 'None', 'AGRICULTURE', 'A15', 35.00, 32.66, 30.53, 28.18, 26.80, 26.59, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(157, 'BANABA', 'ALL LOTS', 'None', 'AGRICULTURE', 'A17', 51.00, 47.58, 44.49, 41.06, 39.05, 38.74, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(158, 'BANABA', 'ALL LOTS', 'None', 'AGRICULTURE', 'A37', 35.00, 32.66, 30.53, 28.18, 26.80, 26.59, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(159, 'BANABA', 'ALL LOTS', 'None', 'AGRICULTURE', 'A41', 34.00, 31.72, 29.66, 27.38, 26.03, 25.83, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(160, 'BANABA', 'ALL LOTS', 'AGRO-LIVESTOCK/POULTRY/PIGGERY', 'AGRICULTURE', 'A50', 140.00, 130.62, 122.13, 112.73, 107.20, 106.34, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(161, 'BANTOG', 'ALL LOTS', 'None', 'RESIDENTIAL', 'RR', 608.00, 567.26, 530.39, 489.55, 465.56, 461.84, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(162, 'BANTOG', 'ALL LOTS', 'None', 'AGRICULTURE', 'A1', 73.00, 68.11, 63.68, 58.78, 55.90, 55.45, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(163, 'BANTOG', 'ALL LOTS', 'None', 'AGRICULTURE', 'A2', 51.00, 47.58, 44.49, 41.06, 39.05, 38.74, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(164, 'BANTOG', 'ALL LOTS', 'None', 'AGRICULTURE', 'A3', 34.00, 31.72, 29.66, 27.38, 26.03, 25.83, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(165, 'BANTOG', 'ALL LOTS', 'None', 'AGRICULTURE', 'A6', 54.00, 50.38, 47.11, 43.48, 41.35, 41.02, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(166, 'BANTOG', 'ALL LOTS', 'None', 'AGRICULTURE', 'A15', 33.00, 30.79, 28.79, 26.57, 25.27, 25.07, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(167, 'BANTOG', 'ALL LOTS', 'None', 'AGRICULTURE', 'A17', 51.00, 47.58, 44.49, 41.06, 39.05, 38.74, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(168, 'BANTOG', 'ALL LOTS', 'None', 'AGRICULTURE', 'A37', 49.00, 45.72, 42.75, 39.45, 37.52, 37.22, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(169, 'BANTOG', 'ALL LOTS', 'None', 'AGRICULTURE', 'A41', 34.00, 31.72, 29.66, 27.38, 26.03, 25.83, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(170, 'BANTOG', 'ALL LOTS', 'AGRO-LIVESTOCK/POULTRY/PIGGERY', 'AGRICULTURE', 'A50', 225.00, 209.93, 196.28, 181.17, 172.29, 170.91, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(171, 'BARAS-BARAS', 'ALL LOTS', 'None', 'COMMERCIAL', 'CR', 3072.00, 2866.18, 2679.87, 2473.52, 2352.32, 2333.50, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(172, 'BARAS-BARAS', 'MAIN ROAD', 'FRONTAL', 'RESIDENTIAL', 'RR', 1557.00, 1452.68, 1358.26, 1253.67, 1192.24, 1182.70, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(173, 'BARAS-BARAS', 'ALL LOTS', 'INTERIOR', 'RESIDENTIAL', 'RR', 853.00, 795.85, 744.12, 686.82, 653.17, 647.94, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(174, 'BARAS-BARAS', 'ALL LOTS', 'None', 'AGRICULTURE', 'A1', 79.00, 73.71, 68.92, 63.61, 60.49, 60.01, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(175, 'BARAS-BARAS', 'ALL LOTS', 'None', 'AGRICULTURE', 'A2', 56.00, 52.25, 48.85, 45.09, 42.88, 42.54, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(176, 'BARAS-BARAS', 'ALL LOTS', 'None', 'AGRICULTURE', 'A3', 35.00, 32.66, 30.53, 28.18, 26.80, 26.59, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(177, 'BARAS-BARAS', 'ALL LOTS', 'None', 'AGRICULTURE', 'A6', 54.00, 50.38, 47.11, 43.48, 41.35, 41.02, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(178, 'BARAS-BARAS', 'ALL LOTS', 'None', 'AGRICULTURE', 'A15', 49.00, 45.72, 42.75, 39.45, 37.52, 37.22, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(179, 'BARAS-BARAS', 'ALL LOTS', 'None', 'AGRICULTURE', 'A17', 54.00, 50.38, 47.11, 43.48, 41.35, 41.02, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(180, 'BARAS-BARAS', 'ALL LOTS', 'None', 'AGRICULTURE', 'A37', 54.00, 50.38, 47.11, 43.48, 41.35, 41.02, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(181, 'BARAS-BARAS', 'ALL LOTS', 'None', 'AGRICULTURE', 'A41', 34.00, 31.72, 29.66, 27.38, 26.03, 25.83, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(182, 'BARAS-BARAS', 'ALL LOTS', 'AGRO-LIVESTOCK/POULTRY/PIGGERY', 'AGRICULTURE', 'A50', 275.00, 256.58, 239.90, 221.43, 210.58, 208.89, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(183, 'BARAS-BARAS', 'SUSAN SISON', 'SOCIALIZE/INTERIOR', 'RESIDENTIAL', 'RR', 1720.00, 1604.76, 1500.45, 1384.92, 1317.06, 1306.52, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(184, 'BARAS-BARAS', 'MONTEVERDE SUBD.', 'SOCIALIZE/INTERIOR', 'RESIDENTIAL', 'RR', 1300.00, 1212.90, 1134.06, 1046.74, 995.45, 987.48, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(185, 'BATANG-BATANG', 'ALL LOTS', 'None', 'RESIDENTIAL', 'RR', 458.00, 427.31, 399.54, 368.77, 350.70, 347.90, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(186, 'BATANG-BATANG', 'ALL LOTS', 'None', 'AGRICULTURE', 'A1', 71.00, 66.24, 61.94, 57.17, 54.37, 53.93, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(187, 'BATANG-BATANG', 'ALL LOTS', 'None', 'AGRICULTURE', 'A2', 51.00, 47.58, 44.49, 41.06, 39.05, 38.74, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(188, 'BATANG-BATANG', 'ALL LOTS', 'None', 'AGRICULTURE', 'A3', 34.00, 31.72, 29.66, 27.38, 26.03, 25.83, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(189, 'BATANG-BATANG', 'ALL LOTS', 'None', 'AGRICULTURE', 'A6', 54.00, 50.38, 47.11, 43.48, 41.35, 41.02, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(190, 'BATANG-BATANG', 'ALL LOTS', 'None', 'AGRICULTURE', 'A15', 49.00, 45.72, 42.75, 39.45, 37.52, 37.22, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(191, 'BATANG-BATANG', 'ALL LOTS', 'None', 'AGRICULTURE', 'A17', 51.00, 47.58, 44.49, 41.06, 39.05, 38.74, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(192, 'BATANG-BATANG', 'ALL LOTS', 'None', 'AGRICULTURE', 'A37', 48.00, 44.78, 41.87, 38.65, 36.76, 36.46, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(193, 'BATANG-BATANG', 'ALL LOTS', 'None', 'AGRICULTURE', 'A41', 35.00, 32.66, 30.53, 28.18, 26.80, 26.59, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(194, 'BATANG-BATANG', 'ALL LOTS', 'AGRO-LIVESTOCK/POULTRY/PIGGERY', 'AGRICULTURE', 'A50', 129.00, 120.36, 112.53, 103.87, 98.78, 97.99, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(195, 'BINAUGANAN', 'ALL LOTS', 'None', 'RESIDENTIAL', 'RR', 916.00, 854.63, 799.08, 737.55, 701.41, 695.80, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(196, 'BINAUGANAN', 'ALL LOTS', 'None', 'AGRICULTURE', 'A1', 77.00, 71.84, 67.17, 62.00, 58.96, 58.49, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(197, 'BINAUGANAN', 'ALL LOTS', 'None', 'AGRICULTURE', 'A2', 54.00, 50.38, 47.11, 43.48, 41.35, 41.02, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(198, 'BINAUGANAN', 'ALL LOTS', 'None', 'AGRICULTURE', 'A3', 37.00, 34.52, 32.28, 29.79, 28.33, 28.11, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(199, 'BINAUGANAN', 'ALL LOTS', 'None', 'AGRICULTURE', 'A6', 54.00, 50.38, 47.11, 43.48, 41.35, 41.02, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(200, 'BINAUGANAN', 'ALL LOTS', 'None', 'AGRICULTURE', 'A15', 34.00, 31.72, 29.66, 27.38, 26.03, 25.83, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(201, 'BINAUGANAN', 'ALL LOTS', 'None', 'AGRICULTURE', 'A17', 52.00, 48.52, 45.36, 41.87, 39.82, 39.50, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(202, 'BINAUGANAN', 'ALL LOTS', 'None', 'AGRICULTURE', 'A37', 38.00, 35.45, 33.15, 30.60, 29.10, 28.86, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(203, 'BINAUGANAN', 'ALL LOTS', 'None', 'AGRICULTURE', 'A41', 36.00, 33.59, 31.40, 28.99, 27.57, 27.35, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(204, 'BINAUGANAN', 'ALL LOTS', 'AGRO-LIVESTOCK/POULTRY/PIGGERY', 'AGRICULTURE', 'A50', 135.00, 125.96, 117.77, 108.70, 103.37, 102.55, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(205, 'BINAUGANAN', 'LAND HOMES DEVELOPER', 'SOCIALIZE/INTERIOR', 'RESIDENTIAL', 'RR', 2292.50, 2138.90, 1999.87, 1845.88, 1755.44, 1741.39, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(206, 'BINAUGANAN', 'NEW TARLAC REALTY', 'SOCIALIZE/INTERIOR', 'RESIDENTIAL', 'RR', 2315.00, 2159.90, 2019.50, 1864.00, 1772.66, 1758.48, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(207, 'BORA', 'ALL LOTS', 'None', 'RESIDENTIAL', 'RR', 666.00, 621.38, 580.99, 536.25, 509.98, 505.90, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(208, 'BORA', 'ALL LOTS', 'None', 'AGRICULTURE', 'A1', 73.00, 68.11, 63.68, 58.78, 55.90, 55.45, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(209, 'BORA', 'ALL LOTS', 'None', 'AGRICULTURE', 'A2', 52.00, 48.52, 45.36, 41.87, 39.82, 39.50, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(210, 'BORA', 'ALL LOTS', 'None', 'AGRICULTURE', 'A3', 35.00, 32.66, 30.53, 28.18, 26.80, 26.59, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(211, 'BORA', 'ALL LOTS', 'None', 'AGRICULTURE', 'A6', 56.00, 52.25, 48.85, 45.09, 42.88, 42.54, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(212, 'BORA', 'ALL LOTS', 'None', 'AGRICULTURE', 'A15', 34.00, 31.72, 29.66, 27.38, 26.03, 25.83, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(213, 'BORA', 'ALL LOTS', 'None', 'AGRICULTURE', 'A17', 50.00, 46.65, 43.62, 40.26, 38.29, 37.98, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(214, 'BORA', 'ALL LOTS', 'None', 'AGRICULTURE', 'A37', 49.00, 45.72, 42.75, 39.45, 37.52, 37.22, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(215, 'BORA', 'ALL LOTS', 'None', 'AGRICULTURE', 'A41', 34.00, 31.72, 29.66, 27.38, 26.03, 25.83, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(216, 'BORA', 'ALL LOTS', 'AGRO-LIVESTOCK/POULTRY/PIGGERY', 'AGRICULTURE', 'A50', 133.00, 124.09, 116.02, 107.09, 101.84, 101.03, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(217, 'BUENAVISTA', 'ALL LOTS', 'None', 'RESIDENTIAL', 'RR', 1095.00, 1021.64, 955.23, 881.68, 838.47, 831.77, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(218, 'BUENAVISTA', 'ALL LOTS', 'None', 'AGRICULTURE', 'A1', 76.00, 70.91, 66.30, 61.19, 58.20, 57.73, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(219, 'BUENAVISTA', 'ALL LOTS', 'None', 'AGRICULTURE', 'A2', 54.00, 50.38, 47.11, 43.48, 41.35, 41.02, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(220, 'BUENAVISTA', 'ALL LOTS', 'None', 'AGRICULTURE', 'A3', 36.00, 33.59, 31.40, 28.99, 27.57, 27.35, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(221, 'BUENAVISTA', 'ALL LOTS', 'None', 'AGRICULTURE', 'A6', 59.00, 55.05, 51.47, 47.51, 45.18, 44.82, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(222, 'BUENAVISTA', 'ALL LOTS', 'None', 'AGRICULTURE', 'A15', 33.00, 30.79, 28.79, 26.57, 25.27, 25.07, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(223, 'BUENAVISTA', 'ALL LOTS', 'None', 'AGRICULTURE', 'A17', 50.00, 46.65, 43.62, 40.26, 38.29, 37.98, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(224, 'BUENAVISTA', 'ALL LOTS', 'None', 'AGRICULTURE', 'A37', 35.00, 32.66, 30.53, 28.18, 26.80, 26.59, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(225, 'BUENAVISTA', 'ALL LOTS', 'None', 'AGRICULTURE', 'A41', 34.00, 31.72, 29.66, 27.38, 26.03, 25.83, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(226, 'BUENAVISTA', 'ALL LOTS', 'AGRO-LIVESTOCK/POULTRY/PIGGERY', 'AGRICULTURE', 'A50', 200.00, 186.60, 174.47, 161.04, 153.15, 151.92, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(227, 'BUHILIT (BUJILIT)', 'ALL LOTS', 'None', 'RESIDENTIAL', 'RR', 566.00, 528.08, 493.75, 455.73, 433.40, 429.94, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(228, 'BUHILIT (BUJILIT)', 'ALL LOTS', 'None', 'AGRICULTURE', 'A1', 75.00, 69.98, 65.43, 60.39, 57.43, 56.97, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(229, 'BUHILIT (BUJILIT)', 'ALL LOTS', 'None', 'AGRICULTURE', 'A2', 53.00, 49.45, 46.23, 42.67, 40.58, 40.26, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(230, 'BUHILIT (BUJILIT)', 'ALL LOTS', 'None', 'AGRICULTURE', 'A3', 36.00, 33.59, 31.40, 28.99, 27.57, 27.35, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(231, 'BUHILIT (BUJILIT)', 'ALL LOTS', 'None', 'AGRICULTURE', 'A6', 58.00, 54.11, 50.60, 46.70, 44.41, 44.06, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(232, 'BUHILIT (BUJILIT)', 'ALL LOTS', 'None', 'AGRICULTURE', 'A15', 34.00, 31.72, 29.66, 27.38, 26.03, 25.83, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(233, 'BUHILIT (BUJILIT)', 'ALL LOTS', 'None', 'AGRICULTURE', 'A17', 49.00, 45.72, 42.75, 39.45, 37.52, 37.22, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(234, 'BUHILIT (BUJILIT)', 'ALL LOTS', 'None', 'AGRICULTURE', 'A37', 49.00, 45.72, 42.75, 39.45, 37.52, 37.22, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(235, 'BUHILIT (BUJILIT)', 'ALL LOTS', 'None', 'AGRICULTURE', 'A41', 34.00, 31.72, 29.66, 27.38, 26.03, 25.83, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(236, 'BUHILIT (BUJILIT)', 'ALL LOTS', 'AGRO-LIVESTOCK/POULTRY/PIGGERY', 'AGRICULTURE', 'A50', 200.00, 186.60, 174.47, 161.04, 153.15, 151.92, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(237, 'BUHILIT (BUJILIT)', 'ROSEMONT COUNTRY HOMES', 'SOCIALIZE/INTERIOR', 'RESIDENTIAL', 'RR', 2250.00, 2099.25, 1962.80, 1811.66, 1722.89, 1709.11, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(238, 'BUROT', 'ALL LOTS', 'MC ARTHUR HIGHWAY', 'COMMERCIAL', 'CR', 6045.00, 5639.99, 5273.39, 4867.34, 4628.84, 4591.81, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(239, 'BUROT', 'MAIN ROAD', 'None', 'RESIDENTIAL', 'RR', 2500.00, 2332.50, 2180.89, 2012.96, 1914.32, 1899.01, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(240, 'BUROT', 'ALL LOTS', 'INTERIOR', 'RESIDENTIAL', 'RR', 1199.00, 1118.67, 1045.95, 965.42, 918.11, 910.76, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(241, 'BUROT', 'ALL LOTS', 'None', 'AGRICULTURE', 'A1', 77.00, 71.84, 67.17, 62.00, 58.96, 58.49, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(242, 'BUROT', 'ALL LOTS', 'None', 'AGRICULTURE', 'A2', 54.00, 50.38, 47.11, 43.48, 41.35, 41.02, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(243, 'BUROT', 'ALL LOTS', 'None', 'AGRICULTURE', 'A3', 36.00, 33.59, 31.40, 28.99, 27.57, 27.35, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(244, 'BUROT', 'ALL LOTS', 'None', 'AGRICULTURE', 'A6', 57.00, 53.18, 49.72, 45.90, 43.65, 43.30, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(245, 'BUROT', 'ALL LOTS', 'None', 'AGRICULTURE', 'A15', 33.00, 30.79, 28.79, 26.57, 25.27, 25.07, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(246, 'BUROT', 'ALL LOTS', 'None', 'AGRICULTURE', 'A17', 49.00, 45.72, 42.75, 39.45, 37.52, 37.22, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(247, 'BUROT', 'ALL LOTS', 'None', 'AGRICULTURE', 'A37', 49.00, 45.72, 42.75, 39.45, 37.52, 37.22, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(248, 'BUROT', 'ALL LOTS', 'None', 'AGRICULTURE', 'A41', 34.00, 31.72, 29.66, 27.38, 26.03, 25.83, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(249, 'BUROT', 'ALL LOTS', 'AGRO-LIVESTOCK/POULTRY/PIGGERY', 'AGRICULTURE', 'A50', 200.00, 186.60, 174.47, 161.04, 153.15, 151.92, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(250, 'BUROT', 'ALL LOTS', 'None', 'AGRICULTURE', 'A50', 34.00, 31.72, 29.66, 27.38, 26.03, 25.83, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(251, 'BUROT', 'TUSCANY SUBD.', 'None', 'COMMERCIAL', 'CR', 4615.00, 4305.80, 4025.92, 3715.92, 3533.84, 3505.57, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(252, 'BUROT', 'TUSCANY SUBD.', 'None', 'RESIDENTIAL', 'RR', 2739.00, 2555.49, 2389.38, 2205.40, 2097.33, 2080.55, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(253, 'CALINGCUAN', 'ALL LOTS', 'None', 'RESIDENTIAL', 'RR', 1291.00, 1204.50, 1126.21, 1039.49, 988.56, 980.65, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(254, 'CALINGCUAN', 'ALL LOTS', 'None', 'AGRICULTURE', 'A1', 75.00, 69.98, 65.43, 60.39, 57.43, 56.97, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(255, 'CALINGCUAN', 'ALL LOTS', 'None', 'AGRICULTURE', 'A2', 53.00, 49.45, 46.23, 42.67, 40.58, 40.26, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(256, 'CALINGCUAN', 'ALL LOTS', 'None', 'AGRICULTURE', 'A3', 36.00, 33.59, 31.40, 28.99, 27.57, 27.35, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(257, 'CALINGCUAN', 'ALL LOTS', 'None', 'AGRICULTURE', 'A6', 61.00, 56.91, 53.21, 49.12, 46.71, 46.34, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(258, 'CALINGCUAN', 'ALL LOTS', 'None', 'AGRICULTURE', 'A15', 35.00, 32.66, 30.53, 28.18, 26.80, 26.59, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(259, 'CALINGCUAN', 'ALL LOTS', 'None', 'AGRICULTURE', 'A17', 49.00, 45.72, 42.75, 39.45, 37.52, 37.22, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(260, 'CALINGCUAN', 'ALL LOTS', 'None', 'AGRICULTURE', 'A37', 51.00, 47.58, 44.49, 41.06, 39.05, 38.74, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(261, 'CALINGCUAN', 'ALL LOTS', 'None', 'AGRICULTURE', 'A41', 34.00, 31.72, 29.66, 27.38, 26.03, 25.83, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(262, 'CALINGCUAN', 'ALL LOTS', 'AGRO-LIVESTOCK/POULTRY/PIGGERY', 'AGRICULTURE', 'A50', 275.00, 256.58, 239.90, 221.43, 210.58, 208.89, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(263, 'CALINGCUAN', 'CALINGCUAN VILLAGE SUBD', 'None', 'RESIDENTIAL', 'RR', 1705.00, 1590.77, 1487.37, 1372.84, 1305.57, 1295.12, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(264, 'CAPEHAN', 'ALL LOTS', 'None', 'RESIDENTIAL', 'RR', 1183.00, 1103.74, 1032.00, 952.53, 905.86, 898.61, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(265, 'CAPEHAN', 'ALL LOTS', 'None', 'AGRICULTURE', 'A1', 75.00, 69.98, 65.43, 60.39, 57.43, 56.97, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(266, 'CAPEHAN', 'ALL LOTS', 'None', 'AGRICULTURE', 'A2', 48.00, 44.78, 41.87, 38.65, 36.76, 36.46, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(267, 'CAPEHAN', 'ALL LOTS', 'None', 'AGRICULTURE', 'A3', 64.00, 59.71, 55.83, 51.53, 49.01, 48.61, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(268, 'CAPEHAN', 'ALL LOTS', 'None', 'AGRICULTURE', 'A6', 50.00, 46.65, 43.62, 40.26, 38.29, 37.98, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(269, 'CAPEHAN', 'ALL LOTS', 'None', 'AGRICULTURE', 'A15', 33.00, 30.79, 28.79, 26.57, 25.27, 25.07, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(270, 'CAPEHAN', 'ALL LOTS', 'None', 'AGRICULTURE', 'A17', 52.00, 48.52, 45.36, 41.87, 39.82, 39.50, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(271, 'CAPEHAN', 'ALL LOTS', 'None', 'AGRICULTURE', 'A37', 50.00, 46.65, 43.62, 40.26, 38.29, 37.98, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(272, 'CAPEHAN', 'ALL LOTS', 'None', 'AGRICULTURE', 'A41', 34.00, 31.72, 29.66, 27.38, 26.03, 25.83, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(273, 'CAPEHAN', 'ALL LOTS', 'AGRO-LIVESTOCK/POULTRY/PIGGERY', 'AGRICULTURE', 'A50', 275.00, 256.58, 239.90, 221.43, 210.58, 208.89, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(274, 'CARANGIAN (CARANGINA)', 'ALL LOTS', 'None', 'COMMERCIAL', 'CR', 2500.00, 2332.50, 2180.89, 2012.96, 1914.32, 1899.01, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(275, 'CARANGIAN (CARANGINA)', 'ALL LOTS', 'None', 'RESIDENTIAL', 'RR', 1347.00, 1256.75, 1175.06, 1084.58, 1031.44, 1023.19, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(276, 'CARANGIAN (CARANGINA)', 'ALL LOTS', 'None', 'AGRICULTURE', 'A1', 79.00, 73.71, 68.92, 63.61, 60.49, 60.01, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(277, 'CARANGIAN (CARANGINA)', 'ALL LOTS', 'None', 'AGRICULTURE', 'A2', 56.00, 52.25, 48.85, 45.09, 42.88, 42.54, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(278, 'CARANGIAN (CARANGINA)', 'ALL LOTS', 'None', 'AGRICULTURE', 'A3', 37.00, 34.52, 32.28, 29.79, 28.33, 28.11, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(279, 'CARANGIAN (CARANGINA)', 'ALL LOTS', 'None', 'AGRICULTURE', 'A6', 55.00, 51.32, 47.98, 44.29, 42.12, 41.78, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(280, 'CARANGIAN (CARANGINA)', 'ALL LOTS', 'None', 'AGRICULTURE', 'A15', 35.00, 32.66, 30.53, 28.18, 26.80, 26.59, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(281, 'CARANGIAN (CARANGINA)', 'ALL LOTS', 'None', 'AGRICULTURE', 'A17', 51.00, 47.58, 44.49, 41.06, 39.05, 38.74, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(282, 'CARANGIAN (CARANGINA)', 'ALL LOTS', 'None', 'AGRICULTURE', 'A37', 49.00, 45.72, 42.75, 39.45, 37.52, 37.22, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(283, 'CARANGIAN (CARANGINA)', 'ALL LOTS', 'None', 'AGRICULTURE', 'A41', 34.00, 31.72, 29.66, 27.38, 26.03, 25.83, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(284, 'CARANGIAN (CARANGINA)', 'ALL LOTS', 'AGRO-LIVESTOCK/POULTRY/PIGGERY', 'AGRICULTURE', 'A50', 275.00, 256.58, 239.90, 221.43, 210.58, 208.89, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(285, 'CARANGIAN (CARANGINA)', 'COUNTRY HILLS SUBD', 'None', 'RESIDENTIAL', 'RR', 2980.00, 2780.34, 2599.62, 2399.45, 2281.87, 2263.62, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(286, 'CARANGIAN (CARANGINA)', 'HAPPY HILLS SUBDIVISION', 'None', 'RESIDENTIAL', 'RR', 3070.00, 2864.31, 2678.13, 2471.91, 2350.79, 2331.98, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(287, 'CARE', 'ALL LOTS', 'None', 'COMMERCIAL', 'CR', 2250.00, 2099.25, 1962.80, 1811.66, 1722.89, 1709.11, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(288, 'CARE', 'ALL LOTS', 'None', 'RESIDENTIAL', 'RR', 1198.00, 1117.73, 1045.08, 964.61, 917.34, 910.01, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(289, 'CARE', 'ALL LOTS', 'None', 'AGRICULTURE', 'A1', 76.00, 70.91, 66.30, 61.19, 58.20, 57.73, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(290, 'CARE', 'ALL LOTS', 'None', 'AGRICULTURE', 'A2', 53.00, 49.45, 46.23, 42.67, 40.58, 40.26, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(291, 'CARE', 'ALL LOTS', 'None', 'AGRICULTURE', 'A3', 36.00, 33.59, 31.40, 28.99, 27.57, 27.35, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(292, 'CARE', 'ALL LOTS', 'None', 'AGRICULTURE', 'A6', 64.00, 59.71, 55.83, 51.53, 49.01, 48.61, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(293, 'CARE', 'ALL LOTS', 'None', 'AGRICULTURE', 'A15', 35.00, 32.66, 30.53, 28.18, 26.80, 26.59, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(294, 'CARE', 'ALL LOTS', 'None', 'AGRICULTURE', 'A17', 48.00, 44.78, 41.87, 38.65, 36.76, 36.46, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(295, 'CARE', 'ALL LOTS', 'None', 'AGRICULTURE', 'A37', 36.00, 33.59, 31.40, 28.99, 27.57, 27.35, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(296, 'CARE', 'ALL LOTS', 'None', 'AGRICULTURE', 'A40', 2250.00, 2099.25, 1962.80, 1811.66, 1722.89, 1709.11, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(297, 'CARE', 'ALL LOTS', 'None', 'AGRICULTURE', 'A41', 34.00, 31.72, 29.66, 27.38, 26.03, 25.83, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(298, 'CARE', 'ALL LOTS', 'AGRO-LIVESTOCK/POULTRY/PIGGERY', 'AGRICULTURE', 'A50', 275.00, 256.58, 239.90, 221.43, 210.58, 208.89, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(299, 'CARE', 'HARTLAND SUBD.', 'None', 'RESIDENTIAL', 'RR', 1900.00, 1772.70, 1657.47, 1529.85, 1454.89, 1443.25, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(300, 'CARE', 'E.A ZARRAGA', 'None', 'RESIDENTIAL', 'RR', 1765.00, 1646.75, 1539.71, 1421.15, 1351.51, 1340.70, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(301, 'CARE', 'PAQUILLAO', 'None', 'RESIDENTIAL', 'RR', 1650.00, 1539.45, 1439.39, 1328.55, 1263.45, 1253.35, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30');
INSERT INTO `zonal_value` (`id`, `barangay`, `street`, `vicinity`, `property_type`, `class`, `price_2025`, `price_2024`, `price_2023`, `price_2022`, `price_2021`, `price_2020`, `data_source`, `is_active`, `created_at`, `updated_at`) VALUES
(302, 'CENTRAL', 'PAQUILLAO', 'None', 'INDUSTRIAL', 'I', 1850.00, 1726.05, 1613.86, 1489.59, 1416.60, 1405.27, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(303, 'CENTRAL', 'ALL LOTS', 'None', 'RESIDENTIAL', 'RR', 1645.00, 1534.79, 1435.02, 1324.53, 1259.63, 1249.55, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(304, 'CENTRAL', 'ALL LOTS', 'None', 'AGRICULTURE', 'A1', 78.00, 72.77, 68.04, 62.80, 59.73, 59.25, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(305, 'CENTRAL', 'ALL LOTS', 'None', 'AGRICULTURE', 'A2', 55.00, 51.32, 47.98, 44.29, 42.12, 41.78, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(306, 'CENTRAL', 'ALL LOTS', 'None', 'AGRICULTURE', 'A3', 35.00, 32.66, 30.53, 28.18, 26.80, 26.59, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(307, 'CENTRAL', 'ALL LOTS', 'None', 'AGRICULTURE', 'A6', 55.00, 51.32, 47.98, 44.29, 42.12, 41.78, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(308, 'CENTRAL', 'ALL LOTS', 'None', 'AGRICULTURE', 'A15', 37.00, 34.52, 32.28, 29.79, 28.33, 28.11, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(309, 'CENTRAL', 'ALL LOTS', 'None', 'AGRICULTURE', 'A17', 50.00, 46.65, 43.62, 40.26, 38.29, 37.98, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(310, 'CENTRAL', 'ALL LOTS', 'None', 'AGRICULTURE', 'A37', 52.00, 48.52, 45.36, 41.87, 39.82, 39.50, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(311, 'CENTRAL', 'ALL LOTS', 'None', 'AGRICULTURE', 'A41', 34.00, 31.72, 29.66, 27.38, 26.03, 25.83, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(312, 'CENTRAL', 'ALL LOTS', 'AGRO-LIVESTOCK/POULTRY/PIGGERY', 'AGRICULTURE', 'A50', 275.00, 256.58, 239.90, 221.43, 210.58, 208.89, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(313, 'CULIPAT', 'ALL LOTS', 'None', 'RESIDENTIAL', 'RR', 702.00, 654.97, 612.39, 565.24, 537.54, 533.24, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(314, 'CULIPAT', 'ALL LOTS', 'None', 'AGRICULTURE', 'A1', 78.00, 72.77, 68.04, 62.80, 59.73, 59.25, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(315, 'CULIPAT', 'ALL LOTS', 'None', 'AGRICULTURE', 'A2', 55.00, 51.32, 47.98, 44.29, 42.12, 41.78, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(316, 'CULIPAT', 'ALL LOTS', 'None', 'AGRICULTURE', 'A3', 38.00, 35.45, 33.15, 30.60, 29.10, 28.86, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(317, 'CULIPAT', 'ALL LOTS', 'None', 'AGRICULTURE', 'A6', 56.00, 52.25, 48.85, 45.09, 42.88, 42.54, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(318, 'CULIPAT', 'ALL LOTS', 'None', 'AGRICULTURE', 'A15', 35.00, 32.66, 30.53, 28.18, 26.80, 26.59, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(319, 'CULIPAT', 'ALL LOTS', 'None', 'AGRICULTURE', 'A17', 50.00, 46.65, 43.62, 40.26, 38.29, 37.98, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(320, 'CULIPAT', 'ALL LOTS', 'None', 'AGRICULTURE', 'A37', 37.00, 34.52, 32.28, 29.79, 28.33, 28.11, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(321, 'CULIPAT', 'ALL LOTS', 'None', 'AGRICULTURE', 'A41', 34.00, 31.72, 29.66, 27.38, 26.03, 25.83, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(322, 'CULIPAT', 'ALL LOTS', 'AGRO-LIVESTOCK/POULTRY/PIGGERY', 'AGRICULTURE', 'A50', 275.00, 256.58, 239.90, 221.43, 210.58, 208.89, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(323, 'CULIPAT', 'SALEM ESTATE ISLE OF PATMOS', 'None', 'RESIDENTIAL', 'RR', 2237.50, 2087.59, 1951.89, 1801.60, 1713.32, 1699.61, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(324, 'CUT-CUT 1ST', 'ALL LOTS', 'None', 'COMMERCIAL', 'CR', 10475.00, 9773.18, 9137.92, 8434.30, 8021.02, 7956.85, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(325, 'CUT-CUT 1ST', 'ALL LOTS', 'None', 'RESIDENTIAL', 'RR', 5080.00, 4739.64, 4431.56, 4090.33, 3889.91, 3858.79, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(326, 'CUT-CUT 2ND', 'ALL LOTS', 'None', 'RESIDENTIAL', 'RR', 698.00, 651.23, 608.90, 562.02, 534.48, 530.20, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(327, 'CUT-CUT 2ND', 'ALL LOTS', 'None', 'AGRICULTURE', 'A1', 78.00, 72.77, 68.04, 62.80, 59.73, 59.25, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(328, 'CUT-CUT 2ND', 'ALL LOTS', 'None', 'AGRICULTURE', 'A2', 55.00, 51.32, 47.98, 44.29, 42.12, 41.78, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(329, 'CUT-CUT 2ND', 'ALL LOTS', 'None', 'AGRICULTURE', 'A3', 34.00, 31.72, 29.66, 27.38, 26.03, 25.83, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(330, 'CUT-CUT 2ND', 'ALL LOTS', 'None', 'AGRICULTURE', 'A6', 58.00, 54.11, 50.60, 46.70, 44.41, 44.06, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(331, 'CUT-CUT 2ND', 'ALL LOTS', 'None', 'AGRICULTURE', 'A15', 33.00, 30.79, 28.79, 26.57, 25.27, 25.07, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(332, 'CUT-CUT 2ND', 'ALL LOTS', 'None', 'AGRICULTURE', 'A17', 49.00, 45.72, 42.75, 39.45, 37.52, 37.22, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(333, 'CUT-CUT 2ND', 'ALL LOTS', 'None', 'AGRICULTURE', 'A37', 37.00, 34.52, 32.28, 29.79, 28.33, 28.11, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(334, 'CUT-CUT 2ND', 'ALL LOTS', 'None', 'AGRICULTURE', 'A41', 34.00, 31.72, 29.66, 27.38, 26.03, 25.83, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(335, 'CUT-CUT 2ND', 'ALL LOTS', 'AGRO-LIVESTOCK/POULTRY/PIGGERY', 'AGRICULTURE', 'A50', 225.00, 209.93, 196.28, 181.17, 172.29, 170.91, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(336, 'CUT-CUT 2ND', 'ALTO PROJEKT ASIA INC', 'None', 'RESIDENTIAL', 'RR', 2365.00, 2206.55, 2063.12, 1904.26, 1810.95, 1796.46, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(337, 'CUT-CUT 2ND', 'FAMILY PARK HOMES', 'None', 'RESIDENTIAL', 'RR', 2375.00, 2215.88, 2071.84, 1912.31, 1818.61, 1804.06, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(338, 'CUT-CUT 2ND', 'DON PEPE SUBD', 'None', 'RESIDENTIAL', 'RR', 2375.00, 2215.88, 2071.84, 1912.31, 1818.61, 1804.06, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(339, 'DALAYAP', 'ALL LOTS', 'None', 'COMMERCIAL', 'CR', 3500.00, 3265.50, 3053.24, 2818.14, 2680.05, 2658.61, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(340, 'DALAYAP', 'ALL LOTS', 'None', 'RESIDENTIAL', 'RR', 811.00, 756.66, 707.48, 653.00, 621.01, 616.04, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(341, 'DALAYAP', 'ALL LOTS', 'None', 'AGRICULTURE', 'A1', 78.00, 72.77, 68.04, 62.80, 59.73, 59.25, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(342, 'DALAYAP', 'ALL LOTS', 'None', 'AGRICULTURE', 'A2', 56.00, 52.25, 48.85, 45.09, 42.88, 42.54, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(343, 'DALAYAP', 'ALL LOTS', 'None', 'AGRICULTURE', 'A3', 35.00, 32.66, 30.53, 28.18, 26.80, 26.59, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(344, 'DALAYAP', 'ALL LOTS', 'None', 'AGRICULTURE', 'A6', 59.00, 55.05, 51.47, 47.51, 45.18, 44.82, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(345, 'DALAYAP', 'ALL LOTS', 'None', 'AGRICULTURE', 'A15', 34.00, 31.72, 29.66, 27.38, 26.03, 25.83, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(346, 'DALAYAP', 'ALL LOTS', 'None', 'AGRICULTURE', 'A17', 51.00, 47.58, 44.49, 41.06, 39.05, 38.74, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(347, 'DALAYAP', 'ALL LOTS', 'None', 'AGRICULTURE', 'A37', 37.00, 34.52, 32.28, 29.79, 28.33, 28.11, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(348, 'DALAYAP', 'ALL LOTS', 'None', 'AGRICULTURE', 'A41', 34.00, 31.72, 29.66, 27.38, 26.03, 25.83, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(349, 'DALAYAP', 'ALL LOTS', 'AGRO-LIVESTOCK/POULTRY/PIGGERY', 'AGRICULTURE', 'A50', 275.00, 256.58, 239.90, 221.43, 210.58, 208.89, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(350, 'DELA PAZ', 'ALL LOTS', 'None', 'RESIDENTIAL', 'RR', 708.00, 660.56, 617.63, 570.07, 542.14, 537.80, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(351, 'DELA PAZ', 'ALL LOTS', 'None', 'AGRICULTURE', 'A1', 75.00, 69.98, 65.43, 60.39, 57.43, 56.97, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(352, 'DELA PAZ', 'ALL LOTS', 'None', 'AGRICULTURE', 'A2', 53.00, 49.45, 46.23, 42.67, 40.58, 40.26, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(353, 'DELA PAZ', 'ALL LOTS', 'None', 'AGRICULTURE', 'A3', 35.00, 32.66, 30.53, 28.18, 26.80, 26.59, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(354, 'DELA PAZ', 'ALL LOTS', 'None', 'AGRICULTURE', 'A6', 58.00, 54.11, 50.60, 46.70, 44.41, 44.06, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(355, 'DELA PAZ', 'ALL LOTS', 'None', 'AGRICULTURE', 'A15', 34.00, 31.72, 29.66, 27.38, 26.03, 25.83, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(356, 'DELA PAZ', 'ALL LOTS', 'None', 'AGRICULTURE', 'A17', 52.00, 48.52, 45.36, 41.87, 39.82, 39.50, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(357, 'DELA PAZ', 'ALL LOTS', 'None', 'AGRICULTURE', 'A37', 51.00, 47.58, 44.49, 41.06, 39.05, 38.74, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(358, 'DELA PAZ', 'ALL LOTS', 'None', 'AGRICULTURE', 'A41', 34.00, 31.72, 29.66, 27.38, 26.03, 25.83, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(359, 'DELA PAZ', 'ALL LOTS', 'AGRO-LIVESTOCK/POULTRY/PIGGERY', 'AGRICULTURE', 'A50', 275.00, 256.58, 239.90, 221.43, 210.58, 208.89, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(360, 'DELA PAZ', 'VILLA DELA PAZ SUBD', 'None', 'RESIDENTIAL', 'RR', 2160.00, 2015.28, 1884.29, 1739.20, 1653.98, 1640.74, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(361, 'DOLORES', 'ALL LOTS', 'ALONG PROVINCIAL ROAD', 'COMMERCIAL', 'CR', 2500.00, 2332.50, 2180.89, 2012.96, 1914.32, 1899.01, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(362, 'DOLORES', 'ALL LOTS', 'FRONTAL', 'RESIDENTIAL', 'RR', 657.50, 613.45, 573.57, 529.41, 503.47, 499.44, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(363, 'DOLORES', 'ALL LOTS', 'None', 'AGRICULTURE', 'A1', 71.00, 66.24, 61.94, 57.17, 54.37, 53.93, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(364, 'DOLORES', 'ALL LOTS', 'None', 'AGRICULTURE', 'A2', 51.00, 47.58, 44.49, 41.06, 39.05, 38.74, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(365, 'DOLORES', 'ALL LOTS', 'None', 'AGRICULTURE', 'A3', 34.00, 31.72, 29.66, 27.38, 26.03, 25.83, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(366, 'DOLORES', 'ALL LOTS', 'None', 'AGRICULTURE', 'A6', 54.00, 50.38, 47.11, 43.48, 41.35, 41.02, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(367, 'DOLORES', 'ALL LOTS', 'None', 'AGRICULTURE', 'A15', 33.00, 30.79, 28.79, 26.57, 25.27, 25.07, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(368, 'DOLORES', 'ALL LOTS', 'None', 'AGRICULTURE', 'A17', 49.00, 45.72, 42.75, 39.45, 37.52, 37.22, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(369, 'DOLORES', 'ALL LOTS', 'None', 'AGRICULTURE', 'A37', 48.00, 44.78, 41.87, 38.65, 36.76, 36.46, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(370, 'DOLORES', 'ALL LOTS', 'None', 'AGRICULTURE', 'A41', 34.00, 31.72, 29.66, 27.38, 26.03, 25.83, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(371, 'DOLORES', 'ALL LOTS', 'AGRO-LIVESTOCK/POULTRY/PIGGERY', 'AGRICULTURE', 'A50', 275.00, 256.58, 239.90, 221.43, 210.58, 208.89, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(372, 'LAOANG', 'ALL LOTS', 'None', 'RESIDENTIAL', 'RR', 447.00, 417.05, 389.94, 359.92, 342.28, 339.54, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(373, 'LAOANG', 'ALL LOTS', 'None', 'AGRICULTURE', 'A1', 71.00, 66.24, 61.94, 57.17, 54.37, 53.93, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(374, 'LAOANG', 'ALL LOTS', 'None', 'AGRICULTURE', 'A2', 51.00, 47.58, 44.49, 41.06, 39.05, 38.74, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(375, 'LAOANG', 'ALL LOTS', 'None', 'AGRICULTURE', 'A3', 34.00, 31.72, 29.66, 27.38, 26.03, 25.83, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(376, 'LAOANG', 'ALL LOTS', 'None', 'AGRICULTURE', 'A6', 57.00, 53.18, 49.72, 45.90, 43.65, 43.30, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(377, 'LAOANG', 'ALL LOTS', 'None', 'AGRICULTURE', 'A15', 33.00, 30.79, 28.79, 26.57, 25.27, 25.07, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(378, 'LAOANG', 'ALL LOTS', 'None', 'AGRICULTURE', 'A17', 49.00, 45.72, 42.75, 39.45, 37.52, 37.22, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(379, 'LAOANG', 'ALL LOTS', 'None', 'AGRICULTURE', 'A37', 49.00, 45.72, 42.75, 39.45, 37.52, 37.22, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(380, 'LAOANG', 'ALL LOTS', 'None', 'AGRICULTURE', 'A41', 34.00, 31.72, 29.66, 27.38, 26.03, 25.83, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(381, 'LAOANG', 'ALL LOTS', 'AGRO-LIVESTOCK/POULTRY/PIGGERY', 'AGRICULTURE', 'A50', 200.00, 186.60, 174.47, 161.04, 153.15, 151.92, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(382, 'LIGTASAN', 'ALL LOTS', 'None', 'RESIDENTIAL', 'RR', 3735.00, 3484.76, 3258.25, 3007.36, 2860.00, 2837.12, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(383, 'LIGTASAN', 'GOMEZ SUBD', 'None', 'RESIDENTIAL', 'RR', 3735.00, 3484.76, 3258.25, 3007.36, 2860.00, 2837.12, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(384, 'LIGTASAN', 'LAZATIN SUBD', 'None', 'RESIDENTIAL', 'RR', 2935.00, 2738.36, 2560.36, 2363.21, 2247.42, 2229.44, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(385, 'LOURDES', 'ALL LOTS', 'None', 'RESIDENTIAL', 'RR', 967.00, 902.21, 843.57, 778.61, 740.46, 734.54, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(386, 'LOURDES', 'ALL LOTS', 'None', 'AGRICULTURE', 'A1', 67.00, 62.51, 58.45, 53.95, 51.30, 50.89, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(387, 'LOURDES', 'ALL LOTS', 'None', 'AGRICULTURE', 'A2', 49.00, 45.72, 42.75, 39.45, 37.52, 37.22, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(388, 'LOURDES', 'ALL LOTS', 'None', 'AGRICULTURE', 'A3', 31.00, 28.92, 27.04, 24.96, 23.74, 23.55, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(389, 'LOURDES', 'ALL LOTS', 'None', 'AGRICULTURE', 'A6', 63.00, 58.78, 54.96, 50.73, 48.24, 47.86, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(390, 'LOURDES', 'ALL LOTS', 'None', 'AGRICULTURE', 'A15', 31.00, 28.92, 27.04, 24.96, 23.74, 23.55, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(391, 'LOURDES', 'ALL LOTS', 'None', 'AGRICULTURE', 'A17', 48.00, 44.78, 41.87, 38.65, 36.76, 36.46, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(392, 'LOURDES', 'ALL LOTS', 'None', 'AGRICULTURE', 'A37', 40.00, 37.32, 34.89, 32.21, 30.63, 30.38, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(393, 'LOURDES', 'ALL LOTS', 'None', 'AGRICULTURE', 'A41', 29.00, 27.06, 25.30, 23.35, 22.21, 22.03, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(394, 'LOURDES', 'ALL LOTS', 'AGRO-LIVESTOCK/POULTRY/PIGGERY', 'AGRICULTURE', 'A50', 223.00, 208.06, 194.54, 179.56, 170.76, 169.39, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(395, 'LOURDES', 'ALL LOTS', 'Within LIP 2', 'INDUSTRIAL', 'I', 1100.00, 1026.30, 959.59, 885.70, 842.30, 835.56, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(396, 'MABINI', 'ALL LOTS', 'None', 'COMMERCIAL', 'CR', 16540.00, 15431.82, 14428.75, 13317.74, 12665.17, 12563.85, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(397, 'MABINI', 'ALL LOTS', 'None', 'RESIDENTIAL', 'RR', 7275.00, 6787.58, 6346.38, 5857.71, 5570.68, 5526.12, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(398, 'MALIGAYA', 'ALL LOTS', 'ALONG MC ARTHUR HIGHWAY', 'COMMERCIAL', 'CR', 9590.00, 8947.47, 8365.88, 7721.71, 7343.35, 7284.60, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(399, 'MALIGAYA', 'ALL LOTS', 'None', 'RESIDENTIAL', 'RR', 4445.00, 4147.19, 3877.62, 3579.04, 3403.67, 3376.44, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(400, 'MALIGAYA', 'ALL LOTS', 'None', 'AGRICULTURE', 'A1', 70.00, 65.31, 61.06, 56.36, 53.60, 53.17, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(401, 'MALIGAYA', 'ALL LOTS', 'None', 'AGRICULTURE', 'A2', 55.00, 51.32, 47.98, 44.29, 42.12, 41.78, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(402, 'MALIGAYA', 'ALL LOTS', 'None', 'AGRICULTURE', 'A3', 32.00, 29.86, 27.92, 25.77, 24.50, 24.31, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(403, 'MALIGAYA', 'ALL LOTS', 'None', 'AGRICULTURE', 'A6', 66.00, 61.58, 57.58, 53.14, 50.54, 50.13, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(404, 'MALIGAYA', 'ALL LOTS', 'None', 'AGRICULTURE', 'A15', 31.00, 28.92, 27.04, 24.96, 23.74, 23.55, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(405, 'MALIGAYA', 'ALL LOTS', 'None', 'AGRICULTURE', 'A17', 53.00, 49.45, 46.23, 42.67, 40.58, 40.26, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(406, 'MALIGAYA', 'ALL LOTS', 'None', 'AGRICULTURE', 'A37', 51.00, 47.58, 44.49, 41.06, 39.05, 38.74, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(407, 'MALIGAYA', 'ALL LOTS', 'None', 'AGRICULTURE', 'A41', 30.00, 27.99, 26.17, 24.16, 22.97, 22.79, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(408, 'MALIGAYA', 'ALL LOTS', 'AGRO-LIVESTOCK/POULTRY/PIGGERY', 'AGRICULTURE', 'A50', 91.00, 84.90, 79.38, 73.27, 69.68, 69.12, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(409, 'MALIWALO', 'ALL LOTS', 'ALONG THE ROAD', 'COMMERCIAL', 'CR', 7725.00, 7207.43, 6738.94, 6220.04, 5915.26, 5867.94, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(410, 'MALIWALO', 'ALL LOTS', 'None', 'RESIDENTIAL', 'RR', 2110.00, 1968.63, 1840.67, 1698.94, 1615.69, 1602.76, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(411, 'MALIWALO', 'ALL LOTS', 'None', 'AGRICULTURE', 'A1', 91.00, 84.90, 79.38, 73.27, 69.68, 69.12, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(412, 'MALIWALO', 'ALL LOTS', 'None', 'AGRICULTURE', 'A2', 43.00, 40.12, 37.51, 34.62, 32.93, 32.66, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(413, 'MALIWALO', 'ALL LOTS', 'None', 'AGRICULTURE', 'A6', 68.00, 63.44, 59.32, 54.75, 52.07, 51.65, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(414, 'MALIWALO', 'ALL LOTS', 'None', 'AGRICULTURE', 'A15', 36.00, 33.59, 31.40, 28.99, 27.57, 27.35, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(415, 'MALIWALO', 'ALL LOTS', 'None', 'AGRICULTURE', 'A17', 59.00, 55.05, 51.47, 47.51, 45.18, 44.82, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(416, 'MALIWALO', 'ALL LOTS', 'None', 'AGRICULTURE', 'A37', 54.00, 50.38, 47.11, 43.48, 41.35, 41.02, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(417, 'MALIWALO', 'ALL LOTS', 'None', 'AGRICULTURE', 'A41', 35.00, 32.66, 30.53, 28.18, 26.80, 26.59, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(418, 'MALIWALO', 'ALL LOTS', 'AGRO-LIVESTOCK/POULTRY/PIGGERY', 'AGRICULTURE', 'A50', 243.00, 226.72, 211.98, 195.66, 186.07, 184.58, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(419, 'MALIWALO', 'CAMELLA SUBD.', 'None', 'RESIDENTIAL', 'RR', 4315.00, 4025.90, 3764.21, 3474.37, 3304.12, 3277.69, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(420, 'MALIWALO', 'LUMINA', 'None', 'RESIDENTIAL', 'RR', 2750.00, 2565.75, 2398.98, 2214.26, 2105.76, 2088.91, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(421, 'MALIWALO', 'LA PUERTO DEL SOL', 'None', 'RESIDENTIAL', 'RR', 2555.00, 2383.82, 2228.87, 2057.24, 1956.44, 1940.79, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(422, 'MALIWALO', 'MARKET VIEW SUBD.', 'None', 'COMMERCIAL', 'CR', 6125.00, 5714.63, 5343.17, 4931.75, 4690.09, 4652.57, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(423, 'MALIWALO', 'MARKET VIEW SUBD.', 'None', 'RESIDENTIAL', 'RR', 3280.00, 3060.24, 2861.32, 2641.00, 2511.59, 2491.50, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(424, 'MALIWALO', 'S.G.DAVID SUBD.', 'None', 'RESIDENTIAL', 'RR', 2495.00, 2327.84, 2176.53, 2008.93, 1910.50, 1895.21, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(425, 'MALIWALO', 'SUNRISE', 'None', 'COMMERCIAL', 'CR', 6125.00, 5714.63, 5343.17, 4931.75, 4690.09, 4652.57, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(426, 'MALIWALO', 'SUNRISE', 'None', 'RESIDENTIAL', 'RR', 3305.00, 3083.57, 2883.13, 2661.13, 2530.74, 2510.49, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(427, 'MALIWALO', 'VILLA LUCINDA', 'None', 'RESIDENTIAL', 'RR', 2400.00, 2239.20, 2093.65, 1932.44, 1837.75, 1823.05, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(428, 'MALIWALO', 'GETHA SUBD', 'None', 'RESIDENTIAL', 'RR', 3245.00, 3027.59, 2830.79, 2612.82, 2484.79, 2464.91, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(429, 'MALIWALO', 'JOSE MACAPINLAC SUBD', 'None', 'RESIDENTIAL', 'RR', 2555.00, 2383.82, 2228.87, 2057.24, 1956.44, 1940.79, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(430, 'MALIWALO', 'VILLA AGUILA', 'None', 'RESIDENTIAL', 'RR', 2245.00, 2094.59, 1958.44, 1807.64, 1719.06, 1705.31, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(431, 'MALIWALO', 'VILLA AGUILA', 'SOCIALIZE HOUSING', 'RESIDENTIAL', 'RR', 1925.00, 1796.03, 1679.28, 1549.98, 1474.03, 1462.24, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(432, 'MAPALACSIAO', 'ALL LOTS', 'None', 'RESIDENTIAL', 'RR', 1560.00, 1455.48, 1360.87, 1256.09, 1194.54, 1184.98, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(433, 'MAPALACSIAO', 'ALL LOTS', 'None', 'AGRICULTURE', 'A1', 78.00, 72.77, 68.04, 62.80, 59.73, 59.25, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(434, 'MAPALACSIAO', 'ALL LOTS', 'None', 'AGRICULTURE', 'A2', 57.00, 53.18, 49.72, 45.90, 43.65, 43.30, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(435, 'MAPALACSIAO', 'ALL LOTS', 'None', 'AGRICULTURE', 'A6', 60.00, 55.98, 52.34, 48.31, 45.94, 45.58, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(436, 'MAPALACSIAO', 'ALL LOTS', 'None', 'AGRICULTURE', 'A15', 37.00, 34.52, 32.28, 29.79, 28.33, 28.11, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(437, 'MAPALACSIAO', 'ALL LOTS', 'None', 'AGRICULTURE', 'A17', 71.00, 66.24, 61.94, 57.17, 54.37, 53.93, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(438, 'MAPALACSIAO', 'ALL LOTS', 'None', 'AGRICULTURE', 'A37', 147.00, 137.15, 128.24, 118.36, 112.56, 111.66, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(439, 'MAPALACSIAO', 'ALL LOTS', 'None', 'AGRICULTURE', 'A41', 35.00, 32.66, 30.53, 28.18, 26.80, 26.59, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(440, 'MAPALACSIAO', 'ALL LOTS', 'AGRO-LIVESTOCK/POULTRY/PIGGERY', 'AGRICULTURE', 'A50', 89.00, 83.04, 77.64, 71.66, 68.15, 67.60, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(441, 'MAPALAD', 'ALL LOTS', 'None', 'RESIDENTIAL', 'RR', 673.00, 627.91, 587.09, 541.89, 515.34, 511.21, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(442, 'MAPALAD', 'ALL LOTS', 'None', 'AGRICULTURE', 'A1', 62.00, 57.85, 54.09, 49.92, 47.48, 47.10, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(443, 'MAPALAD', 'ALL LOTS', 'None', 'AGRICULTURE', 'A2', 53.00, 49.45, 46.23, 42.67, 40.58, 40.26, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(444, 'MAPALAD', 'ALL LOTS', 'None', 'AGRICULTURE', 'A6', 48.00, 44.78, 41.87, 38.65, 36.76, 36.46, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(445, 'MAPALAD', 'ALL LOTS', 'None', 'AGRICULTURE', 'A15', 31.00, 28.92, 27.04, 24.96, 23.74, 23.55, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(446, 'MAPALAD', 'ALL LOTS', 'None', 'AGRICULTURE', 'A17', 43.00, 40.12, 37.51, 34.62, 32.93, 32.66, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(447, 'MAPALAD', 'ALL LOTS', 'None', 'AGRICULTURE', 'A37', 41.00, 38.25, 35.77, 33.01, 31.39, 31.14, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(448, 'MAPALAD', 'ALL LOTS', 'None', 'AGRICULTURE', 'A41', 30.00, 27.99, 26.17, 24.16, 22.97, 22.79, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(449, 'MAPALAD', 'ALL LOTS', 'AGRO-LIVESTOCK/POULTRY/PIGGERY', 'AGRICULTURE', 'A50', 78.00, 72.77, 68.04, 62.80, 59.73, 59.25, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(450, 'MATADERO', 'ALL LOTS', 'ALONG PROVINCIAL ROAD', 'COMMERCIAL', 'CR', 8410.00, 7846.53, 7336.51, 6771.59, 6439.79, 6388.27, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(451, 'MATADERO', 'ALL LOTS', 'None', 'RESIDENTIAL', 'RR', 2505.00, 2337.17, 2185.25, 2016.99, 1918.15, 1902.81, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(452, 'MATADERO', 'ALL LOTS', 'None', 'AGRICULTURE', 'A1', 70.00, 65.31, 61.06, 56.36, 53.60, 53.17, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(453, 'MATADERO', 'ALL LOTS', 'None', 'AGRICULTURE', 'A2', 55.00, 51.32, 47.98, 44.29, 42.12, 41.78, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(454, 'MATADERO', 'ALL LOTS', 'None', 'AGRICULTURE', 'A6', 61.00, 56.91, 53.21, 49.12, 46.71, 46.34, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(455, 'MATADERO', 'ALL LOTS', 'None', 'AGRICULTURE', 'A15', 36.00, 33.59, 31.40, 28.99, 27.57, 27.35, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(456, 'MATADERO', 'ALL LOTS', 'None', 'AGRICULTURE', 'A17', 39.00, 36.39, 34.02, 31.40, 29.86, 29.62, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(457, 'MATADERO', 'ALL LOTS', 'None', 'AGRICULTURE', 'A37', 39.00, 36.39, 34.02, 31.40, 29.86, 29.62, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(458, 'MATADERO', 'ALL LOTS', 'None', 'AGRICULTURE', 'A41', 30.00, 27.99, 26.17, 24.16, 22.97, 22.79, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(459, 'MATADERO', 'ALL LOTS', 'AGRO-LIVESTOCK/POULTRY/PIGGERY', 'AGRICULTURE', 'A50', 231.00, 215.52, 201.51, 186.00, 176.88, 175.47, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(460, 'MATATALAIB', 'ALL LOTS', 'CENTRO / MANGGA I & II', 'COMMERCIAL', 'CR', 8275.00, 7720.58, 7218.74, 6662.89, 6336.41, 6285.72, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(461, 'MATATALAIB', 'ALL LOTS', 'FRONTAL', 'RESIDENTIAL', 'RR', 3124.00, 2914.69, 2725.24, 2515.39, 2392.14, 2373.00, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(462, 'MATATALAIB', 'ALL LOTS', 'None', 'AGRICULTURE', 'A1', 91.00, 84.90, 79.38, 73.27, 69.68, 69.12, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(463, 'MATATALAIB', 'ALL LOTS', 'None', 'AGRICULTURE', 'A2', 77.00, 71.84, 67.17, 62.00, 58.96, 58.49, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(464, 'MATATALAIB', 'ALL LOTS', 'None', 'AGRICULTURE', 'A6', 84.00, 78.37, 73.28, 67.64, 64.32, 63.81, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(465, 'MATATALAIB', 'ALL LOTS', 'None', 'AGRICULTURE', 'A15', 51.00, 47.58, 44.49, 41.06, 39.05, 38.74, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(466, 'MATATALAIB', 'ALL LOTS', 'None', 'AGRICULTURE', 'A17', 76.00, 70.91, 66.30, 61.19, 58.20, 57.73, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(467, 'MATATALAIB', 'ALL LOTS', 'None', 'AGRICULTURE', 'A37', 69.00, 64.38, 60.19, 55.56, 52.84, 52.41, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(468, 'MATATALAIB', 'ALL LOTS', 'None', 'AGRICULTURE', 'A40', 6815.00, 6358.40, 5945.10, 5487.33, 5218.45, 5176.70, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(469, 'MATATALAIB', 'ALL LOTS', 'None', 'AGRICULTURE', 'A41', 50.00, 46.65, 43.62, 40.26, 38.29, 37.98, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(470, 'MATATALAIB', 'ALL LOTS', 'AGRO-LIVESTOCK/POULTRY/PIGGERY', 'AGRICULTURE', 'A50', 243.00, 226.72, 211.98, 195.66, 186.07, 184.58, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(471, 'MATATALAIB', 'FIESTA COMMUNITIES', 'None', 'COMMERCIAL', 'CR', 4805.00, 4483.07, 4191.67, 3868.91, 3679.33, 3649.90, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(472, 'MATATALAIB', 'FIESTA COMMUNITIES', 'None', 'RESIDENTIAL', 'RR', 3015.00, 2813.00, 2630.15, 2427.63, 2308.67, 2290.21, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(473, 'MATATALAIB', 'OUR LADY OF RANSOM', 'None', 'COMMERCIAL', 'CR', 2578.00, 2405.27, 2248.93, 2075.76, 1974.05, 1958.26, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(474, 'MATATALAIB', 'OUR LADY OF RANSOM', 'SOCIALIZE HOUSING', 'RESIDENTIAL', 'RR', 1915.00, 1786.70, 1670.56, 1541.93, 1466.37, 1454.64, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(475, 'MATATALAIB', 'ROBERTS VILLE', 'None', 'COMMERCIAL', 'CR', 2563.00, 2391.28, 2235.85, 2063.69, 1962.57, 1946.86, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(476, 'MATATALAIB', 'ROBERTS VILLE', 'SOCIALIZE HOUSING', 'RESIDENTIAL', 'RR', 1840.00, 1716.72, 1605.13, 1481.54, 1408.94, 1397.67, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(477, 'MATATALAIB', 'STO. NINO VILLAGE', 'None', 'COMMERCIAL', 'CR', 2525.00, 2355.83, 2202.70, 2033.09, 1933.47, 1918.00, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(478, 'MATATALAIB', 'STO. NINO VILLAGE', 'SOCIALIZE HOUSING', 'RESIDENTIAL', 'RR', 1840.00, 1716.72, 1605.13, 1481.54, 1408.94, 1397.67, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(479, 'MATATALAIB', 'VILLA LETICIA', 'None', 'RESIDENTIAL', 'RR', 2555.00, 2383.82, 2228.87, 2057.24, 1956.44, 1940.79, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(480, 'MATATALAIB', 'VILLA PERPETUAL', 'FRONTAL', 'COMMERCIAL', 'CR', 3200.00, 2985.60, 2791.54, 2576.59, 2450.33, 2430.73, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(481, 'MATATALAIB', 'VILLA PERPETUAL', 'INTERIOR', 'RESIDENTIAL', 'RR', 2515.00, 2346.50, 2193.97, 2025.04, 1925.81, 1910.40, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(482, 'MATATALAIB', 'DON ADRIANO SUBD', 'None', 'RESIDENTIAL', 'RR', 2495.00, 2327.84, 2176.53, 2008.93, 1910.50, 1895.21, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(483, 'MATATALAIB', 'MARIA CARMEN GALLARDO', 'SOCIALIZE HOUSING', 'RESIDENTIAL', 'RR', 1880.00, 1754.04, 1640.03, 1513.75, 1439.57, 1428.06, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(484, 'MOLAVE', 'ALL LOTS', 'ALONG PROVINCIAL ROAD', 'COMMERCIAL', 'CR', 2570.00, 2397.81, 2241.95, 2069.32, 1967.93, 1952.18, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(485, 'MOLAVE', 'ALL LOTS', 'None', 'RESIDENTIAL', 'RR', 1305.00, 1217.57, 1138.42, 1050.76, 999.28, 991.28, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(486, 'MOLAVE', 'ALL LOTS', 'INTERIOR', 'RESIDENTIAL', 'RR', 711.00, 663.36, 620.24, 572.49, 544.43, 540.08, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(487, 'MOLAVE', 'ALL LOTS', 'None', 'AGRICULTURE', 'A1', 81.00, 75.57, 70.66, 65.22, 62.02, 61.53, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(488, 'MOLAVE', 'ALL LOTS', 'None', 'AGRICULTURE', 'A2', 60.00, 55.98, 52.34, 48.31, 45.94, 45.58, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(489, 'MOLAVE', 'ALL LOTS', 'None', 'AGRICULTURE', 'A6', 69.00, 64.38, 60.19, 55.56, 52.84, 52.41, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(490, 'MOLAVE', 'ALL LOTS', 'None', 'AGRICULTURE', 'A15', 36.00, 33.59, 31.40, 28.99, 27.57, 27.35, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(491, 'MOLAVE', 'ALL LOTS', 'None', 'AGRICULTURE', 'A17', 54.00, 50.38, 47.11, 43.48, 41.35, 41.02, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(492, 'MOLAVE', 'ALL LOTS', 'None', 'AGRICULTURE', 'A37', 32.00, 29.86, 27.92, 25.77, 24.50, 24.31, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(493, 'MOLAVE', 'ALL LOTS', 'None', 'AGRICULTURE', 'A41', 37.00, 34.52, 32.28, 29.79, 28.33, 28.11, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(494, 'PARAISO', 'ALL LOTS', 'ALONG THE ROAD', 'COMMERCIAL', 'CR', 8425.00, 7860.53, 7349.59, 6783.67, 6451.27, 6399.66, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(495, 'PARAISO', 'ALL LOTS', 'None', 'RESIDENTIAL', 'RR', 3379.00, 3152.61, 2947.69, 2720.72, 2587.40, 2566.70, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(496, 'PARAISO', 'ALL LOTS', 'None', 'AGRICULTURE', 'A1', 89.00, 83.04, 77.64, 71.66, 68.15, 67.60, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(497, 'PARAISO', 'ALL LOTS', 'None', 'AGRICULTURE', 'A2', 63.00, 58.78, 54.96, 50.73, 48.24, 47.86, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(498, 'PARAISO', 'ALL LOTS', 'None', 'AGRICULTURE', 'A6', 69.00, 64.38, 60.19, 55.56, 52.84, 52.41, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(499, 'PARAISO', 'ALL LOTS', 'None', 'AGRICULTURE', 'A15', 40.00, 37.32, 34.89, 32.21, 30.63, 30.38, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(500, 'PARAISO', 'ALL LOTS', 'None', 'AGRICULTURE', 'A17', 61.00, 56.91, 53.21, 49.12, 46.71, 46.34, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(501, 'PARAISO', 'ALL LOTS', 'None', 'AGRICULTURE', 'A37', 55.00, 51.32, 47.98, 44.29, 42.12, 41.78, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(502, 'PARAISO', 'ALL LOTS', 'None', 'AGRICULTURE', 'A41', 35.00, 32.66, 30.53, 28.18, 26.80, 26.59, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(503, 'PARAISO', 'ALL LOTS', 'AGRO-LIVESTOCK/POULTRY/PIGGERY', 'AGRICULTURE', 'A50', 118.00, 110.09, 102.94, 95.01, 90.36, 89.63, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(504, 'SALAPUNGAN', 'ALL LOTS', 'None', 'COMMERCIAL', 'CR', 8425.00, 7860.53, 7349.59, 6783.67, 6451.27, 6399.66, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(505, 'SALAPUNGAN', 'ALL LOTS', 'None', 'RESIDENTIAL', 'RR', 2925.00, 2729.03, 2551.64, 2355.16, 2239.76, 2221.84, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(506, 'SALAPUNGAN', 'ALL LOTS', 'None', 'AGRICULTURE', 'A1', 68.00, 63.44, 59.32, 54.75, 52.07, 51.65, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(507, 'SALAPUNGAN', 'ALL LOTS', 'None', 'AGRICULTURE', 'A2', 56.00, 52.25, 48.85, 45.09, 42.88, 42.54, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(508, 'SALAPUNGAN', 'ALL LOTS', 'None', 'AGRICULTURE', 'A6', 63.00, 58.78, 54.96, 50.73, 48.24, 47.86, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(509, 'SALAPUNGAN', 'ALL LOTS', 'None', 'AGRICULTURE', 'A15', 37.00, 34.52, 32.28, 29.79, 28.33, 28.11, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(510, 'SALAPUNGAN', 'ALL LOTS', 'None', 'AGRICULTURE', 'A17', 42.00, 39.19, 36.64, 33.82, 32.16, 31.90, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(511, 'SALAPUNGAN', 'ALL LOTS', 'None', 'AGRICULTURE', 'A37', 65.00, 60.65, 56.70, 52.34, 49.77, 49.37, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(512, 'SALAPUNGAN', 'ALL LOTS', 'None', 'AGRICULTURE', 'A41', 31.00, 28.92, 27.04, 24.96, 23.74, 23.55, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(513, 'SALAPUNGAN', 'ALL LOTS', 'AGRO-LIVESTOCK/POULTRY/PIGGERY', 'AGRICULTURE', 'A50', 78.00, 72.77, 68.04, 62.80, 59.73, 59.25, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(514, 'SALAPUNGAN', 'ROSEMONT EXECUTIVE VILAGE / FILINVEST LAND INC', 'None', 'RESIDENTIAL', 'RR', 2850.00, 2659.05, 2486.21, 2294.77, 2182.33, 2164.87, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(515, 'SALAPUNGAN', 'SOMERSET LANE', 'None', 'RESIDENTIAL', 'RR', 3670.00, 3424.11, 3201.54, 2955.02, 2810.23, 2787.75, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(516, 'SALAPUNGAN', 'VILLA SOLIMAN', 'None', 'RESIDENTIAL', 'RR', 2660.00, 2481.78, 2320.46, 2141.79, 2036.84, 2020.55, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(517, 'SAN CARLOS', 'ALL LOTS', 'None', 'RESIDENTIAL', 'RR', 440.00, 410.52, 383.84, 354.28, 336.92, 334.23, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(518, 'SAN CARLOS', 'ALL LOTS', 'None', 'AGRICULTURE', 'A1', 62.00, 57.85, 54.09, 49.92, 47.48, 47.10, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(519, 'SAN CARLOS', 'ALL LOTS', 'None', 'AGRICULTURE', 'A2', 46.00, 42.92, 40.13, 37.04, 35.22, 34.94, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(520, 'SAN CARLOS', 'ALL LOTS', 'None', 'AGRICULTURE', 'A6', 51.00, 47.58, 44.49, 41.06, 39.05, 38.74, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(521, 'SAN CARLOS', 'ALL LOTS', 'None', 'AGRICULTURE', 'A15', 31.00, 28.92, 27.04, 24.96, 23.74, 23.55, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(522, 'SAN CARLOS', 'ALL LOTS', 'None', 'AGRICULTURE', 'A17', 44.00, 41.05, 38.38, 35.43, 33.69, 33.42, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(523, 'SAN CARLOS', 'ALL LOTS', 'None', 'AGRICULTURE', 'A37', 42.00, 39.19, 36.64, 33.82, 32.16, 31.90, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(524, 'SAN CARLOS', 'ALL LOTS', 'None', 'AGRICULTURE', 'A41', 30.00, 27.99, 26.17, 24.16, 22.97, 22.79, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(525, 'SAN CARLOS', 'ALL LOTS', 'AGRO-LIVESTOCK/POULTRY/PIGGERY', 'AGRICULTURE', 'A50', 148.00, 138.08, 129.11, 119.17, 113.33, 112.42, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(526, 'SAN CARLOS', 'ALL LOTS', 'None', 'AGRICULTURE', 'A50', 30.00, 27.99, 26.17, 24.16, 22.97, 22.79, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(527, 'SAN FRANCISCO', 'ALL LOTS', 'ALONG THE ROAD', 'COMMERCIAL', 'CR', 7200.00, 6717.60, 6280.96, 5797.32, 5513.25, 5469.15, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(528, 'SAN FRANCISCO', 'ALL LOTS', 'None', 'RESIDENTIAL', 'RR', 2887.50, 2694.04, 2518.93, 2324.97, 2211.04, 2193.36, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(529, 'SAN FRANCISCO', 'ALL LOTS', 'None', 'AGRICULTURE', 'A1', 80.00, 74.64, 69.79, 64.41, 61.26, 60.77, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(530, 'SAN FRANCISCO', 'ALL LOTS', 'None', 'AGRICULTURE', 'A2', 55.00, 51.32, 47.98, 44.29, 42.12, 41.78, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(531, 'SAN FRANCISCO', 'ALL LOTS', 'None', 'AGRICULTURE', 'A6', 61.00, 56.91, 53.21, 49.12, 46.71, 46.34, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(532, 'SAN FRANCISCO', 'ALL LOTS', 'None', 'AGRICULTURE', 'A15', 31.00, 28.92, 27.04, 24.96, 23.74, 23.55, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(533, 'SAN FRANCISCO', 'ALL LOTS', 'None', 'AGRICULTURE', 'A17', 52.00, 48.52, 45.36, 41.87, 39.82, 39.50, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(534, 'SAN FRANCISCO', 'ALL LOTS', 'None', 'AGRICULTURE', 'A37', 39.00, 36.39, 34.02, 31.40, 29.86, 29.62, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(535, 'SAN FRANCISCO', 'ALL LOTS', 'None', 'AGRICULTURE', 'A41', 30.00, 27.99, 26.17, 24.16, 22.97, 22.79, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(536, 'SAN FRANCISCO', 'ALL LOTS', 'AGRO-LIVESTOCK/POULTRY/PIGGERY', 'AGRICULTURE', 'A50', 231.00, 215.52, 201.51, 186.00, 176.88, 175.47, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(537, 'SAN FRANCISCO', 'VILLA EMILIA SUBD. (PAMELACON)', 'None', 'RESIDENTIAL', 'RR', 4615.00, 4305.80, 4025.92, 3715.92, 3533.84, 3505.57, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(538, 'SAN ISIDRO', 'ALL LOTS', 'ALONG THE ROAD', 'COMMERCIAL', 'CR', 3910.00, 3648.03, 3410.91, 3148.27, 2994.00, 2970.05, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(539, 'SAN ISIDRO', 'ALL LOTS', 'None', 'RESIDENTIAL', 'RR', 1946.50, 1816.08, 1698.04, 1567.29, 1490.49, 1478.57, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(540, 'SAN ISIDRO', 'ALL LOTS', 'None', 'AGRICULTURE', 'A1', 91.00, 84.90, 79.38, 73.27, 69.68, 69.12, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(541, 'SAN ISIDRO', 'ALL LOTS', 'None', 'AGRICULTURE', 'A2', 61.00, 56.91, 53.21, 49.12, 46.71, 46.34, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(542, 'SAN ISIDRO', 'ALL LOTS', 'None', 'AGRICULTURE', 'A6', 67.00, 62.51, 58.45, 53.95, 51.30, 50.89, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(543, 'SAN ISIDRO', 'ALL LOTS', 'None', 'AGRICULTURE', 'A15', 32.00, 29.86, 27.92, 25.77, 24.50, 24.31, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(544, 'SAN ISIDRO', 'ALL LOTS', 'None', 'AGRICULTURE', 'A17', 49.00, 45.72, 42.75, 39.45, 37.52, 37.22, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(545, 'SAN ISIDRO', 'ALL LOTS', 'None', 'AGRICULTURE', 'A37', 44.00, 41.05, 38.38, 35.43, 33.69, 33.42, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(546, 'SAN ISIDRO', 'ALL LOTS', 'None', 'AGRICULTURE', 'A40', 3220.00, 3004.26, 2808.98, 2592.69, 2465.65, 2445.92, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(547, 'SAN ISIDRO', 'ALL LOTS', 'None', 'AGRICULTURE', 'A41', 30.00, 27.99, 26.17, 24.16, 22.97, 22.79, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(548, 'SAN ISIDRO', 'ALL LOTS', 'AGRO-LIVESTOCK/POULTRY/PIGGERY', 'AGRICULTURE', 'A50', 243.00, 226.72, 211.98, 195.66, 186.07, 184.58, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(549, 'SAN ISIDRO', 'SKYLAND HOLDING', 'None', 'COMMERCIAL', 'CR', 3910.00, 3648.03, 3410.91, 3148.27, 2994.00, 2970.05, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(550, 'SAN ISIDRO', 'SKYLAND HOLDING', 'None', 'RESIDENTIAL', 'RR', 2480.00, 2313.84, 2163.44, 1996.86, 1899.01, 1883.82, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(551, 'SAN ISIDRO', 'HONORIO BULOS JR SUBD', 'None', 'RESIDENTIAL', 'RR', 2275.00, 2122.58, 1984.61, 1831.79, 1742.03, 1728.10, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(552, 'SAN ISIDRO', 'MARCELINO DIJANCO SUBD', 'None', 'RESIDENTIAL', 'RR', 2275.00, 2122.58, 1984.61, 1831.79, 1742.03, 1728.10, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(553, 'SAN ISIDRO', 'LA CONSOLACION EXECUTIVE SUBDIVISION', 'None', 'RESIDENTIAL', 'RR', 2450.00, 2285.85, 2137.27, 1972.70, 1876.04, 1861.03, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(554, 'SAN JOSE', 'ALL LOTS', 'ALONG PROVINCIAL ROAD', 'COMMERCIAL', 'CR', 1875.00, 1749.38, 1635.67, 1509.72, 1435.74, 1424.26, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(555, 'SAN JOSE', 'ALL LOTS', 'None', 'RESIDENTIAL', 'RR', 1148.00, 1071.08, 1001.46, 924.35, 879.06, 872.03, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(556, 'SAN JOSE', 'ALL LOTS', 'None', 'AGRICULTURE', 'A1', 84.00, 78.37, 73.28, 67.64, 64.32, 63.81, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(557, 'SAN JOSE', 'ALL LOTS', 'None', 'AGRICULTURE', 'A2', 53.00, 49.45, 46.23, 42.67, 40.58, 40.26, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(558, 'SAN JOSE', 'ALL LOTS', 'None', 'AGRICULTURE', 'A6', 62.00, 57.85, 54.09, 49.92, 47.48, 47.10, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(559, 'SAN JOSE', 'ALL LOTS', 'None', 'AGRICULTURE', 'A15', 33.00, 30.79, 28.79, 26.57, 25.27, 25.07, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(560, 'SAN JOSE', 'ALL LOTS', 'None', 'AGRICULTURE', 'A17', 48.00, 44.78, 41.87, 38.65, 36.76, 36.46, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(561, 'SAN JOSE', 'ALL LOTS', 'None', 'AGRICULTURE', 'A37', 45.00, 41.99, 39.26, 36.23, 34.46, 34.18, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(562, 'SAN JOSE', 'ALL LOTS', 'None', 'AGRICULTURE', 'A40', 1913.00, 1784.83, 1668.82, 1540.32, 1464.84, 1453.12, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(563, 'SAN JOSE', 'ALL LOTS', 'None', 'AGRICULTURE', 'A41', 30.00, 27.99, 26.17, 24.16, 22.97, 22.79, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(564, 'SAN JOSE', 'ALL LOTS', 'AGRO-LIVESTOCK/POULTRY/PIGGERY', 'AGRICULTURE', 'A50', 227.00, 211.79, 198.02, 182.78, 173.82, 172.43, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(565, 'SAN JOSE', 'E.B. LADESMA DEV. CORP', 'None', 'RESIDENTIAL', 'RR', 2095.00, 1954.64, 1827.58, 1686.86, 1604.20, 1591.37, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(566, 'SAN JOSE', 'SHANGRILA HOMES', 'None', 'RESIDENTIAL', 'RR', 2460.00, 2295.18, 2145.99, 1980.75, 1883.69, 1868.63, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(567, 'SAN JOSE DE URQUICO', 'ALL LOTS', 'None', 'RESIDENTIAL', 'RR', 680.00, 634.44, 593.20, 547.52, 520.70, 516.53, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(568, 'SAN JOSE DE URQUICO', 'ALL LOTS', 'None', 'AGRICULTURE', 'A1', 72.00, 67.18, 62.81, 57.97, 55.13, 54.69, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(569, 'SAN JOSE DE URQUICO', 'ALL LOTS', 'None', 'AGRICULTURE', 'A2', 50.00, 46.65, 43.62, 40.26, 38.29, 37.98, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(570, 'SAN JOSE DE URQUICO', 'ALL LOTS', 'None', 'AGRICULTURE', 'A6', 62.00, 57.85, 54.09, 49.92, 47.48, 47.10, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(571, 'SAN JOSE DE URQUICO', 'ALL LOTS', 'None', 'AGRICULTURE', 'A15', 38.00, 35.45, 33.15, 30.60, 29.10, 28.86, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(572, 'SAN JOSE DE URQUICO', 'ALL LOTS', 'None', 'AGRICULTURE', 'A17', 63.00, 58.78, 54.96, 50.73, 48.24, 47.86, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(573, 'SAN JOSE DE URQUICO', 'ALL LOTS', 'None', 'AGRICULTURE', 'A37', 54.00, 50.38, 47.11, 43.48, 41.35, 41.02, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(574, 'SAN JOSE DE URQUICO', 'ALL LOTS', 'None', 'AGRICULTURE', 'A41', 31.00, 28.92, 27.04, 24.96, 23.74, 23.55, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(575, 'SAN JOSE DE URQUICO', 'ALL LOTS', 'AGRO-LIVESTOCK/POULTRY/PIGGERY', 'AGRICULTURE', 'A50', 173.00, 161.41, 150.92, 139.30, 132.47, 131.41, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(576, 'SAN JUAN DE MATA', 'ALL LOTS', 'None', 'RESIDENTIAL', 'RR', 655.00, 611.12, 571.39, 527.40, 501.55, 497.54, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(577, 'SAN JUAN DE MATA', 'ALL LOTS', 'None', 'AGRICULTURE', 'A1', 80.00, 74.64, 69.79, 64.41, 61.26, 60.77, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(578, 'SAN JUAN DE MATA', 'ALL LOTS', 'None', 'AGRICULTURE', 'A2', 54.00, 50.38, 47.11, 43.48, 41.35, 41.02, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(579, 'SAN JUAN DE MATA', 'ALL LOTS', 'None', 'AGRICULTURE', 'A6', 92.00, 85.84, 80.26, 74.08, 70.45, 69.88, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(580, 'SAN JUAN DE MATA', 'ALL LOTS', 'None', 'AGRICULTURE', 'A15', 33.00, 30.79, 28.79, 26.57, 25.27, 25.07, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(581, 'SAN JUAN DE MATA', 'ALL LOTS', 'None', 'AGRICULTURE', 'A17', 52.00, 48.52, 45.36, 41.87, 39.82, 39.50, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(582, 'SAN JUAN DE MATA', 'ALL LOTS', 'None', 'AGRICULTURE', 'A37', 46.00, 42.92, 40.13, 37.04, 35.22, 34.94, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(583, 'SAN JUAN DE MATA', 'ALL LOTS', 'None', 'AGRICULTURE', 'A41', 36.00, 33.59, 31.40, 28.99, 27.57, 27.35, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(584, 'SAN JUAN DE MATA', 'ALL LOTS', 'AGRO-LIVESTOCK/POULTRY/PIGGERY', 'AGRICULTURE', 'A50', 181.00, 168.87, 157.90, 145.74, 138.60, 137.49, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(585, 'SAN LUIS', 'ALL LOTS', 'None', 'RESIDENTIAL', 'RR', 640.00, 597.12, 558.31, 515.32, 490.07, 486.15, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(586, 'SAN LUIS', 'ALL LOTS', 'None', 'AGRICULTURE', 'A1', 68.00, 63.44, 59.32, 54.75, 52.07, 51.65, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(587, 'SAN LUIS', 'ALL LOTS', 'None', 'AGRICULTURE', 'A2', 55.00, 51.32, 47.98, 44.29, 42.12, 41.78, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(588, 'SAN LUIS', 'ALL LOTS', 'None', 'AGRICULTURE', 'A6', 53.00, 49.45, 46.23, 42.67, 40.58, 40.26, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(589, 'SAN LUIS', 'ALL LOTS', 'None', 'AGRICULTURE', 'A15', 33.00, 30.79, 28.79, 26.57, 25.27, 25.07, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(590, 'SAN LUIS', 'ALL LOTS', 'None', 'AGRICULTURE', 'A17', 46.00, 42.92, 40.13, 37.04, 35.22, 34.94, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(591, 'SAN LUIS', 'ALL LOTS', 'None', 'AGRICULTURE', 'A37', 43.00, 40.12, 37.51, 34.62, 32.93, 32.66, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(592, 'SAN LUIS', 'ALL LOTS', 'None', 'AGRICULTURE', 'A41', 120.00, 111.96, 104.68, 96.62, 91.89, 91.15, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(593, 'SAN LUIS', 'ALL LOTS', 'AGRO-LIVESTOCK/POULTRY/PIGGERY', 'AGRICULTURE', 'A50', 76.00, 70.91, 66.30, 61.19, 58.20, 57.73, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(594, 'SAN MANUEL', 'ALL LOTS', 'ALONG PROVINCIAL ROAD', 'COMMERCIAL', 'CR', 1875.00, 1749.38, 1635.67, 1509.72, 1435.74, 1424.26, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(595, 'SAN MANUEL', 'ALL LOTS', 'None', 'RESIDENTIAL', 'RR', 1093.00, 1019.77, 953.48, 880.07, 836.94, 830.25, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(596, 'SAN MANUEL', 'ALL LOTS', 'None', 'AGRICULTURE', 'A1', 76.00, 70.91, 66.30, 61.19, 58.20, 57.73, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(597, 'SAN MANUEL', 'ALL LOTS', 'None', 'AGRICULTURE', 'A2', 56.00, 52.25, 48.85, 45.09, 42.88, 42.54, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(598, 'SAN MANUEL', 'ALL LOTS', 'None', 'AGRICULTURE', 'A6', 54.00, 50.38, 47.11, 43.48, 41.35, 41.02, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(599, 'SAN MANUEL', 'ALL LOTS', 'None', 'AGRICULTURE', 'A15', 32.00, 29.86, 27.92, 25.77, 24.50, 24.31, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(600, 'SAN MANUEL', 'ALL LOTS', 'None', 'AGRICULTURE', 'A17', 45.00, 41.99, 39.26, 36.23, 34.46, 34.18, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(601, 'SAN MANUEL', 'ALL LOTS', 'None', 'AGRICULTURE', 'A37', 43.00, 40.12, 37.51, 34.62, 32.93, 32.66, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30');
INSERT INTO `zonal_value` (`id`, `barangay`, `street`, `vicinity`, `property_type`, `class`, `price_2025`, `price_2024`, `price_2023`, `price_2022`, `price_2021`, `price_2020`, `data_source`, `is_active`, `created_at`, `updated_at`) VALUES
(602, 'SAN MANUEL', 'ALL LOTS', 'None', 'AGRICULTURE', 'A41', 32.00, 29.86, 27.92, 25.77, 24.50, 24.31, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(603, 'SAN MANUEL', 'ALL LOTS', 'AGRO-LIVESTOCK/POULTRY/PIGGERY', 'AGRICULTURE', 'A50', 233.00, 217.39, 203.26, 187.61, 178.42, 176.99, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(604, 'SAN MIGUEL', 'MC. ARTHUR HIGHWAY', 'ALONG MC. ARTHUR HIGHWAY', 'COMMERCIAL', 'CR', 11725.00, 10939.43, 10228.36, 9440.78, 8978.18, 8906.35, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(605, 'SAN MIGUEL', 'ALL LOTS', '(FRONTING ROBINSON (PREVIOUSLY LUISITA MALL)', 'RESIDENTIAL', 'RR', 4438.00, 4140.65, 3871.51, 3573.41, 3398.31, 3371.12, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(606, 'SAN MIGUEL', 'LUISITA INDUSTRIAL PARK', 'LUISITA INDUSTRIAL PARK', 'COMMERCIAL', 'CR', 8075.00, 7533.98, 7044.27, 6501.86, 6183.27, 6133.80, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(607, 'SAN MIGUEL', 'ALL LOTS', 'None', 'INDUSTRIAL', 'I', 4113.00, 3837.43, 3588.00, 3311.72, 3149.45, 3124.25, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(608, 'SAN MIGUEL', 'ALL LOTS', 'None', 'AGRICULTURE', 'A1', 78.00, 72.77, 68.04, 62.80, 59.73, 59.25, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(609, 'SAN MIGUEL', 'ALL LOTS', 'None', 'AGRICULTURE', 'A2', 67.00, 62.51, 58.45, 53.95, 51.30, 50.89, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(610, 'SAN MIGUEL', 'ALL LOTS', 'None', 'AGRICULTURE', 'A6', 74.00, 69.04, 64.55, 59.58, 56.66, 56.21, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(611, 'SAN MIGUEL', 'ALL LOTS', 'None', 'AGRICULTURE', 'A15', 67.00, 62.51, 58.45, 53.95, 51.30, 50.89, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(612, 'SAN MIGUEL', 'ALL LOTS', 'None', 'AGRICULTURE', 'A17', 57.00, 53.18, 49.72, 45.90, 43.65, 43.30, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(613, 'SAN MIGUEL', 'ALL LOTS', 'None', 'AGRICULTURE', 'A37', 50.00, 46.65, 43.62, 40.26, 38.29, 37.98, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(614, 'SAN MIGUEL', 'ALL LOTS', 'None', 'AGRICULTURE', 'A41', 39.00, 36.39, 34.02, 31.40, 29.86, 29.62, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(615, 'SAN MIGUEL', 'ALL LOTS', 'AGRO-LIVESTOCK/POULTRY/PIGGERY', 'AGRICULTURE', 'A50', 231.00, 215.52, 201.51, 186.00, 176.88, 175.47, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(616, 'SAN MIGUEL', 'ALTO PROJECT', 'None', 'RESIDENTIAL', 'RR', 2250.00, 2099.25, 1962.80, 1811.66, 1722.89, 1709.11, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(617, 'SAN MIGUEL', 'LUISITA REALTY', 'None', 'RESIDENTIAL', 'RR', 2920.00, 2724.36, 2547.28, 2351.14, 2235.93, 2218.04, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(618, 'SAN MIGUEL', 'LAS HACIENDAS', 'None', 'RESIDENTIAL', 'RR', 4375.00, 4081.88, 3816.55, 3522.68, 3350.07, 3323.27, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(619, 'SAN MIGUEL', 'CAMP AQUINO VILLAGE', 'None', 'RESIDENTIAL', 'RR', 2250.00, 2099.25, 1962.80, 1811.66, 1722.89, 1709.11, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(620, 'SAN NICOLAS', 'ZAPIRO ST.', 'TARLAC DIKE -M.H DEL PILAR', 'COMMERCIAL', 'CR', 16900.00, 15767.70, 14742.80, 13607.60, 12940.83, 12837.30, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(621, 'SAN NICOLAS', 'ZAPIRO ST.', 'None', 'RESIDENTIAL', 'RR', 7795.00, 7272.74, 6800.01, 6276.41, 5968.86, 5921.11, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(622, 'SAN NICOLAS', 'ALL LOTS', 'None', 'RESIDENTIAL', 'RR', 3925.00, 3662.03, 3423.99, 3160.35, 3005.49, 2981.45, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(623, 'SAN NICOLAS', 'PUNO SUBDIVISON', 'None', 'RESIDENTIAL', 'RR', 3980.00, 3713.34, 3471.97, 3204.63, 3047.60, 3023.22, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(624, 'SAN NICOLAS', 'BLOSSOMVILLE SUBD', 'None', 'RESIDENTIAL', 'RR', 3890.00, 3629.37, 3393.46, 3132.16, 2978.69, 2954.86, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(625, 'SAN NICOLAS', 'TOMAS BESA SUBD', 'None', 'RESIDENTIAL', 'RR', 3890.00, 3629.37, 3393.46, 3132.16, 2978.69, 2954.86, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(626, 'SAN PABLO', 'ALL LOTS', 'None', 'COMMERCIAL', 'CR', 5080.00, 4739.64, 4431.56, 4090.33, 3889.91, 3858.79, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(627, 'SAN PABLO', 'ALL LOTS', 'None', 'RESIDENTIAL', 'RR', 1503.00, 1402.30, 1311.15, 1210.19, 1150.89, 1141.68, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(628, 'SAN PABLO', 'ALL LOTS', 'None', 'AGRICULTURE', 'A1', 74.00, 69.04, 64.55, 59.58, 56.66, 56.21, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(629, 'SAN PABLO', 'ALL LOTS', 'None', 'AGRICULTURE', 'A2', 54.00, 50.38, 47.11, 43.48, 41.35, 41.02, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(630, 'SAN PABLO', 'ALL LOTS', 'None', 'AGRICULTURE', 'A6', 68.00, 63.44, 59.32, 54.75, 52.07, 51.65, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(631, 'SAN PABLO', 'ALL LOTS', 'None', 'AGRICULTURE', 'A15', 34.00, 31.72, 29.66, 27.38, 26.03, 25.83, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(632, 'SAN PABLO', 'ALL LOTS', 'None', 'AGRICULTURE', 'A17', 52.00, 48.52, 45.36, 41.87, 39.82, 39.50, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(633, 'SAN PABLO', 'ALL LOTS', 'None', 'AGRICULTURE', 'A37', 46.00, 42.92, 40.13, 37.04, 35.22, 34.94, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(634, 'SAN PABLO', 'ALL LOTS', 'None', 'AGRICULTURE', 'A41', 31.00, 28.92, 27.04, 24.96, 23.74, 23.55, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(635, 'SAN PABLO', 'ALL LOTS', 'AGRO-LIVESTOCK/POULTRY/PIGGERY', 'AGRICULTURE', 'A50', 81.00, 75.57, 70.66, 65.22, 62.02, 61.53, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(636, 'SAN PABLO', 'VILLA PILAR SUBDIVISION', 'None', 'RESIDENTIAL', 'RR', 2420.00, 2257.86, 2111.10, 1948.54, 1853.07, 1838.24, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(637, 'SAN PASCUAL', 'ALL LOTS', 'None', 'RESIDENTIAL', 'RR', 443.00, 413.32, 386.45, 356.70, 339.22, 336.50, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(638, 'SAN PASCUAL', 'ALL LOTS', 'None', 'AGRICULTURE', 'A1', 72.00, 67.18, 62.81, 57.97, 55.13, 54.69, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(639, 'SAN PASCUAL', 'ALL LOTS', 'None', 'AGRICULTURE', 'A2', 50.50, 47.12, 44.05, 40.66, 38.67, 38.36, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(640, 'SAN PASCUAL', 'ALL LOTS', 'None', 'AGRICULTURE', 'A6', 51.00, 47.58, 44.49, 41.06, 39.05, 38.74, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(641, 'SAN PASCUAL', 'ALL LOTS', 'None', 'AGRICULTURE', 'A15', 33.00, 30.79, 28.79, 26.57, 25.27, 25.07, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(642, 'SAN PASCUAL', 'ALL LOTS', 'None', 'AGRICULTURE', 'A17', 49.00, 45.72, 42.75, 39.45, 37.52, 37.22, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(643, 'SAN PASCUAL', 'ALL LOTS', 'None', 'AGRICULTURE', 'A37', 45.00, 41.99, 39.26, 36.23, 34.46, 34.18, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(644, 'SAN PASCUAL', 'ALL LOTS', 'None', 'AGRICULTURE', 'A41', 32.00, 29.86, 27.92, 25.77, 24.50, 24.31, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(645, 'SAN PASCUAL', 'ALL LOTS', 'AGRO-LIVESTOCK/POULTRY/PIGGERY', 'AGRICULTURE', 'A50', 154.00, 143.68, 134.34, 124.00, 117.92, 116.98, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(646, 'SAN RAFAEL', 'ALL LOTS', 'ALONG THE ROAD', 'COMMERCIAL', 'CR', 9575.00, 8933.48, 8352.80, 7709.63, 7331.86, 7273.21, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(647, 'SAN RAFAEL', 'MAIN ROAD', 'None', 'RESIDENTIAL', 'RR', 4475.00, 4175.18, 3903.79, 3603.20, 3426.64, 3399.23, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(648, 'SAN RAFAEL', 'ALL LOTS', 'SIDE STREETS', 'RESIDENTIAL', 'RR', 2075.00, 1935.98, 1810.14, 1670.76, 1588.89, 1576.18, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(649, 'SAN RAFAEL', 'ALL LOTS', 'None', 'AGRICULTURE', 'A1', 89.00, 83.04, 77.64, 71.66, 68.15, 67.60, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(650, 'SAN RAFAEL', 'ALL LOTS', 'None', 'AGRICULTURE', 'A2', 63.00, 58.78, 54.96, 50.73, 48.24, 47.86, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(651, 'SAN RAFAEL', 'ALL LOTS', 'None', 'AGRICULTURE', 'A6', 72.00, 67.18, 62.81, 57.97, 55.13, 54.69, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(652, 'SAN RAFAEL', 'ALL LOTS', 'None', 'AGRICULTURE', 'A15', 33.00, 30.79, 28.79, 26.57, 25.27, 25.07, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(653, 'SAN RAFAEL', 'ALL LOTS', 'None', 'AGRICULTURE', 'A17', 53.00, 49.45, 46.23, 42.67, 40.58, 40.26, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(654, 'SAN RAFAEL', 'ALL LOTS', 'None', 'AGRICULTURE', 'A37', 47.00, 43.85, 41.00, 37.84, 35.99, 35.70, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(655, 'SAN RAFAEL', 'ALL LOTS', 'None', 'AGRICULTURE', 'A41', 32.00, 29.86, 27.92, 25.77, 24.50, 24.31, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(656, 'SAN RAFAEL', 'ALL LOTS', 'AGRO-LIVESTOCK/POULTRY/PIGGERY', 'AGRICULTURE', 'A50', 101.00, 94.23, 88.11, 81.32, 77.34, 76.72, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(657, 'SAN RAFAEL', 'DON BENITO SUBD.', 'None', 'RESIDENTIAL', 'RR', 3010.00, 2808.33, 2625.79, 2423.60, 2304.85, 2286.41, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(658, 'SAN RAFAEL', 'FELOMINA VILL. PHASE I', 'PHASE I', 'RESIDENTIAL', 'RR', 3495.00, 3260.84, 3048.88, 2814.12, 2676.23, 2654.82, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(659, 'SAN RAFAEL', 'FELOMINA VILL. PHASE II', 'PHASE II', 'RESIDENTIAL', 'RR', 2545.00, 2374.49, 2220.14, 2049.19, 1948.78, 1933.19, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(660, 'SAN RAFAEL', 'NORTHERN HILLS', 'None', 'RESIDENTIAL', 'RR', 3025.00, 2822.33, 2638.87, 2435.68, 2316.33, 2297.80, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(661, 'SAN RAFAEL', 'RED CROSS VILLAGE', 'None', 'RESIDENTIAL', 'RR', 3070.00, 2864.31, 2678.13, 2471.91, 2350.79, 2331.98, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(662, 'SAN RAFAEL', 'STA. MONICA', 'None', 'COMMERCIAL', 'CR', 9575.00, 8933.48, 8352.80, 7709.63, 7331.86, 7273.21, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(663, 'SAN RAFAEL', 'STA. MONICA', 'None', 'RESIDENTIAL', 'RR', 2985.00, 2785.01, 2603.98, 2403.47, 2285.70, 2267.42, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(664, 'SAN RAFAEL', 'ST. FRANCIS HOME', 'None', 'RESIDENTIAL', 'RR', 3195.00, 2980.94, 2787.17, 2572.56, 2446.51, 2426.93, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(665, 'SAN RAFAEL', 'VILLA LOURDES (JECCA)', 'None', 'RESIDENTIAL', 'RR', 3010.00, 2808.33, 2625.79, 2423.60, 2304.85, 2286.41, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(666, 'SAN RAFAEL', 'ALLIED CITY ESTATE', 'None', 'RESIDENTIAL', 'RR', 2742.50, 2558.75, 2392.43, 2208.22, 2100.01, 2083.21, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(667, 'SAN RAFAEL', 'CHRISTOPHER FLORENCIO GOCOCO SUBD', 'None', 'RESIDENTIAL', 'RR', 2100.00, 1959.30, 1831.95, 1690.89, 1608.03, 1595.17, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(668, 'SAN RAFAEL', 'FIESTA COMMUNITIES', 'None', 'COMMERCIAL', 'CR', 4995.00, 4660.34, 4357.41, 4021.89, 3824.82, 3794.22, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(669, 'SAN RAFAEL', 'FIESTA COMMUNITIES', 'None', 'RESIDENTIAL', 'RR', 3240.00, 3022.92, 2826.43, 2608.80, 2480.96, 2461.12, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(670, 'SAN RAFAEL', 'JESUS CANO SHUA', 'None', 'RESIDENTIAL', 'RR', 3010.00, 2808.33, 2625.79, 2423.60, 2304.85, 2286.41, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(671, 'SAN RAFAEL', 'L.T.A. LANDING/HOMESITE', 'None', 'RESIDENTIAL', 'RR', 2075.00, 1935.98, 1810.14, 1670.76, 1588.89, 1576.18, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(672, 'SAN RAFAEL', 'SAINT MICHEAL SUBD', 'None', 'RESIDENTIAL', 'RR', 3195.00, 2980.94, 2787.17, 2572.56, 2446.51, 2426.93, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(673, 'SAN RAFAEL', 'TARVET', 'None', 'RESIDENTIAL', 'RR', 2075.00, 1935.98, 1810.14, 1670.76, 1588.89, 1576.18, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(674, 'SAN RAFAEL', 'VICTORIO SOLIMAN COMPOUND', 'None', 'RESIDENTIAL', 'RR', 1500.00, 1399.50, 1308.53, 1207.78, 1148.59, 1139.41, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(675, 'SAN ROQUE', 'ALL LOTS', 'ZAMORA ST.', 'COMMERCIAL', 'CR', 11320.00, 10561.56, 9875.06, 9114.68, 8668.06, 8598.72, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(676, 'SAN ROQUE', 'MAIN ROAD', 'FRONTAL', 'RESIDENTIAL', 'RR', 6000.00, 5598.00, 5234.13, 4831.10, 4594.38, 4557.62, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(677, 'SAN ROQUE', 'ALL LOTS', 'INTERIOR', 'RESIDENTIAL', 'RR', 3750.00, 3498.75, 3271.33, 3019.44, 2871.49, 2848.51, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(678, 'SAN ROQUE', 'CAPITOL GARDENS', 'None', 'RESIDENTIAL', 'RR', 3500.00, 3265.50, 3053.24, 2818.14, 2680.05, 2658.61, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(679, 'SAN ROQUE', 'FRIENDSHIP (BJRC)', 'None', 'RESIDENTIAL', 'RR', 3055.00, 2850.32, 2665.04, 2459.84, 2339.30, 2320.59, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(680, 'SAN ROQUE', 'MAGNA GARDEN SUBD.', 'None', 'RESIDENTIAL', 'RR', 3230.00, 3013.59, 2817.71, 2600.74, 2473.31, 2453.52, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(681, 'SAN ROQUE', 'PARADISE SUBD.', 'None', 'RESIDENTIAL', 'RR', 3000.00, 2799.00, 2617.07, 2415.55, 2297.19, 2278.81, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(682, 'SAN ROQUE', 'FIL. CHINESE FRIENDSHIP VILLAGE', 'None', 'RESIDENTIAL', 'RR', 3575.00, 3335.48, 3118.67, 2878.53, 2737.48, 2715.58, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(683, 'SAN ROQUE', 'PILAR HILL', 'None', 'RESIDENTIAL', 'RR', 3140.00, 2929.62, 2739.19, 2528.28, 2404.39, 2385.16, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(684, 'SAN ROQUE', 'ROSARIO GARDEN VILLE', 'None', 'RESIDENTIAL', 'RR', 3095.00, 2887.64, 2699.94, 2492.04, 2369.93, 2350.97, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(685, 'SAN SEBASTIAN', 'MC ARTHUR HIGHWAY', 'MC ARTHUR HIGHWAY', 'COMMERCIAL', 'CR', 13000.00, 12129.00, 11340.62, 10467.39, 9954.49, 9874.85, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(686, 'SAN SEBASTIAN', 'ALL LOTS', 'None', 'RESIDENTIAL', 'RR', 7210.00, 6726.93, 6289.68, 5805.37, 5520.91, 5476.74, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(687, 'SAN SEBASTIAN', 'ALL LOTS', 'INTERIOR', 'COMMERCIAL', 'CR', 7210.00, 6726.93, 6289.68, 5805.37, 5520.91, 5476.74, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(688, 'SAN SEBASTIAN', 'ALL LOTS', 'None', 'INDUSTRIAL', 'I', 13000.00, 12129.00, 11340.62, 10467.39, 9954.49, 9874.85, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(689, 'SAN SEBASTIAN', 'ALL LOTS', 'None', 'AGRICULTURE', 'A1', 111.00, 103.56, 96.83, 89.38, 85.00, 84.32, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(690, 'SAN SEBASTIAN', 'ALL LOTS', 'None', 'AGRICULTURE', 'A2', 82.00, 76.51, 71.53, 66.03, 62.79, 62.29, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(691, 'SAN SEBASTIAN', 'ALL LOTS', 'None', 'AGRICULTURE', 'A6', 107.00, 99.83, 93.34, 86.15, 81.93, 81.28, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(692, 'SAN SEBASTIAN', 'ALL LOTS', 'None', 'AGRICULTURE', 'A15', 33.00, 30.79, 28.79, 26.57, 25.27, 25.07, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(693, 'SAN SEBASTIAN', 'ALL LOTS', 'None', 'AGRICULTURE', 'A17', 81.00, 75.57, 70.66, 65.22, 62.02, 61.53, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(694, 'SAN SEBASTIAN', 'ALL LOTS', 'None', 'AGRICULTURE', 'A37', 61.00, 56.91, 53.21, 49.12, 46.71, 46.34, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(695, 'SAN SEBASTIAN', 'ALL LOTS', 'None', 'AGRICULTURE', 'A41', 37.00, 34.52, 32.28, 29.79, 28.33, 28.11, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(696, 'SAN SEBASTIAN', 'ALL LOTS', 'AGRO-LIVESTOCK/POULTRY/PIGGERY', 'AGRICULTURE', 'A50', 125.00, 116.63, 109.04, 100.65, 95.72, 94.95, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(697, 'SAN SEBASTIAN', 'NINAS VILLE SUBD.', 'None', 'RESIDENTIAL', 'RR', 3620.00, 3377.46, 3157.93, 2914.76, 2771.94, 2749.77, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(698, 'SAN SEBASTIAN', 'ROWLAND SUBD.', 'None', 'RESIDENTIAL', 'RR', 3825.00, 3568.73, 3336.76, 3079.83, 2928.92, 2905.48, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(699, 'SAN SEBASTIAN', 'SAN SEBASTIAN VILL. GATE I', 'None', 'RESIDENTIAL', 'RR', 4120.00, 3843.96, 3594.10, 3317.36, 3154.81, 3129.57, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(700, 'SAN SEBASTIAN', 'SAN SEBASTIAN VILL. GATE II', 'None', 'RESIDENTIAL', 'RR', 4120.00, 3843.96, 3594.10, 3317.36, 3154.81, 3129.57, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(701, 'SAN SEBASTIAN', 'SAN SEBASTIAN VILL. GATE III', 'None', 'RESIDENTIAL', 'RR', 4120.00, 3843.96, 3594.10, 3317.36, 3154.81, 3129.57, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(702, 'SAN SEBASTIAN', 'SAN SEBASTIAN VILL - PHASE I', 'None', 'RESIDENTIAL', 'RR', 3575.00, 3335.48, 3118.67, 2878.53, 2737.48, 2715.58, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(703, 'SAN SEBASTIAN', 'SAN SEBASTIAN VILL - PHASE II', 'None', 'RESIDENTIAL', 'RR', 3575.00, 3335.48, 3118.67, 2878.53, 2737.48, 2715.58, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(704, 'SAN SEBASTIAN', 'BY PASS ROAD', 'None', 'COMMERCIAL', 'CR', 13000.00, 12129.00, 11340.62, 10467.39, 9954.49, 9874.85, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(705, 'SAN VICENTE', 'ROMULO BLVD.', 'ROMULO BLVD.', 'COMMERCIAL', 'CR', 12500.00, 11662.50, 10904.44, 10064.80, 9571.62, 9495.05, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(706, 'SAN VICENTE', 'MACABULOS DRIVE', 'MACABULOS DRIVE', 'COMMERCIAL', 'CR', 9600.00, 8956.80, 8374.61, 7729.76, 7351.00, 7292.20, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(707, 'SAN VICENTE', 'ALL LOTS', 'INTERIOR (SIDE STREETS)', 'RESIDENTIAL', 'RR', 3665.00, 3419.45, 3197.18, 2951.00, 2806.40, 2783.95, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(708, 'SAN VICENTE', 'RAMOS ST.', 'RAMOS ST. & NEARBY SIDE STS.', 'RESIDENTIAL', 'RR', 3665.00, 3419.45, 3197.18, 2951.00, 2806.40, 2783.95, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(709, 'SAN VICENTE', 'MACABULOS ST.', 'MACABULOS ST.', 'RESIDENTIAL', 'RR', 3665.00, 3419.45, 3197.18, 2951.00, 2806.40, 2783.95, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(710, 'SAN VICENTE', 'CHAMPACA ST.', 'CHAMPACA ST.', 'COMMERCIAL', 'CR', 9600.00, 8956.80, 8374.61, 7729.76, 7351.00, 7292.20, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(711, 'SAN VICENTE', 'CHAMPACA ST.', 'CHAMPACA ST.', 'RESIDENTIAL', 'RR', 3635.00, 3391.46, 3171.01, 2926.84, 2783.43, 2761.16, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(712, 'SAN VICENTE', 'HOSPITAL DRIVE', 'HOSPITAL DRIVE', 'COMMERCIAL', 'CR', 9600.00, 8956.80, 8374.61, 7729.76, 7351.00, 7292.20, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(713, 'SAN VICENTE', 'ALL LOTS', 'None', 'AGRICULTURE', 'A1', 95.00, 88.64, 82.87, 76.49, 72.74, 72.16, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(714, 'SAN VICENTE', 'ALL LOTS', 'None', 'AGRICULTURE', 'A2', 65.00, 60.65, 56.70, 52.34, 49.77, 49.37, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(715, 'SAN VICENTE', 'ALL LOTS', 'None', 'AGRICULTURE', 'A6', 73.00, 68.11, 63.68, 58.78, 55.90, 55.45, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(716, 'SAN VICENTE', 'ALL LOTS', 'None', 'AGRICULTURE', 'A15', 39.00, 36.39, 34.02, 31.40, 29.86, 29.62, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(717, 'SAN VICENTE', 'ALL LOTS', 'None', 'AGRICULTURE', 'A17', 57.00, 53.18, 49.72, 45.90, 43.65, 43.30, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(718, 'SAN VICENTE', 'ALL LOTS', 'None', 'AGRICULTURE', 'A37', 49.00, 45.72, 42.75, 39.45, 37.52, 37.22, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(719, 'SAN VICENTE', 'ALL LOTS', 'None', 'AGRICULTURE', 'A41', 31.00, 28.92, 27.04, 24.96, 23.74, 23.55, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(720, 'SAN VICENTE', 'ALL LOTS', 'AGRO-LIVESTOCK/POULTRY/PIGGERY', 'AGRICULTURE', 'A50', 107.00, 99.83, 93.34, 86.15, 81.93, 81.28, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(721, 'SAN VICENTE', 'CAPITOL VILLAS', 'None', 'RESIDENTIAL', 'RR', 3285.00, 3064.91, 2865.69, 2645.03, 2515.42, 2495.30, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(722, 'SAN VICENTE', 'CAPITOL VILLAS', 'SOCIALIZE/INTERIOR', 'RESIDENTIAL', 'RR', 2825.00, 2635.73, 2464.40, 2274.64, 2163.19, 2145.88, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(723, 'SAN VICENTE', 'FAIRLANE', 'None', 'COMMERCIAL', 'CR', 11320.00, 10561.56, 9875.06, 9114.68, 8668.06, 8598.72, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(724, 'SAN VICENTE', 'FAIRLANE MAIN STREET', 'ALONG MAIN STREET', 'RESIDENTIAL', 'RR', 4100.00, 3825.30, 3576.66, 3301.25, 3139.49, 3114.38, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(725, 'SAN VICENTE', 'FAIRLANE', 'SIDE STREET', 'RESIDENTIAL', 'RR', 3530.00, 3293.49, 3079.41, 2842.30, 2703.03, 2681.40, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(726, 'SAN VICENTE', 'SAN VICENTE HILLS/JOEMAC SUBD.', 'None', 'RESIDENTIAL', 'RR', 2560.00, 2388.48, 2233.23, 2061.27, 1960.27, 1944.59, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(727, 'SAN VICENTE', 'MAGSAYSAY SUBD.', 'None', 'RESIDENTIAL', 'RR', 2485.00, 2318.51, 2167.80, 2000.88, 1902.84, 1887.62, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(728, 'SAN VICENTE', 'OLIVIAN VILLE', 'None', 'RESIDENTIAL', 'RR', 2540.00, 2369.82, 2215.78, 2045.17, 1944.95, 1929.39, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(729, 'SAN VICENTE', 'SAN SEBASTIAN HEIGHTS', 'None', 'RESIDENTIAL', 'RR', 3100.00, 2892.30, 2704.30, 2496.07, 2373.76, 2354.77, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(730, 'SAN VICENTE', 'ST. DOMINIC VILLAGE', 'None', 'RESIDENTIAL', 'RR', 3100.00, 2892.30, 2704.30, 2496.07, 2373.76, 2354.77, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(731, 'SAN VICENTE', 'SOUTH PLAINS SUBD', 'None', 'RESIDENTIAL', 'RR', 3350.00, 3125.55, 2922.39, 2697.37, 2565.19, 2544.67, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(732, 'SAN VICENTE', 'VILLA PILAR SUBD.', 'None', 'RESIDENTIAL', 'RR', 3350.00, 3125.55, 2922.39, 2697.37, 2565.19, 2544.67, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(733, 'SAN VICENTE', 'VILLA ZARRAGA SUBD.', 'None', 'RESIDENTIAL', 'RR', 3350.00, 3125.55, 2922.39, 2697.37, 2565.19, 2544.67, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(734, 'SAN VICENTE', 'GEORGE L. PARKS', 'None', 'RESIDENTIAL', 'RR', 2850.00, 2659.05, 2486.21, 2294.77, 2182.33, 2164.87, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(735, 'SAN VICENTE', 'POLICE KALINGA', 'SOCIALIZE HOUSING', 'RESIDENTIAL', 'RR', 1850.00, 1726.05, 1613.86, 1489.59, 1416.60, 1405.27, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(736, 'SAN VICENTE', 'TARLAC CAPITOL SUBD', 'None', 'RESIDENTIAL', 'RR', 2350.00, 2192.55, 2050.03, 1892.18, 1799.46, 1785.07, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(737, 'SAN VICENTE', 'WEST COVINA HTS.', 'None', 'RESIDENTIAL', 'RR', 2350.00, 2192.55, 2050.03, 1892.18, 1799.46, 1785.07, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(738, 'SAN VICENTE', 'BY PASS ROAD', 'None', 'COMMERCIAL', 'CR', 13000.00, 12129.00, 11340.62, 10467.39, 9954.49, 9874.85, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(739, 'SAPANG MARAGUL', 'ALL LOTS', 'None', 'COMMERCIAL', 'CR', 2250.00, 2099.25, 1962.80, 1811.66, 1722.89, 1709.11, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(740, 'SAPANG MARAGUL', 'ALL LOTS', 'None', 'RESIDENTIAL', 'RR', 1100.00, 1026.30, 959.59, 885.70, 842.30, 835.56, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(741, 'SAPANG MARAGUL', 'ALL LOTS', 'None', 'AGRICULTURE', 'A1', 95.00, 88.64, 82.87, 76.49, 72.74, 72.16, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(742, 'SAPANG MARAGUL', 'ALL LOTS', 'None', 'AGRICULTURE', 'A2', 56.00, 52.25, 48.85, 45.09, 42.88, 42.54, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(743, 'SAPANG MARAGUL', 'ALL LOTS', 'None', 'AGRICULTURE', 'A3', 35.00, 32.66, 30.53, 28.18, 26.80, 26.59, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(744, 'SAPANG MARAGUL', 'ALL LOTS', 'None', 'AGRICULTURE', 'A6', 71.00, 66.24, 61.94, 57.17, 54.37, 53.93, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(745, 'SAPANG MARAGUL', 'ALL LOTS', 'None', 'AGRICULTURE', 'A15', 33.00, 30.79, 28.79, 26.57, 25.27, 25.07, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(746, 'SAPANG MARAGUL', 'ALL LOTS', 'None', 'AGRICULTURE', 'A17', 56.00, 52.25, 48.85, 45.09, 42.88, 42.54, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(747, 'SAPANG MARAGUL', 'ALL LOTS', 'None', 'AGRICULTURE', 'A37', 48.00, 44.78, 41.87, 38.65, 36.76, 36.46, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(748, 'SAPANG MARAGUL', 'ALL LOTS', 'None', 'AGRICULTURE', 'A40', 3180.00, 2966.94, 2774.09, 2560.48, 2435.02, 2415.54, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(749, 'SAPANG MARAGUL', 'ALL LOTS', 'None', 'AGRICULTURE', 'A41', 33.00, 30.79, 28.79, 26.57, 25.27, 25.07, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(750, 'SAPANG MARAGUL', 'ALL LOTS', 'AGRO-LIVESTOCK/POULTRY/PIGGERY', 'AGRICULTURE', 'A50', 103.00, 96.10, 89.85, 82.93, 78.87, 78.24, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(751, 'SAPANG MARAGUL', 'PACIFICO PARAISO SUBD', 'None', 'RESIDENTIAL', 'RR', 1750.00, 1632.75, 1526.62, 1409.07, 1340.03, 1329.31, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(752, 'SAPANG TAGALOG', 'ALL LOTS', 'ALONG MC ARTHUR HIGHWAY', 'COMMERCIAL', 'CR', 7410.00, 6913.53, 6464.15, 5966.41, 5674.06, 5628.66, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(753, 'SAPANG TAGALOG', 'ALL LOTS', 'None', 'RESIDENTIAL', 'RR', 2715.00, 2533.10, 2368.44, 2186.07, 2078.96, 2062.32, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(754, 'SAPANG TAGALOG', 'ALL LOTS', 'None', 'AGRICULTURE', 'A1', 80.00, 74.64, 69.79, 64.41, 61.26, 60.77, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(755, 'SAPANG TAGALOG', 'ALL LOTS', 'None', 'AGRICULTURE', 'A2', 62.00, 57.85, 54.09, 49.92, 47.48, 47.10, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(756, 'SAPANG TAGALOG', 'ALL LOTS', 'None', 'AGRICULTURE', 'A3', 34.00, 31.72, 29.66, 27.38, 26.03, 25.83, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(757, 'SAPANG TAGALOG', 'ALL LOTS', 'None', 'AGRICULTURE', 'A6', 74.00, 69.04, 64.55, 59.58, 56.66, 56.21, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(758, 'SAPANG TAGALOG', 'ALL LOTS', 'None', 'AGRICULTURE', 'A15', 33.00, 30.79, 28.79, 26.57, 25.27, 25.07, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(759, 'SAPANG TAGALOG', 'ALL LOTS', 'None', 'AGRICULTURE', 'A17', 54.00, 50.38, 47.11, 43.48, 41.35, 41.02, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(760, 'SAPANG TAGALOG', 'ALL LOTS', 'None', 'AGRICULTURE', 'A37', 50.00, 46.65, 43.62, 40.26, 38.29, 37.98, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(761, 'SAPANG TAGALOG', 'ALL LOTS', 'None', 'AGRICULTURE', 'A41', 36.00, 33.59, 31.40, 28.99, 27.57, 27.35, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(762, 'SAPANG TAGALOG', 'ALL LOTS', 'AGRO-LIVESTOCK/POULTRY/PIGGERY', 'AGRICULTURE', 'A50', 89.00, 83.04, 77.64, 71.66, 68.15, 67.60, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(763, 'SAPANG TAGALOG', 'HACIENDA GUITAN', 'None', 'RESIDENTIAL', 'RR', 2250.00, 2099.25, 1962.80, 1811.66, 1722.89, 1709.11, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(764, 'SEPUNG CALZADA', 'ALL LOTS', 'MAC ARTHUR HIGHWAY', 'COMMERCIAL', 'CR', 19475.00, 18170.18, 16989.11, 15680.95, 14912.59, 14793.28, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(765, 'SEPUNG CALZADA', 'MAIN ROAD', 'FRONTAL', 'RESIDENTIAL', 'RR', 5828.00, 5437.52, 5084.08, 4692.61, 4462.67, 4426.97, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(766, 'SEPUNG CALZADA', 'ALL LOTS', 'INTERIOR', 'RESIDENTIAL', 'RR', 2430.00, 2267.19, 2119.82, 1956.60, 1860.72, 1845.84, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(767, 'SEPUNG CALZADA', 'ALL LOTS', 'None', 'AGRICULTURE', 'A1', 70.00, 65.31, 61.06, 56.36, 53.60, 53.17, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(768, 'SEPUNG CALZADA', 'ALL LOTS', 'None', 'AGRICULTURE', 'A2', 50.00, 46.65, 43.62, 40.26, 38.29, 37.98, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(769, 'SEPUNG CALZADA', 'ALL LOTS', 'None', 'AGRICULTURE', 'A3', 34.00, 31.72, 29.66, 27.38, 26.03, 25.83, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(770, 'SEPUNG CALZADA', 'ALL LOTS', 'None', 'AGRICULTURE', 'A6', 52.00, 48.52, 45.36, 41.87, 39.82, 39.50, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(771, 'SEPUNG CALZADA', 'ALL LOTS', 'None', 'AGRICULTURE', 'A15', 33.00, 30.79, 28.79, 26.57, 25.27, 25.07, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(772, 'SEPUNG CALZADA', 'ALL LOTS', 'None', 'AGRICULTURE', 'A17', 49.00, 45.72, 42.75, 39.45, 37.52, 37.22, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(773, 'SEPUNG CALZADA', 'ALL LOTS', 'None', 'AGRICULTURE', 'A37', 46.00, 42.92, 40.13, 37.04, 35.22, 34.94, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(774, 'SEPUNG CALZADA', 'ALL LOTS', 'None', 'AGRICULTURE', 'A41', 32.00, 29.86, 27.92, 25.77, 24.50, 24.31, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(775, 'SEPUNG CALZADA', 'ALL LOTS', 'AGRO-LIVESTOCK/POULTRY/PIGGERY', 'AGRICULTURE', 'A50', 68.00, 63.44, 59.32, 54.75, 52.07, 51.65, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(776, 'SEPUNG CALZADA', 'ROSEMONT EXECUTIVE VILAGE / FILINVEST LAND INC', 'None', 'RESIDENTIAL', 'RR', 2850.00, 2659.05, 2486.21, 2294.77, 2182.33, 2164.87, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(777, 'SEPUNG CALZADA', 'VILLA SOLIMAN', 'None', 'RESIDENTIAL', 'RR', 2660.00, 2481.78, 2320.46, 2141.79, 2036.84, 2020.55, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(778, 'SINAIT', 'ALL LOTS', 'None', 'RESIDENTIAL', 'RR', 525.00, 489.83, 457.99, 422.72, 402.01, 398.79, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(779, 'SINAIT', 'ALL LOTS', 'None', 'AGRICULTURE', 'A1', 72.00, 67.18, 62.81, 57.97, 55.13, 54.69, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(780, 'SINAIT', 'ALL LOTS', 'None', 'AGRICULTURE', 'A2', 50.00, 46.65, 43.62, 40.26, 38.29, 37.98, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(781, 'SINAIT', 'ALL LOTS', 'None', 'AGRICULTURE', 'A3', 34.00, 31.72, 29.66, 27.38, 26.03, 25.83, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(782, 'SINAIT', 'ALL LOTS', 'None', 'AGRICULTURE', 'A6', 59.00, 55.05, 51.47, 47.51, 45.18, 44.82, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(783, 'SINAIT', 'ALL LOTS', 'None', 'AGRICULTURE', 'A15', 33.00, 30.79, 28.79, 26.57, 25.27, 25.07, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(784, 'SINAIT', 'ALL LOTS', 'None', 'AGRICULTURE', 'A17', 49.00, 45.72, 42.75, 39.45, 37.52, 37.22, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(785, 'SINAIT', 'ALL LOTS', 'None', 'AGRICULTURE', 'A37', 46.00, 42.92, 40.13, 37.04, 35.22, 34.94, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(786, 'SINAIT', 'ALL LOTS', 'None', 'AGRICULTURE', 'A41', 32.00, 29.86, 27.92, 25.77, 24.50, 24.31, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(787, 'SINAIT', 'ALL LOTS', 'AGRO-LIVESTOCK/POULTRY/PIGGERY', 'AGRICULTURE', 'A50', 275.00, 256.58, 239.90, 221.43, 210.58, 208.89, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(788, 'SINAIT', 'ALL LOTS', 'None', 'AGRICULTURE', 'A50', 32.00, 29.86, 27.92, 25.77, 24.50, 24.31, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(789, 'SINAIT', 'ALL LOTS', 'None', 'INDUSTRIAL', 'I', 300.00, 279.90, 261.71, 241.56, 229.72, 227.88, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(790, 'STA. CRUZ', 'ALL LOTS', 'ALONG MC ARTHUR HIGHWAY', 'COMMERCIAL', 'CR', 4425.00, 4128.53, 3860.17, 3562.94, 3388.35, 3361.25, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(791, 'STA. CRUZ', 'MAIN ROAD', 'None', 'RESIDENTIAL', 'RR', 2440.00, 2276.52, 2128.55, 1964.65, 1868.38, 1853.43, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(792, 'STA. CRUZ', 'ALL LOTS', 'INTERIOR', 'RESIDENTIAL', 'RR', 888.00, 828.50, 774.65, 715.00, 679.97, 674.53, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(793, 'STA. CRUZ', 'ALL LOTS', 'None', 'AGRICULTURE', 'A1', 80.00, 74.64, 69.79, 64.41, 61.26, 60.77, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(794, 'STA. CRUZ', 'ALL LOTS', 'None', 'AGRICULTURE', 'A2', 62.00, 57.85, 54.09, 49.92, 47.48, 47.10, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(795, 'STA. CRUZ', 'ALL LOTS', 'None', 'AGRICULTURE', 'A6', 70.00, 65.31, 61.06, 56.36, 53.60, 53.17, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(796, 'STA. CRUZ', 'ALL LOTS', 'None', 'AGRICULTURE', 'A15', 36.00, 33.59, 31.40, 28.99, 27.57, 27.35, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(797, 'STA. CRUZ', 'ALL LOTS', 'None', 'AGRICULTURE', 'A17', 53.00, 49.45, 46.23, 42.67, 40.58, 40.26, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(798, 'STA. CRUZ', 'ALL LOTS', 'None', 'AGRICULTURE', 'A37', 49.00, 45.72, 42.75, 39.45, 37.52, 37.22, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(799, 'STA. CRUZ', 'ALL LOTS', 'None', 'AGRICULTURE', 'A41', 32.00, 29.86, 27.92, 25.77, 24.50, 24.31, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(800, 'STA. CRUZ', 'ALL LOTS', 'AGRO-LIVESTOCK/POULTRY/PIGGERY', 'AGRICULTURE', 'A50', 206.00, 192.20, 179.71, 165.87, 157.74, 156.48, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(801, 'STA. CRUZ', 'ROBERT CARLOS M/ TO LUCIA MAGBAG', 'None', 'RESIDENTIAL', 'RR', 2415.00, 2253.20, 2106.74, 1944.52, 1849.24, 1834.44, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(802, 'STA. CRUZ', 'VILLA STO. NINO', 'None', 'RESIDENTIAL', 'RR', 2250.00, 2099.25, 1962.80, 1811.66, 1722.89, 1709.11, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(803, 'STA. MARIA', 'ALL LOTS', 'None', 'RESIDENTIAL', 'RR', 528.00, 492.62, 460.60, 425.14, 404.31, 401.07, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(804, 'STA. MARIA', 'ALL LOTS', 'None', 'AGRICULTURE', 'A1', 72.00, 67.18, 62.81, 57.97, 55.13, 54.69, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(805, 'STA. MARIA', 'ALL LOTS', 'None', 'AGRICULTURE', 'A2', 50.00, 46.65, 43.62, 40.26, 38.29, 37.98, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(806, 'STA. MARIA', 'ALL LOTS', 'None', 'AGRICULTURE', 'A3', 32.00, 29.86, 27.92, 25.77, 24.50, 24.31, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(807, 'STA. MARIA', 'ALL LOTS', 'None', 'AGRICULTURE', 'A6', 59.00, 55.05, 51.47, 47.51, 45.18, 44.82, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(808, 'STA. MARIA', 'ALL LOTS', 'None', 'AGRICULTURE', 'A15', 33.00, 30.79, 28.79, 26.57, 25.27, 25.07, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(809, 'STA. MARIA', 'ALL LOTS', 'None', 'AGRICULTURE', 'A17', 50.00, 46.65, 43.62, 40.26, 38.29, 37.98, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(810, 'STA. MARIA', 'ALL LOTS', 'None', 'AGRICULTURE', 'A37', 47.00, 43.85, 41.00, 37.84, 35.99, 35.70, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(811, 'STA. MARIA', 'ALL LOTS', 'None', 'AGRICULTURE', 'A41', 32.00, 29.86, 27.92, 25.77, 24.50, 24.31, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(812, 'STA. MARIA', 'ALL LOTS', 'AGRO-LIVESTOCK/POULTRY/PIGGERY', 'AGRICULTURE', 'A50', 80.00, 74.64, 69.79, 64.41, 61.26, 60.77, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(813, 'STO. CRISTO', 'ALL LOTS', 'DEL PILAR-MC. ARTHUR HIGHWAY', 'COMMERCIAL', 'CR', 15500.00, 14461.50, 13521.50, 12480.35, 11868.81, 11773.86, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(814, 'STO. CRISTO', 'MAIN ROAD', 'None', 'RESIDENTIAL', 'RR', 6325.00, 5901.23, 5517.65, 5092.79, 4843.24, 4804.49, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(815, 'STO. CRISTO', 'ALL LOTS', 'INTERIOR', 'RESIDENTIAL', 'RR', 3325.00, 3102.23, 2900.58, 2677.24, 2546.05, 2525.68, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(816, 'STO. CRISTO', 'BLOSSOMVILLE', 'None', 'RESIDENTIAL', 'RR', 3890.00, 3629.37, 3393.46, 3132.16, 2978.69, 2954.86, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(817, 'STO. CRISTO', 'ARSENIA URQUICO DEL ROSARIO SUBD', 'None', 'RESIDENTIAL', 'RR', 3720.00, 3470.76, 3245.16, 2995.28, 2848.51, 2825.73, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(818, 'STO. CRISTO', 'SERVILLANO AQUINO ET AL SUBD', 'None', 'RESIDENTIAL', 'RR', 3820.00, 3564.06, 3332.40, 3075.80, 2925.09, 2901.69, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(819, 'STO. CRISTO', 'URQUICO SUBD', 'None', 'RESIDENTIAL', 'RR', 3820.00, 3564.06, 3332.40, 3075.80, 2925.09, 2901.69, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(820, 'STO. DOMINGO', 'ALL LOTS', 'None', 'RESIDENTIAL', 'RR', 498.00, 464.63, 434.43, 400.98, 381.33, 378.28, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(821, 'STO. DOMINGO', 'ALL LOTS', 'None', 'AGRICULTURE', 'A1', 68.00, 63.44, 59.32, 54.75, 52.07, 51.65, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(822, 'STO. DOMINGO', 'ALL LOTS', 'None', 'AGRICULTURE', 'A2', 50.00, 46.65, 43.62, 40.26, 38.29, 37.98, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(823, 'STO. DOMINGO', 'ALL LOTS', 'None', 'AGRICULTURE', 'A3', 34.00, 31.72, 29.66, 27.38, 26.03, 25.83, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(824, 'STO. DOMINGO', 'ALL LOTS', 'None', 'AGRICULTURE', 'A6', 78.00, 72.77, 68.04, 62.80, 59.73, 59.25, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(825, 'STO. DOMINGO', 'ALL LOTS', 'None', 'AGRICULTURE', 'A15', 31.00, 28.92, 27.04, 24.96, 23.74, 23.55, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(826, 'STO. DOMINGO', 'ALL LOTS', 'None', 'AGRICULTURE', 'A17', 43.00, 40.12, 37.51, 34.62, 32.93, 32.66, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(827, 'STO. DOMINGO', 'ALL LOTS', 'None', 'AGRICULTURE', 'A37', 46.00, 42.92, 40.13, 37.04, 35.22, 34.94, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(828, 'STO. DOMINGO', 'ALL LOTS', 'None', 'AGRICULTURE', 'A41', 32.00, 29.86, 27.92, 25.77, 24.50, 24.31, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(829, 'STO. DOMINGO', 'ALL LOTS', 'AGRO-LIVESTOCK/POULTRY/PIGGERY', 'AGRICULTURE', 'A50', 142.00, 132.49, 123.87, 114.34, 108.73, 107.86, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(830, 'STO. NINO', 'ALL LOTS', 'None', 'RESIDENTIAL', 'RR', 700.00, 653.10, 610.65, 563.63, 536.01, 531.72, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(831, 'STO. NINO', 'ALL LOTS', 'None', 'AGRICULTURE', 'A1', 72.00, 67.18, 62.81, 57.97, 55.13, 54.69, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(832, 'STO. NINO', 'ALL LOTS', 'None', 'AGRICULTURE', 'A2', 56.00, 52.25, 48.85, 45.09, 42.88, 42.54, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(833, 'STO. NINO', 'ALL LOTS', 'None', 'AGRICULTURE', 'A3', 45.00, 41.99, 39.26, 36.23, 34.46, 34.18, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(834, 'STO. NINO', 'ALL LOTS', 'None', 'AGRICULTURE', 'A6', 57.00, 53.18, 49.72, 45.90, 43.65, 43.30, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(835, 'STO. NINO', 'ALL LOTS', 'None', 'AGRICULTURE', 'A15', 31.00, 28.92, 27.04, 24.96, 23.74, 23.55, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(836, 'STO. NINO', 'ALL LOTS', 'None', 'AGRICULTURE', 'A17', 49.00, 45.72, 42.75, 39.45, 37.52, 37.22, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(837, 'STO. NINO', 'ALL LOTS', 'None', 'AGRICULTURE', 'A37', 46.00, 42.92, 40.13, 37.04, 35.22, 34.94, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(838, 'STO. NINO', 'ALL LOTS', 'None', 'AGRICULTURE', 'A41', 34.00, 31.72, 29.66, 27.38, 26.03, 25.83, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(839, 'STO. NINO', 'ALL LOTS', 'AGRO-LIVESTOCK/POULTRY/PIGGERY', 'AGRICULTURE', 'A50', 198.00, 184.73, 172.73, 159.43, 151.61, 150.40, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(840, 'SUIZO', 'ALL LOTS', 'None', 'RESIDENTIAL', 'RR', 973.00, 907.81, 848.80, 783.44, 745.05, 739.09, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(841, 'SUIZO', 'ALL LOTS', 'None', 'AGRICULTURE', 'A1', 82.00, 76.51, 71.53, 66.03, 62.79, 62.29, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(842, 'SUIZO', 'ALL LOTS', 'None', 'AGRICULTURE', 'A2', 54.00, 50.38, 47.11, 43.48, 41.35, 41.02, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(843, 'SUIZO', 'ALL LOTS', 'None', 'AGRICULTURE', 'A3', 34.00, 31.72, 29.66, 27.38, 26.03, 25.83, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(844, 'SUIZO', 'ALL LOTS', 'None', 'AGRICULTURE', 'A6', 64.00, 59.71, 55.83, 51.53, 49.01, 48.61, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(845, 'SUIZO', 'ALL LOTS', 'None', 'AGRICULTURE', 'A15', 31.00, 28.92, 27.04, 24.96, 23.74, 23.55, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(846, 'SUIZO', 'ALL LOTS', 'None', 'AGRICULTURE', 'A17', 55.00, 51.32, 47.98, 44.29, 42.12, 41.78, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(847, 'SUIZO', 'ALL LOTS', 'None', 'AGRICULTURE', 'A37', 49.00, 45.72, 42.75, 39.45, 37.52, 37.22, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(848, 'SUIZO', 'ALL LOTS', 'None', 'AGRICULTURE', 'A41', 32.00, 29.86, 27.92, 25.77, 24.50, 24.31, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(849, 'SUIZO', 'ALL LOTS', 'AGRO-LIVESTOCK/POULTRY/PIGGERY', 'AGRICULTURE', 'A50', 231.00, 215.52, 201.51, 186.00, 176.88, 175.47, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(850, 'SUIZO', 'AURORA VILL.', 'None', 'COMMERCIAL', 'CR', 3525.00, 3288.83, 3075.05, 2838.27, 2699.20, 2677.60, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(851, 'SUIZO', 'AURORA VILL.', 'None', 'RESIDENTIAL', 'RR', 2455.00, 2290.52, 2141.63, 1976.73, 1879.87, 1864.83, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(852, 'SUIZO', 'BLISS', 'None', 'RESIDENTIAL', 'RR', 1925.00, 1796.03, 1679.28, 1549.98, 1474.03, 1462.24, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(853, 'SUIZO', 'JOSE DE LEON JOVEN', 'None', 'RESIDENTIAL', 'RR', 1925.00, 1796.03, 1679.28, 1549.98, 1474.03, 1462.24, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(854, 'SUIZO', 'RED CROSS VILLAGE', 'None', 'RESIDENTIAL', 'RR', 1925.00, 1796.03, 1679.28, 1549.98, 1474.03, 1462.24, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(855, 'TARIJI', 'MAIN ROAD', 'FRONTAL', 'RESIDENTIAL', 'RR', 1183.00, 1103.74, 1032.00, 952.53, 905.86, 898.61, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(856, 'TARIJI', 'ALL LOTS', 'INTERIOR', 'RESIDENTIAL', 'RR', 313.00, 292.03, 273.05, 252.02, 239.67, 237.76, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(857, 'TARIJI', 'ALL LOTS', 'None', 'AGRICULTURE', 'A1', 80.00, 74.64, 69.79, 64.41, 61.26, 60.77, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(858, 'TARIJI', 'ALL LOTS', 'None', 'AGRICULTURE', 'A2', 56.00, 52.25, 48.85, 45.09, 42.88, 42.54, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(859, 'TARIJI', 'ALL LOTS', 'None', 'AGRICULTURE', 'A3', 42.00, 39.19, 36.64, 33.82, 32.16, 31.90, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(860, 'TARIJI', 'ALL LOTS', 'None', 'AGRICULTURE', 'A6', 60.00, 55.98, 52.34, 48.31, 45.94, 45.58, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(861, 'TARIJI', 'ALL LOTS', 'None', 'AGRICULTURE', 'A15', 33.00, 30.79, 28.79, 26.57, 25.27, 25.07, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(862, 'TARIJI', 'ALL LOTS', 'None', 'AGRICULTURE', 'A17', 50.00, 46.65, 43.62, 40.26, 38.29, 37.98, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(863, 'TARIJI', 'ALL LOTS', 'None', 'AGRICULTURE', 'A37', 46.00, 42.92, 40.13, 37.04, 35.22, 34.94, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(864, 'TARIJI', 'ALL LOTS', 'None', 'AGRICULTURE', 'A41', 32.00, 29.86, 27.92, 25.77, 24.50, 24.31, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(865, 'TARIJI', 'ALL LOTS', 'AGRO-LIVESTOCK/POULTRY/PIGGERY', 'AGRICULTURE', 'A50', 233.00, 217.39, 203.26, 187.61, 178.42, 176.99, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(866, 'TARIJI', 'TIERRA JESUSA', 'None', 'RESIDENTIAL', 'RR', 2130.00, 1987.29, 1858.12, 1715.04, 1631.00, 1617.96, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(867, 'TIBAG', 'ALL LOTS', 'ALONG THE HIGHWAY', 'COMMERCIAL', 'CR', 4295.00, 4007.24, 3746.76, 3458.26, 3288.81, 3262.50, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(868, 'TIBAG', 'MAIN ROAD', 'None', 'RESIDENTIAL', 'RR', 2280.00, 2127.24, 1988.97, 1835.82, 1745.86, 1731.90, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(869, 'TIBAG', 'ALL LOTS', 'INTERIOR', 'RESIDENTIAL', 'RR', 1265.00, 1180.25, 1103.53, 1018.56, 968.65, 960.90, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(870, 'TIBAG', 'ALL LOTS', 'None', 'AGRICULTURE', 'A1', 80.00, 74.64, 69.79, 64.41, 61.26, 60.77, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(871, 'TIBAG', 'ALL LOTS', 'None', 'AGRICULTURE', 'A2', 62.00, 57.85, 54.09, 49.92, 47.48, 47.10, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(872, 'TIBAG', 'ALL LOTS', 'None', 'AGRICULTURE', 'A3', 34.00, 31.72, 29.66, 27.38, 26.03, 25.83, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(873, 'TIBAG', 'ALL LOTS', 'None', 'AGRICULTURE', 'A6', 64.00, 59.71, 55.83, 51.53, 49.01, 48.61, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(874, 'TIBAG', 'ALL LOTS', 'None', 'AGRICULTURE', 'A15', 33.00, 30.79, 28.79, 26.57, 25.27, 25.07, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(875, 'TIBAG', 'ALL LOTS', 'None', 'AGRICULTURE', 'A17', 55.00, 51.32, 47.98, 44.29, 42.12, 41.78, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(876, 'TIBAG', 'ALL LOTS', 'None', 'AGRICULTURE', 'A37', 49.00, 45.72, 42.75, 39.45, 37.52, 37.22, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(877, 'TIBAG', 'ALL LOTS', 'None', 'AGRICULTURE', 'A40', 3555.00, 3316.82, 3101.22, 2862.43, 2722.17, 2700.39, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(878, 'TIBAG', 'ALL LOTS', 'None', 'AGRICULTURE', 'A41', 32.00, 29.86, 27.92, 25.77, 24.50, 24.31, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(879, 'TIBAG', 'ALL LOTS', 'AGRO-LIVESTOCK/POULTRY/PIGGERY', 'AGRICULTURE', 'A50', 231.00, 215.52, 201.51, 186.00, 176.88, 175.47, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(880, 'TIBAG', 'IMACULADA CONCEPCION', 'None', 'RESIDENTIAL', 'RR', 2350.00, 2192.55, 2050.03, 1892.18, 1799.46, 1785.07, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(881, 'TIBAG', 'TERESA HOMES', 'None', 'COMMERCIAL', 'CR', 4295.00, 4007.24, 3746.76, 3458.26, 3288.81, 3262.50, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(882, 'TIBAG', 'TERESA HOMES', 'None', 'RESIDENTIAL', 'RR', 2350.00, 2192.55, 2050.03, 1892.18, 1799.46, 1785.07, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(883, 'TIBAG', 'CONRADO DIAZ', 'None', 'RESIDENTIAL', 'RR', 2495.00, 2327.84, 2176.53, 2008.93, 1910.50, 1895.21, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(884, 'TIBAG', 'E. ZARRAGA', 'None', 'RESIDENTIAL', 'RR', 2500.00, 2332.50, 2180.89, 2012.96, 1914.32, 1899.01, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(885, 'TIBAG', 'ESPIRITU SANTO SUBD', 'None', 'RESIDENTIAL', 'RR', 2365.00, 2206.55, 2063.12, 1904.26, 1810.95, 1796.46, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(886, 'TIBAG', 'PAGASA SUBD', 'None', 'RESIDENTIAL', 'RR', 2320.00, 2164.56, 2023.86, 1868.03, 1776.49, 1762.28, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(887, 'TIBAGAN', 'ALL LOTS', 'None', 'RESIDENTIAL', 'RR', 650.00, 606.45, 567.03, 523.37, 497.72, 493.74, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(888, 'TIBAGAN', 'ALL LOTS', 'None', 'AGRICULTURE', 'A1', 76.00, 70.91, 66.30, 61.19, 58.20, 57.73, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(889, 'TIBAGAN', 'ALL LOTS', 'None', 'AGRICULTURE', 'A2', 56.00, 52.25, 48.85, 45.09, 42.88, 42.54, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(890, 'TIBAGAN', 'ALL LOTS', 'None', 'AGRICULTURE', 'A3', 34.00, 31.72, 29.66, 27.38, 26.03, 25.83, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(891, 'TIBAGAN', 'ALL LOTS', 'None', 'AGRICULTURE', 'A6', 57.00, 53.18, 49.72, 45.90, 43.65, 43.30, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(892, 'TIBAGAN', 'ALL LOTS', 'None', 'AGRICULTURE', 'A15', 33.00, 30.79, 28.79, 26.57, 25.27, 25.07, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(893, 'TIBAGAN', 'ALL LOTS', 'None', 'AGRICULTURE', 'A17', 50.00, 46.65, 43.62, 40.26, 38.29, 37.98, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(894, 'TIBAGAN', 'ALL LOTS', 'None', 'AGRICULTURE', 'A37', 46.00, 42.92, 40.13, 37.04, 35.22, 34.94, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30');
INSERT INTO `zonal_value` (`id`, `barangay`, `street`, `vicinity`, `property_type`, `class`, `price_2025`, `price_2024`, `price_2023`, `price_2022`, `price_2021`, `price_2020`, `data_source`, `is_active`, `created_at`, `updated_at`) VALUES
(895, 'TIBAGAN', 'ALL LOTS', 'None', 'AGRICULTURE', 'A41', 32.00, 29.86, 27.92, 25.77, 24.50, 24.31, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(896, 'TIBAGAN', 'ALL LOTS', 'AGRO-LIVESTOCK/POULTRY/PIGGERY', 'AGRICULTURE', 'A50', 177.00, 165.14, 154.41, 142.52, 135.53, 134.45, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(897, 'TRINIDAD', 'ALL LOTS', 'None', 'RESIDENTIAL', 'RR', 448.00, 417.98, 390.82, 360.72, 343.05, 340.30, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(898, 'TRINIDAD', 'ALL LOTS', 'None', 'AGRICULTURE', 'A1', 78.00, 72.77, 68.04, 62.80, 59.73, 59.25, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(899, 'TRINIDAD', 'ALL LOTS', 'None', 'AGRICULTURE', 'A2', 58.00, 54.11, 50.60, 46.70, 44.41, 44.06, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(900, 'TRINIDAD', 'ALL LOTS', 'None', 'AGRICULTURE', 'A3', 34.00, 31.72, 29.66, 27.38, 26.03, 25.83, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(901, 'TRINIDAD', 'ALL LOTS', 'None', 'AGRICULTURE', 'A6', 56.00, 52.25, 48.85, 45.09, 42.88, 42.54, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(902, 'TRINIDAD', 'ALL LOTS', 'None', 'AGRICULTURE', 'A15', 56.00, 52.25, 48.85, 45.09, 42.88, 42.54, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(903, 'TRINIDAD', 'ALL LOTS', 'None', 'AGRICULTURE', 'A17', 50.00, 46.65, 43.62, 40.26, 38.29, 37.98, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(904, 'TRINIDAD', 'ALL LOTS', 'None', 'AGRICULTURE', 'A37', 46.00, 42.92, 40.13, 37.04, 35.22, 34.94, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(905, 'TRINIDAD', 'ALL LOTS', 'None', 'AGRICULTURE', 'A41', 32.00, 29.86, 27.92, 25.77, 24.50, 24.31, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(906, 'TRINIDAD', 'ALL LOTS', 'AGRO-LIVESTOCK/POULTRY/PIGGERY', 'AGRICULTURE', 'A50', 179.00, 167.01, 156.15, 144.13, 137.07, 135.97, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(907, 'UNGOT', 'ALL LOTS', 'None', 'RESIDENTIAL', 'RR', 808.00, 753.86, 704.86, 650.59, 618.71, 613.76, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(908, 'UNGOT', 'ALL LOTS', 'None', 'AGRICULTURE', 'A1', 80.00, 74.64, 69.79, 64.41, 61.26, 60.77, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(909, 'UNGOT', 'ALL LOTS', 'None', 'AGRICULTURE', 'A2', 54.00, 50.38, 47.11, 43.48, 41.35, 41.02, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(910, 'UNGOT', 'ALL LOTS', 'None', 'AGRICULTURE', 'A3', 34.00, 31.72, 29.66, 27.38, 26.03, 25.83, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(911, 'UNGOT', 'ALL LOTS', 'None', 'AGRICULTURE', 'A6', 64.00, 59.71, 55.83, 51.53, 49.01, 48.61, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(912, 'UNGOT', 'ALL LOTS', 'None', 'AGRICULTURE', 'A15', 56.00, 52.25, 48.85, 45.09, 42.88, 42.54, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(913, 'UNGOT', 'ALL LOTS', 'None', 'AGRICULTURE', 'A17', 55.00, 51.32, 47.98, 44.29, 42.12, 41.78, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(914, 'UNGOT', 'ALL LOTS', 'None', 'AGRICULTURE', 'A37', 49.00, 45.72, 42.75, 39.45, 37.52, 37.22, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(915, 'UNGOT', 'ALL LOTS', 'None', 'AGRICULTURE', 'A41', 32.00, 29.86, 27.92, 25.77, 24.50, 24.31, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(916, 'UNGOT', 'ALL LOTS', 'AGRO-LIVESTOCK/POULTRY/PIGGERY', 'AGRICULTURE', 'A50', 181.00, 168.87, 157.90, 145.74, 138.60, 137.49, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(917, 'UNGOT', 'GETHA SUBD', 'None', 'RESIDENTIAL', 'RR', 3245.00, 3027.59, 2830.79, 2612.82, 2484.79, 2464.91, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(918, 'VILLA BACOLOR', 'ALL LOTS', 'None', 'RESIDENTIAL', 'RR', 428.00, 399.32, 373.37, 344.62, 327.73, 325.11, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(919, 'VILLA BACOLOR', 'ALL LOTS', 'None', 'AGRICULTURE', 'A1', 72.00, 67.18, 62.81, 57.97, 55.13, 54.69, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(920, 'VILLA BACOLOR', 'ALL LOTS', 'None', 'AGRICULTURE', 'A2', 50.00, 46.65, 43.62, 40.26, 38.29, 37.98, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(921, 'VILLA BACOLOR', 'ALL LOTS', 'None', 'AGRICULTURE', 'A3', 34.00, 31.72, 29.66, 27.38, 26.03, 25.83, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(922, 'VILLA BACOLOR', 'ALL LOTS', 'None', 'AGRICULTURE', 'A6', 56.00, 52.25, 48.85, 45.09, 42.88, 42.54, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(923, 'VILLA BACOLOR', 'ALL LOTS', 'None', 'AGRICULTURE', 'A15', 33.00, 30.79, 28.79, 26.57, 25.27, 25.07, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(924, 'VILLA BACOLOR', 'ALL LOTS', 'None', 'AGRICULTURE', 'A17', 50.00, 46.65, 43.62, 40.26, 38.29, 37.98, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(925, 'VILLA BACOLOR', 'ALL LOTS', 'None', 'AGRICULTURE', 'A37', 46.00, 42.92, 40.13, 37.04, 35.22, 34.94, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(926, 'VILLA BACOLOR', 'ALL LOTS', 'None', 'AGRICULTURE', 'A41', 32.00, 29.86, 27.92, 25.77, 24.50, 24.31, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30'),
(927, 'VILLA BACOLOR', 'ALL LOTS', 'AGRO-LIVESTOCK/POULTRY/PIGGERY', 'AGRICULTURE', 'A50', 148.00, 138.08, 129.11, 119.17, 113.33, 112.42, 'BIR', 1, '2025-10-27 01:03:30', '2025-10-27 01:03:30');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `estimation_logs`
--
ALTER TABLE `estimation_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_property_type` (`property_type`),
  ADD KEY `idx_property_class` (`property_class`),
  ADD KEY `idx_created_at` (`created_at`),
  ADD KEY `idx_data_source` (`data_source`);

--
-- Indexes for table `historical_prices_2020`
--
ALTER TABLE `historical_prices_2020`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_historical_data_2020` (`class`,`property_type`,`address`),
  ADD KEY `idx_class` (`class`),
  ADD KEY `idx_property_type` (`property_type`);

--
-- Indexes for table `historical_prices_2021`
--
ALTER TABLE `historical_prices_2021`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_historical_data_2021` (`class`,`property_type`,`address`),
  ADD KEY `idx_class` (`class`),
  ADD KEY `idx_property_type` (`property_type`);

--
-- Indexes for table `historical_prices_2022`
--
ALTER TABLE `historical_prices_2022`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_historical_data_2022` (`class`,`property_type`,`address`),
  ADD KEY `idx_class` (`class`),
  ADD KEY `idx_property_type` (`property_type`);

--
-- Indexes for table `historical_prices_2023`
--
ALTER TABLE `historical_prices_2023`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_historical_data_2023` (`class`,`property_type`,`address`),
  ADD KEY `idx_class` (`class`),
  ADD KEY `idx_property_type` (`property_type`);

--
-- Indexes for table `historical_prices_2024`
--
ALTER TABLE `historical_prices_2024`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_historical_data_2024` (`class`,`property_type`,`address`),
  ADD KEY `idx_class` (`class`),
  ADD KEY `idx_property_type` (`property_type`);

--
-- Indexes for table `properties`
--
ALTER TABLE `properties`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_agent_id` (`agent_id`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_property_type` (`property_type`),
  ADD KEY `idx_barangay` (`barangay`),
  ADD KEY `idx_street` (`street`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_id` (`user_id`),
  ADD KEY `idx_task_type` (`task_type`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_is_completed` (`is_completed`),
  ADD KEY `idx_property_id` (`property_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `zonal_value`
--
ALTER TABLE `zonal_value`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_zonal_entry` (`barangay`,`street`,`vicinity`,`property_type`,`class`),
  ADD KEY `idx_barangay` (`barangay`),
  ADD KEY `idx_street` (`street`),
  ADD KEY `idx_property_type` (`property_type`),
  ADD KEY `idx_class` (`class`),
  ADD KEY `idx_active` (`is_active`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `estimation_logs`
--
ALTER TABLE `estimation_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `historical_prices_2020`
--
ALTER TABLE `historical_prices_2020`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `historical_prices_2021`
--
ALTER TABLE `historical_prices_2021`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `historical_prices_2022`
--
ALTER TABLE `historical_prices_2022`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `historical_prices_2023`
--
ALTER TABLE `historical_prices_2023`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `historical_prices_2024`
--
ALTER TABLE `historical_prices_2024`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `properties`
--
ALTER TABLE `properties`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `zonal_value`
--
ALTER TABLE `zonal_value`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=928;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `properties`
--
ALTER TABLE `properties`
  ADD CONSTRAINT `properties_ibfk_1` FOREIGN KEY (`agent_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tasks_ibfk_2` FOREIGN KEY (`property_id`) REFERENCES `properties` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
