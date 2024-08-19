-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 19, 2024 at 11:07 AM
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
-- Database: `cleaningdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `admin_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `role` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`admin_id`, `username`, `password_hash`, `email`, `role`, `created_at`, `updated_at`) VALUES
(3, 'MIKE', '$2b$06$n3SlnWbgHH9wIj//ph59SOCuwgSpglObb35SHkS9ktpZnG1bFujTK', 'mike@uwezo.co.ke', 'FM', '2024-08-15 06:42:49', '2024-08-15 06:42:49'),
(4, 'Michael', '$2b$06$3dGjcX.JRolLhTDOCOlmOuEQI71MSs.srsZwn1Ll2Dqu9q7V1GLXq', 'mr@uwezo.co.ke', 'FM', '2024-08-15 06:46:56', '2024-08-15 06:46:56'),
(5, '._mulatya_.', '$2b$06$cYzN7M9T19jow8ZH5zjJ/.LpWB1JHtFi/9lQgdufYqOfiEEnndGoe', 'mulatya@uwezo.co.ke', 'CEO', '2024-08-15 07:07:47', '2024-08-15 07:07:47');

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `booking_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `booking_date` date DEFAULT current_timestamp(),
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `status` varchar(50) DEFAULT 'Pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `price` decimal(10,2) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `feedback` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`booking_id`, `customer_id`, `employee_id`, `booking_date`, `start_time`, `end_time`, `status`, `created_at`, `updated_at`, `price`, `name`, `feedback`) VALUES
(1, 13, 1, NULL, NULL, NULL, NULL, '2024-07-31 10:26:54', '2024-07-31 10:26:54', 770.00, 'Carpet', NULL),
(2, 13, 1, NULL, NULL, NULL, NULL, '2024-07-31 10:55:04', '2024-07-31 10:55:04', 600.00, 'house', NULL),
(3, 13, 1, '2024-07-31', NULL, NULL, NULL, '2024-07-31 14:24:24', '2024-07-31 14:24:24', 600.00, 'Carpet', NULL),
(4, 13, 1, '2024-07-31', NULL, NULL, NULL, '2024-07-31 14:32:25', '2024-07-31 14:32:25', 2400.00, 'Carpet', 'It was an amazing service'),
(5, 13, 1, '2024-07-31', NULL, NULL, NULL, '2024-07-31 14:36:38', '2024-07-31 14:36:38', 1200.00, 'Carpet', 'I liked the services'),
(6, 13, 1, '2024-07-31', NULL, NULL, NULL, '2024-07-31 14:39:15', '2024-07-31 14:39:15', 6400.00, 'Carpet', 'Excellent cleaning. My office is sparkling clean thank you!!!'),
(7, 13, 1, '2024-07-31', NULL, NULL, NULL, '2024-07-31 14:49:06', '2024-07-31 14:49:06', 2200.00, 'Carpet', 'Amazing\r\n'),
(8, 13, 1, '2024-07-31', NULL, NULL, NULL, '2024-07-31 14:49:57', '2024-07-31 14:49:57', 5353.00, 'Carpet', 'wonderful'),
(9, 13, 1, '2024-07-31', NULL, NULL, NULL, '2024-07-31 14:52:21', '2024-07-31 14:52:21', 1200.00, 'Carpet', 'Thanks'),
(10, 13, 1, '2024-08-01', NULL, NULL, NULL, '2024-08-01 10:26:49', '2024-08-01 10:26:49', 500.00, 'Carpet', 'goooooood\r\n'),
(11, 13, 1, '2024-08-06', NULL, NULL, 'Pending', '2024-08-06 09:54:33', '2024-08-06 09:54:33', 3600.00, 'Carpet', 'thanks Uwezo\r\n'),
(12, 13, 1, '2024-08-06', NULL, NULL, 'Pending', '2024-08-06 09:56:41', '2024-08-06 09:56:41', 3600.00, 'Carpet', 'ok');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `first_name`, `last_name`, `email`, `phone`, `address`, `created_at`, `updated_at`, `password`) VALUES
(11, 'Ngio', 'Musili', 'jk@gmail.com', '0766435244', 'Eldoret', '2024-07-20 13:25:27', '2024-07-20 13:25:27', '$2b$05$pSWSUdExIrAw.Y58Gxrdje2bfNZ.KfO0w5Hhih2Wx9dJ3qoe3PdRG'),
(12, 'Michael', 'Mulatya', 'mulatyamichael6@gmail.com', '+254736010245', '942-30100', '2024-07-20 13:28:44', '2024-07-20 13:28:44', '$2b$05$BozCVykGrpTtViE31.l1leQ9KfxNX5HlrqWAamtVNxIYHoiHjpUbC'),
(13, 'Paul', 'Musili', 'paul.musili1989@gmail.com', '0725058638', '942-30100', '2024-07-20 13:29:27', '2024-07-20 13:29:27', '$2b$05$yDM4mbeBUKf2njhWyrdxK.kc.Eks2qHUBD6usGQY0yZ81Uoemyg6K'),
(14, 'Terence ', 'Shimbiro', 'kigenterence@gmail.com', '0722457781', 'Eldoret', '2024-07-21 10:23:05', '2024-07-21 10:23:05', '$2b$05$Xw6MmEjwvSlerexXsiG2q.JiGrkORuAgPmHOQUWkHw3N8E56/KTde'),
(15, 'Sophie ', 'Jerurbai', 'jerurbaisophie@gmail.com', '0794000140', '943-30100', '2024-07-22 08:34:51', '2024-07-22 08:34:51', '$2b$05$Ar8s43TD3qVndz4XslhYvOc3hhUcOgxX.ZLzXLGtXobO0Qah6Mlf6'),
(16, 'joyce ', 'katheni', 'joycekatheni78@gmail.com', '0111585666', '942-30100', '2024-07-23 18:50:58', '2024-07-23 18:50:58', '$2b$05$08lbxSg3d1WDPgL7QJIkuuaqV1YNaegphZlqXNcmsNxptNU54mpSK'),
(17, 'Joyce', 'Ngio', 'ngiojoyce@g,ail.com', '0794627420', '942-30100', '2024-07-23 18:59:46', '2024-07-23 18:59:46', '$2b$05$VJKuJzy3jX71pQ5dZtq0vOj2Df//6SHnCeHgKESy7S6DCJjbnFJUq'),
(18, 'sandra ', 'kemboi', 'sandra@gmail.com', '0756723181', 'Eldoret', '2024-07-24 08:30:50', '2024-07-24 08:30:50', '$2b$05$oJGeubVfSCLCoeBKcEGxIOHSKnX/qe8r/lRnwlbgGrFGyJ3lysy6a'),
(19, 'john', 'mwangi', 'Mulatyamichael12@gmail.com', '0111585666', 'Eldoret', '2024-07-26 18:36:21', '2024-07-26 18:36:21', '$2b$05$8c3HI36TPQcabhWHX1cNDeblk9nNqzL3iQqmTLPX9hwu0ULf4eeem'),
(22, 'Ngio', 'mwangi', 'johnmwanda@gmail.com', '+254736010245', '943-30100', '2024-07-29 09:01:50', '2024-07-29 09:01:50', '$2b$05$pLsWlLUVvnkUHVhXxwToVuse8T3PtT5ZEvHeOmgXZH.um8VA.zyH2'),
(23, 'Michael', 'Ngio', 'ngiomike@gmail.com', '0741559222', '943-30100', '2024-08-05 17:16:28', '2024-08-05 17:16:28', '$2b$05$6bQtN9YhcMJ5azdsiwVl.eVQqzujXRRbQPbinjuKFBCTGQYc5mnVC');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `employee_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `hire_date` date DEFAULT NULL,
  `position` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone`, `hire_date`, `position`, `created_at`, `updated_at`) VALUES
(1, 'albert', 'kipchirchir', 'albert@eldohub.co.ke', '07174829828', '2024-07-01', 'manager', '2024-07-31 09:49:02', '2024-07-31 09:49:02');

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `invoice_id` int(11) NOT NULL,
  `booking_id` int(11) DEFAULT NULL,
  `amount` decimal(8,2) DEFAULT NULL,
  `issue_date` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`employee_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`invoice_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `invoice_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  ADD CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
