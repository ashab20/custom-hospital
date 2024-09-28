CREATE TABLE `admit` (
  `id` int(11) NOT NULL,
  `room_id` int(11) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `modified_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
);

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `id` int(11) NOT NULL,
  `name` varchar(40) NOT NULL,
  `father_or_husband_name` varchar(50) NULL,
  `phone` varchar(15) DEFAULT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `message` text,
  `doctor_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
);

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
);

-- --------------------------------------------------------

--
-- Table structure for table `designation`
--

CREATE TABLE `designation` (
  `id` int(11) NOT NULL,
  `designation_name` varchar(255) NOT NULL,
  `base_salary` decimal(10,2) NOT NULL,
  `bounus_by_percent` decimal(5,0) DEFAULT NULL,
  `total_bounus` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `modified_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
);

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `father_name` varchar(40) NOT NULL,
  `mother_name` varchar(40) NOT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `date_of_birth` date NOT NULL,
  `qualification` varchar(200) DEFAULT NULL,
  `gratuated_from` varchar(200) DEFAULT NULL,
  `shift` enum('MORNING','EVENING','NIGHT') DEFAULT NULL,
  `chamber_id` int(11) DEFAULT NULL,
  `designation_id` int(11) DEFAULT NULL,
  `visit_fee` decimal(7,2) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `modified_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
);

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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `modified_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
);

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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `modified_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
);

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `id` int(11) NOT NULL,
  `name` varchar(40) NOT NULL,
  `phone` varchar(13) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `age` varchar(3) NOT NULL,
  `weight` int(11) DEFAULT NULL,
  `address` varchar(30) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `modified_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
);

-- --------------------------------------------------------

--
-- Table structure for table `invoice_payment`
--

CREATE TABLE `invoice_payment` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `tax` int(11) DEFAULT NULL,
  `discount` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `net` int(11) DEFAULT NULL,
  `advance` int(11) DEFAULT NULL,
  `due` int(11) DEFAULT NULL,
  `remark` enum('DUE','RECIVED','PRCESSCING') DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `modified_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
);

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

CREATE TABLE `report` (
  `id` int(11) NOT NULL,
  `patient_id` int(20) DEFAULT NULL,
  `test_id` int(11) DEFAULT NULL,
  `payment_id` int(11) DEFAULT NULL,
  `printed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `condition_on` varchar(255) DEFAULT NULL,
  `issues_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) DEFAULT NULL,
  `modified_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
);

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `id` int(11) NOT NULL,
  `room_type` enum('GENERAL-CABIN','VIP-CABIN','CHAMBER','OT','GUEST-ROOM') DEFAULT 'GENERAL-CABIN',
  `room_no` varchar(30) DEFAULT NULL,
  `details` varchar(255) DEFAULT NULL,
  `floor` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `modified_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
);

-- --------------------------------------------------------

--
-- Table structure for table `salary`
--

CREATE TABLE `salary` (
  `id` int(11) NOT NULL,
  `_id` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `modified_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
);

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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `modified_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
);

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE `test` (
  `id` int(11) NOT NULL,
  `test_name` varchar(20) NOT NULL,
  `delivary` date NOT NULL,
  `description` text,
  `time` varchar(10) DEFAULT '7:00PM',
  `rate` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `modified_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(40) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `password` char(40) NOT NULL,
  `phone` varchar(13) NOT NULL,
  `last_service` date DEFAULT NULL,
  `roles` enum('SUPERADMIN','ADMIN','DOCTOR','EMPLOYEE') DEFAULT 'EMPLOYEE',
  `address` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
);

INSERT INTO `user` (`id`, `avatar`, `name`, `email`, `password`, `phone`, `roles`, `address`, `created_at`, `created_by`, `modified_at`, `modified_by`, `status`) VALUES
(1, NULL, 'Ashab Uddin', 'ashab@gmail.com', '125bce26d032f2034e26cf229da4b52e', '01840088189', 'SUPERADMIN', NULL, '2022-07-06 11:34:56', NULL, NULL, NULL, 1),
(2, NULL, 'Mr. Doctor', 'doctor@gmail.com', 'b714337aa8007c433329ef43c7b8252c', '01744100139', 'DOCTOR', 'Bhola', '2022-07-06 11:40:48', 1, NULL, NULL, 1),
(3, NULL, 'Dr. Tashin Mustafe', 'tasin@gmail.com', 'b714337aa8007c433329ef43c7b8252c', '01717661719', 'DOCTOR', 'chawakbazar', '2022-07-15 05:22:07', 1, NULL, NULL, 1),
(4, NULL, 'Habibur Rohman', 'habibur@gmail.com', 'b714337aa8007c433329ef43c7b8252c', '01739000999', 'DOCTOR', 'Dhaka', '2022-07-21 04:59:18', 1, NULL, NULL, 1);


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


INSERT INTO `designation` (`id`, `designation_name`, `base_salary`, `bounus_by_percent`, `total_bounus`, `created_at`, `created_by`, `modified_at`, `modified_by`, `status`) VALUES
(1, 'Reciptionist', '32000.00', '0.15', 2, '2022-07-06 11:42:07', 1, '0000-00-00 00:00:00', NULL, 1),
(2, 'Supervisor', '25000.00', '0.15', 2, '2022-07-06 11:42:34', 1, '0000-00-00 00:00:00', NULL, 1),
(3, 'Medical Officer', '25000.00', '0.15', 2, '2022-07-06 11:42:54', 1, '0000-00-00 00:00:00', NULL, 1),
(4, 'Medical Surgent', '50000.00', '0.15', 2, '2022-07-21 04:11:31', 1, '0000-00-00 00:00:00', NULL, 1);




INSERT INTO `doctor` (`id`, `user_id`, `father_name`, `mother_name`, `qualification`, `gratuated_from`, `gender`, `date_of_birth`, `shift`, `designation_id`, `visit_fee`, `department_id`, `created_at`, `created_by`, `modified_at`, `modified_by`, `status`) VALUES
(1, 2, 'Father', 'Mother', 'MBBS, FCPS, FCPS-2', 'Chittagong Medical College', 'male', '1987-06-01', 'EVENING',  4, '2000.00', 7, '2022-07-21 04:37:18', 1, '0000-00-00 00:00:00', NULL, 1),
(2, 3, 'Father', 'Mother', 'FCPS', 'Sylhet Osmani Medical College', 'female', '2015-06-10', 'EVENING',  3, '1000.00', 10, '2022-07-21 04:58:06', 1, '0000-00-00 00:00:00', NULL, 1);


INSERT INTO `patient` (`id`, `name`, `father_or_husband_name`, `mother_name`, `religious`, `nid`, `blood_group`, `nationality`, `marital_status`, `phone`, `gender`, `age`, `relagius`, `weight`, `present_address`, `permanent_address`, `created_at`, `created_by`, `modified_at`, `modified_by`, `status`) VALUES
(1, 'Mr. Rabib Hasan', 'MR,', 'Mrs', NULL, '', 'A+', NULL, 'MARRIED', '01840083454', 'male', '35', NULL, NULL, 'Ctg', 'Bhula', '2022-07-21 03:59:30', 1, '0000-00-00 00:00:00', NULL, 1),
(2, 'Mr Patient', 'Mr ', 'Mrs', NULL, '', '', NULL, 'UNMARRIED', '01845345345', 'male', '56', NULL, NULL, 'ctg', '', '2022-07-21 04:49:01', 1, '0000-00-00 00:00:00', NULL, 1);


INSERT INTO `appointment` (`id`, `name`, `phone`, `patient_id`, `message`, `doctor_id`, `department_id`, `date`, `time`, `created_at`, `created_by`, `modified_at`, `modified_by`, `status`) VALUES
(1, 'Mr. Rabib Hasan', '01840083454', 1, '', 1, 7, '2022-07-23', '02:00PM', '2022-07-21 04:37:48', 1, NULL, NULL, 1),
(2, 'Mr. Rabib Hasan', '01840083454', 1, '', 1, 7, '2022-07-22', '01:00PM', '2022-07-21 04:39:44', 1, NULL, NULL, 1);





COMMIT;