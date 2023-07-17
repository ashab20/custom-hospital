-- phpMyAdmin SQL Dump
-- version 5.2.1-1.fc38
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 18, 2023 at 03:15 AM
-- Server version: 10.5.20-MariaDB
-- PHP Version: 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hospital`
--

-- --------------------------------------------------------

--
-- Table structure for table `admit`
--

CREATE TABLE `admit` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `guardian_name` varchar(255) NOT NULL,
  `emargency_contact` varchar(13) DEFAULT NULL,
  `relationship_with_patient` varchar(100) DEFAULT NULL,
  `refarecne_by` varchar(100) DEFAULT NULL,
  `patient_of` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `entry_time` datetime NOT NULL,
  `out_time` datetime DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `patient_condition` varchar(255) DEFAULT NULL,
  `roles` enum('ADMITTED','RELEASED') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) NOT NULL,
  `modified_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

--
-- Dumping data for table `admit`
--

INSERT INTO `admit` (`id`, `patient_id`, `guardian_name`, `emargency_contact`, `relationship_with_patient`, `refarecne_by`, `patient_of`, `room_id`, `entry_time`, `out_time`, `duration`, `patient_condition`, `roles`, `created_at`, `created_by`, `modified_at`, `modified_by`, `status`) VALUES
(1, 2, 'Mr Father', '01950034242', 'Father', '', 1, 8, '2022-07-21 00:00:00', NULL, NULL, 'Critical Se', 'ADMITTED', '2022-07-21 04:51:19', 1, '0000-00-00 00:00:00', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `id` int(11) NOT NULL,
  `name` varchar(40) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`id`, `name`, `phone`, `patient_id`, `message`, `doctor_id`, `department_id`, `date`, `time`, `created_at`, `created_by`, `modified_at`, `modified_by`, `status`) VALUES
(1, 'Mr. Rabib Hasan', '01840083454', 1, '', 1, 7, '2022-07-23', '02:00PM', '2022-07-21 04:37:48', 1, NULL, NULL, 1),
(2, 'Mr. Rabib Hasan', '01840083454', 1, '', 1, 7, '2022-07-22', '01:00PM', '2022-07-21 04:39:44', 1, NULL, NULL, 1),
(3, 'Ahmad Ashab Uddin', '01840088189', 3, '', 1, 7, '2023-07-13', '12:00PM', '2023-07-12 16:44:01', 1, NULL, NULL, 1),
(4, 'Ahmad Ashab Uddin', '01840088189', 3, '', 1, 7, '2023-07-14', '01:00PM', '2023-07-12 19:02:55', 1, NULL, NULL, 1),
(5, 'Mr. Patient', '018534342423', 3, 'Have Very Problem', 1, 7, '2023-07-18', '05:00PM', '2023-07-17 11:26:31', 1, NULL, NULL, 1),
(6, 'Mr. Patient', '018534342423', 3, 'Magna Unde Consequun', 1, 7, '2023-07-17', '05:00PM', '2023-07-17 11:27:43', 1, NULL, NULL, 1),
(7, 'Mr. Patient', '018534342423', 3, 'Ok', 1, 7, '2023-07-18', '06:00PM', '2023-07-17 11:29:26', 1, NULL, NULL, 1),
(8, 'Mr. Patient', '018534342423', 3, '', 1, 7, '2023-07-18', '07:00PM', '2023-07-17 11:34:10', 1, NULL, NULL, 1),
(9, 'Mr. Patient', '018534342423', 3, '', 1, 7, '2023-07-18', '11:00AM', '2023-07-17 11:43:20', 1, NULL, NULL, 1),
(10, 'Mr. Patient', '018534342423', 3, '', 1, 7, '2023-07-18', '03:00PM', '2023-07-17 11:47:06', 1, NULL, NULL, 1),
(11, 'Mr. Patient', '018534342423', 3, '', 1, 7, '2023-07-18', '04:00PM', '2023-07-17 18:22:43', 1, NULL, NULL, 1),
(12, 'Mr. Patient', '018534342423', 3, '', 1, 7, '2023-07-18', '03:00PM', '2023-07-17 18:23:25', 1, NULL, NULL, 1),
(13, 'Price Key', '01840088124', NULL, 'Consectetur Voluptat', 2, 10, '2023-07-18', NULL, '2023-07-17 19:43:45', NULL, NULL, NULL, 1),
(14, 'Steven Mcknight', '018403242342', NULL, 'Sapiente Quos Perfer', 2, 10, '2023-07-18', NULL, '2023-07-17 19:48:14', NULL, NULL, NULL, 1),
(15, 'Brenden Orr', '01875432453', 6, '', 2, 10, '2023-07-19', '05:00PM', '2023-07-17 20:47:45', 5, NULL, NULL, 1),
(16, 'Brenden Orr', '01875432453', 6, '', 2, 10, '2023-07-19', '03:00PM', '2023-07-17 20:51:40', 5, NULL, NULL, 1),
(17, 'Brenden Orr', '01875432453', 6, '', 2, 10, '2023-07-19', NULL, '2023-07-17 21:08:41', 5, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`id`, `name`, `created_by`, `created_at`, `modified_at`, `modified_by`, `status`) VALUES
(1, 'Pethology', 1, '2022-07-06 11:41:15', '0000-00-00 00:00:00', NULL, 1),
(2, 'Allergists/Immunologists', 1, '2022-07-06 11:41:34', '0000-00-00 00:00:00', NULL, 1),
(3, 'Anesthesiologists', 1, '2022-07-06 11:41:41', '0000-00-00 00:00:00', NULL, 1),
(4, 'Critical Care Medicine Specialists', 1, '2022-07-21 04:08:35', '0000-00-00 00:00:00', NULL, 1),
(5, 'Hematologists', 1, '2022-07-21 04:08:46', '0000-00-00 00:00:00', NULL, 1),
(6, 'Internists', 1, '2022-07-21 04:08:54', '0000-00-00 00:00:00', NULL, 1),
(7, 'Neurologists', 1, '2022-07-21 04:09:03', '0000-00-00 00:00:00', NULL, 1),
(8, 'Plastic Surgeons', 1, '2022-07-21 04:09:16', '0000-00-00 00:00:00', NULL, 1),
(9, 'Podiatrists', 1, '2022-07-21 04:09:26', '0000-00-00 00:00:00', NULL, 1),
(10, 'Radiologists', 1, '2022-07-21 04:09:46', '0000-00-00 00:00:00', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `designation`
--

CREATE TABLE `designation` (
  `id` int(11) NOT NULL,
  `designation_name` varchar(255) NOT NULL,
  `base_salary` decimal(10,2) NOT NULL,
  `bounus_by_percent` decimal(5,2) DEFAULT NULL,
  `total_bounus` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `modified_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

--
-- Dumping data for table `designation`
--

INSERT INTO `designation` (`id`, `designation_name`, `base_salary`, `bounus_by_percent`, `total_bounus`, `created_at`, `created_by`, `modified_at`, `modified_by`, `status`) VALUES
(1, 'Reciptionist', 32000.00, 0.15, 2, '2022-07-06 11:42:07', 1, '0000-00-00 00:00:00', NULL, 1),
(2, 'Supervisor', 25000.00, 0.15, 2, '2022-07-06 11:42:34', 1, '0000-00-00 00:00:00', NULL, 1),
(3, 'Medical Officer', 25000.00, 0.15, 2, '2022-07-06 11:42:54', 1, '0000-00-00 00:00:00', NULL, 1),
(4, 'Medical Surgent', 50000.00, 0.15, 2, '2022-07-21 04:11:31', 1, '0000-00-00 00:00:00', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `father_name` varchar(40) NOT NULL,
  `mother_name` varchar(40) NOT NULL,
  `qualification` varchar(100) DEFAULT NULL,
  `gratuated_from` varchar(100) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `date_of_birth` date NOT NULL,
  `shift` enum('MORNING','EVENING','NIGHT') DEFAULT NULL,
  `chamber_id` int(11) DEFAULT NULL,
  `designation_id` int(11) DEFAULT NULL,
  `daily_approval_patient` varchar(20) DEFAULT NULL,
  `visit_fee` decimal(7,2) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `modified_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`id`, `user_id`, `father_name`, `mother_name`, `qualification`, `gratuated_from`, `gender`, `date_of_birth`, `shift`, `chamber_id`, `designation_id`, `daily_approval_patient`, `visit_fee`, `department_id`, `created_at`, `created_by`, `modified_at`, `modified_by`, `status`) VALUES
(1, 2, 'Father', 'Mother', 'MBBS, FCPS, FCPS-2', 'Chittagong Medical College', 'male', '1987-06-01', 'EVENING', 3, 4, '5', 2000.00, 7, '2022-07-21 04:37:18', 1, '0000-00-00 00:00:00', NULL, 1),
(2, 3, 'Father', 'Mother', 'FCPS', 'Sylhet Osmani Medical College', 'female', '2015-06-10', 'EVENING', 2, 3, '15', 1000.00, 10, '2022-07-21 04:58:06', 1, '0000-00-00 00:00:00', NULL, 1),
(3, 4, 'Carter Rosario', 'Ivy Clemons', 'Quas Saepe In Dicta ', 'Harum Deserunt Et Ad', 'female', '2013-04-19', 'NIGHT', 1, 1, 'Tempor corrupti est', 27.00, 1, '2023-07-17 20:28:11', 1, '0000-00-00 00:00:00', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `father_name` varchar(40) NOT NULL,
  `mother_name` varchar(40) NOT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `date_of_birth` date NOT NULL,
  `shift` enum('MORNING','EVENING','NIGHT') DEFAULT NULL,
  `designation_id` int(11) DEFAULT NULL,
  `base_salary` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `modified_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employeehistory`
--

CREATE TABLE `employeehistory` (
  `id` int(11) NOT NULL,
  `emplopyee_id` int(11) DEFAULT NULL,
  `joined_date` date NOT NULL,
  `leave_date` date NOT NULL,
  `atentance` int(11) DEFAULT NULL,
  `absense` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `modified_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `generalcheckup`
--

CREATE TABLE `generalcheckup` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `presure` varchar(20) NOT NULL,
  `temperature` varchar(20) NOT NULL,
  `bp` varchar(30) DEFAULT NULL,
  `saturation` varchar(20) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `modified_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_payment`
--

CREATE TABLE `invoice_payment` (
  `id` int(11) NOT NULL,
  `ipid` varchar(100) NOT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `test_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`test_id`)),
  `appointment_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`appointment_id`)),
  `admit_id` int(11) DEFAULT NULL,
  `payment_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `subtotal` decimal(10,2) UNSIGNED DEFAULT NULL,
  `tax` decimal(10,0) DEFAULT NULL,
  `discount` decimal(10,2) DEFAULT NULL,
  `total` decimal(10,2) NOT NULL,
  `payment` decimal(10,2) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `remark` enum('DUE','PAID') DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `modified_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

--
-- Dumping data for table `invoice_payment`
--

INSERT INTO `invoice_payment` (`id`, `ipid`, `patient_id`, `test_id`, `appointment_id`, `admit_id`, `payment_date`, `subtotal`, `tax`, `discount`, `total`, `payment`, `note`, `remark`, `created_at`, `created_by`, `modified_at`, `modified_by`, `status`) VALUES
(1, 'IP2022072106374862d8d81cd0b45', 1, NULL, '1', NULL, '2022-07-21 04:37:48', 2000.00, NULL, 0.00, 2000.00, 2000.00, NULL, 'PAID', '2022-07-21 04:37:48', NULL, '0000-00-00 00:00:00', NULL, 1),
(2, 'IP2022072106394462d8d890cb510', 1, NULL, '2', NULL, '2022-07-21 04:39:44', 2000.00, NULL, 400.00, 1600.00, 1600.00, NULL, 'PAID', '2022-07-21 04:39:44', NULL, '0000-00-00 00:00:00', NULL, 1),
(3, 'IP22072106493462d8dade5d8af', 2, '[\"5\",\"6\"]', NULL, NULL, '2022-07-21 00:49:34', 3200.00, 0, 0.00, 3200.00, 200.00, NULL, 'DUE', '2022-07-21 04:49:34', NULL, '0000-00-00 00:00:00', NULL, 1),
(4, 'IP2023071210440164aed851cd778', 3, NULL, '3', NULL, '2023-07-12 16:44:01', 2000.00, NULL, 0.00, 2000.00, 2000.00, NULL, 'PAID', '2023-07-12 16:44:01', NULL, '0000-00-00 00:00:00', NULL, 1),
(5, 'IP23071210465664aed900c8bf1', 3, '[\"2\",\"4\"]', NULL, NULL, '2023-07-12 16:46:56', 400.00, 0, 0.00, 400.00, 400.00, NULL, 'PAID', '2023-07-12 16:46:56', NULL, '0000-00-00 00:00:00', NULL, 1),
(6, 'IP2023071301025564aef8df14209', 3, NULL, '4', NULL, '2023-07-12 19:02:55', 2000.00, NULL, 400.00, 1600.00, 1600.00, NULL, 'PAID', '2023-07-12 19:02:55', NULL, '0000-00-00 00:00:00', NULL, 1),
(7, 'IP2023071705263164b5256790c32', 3, NULL, '5', NULL, '2023-07-17 11:26:31', 2000.00, NULL, 400.00, 1600.00, 1600.00, NULL, 'PAID', '2023-07-17 11:26:31', NULL, '0000-00-00 00:00:00', NULL, 1),
(8, 'IP2023071705274364b525afd4631', 3, NULL, '6', NULL, '2023-07-17 11:27:43', 2000.00, NULL, 400.00, 1600.00, 1600.00, NULL, 'PAID', '2023-07-17 11:27:43', NULL, '0000-00-00 00:00:00', NULL, 1),
(9, 'IP2023071705292664b52616d9e7b', 3, NULL, '7', NULL, '2023-07-17 11:29:26', 2000.00, NULL, 400.00, 1600.00, 1600.00, NULL, 'PAID', '2023-07-17 11:29:26', NULL, '0000-00-00 00:00:00', NULL, 1),
(10, 'IP2023071705341064b527329fab8', 3, NULL, '8', NULL, '2023-07-17 11:34:10', 2000.00, NULL, 400.00, 1600.00, 1600.00, NULL, 'PAID', '2023-07-17 11:34:10', NULL, '0000-00-00 00:00:00', NULL, 1),
(11, 'IP2023071705432064b529587bfa7', 3, NULL, '9', NULL, '2023-07-17 11:43:20', 2000.00, NULL, 400.00, 1600.00, 1600.00, NULL, 'PAID', '2023-07-17 11:43:20', NULL, '0000-00-00 00:00:00', NULL, 1),
(12, 'IP2023071705470664b52a3aa3919', 3, NULL, '10', NULL, '2023-07-17 11:47:06', 2000.00, NULL, 400.00, 1600.00, 1600.00, NULL, 'PAID', '2023-07-17 11:47:06', NULL, '0000-00-00 00:00:00', NULL, 1),
(13, 'IP2023071812224364b586f3a3153', 3, NULL, '11', NULL, '2023-07-17 18:22:43', 2000.00, NULL, 400.00, 1600.00, 1600.00, NULL, 'PAID', '2023-07-17 18:22:43', NULL, '0000-00-00 00:00:00', NULL, 1),
(14, 'IP2023071812232564b5871d81f5d', 3, NULL, '12', NULL, '2023-07-17 18:23:25', 2000.00, NULL, 400.00, 1600.00, 1600.00, NULL, 'PAID', '2023-07-17 18:23:25', NULL, '0000-00-00 00:00:00', NULL, 1),
(15, 'IP2023071801434564b599f1bb054', 4, NULL, '13', NULL, '2023-07-17 19:43:45', 1000.00, NULL, 0.00, 1000.00, 1000.00, NULL, 'PAID', '2023-07-17 19:43:45', NULL, '0000-00-00 00:00:00', NULL, 1),
(16, 'IP2023071802474564b5a8f1b6486', 6, NULL, '15', NULL, '2023-07-17 20:47:45', 1000.00, NULL, 0.00, 1000.00, 1000.00, NULL, 'PAID', '2023-07-17 20:47:45', NULL, '0000-00-00 00:00:00', NULL, 1),
(17, 'IP2023071802514064b5a9dc30249', 6, NULL, '16', NULL, '2023-07-17 20:51:40', 1000.00, NULL, 200.00, 800.00, 800.00, NULL, 'PAID', '2023-07-17 20:51:40', NULL, '0000-00-00 00:00:00', NULL, 1),
(18, 'IP2023071803084164b5add95d2ae', 6, NULL, '17', NULL, '2023-07-17 21:08:41', 1000.00, NULL, 200.00, 800.00, 800.00, NULL, 'PAID', '2023-07-17 21:08:41', NULL, '0000-00-00 00:00:00', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `medical_history`
--

CREATE TABLE `medical_history` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) NOT NULL,
  `modified_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `medicine`
--

CREATE TABLE `medicine` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `type` enum('TAB','INJ') NOT NULL,
  `medicine_name` varchar(100) NOT NULL,
  `mg` decimal(5,0) UNSIGNED DEFAULT NULL,
  `dose` varchar(20) NOT NULL,
  `day` varchar(20) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `modified_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

--
-- Dumping data for table `medicine`
--

INSERT INTO `medicine` (`id`, `patient_id`, `type`, `medicine_name`, `mg`, `dose`, `day`, `comment`, `created_at`, `created_by`, `modified_at`, `modified_by`, `status`) VALUES
(1, 3, 'TAB', 'Napa', 500, '3', '7', '', '2023-07-12 16:45:47', NULL, '0000-00-00 00:00:00', NULL, 1),
(2, 3, 'INJ', 'A Inj', 200, '1', '8', '', '2023-07-12 16:45:47', NULL, '0000-00-00 00:00:00', NULL, 1),
(3, 1, 'TAB', 'Napa', 500, '2', '7', 'After Eat', '2023-07-12 19:08:45', NULL, '0000-00-00 00:00:00', NULL, 1),
(4, 1, 'INJ', 'Inj', 20, '1', '15', '', '2023-07-12 19:08:45', NULL, '0000-00-00 00:00:00', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `medicinestore`
--

CREATE TABLE `medicinestore` (
  `id` int(11) NOT NULL,
  `type` enum('TAB','INJ') NOT NULL,
  `name` varchar(100) NOT NULL,
  `mg` decimal(5,0) UNSIGNED DEFAULT NULL,
  `total_dose` decimal(5,0) NOT NULL,
  `rate` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `modified_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `id` int(11) NOT NULL,
  `name` varchar(40) NOT NULL,
  `father_or_husband_name` varchar(40) DEFAULT NULL,
  `mother_name` varchar(40) DEFAULT NULL,
  `religious` varchar(10) DEFAULT NULL,
  `nid` varchar(40) DEFAULT NULL,
  `blood_group` varchar(10) DEFAULT NULL,
  `nationality` varchar(20) DEFAULT NULL,
  `marital_status` enum('MARRIED','UNMARRIED','OTHERS') DEFAULT 'UNMARRIED',
  `phone` varchar(13) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `age` varchar(3) NOT NULL,
  `relagius` varchar(10) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `present_address` varchar(255) DEFAULT NULL,
  `permanent_address` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `modified_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`id`, `name`, `father_or_husband_name`, `mother_name`, `religious`, `nid`, `blood_group`, `nationality`, `marital_status`, `phone`, `gender`, `age`, `relagius`, `weight`, `present_address`, `permanent_address`, `created_at`, `created_by`, `modified_at`, `modified_by`, `status`) VALUES
(1, 'Mr. Rabib Hasan', 'MR,', 'Mrs', NULL, '', 'A+', NULL, 'MARRIED', '01840083454', 'male', '35', NULL, NULL, 'Ctg', 'Bhula', '2022-07-21 03:59:30', 1, '0000-00-00 00:00:00', NULL, 1),
(2, 'Mr Patient', 'Mr ', 'Mrs', NULL, '', '', NULL, 'UNMARRIED', '01845345345', 'male', '56', NULL, NULL, 'ctg', '', '2022-07-21 04:49:01', 1, '0000-00-00 00:00:00', NULL, 1),
(3, 'Mr. Patient', 'Abdur Rohman', 'Sayeda Yasmin Akther', NULL, '', 'A+', NULL, 'UNMARRIED', '018534342423', 'male', '23', NULL, NULL, 'abc Address', 'abc Address', '2023-07-12 16:42:51', 1, '0000-00-00 00:00:00', NULL, 1),
(4, 'Price Key', NULL, NULL, NULL, NULL, NULL, NULL, 'UNMARRIED', '01840088124', 'male', '0', NULL, NULL, NULL, NULL, '2023-07-17 19:39:49', NULL, '0000-00-00 00:00:00', NULL, 1),
(5, 'Steven Mcknight', NULL, NULL, NULL, NULL, NULL, NULL, 'UNMARRIED', '018403242342', 'male', '13', NULL, NULL, NULL, NULL, '2023-07-17 19:48:14', NULL, '0000-00-00 00:00:00', NULL, 1),
(6, 'Brenden Orr', 'Addison Park', 'Jason Raymond', NULL, 'Quia dignissimos rep', 'A+', NULL, 'UNMARRIED', '01875432453', 'male', '34', NULL, NULL, 'Magni ea nulla unde ', 'Tempor quos alias es', '2023-07-17 20:47:19', 5, '0000-00-00 00:00:00', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `prescription`
--

CREATE TABLE `prescription` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `appointment_id` int(11) DEFAULT NULL,
  `admit_id` int(11) DEFAULT NULL,
  `medicine_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`medicine_id`)),
  `test` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`test`)),
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`description`)),
  `advice` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`advice`)),
  `overal_comment` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `modified_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

--
-- Dumping data for table `prescription`
--

INSERT INTO `prescription` (`id`, `patient_id`, `doctor_id`, `appointment_id`, `admit_id`, `medicine_id`, `test`, `description`, `advice`, `overal_comment`, `created_at`, `created_by`, `modified_at`, `modified_by`, `status`) VALUES
(1, 3, NULL, 3, NULL, '[\"1\",\"2\"]', '[\"Cbc\"]', '[\"ok\"]', '[\"kali pethe\"]', '', '2023-07-12 16:45:47', NULL, '0000-00-00 00:00:00', NULL, 1),
(2, 1, NULL, 2, NULL, '[\"3\",\"4\"]', '[\"X-ray\"]', '[\"\"]', '[\"\"]', '', '2023-07-12 19:08:45', NULL, '0000-00-00 00:00:00', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `rate`
--

CREATE TABLE `rate` (
  `id` int(11) NOT NULL,
  `service_name` varchar(255) DEFAULT NULL,
  `rate` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `modified_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

--
-- Dumping data for table `rate`
--

INSERT INTO `rate` (`id`, `service_name`, `rate`, `created_at`, `created_by`, `modified_at`, `modified_by`, `status`) VALUES
(1, 'MRI', 4000.00, '2022-07-06 12:01:36', 1, '0000-00-00 00:00:00', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

CREATE TABLE `report` (
  `id` int(11) NOT NULL,
  `patient_id` int(20) DEFAULT NULL,
  `test_id` int(11) DEFAULT NULL,
  `invoice_id` int(11) DEFAULT NULL,
  `method` varchar(255) DEFAULT NULL,
  `material` varchar(255) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `test_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`test_data`)),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `modified_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

--
-- Dumping data for table `report`
--

INSERT INTO `report` (`id`, `patient_id`, `test_id`, `invoice_id`, `method`, `material`, `note`, `test_data`, `created_at`, `created_by`, `modified_at`, `modified_by`, `status`) VALUES
(1, 3, 2, 5, '', '', '', '[{\"test\":\"Back Bon X-ray \",\"result\":\"fraction\",\"normal_values\":\"\"}]', '2023-07-12 16:48:05', 1, '0000-00-00 00:00:00', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `id` int(11) NOT NULL,
  `room_type` enum('GENERAL-CABIN','NON-AC-CABIN','AC-CABIN','VIP-CABIN','CHAMBER','OT','WAITING-ROOM','ICU','CCU') DEFAULT 'GENERAL-CABIN',
  `room_no` varchar(30) DEFAULT NULL,
  `rate` decimal(10,2) NOT NULL,
  `capacity` decimal(2,0) NOT NULL DEFAULT 1,
  `details` varchar(255) DEFAULT NULL,
  `floor` varchar(20) DEFAULT NULL,
  `availability` enum('YES','NO') DEFAULT 'YES',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `modified_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`id`, `room_type`, `room_no`, `rate`, `capacity`, `details`, `floor`, `availability`, `created_at`, `created_by`, `modified_at`, `modified_by`, `status`) VALUES
(1, 'GENERAL-CABIN', '101', 0.00, 1, '', 'Ground Floor', 'YES', '2022-07-06 11:43:26', 1, '0000-00-00 00:00:00', NULL, 1),
(2, 'CHAMBER', '102', 0.00, 1, '', 'Ground Floor', 'YES', '2022-07-06 11:43:41', 1, '0000-00-00 00:00:00', NULL, 1),
(3, 'CHAMBER', '103', 0.00, 1, '', 'Ground Floor', 'YES', '2022-07-06 11:44:01', 1, '0000-00-00 00:00:00', NULL, 1),
(5, 'CHAMBER', '104', 0.00, 1, '[\"Tv\"]', '1st', 'YES', '2022-07-21 04:13:54', 1, '0000-00-00 00:00:00', NULL, 1),
(6, 'CHAMBER', '106', 0.00, 1, '', 'Ground Floor', 'YES', '2022-07-21 04:25:45', 1, '0000-00-00 00:00:00', NULL, 1),
(7, 'GENERAL-CABIN', '108', 0.00, 8, '', 'Ground Floor', 'YES', '2022-07-21 04:26:26', 1, '0000-00-00 00:00:00', NULL, 1),
(8, 'ICU', '401', 0.00, 8, '[\"AC\",\"Refrigerator\",\"Locker\"]', '4th', 'NO', '2022-07-21 04:51:19', 1, '0000-00-00 00:00:00', NULL, 1),
(9, 'CCU', '301', 0.00, 4, '[\"AC\",\"Refrigerator\",\"Locker\"]', '3RD FLOOR', 'YES', '2022-07-21 04:27:57', 1, '0000-00-00 00:00:00', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `salary`
--

CREATE TABLE `salary` (
  `id` int(11) NOT NULL,
  `_id` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `modified_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE `service` (
  `id` int(11) NOT NULL,
  `service_name` varchar(20) DEFAULT NULL,
  `rate` int(11) NOT NULL,
  `condition_on` varchar(100) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `duration` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `modified_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

--
-- Dumping data for table `service`
--

INSERT INTO `service` (`id`, `service_name`, `rate`, `condition_on`, `description`, `duration`, `created_at`, `created_by`, `modified_at`, `modified_by`, `status`) VALUES
(1, 'Nebulzer', 300, 'Every Time', '', '', '2022-07-06 12:01:17', 1, '0000-00-00 00:00:00', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE `test` (
  `id` int(11) NOT NULL,
  `test_name` varchar(20) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `rate` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `modified_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

--
-- Dumping data for table `test`
--

INSERT INTO `test` (`id`, `test_name`, `description`, `rate`, `created_at`, `created_by`, `modified_at`, `modified_by`, `status`) VALUES
(1, 'MRI', 'Full Body Scane', 4000.00, '2022-07-06 11:50:36', 1, '0000-00-00 00:00:00', NULL, 1),
(2, 'X-Ray', 'Normal X-ray', 300.00, '2022-07-06 11:57:20', 1, '0000-00-00 00:00:00', NULL, 1),
(3, 'CBC', '', 4000.00, '2022-07-07 04:27:01', 1, '0000-00-00 00:00:00', NULL, 1),
(4, 'Blood Group Test', '', 100.00, '2022-07-07 04:27:46', 1, '0000-00-00 00:00:00', NULL, 1),
(5, 'Hemoglobin Test', '', 2500.00, '2022-07-07 04:28:25', 1, '0000-00-00 00:00:00', NULL, 1),
(6, 'Covid', '', 700.00, '2022-07-21 04:29:13', 1, '0000-00-00 00:00:00', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(40) DEFAULT NULL,
  `password` char(40) NOT NULL,
  `phone` varchar(13) NOT NULL,
  `roles` enum('SUPERADMIN','ADMIN','DOCTOR','ASSISTANT') DEFAULT 'ASSISTANT',
  `address` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `avatar`, `name`, `email`, `password`, `phone`, `roles`, `address`, `created_at`, `created_by`, `modified_at`, `modified_by`, `status`) VALUES
(1, NULL, 'Admin', 'admin@gmail.com', '125bce26d032f2034e26cf229da4b52e', '0143435435435', 'SUPERADMIN', '', '2022-07-06 11:34:56', NULL, '2023-07-13 01:11:18', 1, 1),
(2, NULL, 'Mr. Doctor', 'doctor@gmail.com', 'b714337aa8007c433329ef43c7b8252c', '01744100139', 'DOCTOR', 'Bhola', '2022-07-06 11:40:48', 1, NULL, NULL, 1),
(3, NULL, 'Dr. Tashin Mustafe', 'tasin@gmail.com', 'b714337aa8007c433329ef43c7b8252c', '01717661719', 'DOCTOR', 'chawakbazar', '2022-07-15 05:22:07', 1, NULL, NULL, 1),
(4, NULL, 'Habibur Rohman', 'habibur@gmail.com', 'b714337aa8007c433329ef43c7b8252c', '01739000999', 'DOCTOR', 'Dhaka', '2022-07-21 04:59:18', 1, NULL, NULL, 1),
(5, NULL, 'Brielle Dunn', 'asst@gmail.com', '125bce26d032f2034e26cf229da4b52e', '01345673434', 'ASSISTANT', NULL, '2023-07-17 20:30:27', NULL, NULL, NULL, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admit`
--
ALTER TABLE `admit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_of` (`patient_of`),
  ADD KEY `room_id` (`room_id`),
  ADD KEY `modified_by` (`modified_by`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `patient_id` (`patient_id`);

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `modified_by` (`modified_by`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `doctor_id` (`doctor_id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `department_id` (`department_id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `modified_by` (`modified_by`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `designation`
--
ALTER TABLE `designation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `modified_by` (`modified_by`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `modified_by` (`modified_by`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `designation_id` (`designation_id`),
  ADD KEY `chamber_id` (`chamber_id`),
  ADD KEY `department_id` (`department_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `modified_by` (`modified_by`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `designation_id` (`designation_id`);

--
-- Indexes for table `employeehistory`
--
ALTER TABLE `employeehistory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `emplopyee_id` (`emplopyee_id`),
  ADD KEY `modified_by` (`modified_by`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `generalcheckup`
--
ALTER TABLE `generalcheckup`
  ADD PRIMARY KEY (`id`),
  ADD KEY `modified_by` (`modified_by`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `patient_id` (`patient_id`);

--
-- Indexes for table `invoice_payment`
--
ALTER TABLE `invoice_payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `modified_by` (`modified_by`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `admit_id` (`admit_id`);

--
-- Indexes for table `medical_history`
--
ALTER TABLE `medical_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `modified_by` (`modified_by`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `patient_id` (`patient_id`);

--
-- Indexes for table `medicine`
--
ALTER TABLE `medicine`
  ADD PRIMARY KEY (`id`),
  ADD KEY `modified_by` (`modified_by`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `patient_id` (`patient_id`);

--
-- Indexes for table `medicinestore`
--
ALTER TABLE `medicinestore`
  ADD PRIMARY KEY (`id`),
  ADD KEY `modified_by` (`modified_by`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `phone` (`phone`),
  ADD KEY `modified_by` (`modified_by`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `prescription`
--
ALTER TABLE `prescription`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `appointment_id` (`appointment_id`),
  ADD KEY `modified_by` (`modified_by`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `doctor_id` (`doctor_id`),
  ADD KEY `admit_id` (`admit_id`);

--
-- Indexes for table `rate`
--
ALTER TABLE `rate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `modified_by` (`modified_by`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`id`),
  ADD KEY `modified_by` (`modified_by`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `invoice_id` (`invoice_id`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `room_no` (`room_no`),
  ADD KEY `modified_by` (`modified_by`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `salary`
--
ALTER TABLE `salary`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `_id` (`_id`),
  ADD KEY `modified_by` (`modified_by`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`id`),
  ADD KEY `modified_by` (`modified_by`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `test_name` (`test_name`),
  ADD KEY `modified_by` (`modified_by`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `phone` (`phone`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `modified_by` (`modified_by`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admit`
--
ALTER TABLE `admit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `designation`
--
ALTER TABLE `designation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `doctor`
--
ALTER TABLE `doctor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employeehistory`
--
ALTER TABLE `employeehistory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `generalcheckup`
--
ALTER TABLE `generalcheckup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice_payment`
--
ALTER TABLE `invoice_payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `medical_history`
--
ALTER TABLE `medical_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `medicine`
--
ALTER TABLE `medicine`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `medicinestore`
--
ALTER TABLE `medicinestore`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `prescription`
--
ALTER TABLE `prescription`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `rate`
--
ALTER TABLE `rate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `report`
--
ALTER TABLE `report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `room`
--
ALTER TABLE `room`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `salary`
--
ALTER TABLE `salary`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `service`
--
ALTER TABLE `service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `test`
--
ALTER TABLE `test`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admit`
--
ALTER TABLE `admit`
  ADD CONSTRAINT `admit_ibfk_1` FOREIGN KEY (`patient_of`) REFERENCES `doctor` (`id`),
  ADD CONSTRAINT `admit_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`),
  ADD CONSTRAINT `admit_ibfk_3` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `admit_ibfk_4` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `admit_ibfk_5` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`id`);

--
-- Constraints for table `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `appointment_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `appointment_ibfk_3` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`id`),
  ADD CONSTRAINT `appointment_ibfk_4` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`id`),
  ADD CONSTRAINT `appointment_ibfk_5` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`);

--
-- Constraints for table `department`
--
ALTER TABLE `department`
  ADD CONSTRAINT `department_ibfk_1` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `department_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`);

--
-- Constraints for table `designation`
--
ALTER TABLE `designation`
  ADD CONSTRAINT `designation_ibfk_1` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `designation_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`);

--
-- Constraints for table `doctor`
--
ALTER TABLE `doctor`
  ADD CONSTRAINT `doctor_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `doctor_ibfk_2` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `doctor_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `doctor_ibfk_4` FOREIGN KEY (`designation_id`) REFERENCES `designation` (`id`),
  ADD CONSTRAINT `doctor_ibfk_5` FOREIGN KEY (`chamber_id`) REFERENCES `room` (`id`),
  ADD CONSTRAINT `doctor_ibfk_6` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`);

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `employee_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `employee_ibfk_4` FOREIGN KEY (`designation_id`) REFERENCES `designation` (`id`);

--
-- Constraints for table `employeehistory`
--
ALTER TABLE `employeehistory`
  ADD CONSTRAINT `employeehistory_ibfk_1` FOREIGN KEY (`emplopyee_id`) REFERENCES `employee` (`id`),
  ADD CONSTRAINT `employeehistory_ibfk_2` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `employeehistory_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`);

--
-- Constraints for table `generalcheckup`
--
ALTER TABLE `generalcheckup`
  ADD CONSTRAINT `generalcheckup_ibfk_1` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `generalcheckup_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `generalcheckup_ibfk_3` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`id`);

--
-- Constraints for table `invoice_payment`
--
ALTER TABLE `invoice_payment`
  ADD CONSTRAINT `invoice_payment_ibfk_1` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `invoice_payment_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `invoice_payment_ibfk_3` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`id`),
  ADD CONSTRAINT `invoice_payment_ibfk_4` FOREIGN KEY (`admit_id`) REFERENCES `admit` (`id`);

--
-- Constraints for table `medical_history`
--
ALTER TABLE `medical_history`
  ADD CONSTRAINT `medical_history_ibfk_1` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `medical_history_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `medical_history_ibfk_3` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`id`);

--
-- Constraints for table `medicine`
--
ALTER TABLE `medicine`
  ADD CONSTRAINT `medicine_ibfk_1` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `medicine_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `medicine_ibfk_3` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`id`);

--
-- Constraints for table `medicinestore`
--
ALTER TABLE `medicinestore`
  ADD CONSTRAINT `medicinestore_ibfk_1` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `medicinestore_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`);

--
-- Constraints for table `patient`
--
ALTER TABLE `patient`
  ADD CONSTRAINT `patient_ibfk_1` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `patient_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`);

--
-- Constraints for table `prescription`
--
ALTER TABLE `prescription`
  ADD CONSTRAINT `prescription_ibfk_1` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `prescription_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `prescription_ibfk_3` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`id`),
  ADD CONSTRAINT `prescription_ibfk_4` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`id`),
  ADD CONSTRAINT `prescription_ibfk_5` FOREIGN KEY (`appointment_id`) REFERENCES `appointment` (`id`),
  ADD CONSTRAINT `prescription_ibfk_6` FOREIGN KEY (`admit_id`) REFERENCES `admit` (`id`);

--
-- Constraints for table `rate`
--
ALTER TABLE `rate`
  ADD CONSTRAINT `rate_ibfk_1` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `rate_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`);

--
-- Constraints for table `report`
--
ALTER TABLE `report`
  ADD CONSTRAINT `report_ibfk_1` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `report_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `report_ibfk_3` FOREIGN KEY (`invoice_id`) REFERENCES `invoice_payment` (`id`);

--
-- Constraints for table `room`
--
ALTER TABLE `room`
  ADD CONSTRAINT `room_ibfk_1` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `room_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`);

--
-- Constraints for table `salary`
--
ALTER TABLE `salary`
  ADD CONSTRAINT `salary_ibfk_1` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `salary_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`);

--
-- Constraints for table `service`
--
ALTER TABLE `service`
  ADD CONSTRAINT `service_ibfk_1` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `service_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`);

--
-- Constraints for table `test`
--
ALTER TABLE `test`
  ADD CONSTRAINT `test_ibfk_1` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `test_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `user_ibfk_2` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
