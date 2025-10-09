-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 08, 2025 at 10:31 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

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
-- Table structure for table `properties`
--

CREATE TABLE `properties` (
  `id` int(11) NOT NULL,
  `agent_id` int(11) NOT NULL,
  `property_title` varchar(200) NOT NULL,
  `description` text DEFAULT NULL,
  `address` text NOT NULL,
  `city` varchar(100) NOT NULL,
  `province` varchar(100) NOT NULL,
  `price` decimal(12,2) NOT NULL,
  `property_type` varchar(100) NOT NULL,
  `listing_type` enum('Sale','Rent') NOT NULL,
  `bedrooms` int(11) DEFAULT NULL,
  `bathrooms` int(11) DEFAULT NULL,
  `floor_area` int(11) DEFAULT NULL,
  `lot_area` int(11) DEFAULT NULL,
  `parking_spaces` int(11) DEFAULT 0,
  `furnished` enum('Furnished','Semi-Furnished','Unfurnished') DEFAULT 'Unfurnished',
  `owner_name` varchar(100) NOT NULL,
  `contact_number` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `status` enum('Available','Sold','Rented','Pending') DEFAULT 'Available',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `lead_status` varchar(50) DEFAULT 'Proposal' COMMENT 'Lead status: Proposal, Negotiation, Closed, Lost'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `properties`
--

INSERT INTO `properties` (`id`, `agent_id`, `property_title`, `description`, `address`, `city`, `province`, `price`, `property_type`, `listing_type`, `bedrooms`, `bathrooms`, `floor_area`, `lot_area`, `parking_spaces`, `furnished`, `owner_name`, `contact_number`, `email`, `status`, `created_at`, `updated_at`, `lead_status`) VALUES
(1, 1, 'give me', 'pangit so kenneth\nbahalana kayo kung sino sa dalawa\n\n\n\n\n', 'F. Tanedo St. Poblacion', 'Tarlac City', 'Tarlac', 1000000.00, 'House', 'Sale', 2, 3, 120, 150, 2, 'Semi-Furnished', 'arvin coronel', '09098029269', 'arvincalapuz@gmail.com', '', '2025-09-17 12:21:33', '2025-10-08 04:16:00', 'Proposal'),
(2, 1, 'moral support too you and i heheheheheheheheheheh', 'hehe ngek ngek', 'Balibago', 'Tarlac City', 'Tarlac', 1223141423.00, 'Condominium', 'Sale', 3, 23, 1234, 1234, 12, 'Semi-Furnished', 'elmerson dizon', '09296735489', 'elmer023gragasin@gmail.com', '', '2025-09-17 14:40:54', '2025-10-08 04:16:01', 'Proposal'),
(4, 2, 'give me', 'expensive', 'F. Tanedo St. Poblacion', 'Tarlac City', 'Tarlac', 11000.00, 'Condominium', 'Sale', 3, NULL, 3000, NULL, 20, 'Furnished', 'arvin coronel', '09296735489', 'fsoriano_07@yahoo.com', 'Available', '2025-09-18 06:44:06', '2025-09-18 06:44:06', 'Proposal'),
(5, 2, 'give me', 'adaf', 'Balibago', 'Tarlac City', 'Tarlac', 155638.00, 'House', 'Sale', 1, 4, 123, 81, 2, 'Semi-Furnished', 'taka balibago', '09474837192', 'just@gmail.com', 'Available', '2025-10-03 06:55:01', '2025-10-03 06:55:01', 'Proposal'),
(6, 1, '12312', 'asdf\n', '3131', '32131', '31321', 312321.00, 'House', 'Sale', 312312, 1323, 32131, 13123, 31123, 'Semi-Furnished', '31231', '3131', '31231@gmail.com', '', '2025-10-04 12:02:00', '2025-10-08 04:15:44', 'Proposal'),
(7, 1, 'kupal ka boss', 'bossing', 'wagayway', 'Tarlac City', 'Tarlac', 125000.00, 'House', 'Rent', 1, 1, 120, 120, 1, 'Semi-Furnished', 'arvin coronel', '09296735489', 'i_catherine3@yahoo.com', '', '2025-10-04 17:38:39', '2025-10-08 04:18:25', 'Proposal'),
(8, 1, 'house', 'uwu', 'palang', 'Tarlac City', 'Tarlac', 102345.00, 'Condominium', 'Sale', 1, 1, 122, 121, 1, 'Semi-Furnished', 'kenneth sta cruz', '09876543211', 'kenneth@gmail.com', 'Available', '2025-10-08 04:32:00', '2025-10-08 04:32:00', 'Proposal');

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
(1, 2, NULL, '2131', 'todo', 'Not Started', 'High', 'asfsa', '2025-04-15', '08:00:00', 1, '2421', 1, '2025-09-21 14:24:06', '2025-09-22 16:07:12'),
(2, 2, NULL, '3131', 'todo', 'On Progress', 'High', '31313', '2025-04-15', '08:00:00', 1, 'fdfsae', 1, '2025-09-21 14:33:04', '2025-09-22 16:06:26'),
(3, 2, NULL, '3144512', 'todo', 'Not Started', 'High', '4142413', '2025-04-15', '08:00:00', 1, 'sfgwqt', 1, '2025-09-21 14:41:25', '2025-09-22 16:06:22'),
(4, 2, NULL, '5262', 'todo', 'Upcoming', 'High', NULL, '2025-09-03', '12:43:00', 2, NULL, 1, '2025-09-21 14:44:07', '2025-09-22 16:06:18'),
(5, 2, NULL, 'dyuSFGH', 'todo', 'Upcoming', 'High', 'DFGGW', '2025-09-10', '22:48:00', 1, 'SEG2', 1, '2025-09-21 14:47:31', '2025-09-22 16:06:15'),
(6, 2, NULL, '23sdgeqwt', 'todo', 'Upcoming', 'High', 'qfgwg2we', '2025-09-10', '22:01:00', 1, '231rfds', 1, '2025-09-21 14:58:51', '2025-09-22 16:06:11'),
(7, 1, NULL, 'habv', 'todo', 'Not Started', 'High', 'fmbnshjskjp', '2025-09-11', '23:02:00', 1, NULL, 1, '2025-09-21 15:01:01', '2025-10-03 07:32:54'),
(8, 1, NULL, 'asfqegt', 'call', NULL, NULL, '313213', NULL, NULL, 1, NULL, 0, '2025-09-21 15:14:30', '2025-09-21 15:14:30'),
(9, 1, NULL, '1sf1', 'todo', 'Upcoming', 'High', 'qrfdq', '2025-09-18', '15:18:00', 2, 'safqw3', 0, '2025-09-21 15:18:29', '2025-09-21 15:18:29'),
(10, 1, NULL, 'tr1qftw', 'todo', 'Not Started', 'High', 'qafew', '2025-09-09', '15:22:00', 1, 'qrq', 1, '2025-09-21 15:22:58', '2025-10-08 08:30:50'),
(11, 1, NULL, 'fuhyfgliagf', 'email', NULL, NULL, 'gqgdgw', '0014-03-14', '13:26:00', 2, 'sfgqr', 0, '2025-09-21 15:26:56', '2025-09-21 15:26:56'),
(12, 1, NULL, 'gfrdxsrdf', 'todo', 'Not Started', 'High', 'ppdWREFYGHJ', NULL, NULL, 1, 'TFYGHJ', 1, '2025-09-21 15:28:05', '2025-10-03 15:37:02'),
(13, 1, NULL, 'CVBNM,.', 'call', NULL, NULL, NULL, '2025-09-11', '23:36:00', 1, 'HSDFHJKL;', 0, '2025-09-21 15:35:06', '2025-09-21 15:35:06'),
(14, 3, NULL, 'Meeting ko', 'todo', 'Upcoming', 'High', 'Regu', '2025-09-25', '08:30:00', 1, 'need ko tumae', 0, '2025-09-24 03:33:24', '2025-09-24 03:33:24'),
(15, 2, NULL, 'dfgh', 'call', NULL, NULL, '313131', '4200-07-03', NULL, 1, NULL, 1, '2025-09-24 07:40:12', '2025-09-24 07:40:17'),
(16, 2, NULL, 'meeting', 'todo', 'Upcoming', 'High', 'regu', '2025-09-28', '14:30:00', 1, NULL, 0, '2025-09-26 20:12:47', '2025-09-26 20:12:47'),
(17, 1, NULL, 'meeting kasi', 'call', NULL, NULL, 'vinvin', '2025-10-07', '13:37:00', 1, 'wag po', 0, '2025-10-03 15:39:08', '2025-10-03 15:39:08'),
(18, 1, 6, 'meeting natin', 'todo', 'Upcoming', 'Medium', 'arvin', '2025-10-06', '22:11:00', 2, 'pangit kayo', 1, '2025-10-04 12:11:59', '2025-10-04 12:19:44'),
(19, 1, 6, 'meeting add', 'todo', 'Upcoming', 'High', 'arvin', '2025-10-08', '22:39:00', 1, 'i add', 0, '2025-10-04 12:39:28', '2025-10-04 12:39:28');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
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

INSERT INTO `users` (`id`, `email`, `password_hash`, `first_name`, `last_name`, `contact_number`, `user_type`, `is_active`, `created_at`, `updated_at`, `gender`, `language`) VALUES
(1, 'arvincalapuz@gmail.com', '$2y$10$LENLNfI8a5uxW8PYMWUPf.tQOkCitv3KZLcX0ghXhEij4b8YaIDce', 'Arvin', 'Coronel', '09468539156', 'client', 1, '2025-09-17 10:44:17', '2025-10-03 15:33:12', 'Male', 'English - United States'),
(2, 'angelo.vert.valencia@gmail.com', '$2y$10$F6ywQaoK5hqCFJjRi8rTouEP414snagmY5hb965dLweAjorMS30yC', 'nill', 'Valencio', '09387984497', 'client', 1, '2025-09-17 12:23:38', '2025-09-24 07:39:20', 'Not specified', 'English - United States'),
(3, 'regutaro@gmail.com', '$2y$10$5i2snc7Tj4tldD1vIqa64OyRKQWXuN25z6YxiUBIg7aqJ.TIdzwpa', 'regu', 'taro', '09098029269', 'client', 1, '2025-09-22 17:16:33', '2025-09-22 17:16:33', 'Not specified', 'English - United States');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `properties`
--
ALTER TABLE `properties`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_agent_id` (`agent_id`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_property_type` (`property_type`),
  ADD KEY `idx_listing_type` (`listing_type`);

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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `properties`
--
ALTER TABLE `properties`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
