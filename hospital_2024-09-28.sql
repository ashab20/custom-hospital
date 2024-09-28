# ************************************************************
# Sequel Ace SQL dump
# Version 20073
#
# https://sequel-ace.com/
# https://github.com/Sequel-Ace/Sequel-Ace
#
# Host: localhost (MySQL 11.3.2-MariaDB-log)
# Database: hospital
# Generation Time: 2024-09-28 16:21:57 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE='NO_AUTO_VALUE_ON_ZERO', SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table appointment
# ------------------------------------------------------------

DROP TABLE IF EXISTS `appointment`;

CREATE TABLE `appointment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `status` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `modified_by` (`modified_by`),
  KEY `created_by` (`created_by`),
  KEY `doctor_id` (`doctor_id`),
  KEY `patient_id` (`patient_id`),
  KEY `department_id` (`department_id`),
  CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`),
  CONSTRAINT `appointment_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`),
  CONSTRAINT `appointment_ibfk_3` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`id`),
  CONSTRAINT `appointment_ibfk_4` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`id`),
  CONSTRAINT `appointment_ibfk_5` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

LOCK TABLES `appointment` WRITE;
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;

INSERT INTO `appointment` (`id`, `name`, `phone`, `patient_id`, `message`, `doctor_id`, `department_id`, `date`, `time`, `created_at`, `created_by`, `modified_at`, `modified_by`, `status`)
VALUES
	(5,'Mr. Patient','018534342423',3,'Have Very Problem',1,7,'2023-07-18','05:00PM','2023-07-17 17:26:31',1,NULL,NULL,1),
	(6,'Mr. Patient','018534342423',3,'Magna Unde Consequun',1,7,'2023-07-17','05:00PM','2023-07-17 17:27:43',1,NULL,NULL,1),
	(7,'Mr. Patient','018534342423',3,'Ok',1,7,'2023-07-18','06:00PM','2023-07-17 17:29:26',1,NULL,NULL,1),
	(8,'Mr. Patient','018534342423',3,'',1,7,'2023-07-18','07:00PM','2023-07-17 17:34:10',1,NULL,7,0),
	(9,'Mr. Patient','018534342423',3,'',1,7,'2023-07-18','11:00AM','2023-07-17 17:43:20',1,NULL,NULL,1),
	(10,'Mr. Patient','018534342423',3,'',1,7,'2023-07-18','03:00PM','2023-07-17 17:47:06',1,NULL,7,0),
	(11,'Mr. Patient','018534342423',3,'',1,7,'2023-07-18','04:00PM','2023-07-18 00:22:43',1,NULL,NULL,1),
	(12,'Mr. Patient','018534342423',3,'',1,7,'2023-07-18','03:00PM','2023-07-18 00:23:25',1,NULL,NULL,1),
	(13,'Price Key','01840088124',NULL,'Consectetur Voluptat',2,10,'2023-07-18',NULL,'2023-07-18 01:43:45',NULL,NULL,NULL,1),
	(14,'Steven Mcknight','018403242342',NULL,'Sapiente Quos Perfer',2,10,'2023-07-18',NULL,'2023-07-18 01:48:14',NULL,NULL,NULL,1),
	(15,'Brenden Orr','01875432453',6,'',2,10,'2023-07-19','05:00PM','2023-07-18 02:47:45',5,NULL,7,0),
	(16,'Brenden Orr','01875432453',6,'',2,10,'2023-07-19','03:00PM','2023-07-18 02:51:40',5,NULL,7,0),
	(17,'Brenden Orr','01875432453',6,'',2,10,'2023-07-19',NULL,'2023-07-18 03:08:41',5,NULL,NULL,1),
	(18,'Francesca Beard','01840088188',NULL,'Laboriosam Maxime A',3,1,'2024-09-28',NULL,'2024-09-28 12:35:11',NULL,NULL,7,0),
	(19,'Hakeem Mcclure','01231231231',4,'',1,7,'2024-10-01',NULL,'2024-09-28 21:49:29',7,NULL,NULL,1),
	(20,'Hakeem Mcclure','01231231231',4,'',1,7,'2024-10-02',NULL,'2024-09-28 21:53:22',7,NULL,NULL,1),
	(21,'Hakeem Mcclure','01231231231',4,'',1,7,'2024-10-02',NULL,'2024-09-28 21:53:33',7,NULL,NULL,1),
	(22,'Hakeem Mcclure','01231231231',4,'',1,7,'2024-10-02',NULL,'2024-09-28 21:55:39',7,NULL,NULL,1),
	(23,'Hakeem Mcclure','01231231231',4,'',1,7,'2024-10-04',NULL,'2024-09-28 21:56:06',7,NULL,NULL,1),
	(24,'Hakeem Mcclure','01231231231',4,'',1,7,'2024-10-04',NULL,'2024-09-28 21:56:52',7,NULL,NULL,1),
	(25,'Brenden Orr','01875432453',6,'',1,7,'2024-10-04',NULL,'2024-09-28 21:58:58',7,NULL,NULL,1),
	(26,'Katelyn Pena','01840088189',7,'',1,7,'2024-10-04',NULL,'2024-09-28 21:59:21',7,NULL,NULL,1),
	(27,'Katelyn Pena','01840088189',7,'',1,7,'2024-10-05',NULL,'2024-09-28 22:02:20',7,NULL,NULL,0);

/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table department
# ------------------------------------------------------------

DROP TABLE IF EXISTS `department`;

CREATE TABLE `department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `modified_by` (`modified_by`),
  KEY `created_by` (`created_by`),
  CONSTRAINT `department_ibfk_1` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`),
  CONSTRAINT `department_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;

INSERT INTO `department` (`id`, `name`, `created_by`, `created_at`, `modified_at`, `modified_by`, `status`)
VALUES
	(1,'Pethology',1,'2022-07-06 17:41:15','0000-00-00 00:00:00',NULL,1),
	(2,'Allergists/Immunologists',1,'2022-07-06 17:41:34','0000-00-00 00:00:00',NULL,1),
	(3,'Anesthesiologists',1,'2022-07-06 17:41:41','0000-00-00 00:00:00',NULL,1),
	(4,'Critical Care Medicine Specialists',1,'2022-07-21 10:08:35','0000-00-00 00:00:00',NULL,1),
	(5,'Hematologists',1,'2022-07-21 10:08:46','0000-00-00 00:00:00',NULL,1),
	(6,'Internists',1,'2022-07-21 10:08:54','0000-00-00 00:00:00',NULL,1),
	(7,'Neurologists',1,'2022-07-21 10:09:03','0000-00-00 00:00:00',NULL,1),
	(8,'Plastic Surgeons',1,'2022-07-21 10:09:16','0000-00-00 00:00:00',NULL,1),
	(9,'Podiatrists',1,'2022-07-21 10:09:26','0000-00-00 00:00:00',NULL,1),
	(10,'Radiologists',1,'2022-07-21 10:09:46','0000-00-00 00:00:00',NULL,1);

/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table designation
# ------------------------------------------------------------

DROP TABLE IF EXISTS `designation`;

CREATE TABLE `designation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `designation_name` varchar(255) NOT NULL,
  `base_salary` decimal(10,2) NOT NULL,
  `bounus_by_percent` decimal(5,2) DEFAULT NULL,
  `total_bounus` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `modified_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `modified_by` (`modified_by`),
  KEY `created_by` (`created_by`),
  CONSTRAINT `designation_ibfk_1` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`),
  CONSTRAINT `designation_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

LOCK TABLES `designation` WRITE;
/*!40000 ALTER TABLE `designation` DISABLE KEYS */;

INSERT INTO `designation` (`id`, `designation_name`, `base_salary`, `bounus_by_percent`, `total_bounus`, `created_at`, `created_by`, `modified_at`, `modified_by`, `status`)
VALUES
	(1,'Reciptionist',32000.00,0.15,2,'2022-07-06 17:42:07',1,'0000-00-00 00:00:00',NULL,1),
	(2,'Supervisor',25000.00,0.15,2,'2022-07-06 17:42:34',1,'0000-00-00 00:00:00',NULL,1),
	(3,'Medical Officer',25000.00,0.15,2,'2022-07-06 17:42:54',1,'0000-00-00 00:00:00',NULL,1),
	(4,'Medical Surgent',50000.00,0.15,2,'2022-07-21 10:11:31',1,'0000-00-00 00:00:00',NULL,1);

/*!40000 ALTER TABLE `designation` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table doctor
# ------------------------------------------------------------

DROP TABLE IF EXISTS `doctor`;

CREATE TABLE `doctor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `status` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `modified_by` (`modified_by`),
  KEY `created_by` (`created_by`),
  KEY `designation_id` (`designation_id`),
  KEY `chamber_id` (`chamber_id`),
  KEY `department_id` (`department_id`),
  CONSTRAINT `doctor_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `doctor_ibfk_2` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`),
  CONSTRAINT `doctor_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`),
  CONSTRAINT `doctor_ibfk_4` FOREIGN KEY (`designation_id`) REFERENCES `designation` (`id`),
  CONSTRAINT `doctor_ibfk_5` FOREIGN KEY (`chamber_id`) REFERENCES `room` (`id`),
  CONSTRAINT `doctor_ibfk_6` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;

INSERT INTO `doctor` (`id`, `user_id`, `father_name`, `mother_name`, `qualification`, `gratuated_from`, `gender`, `date_of_birth`, `shift`, `chamber_id`, `designation_id`, `daily_approval_patient`, `visit_fee`, `department_id`, `created_at`, `created_by`, `modified_at`, `modified_by`, `status`)
VALUES
	(1,2,'Father','Mother','MBBS, FCPS, FCPS-2','Chittagong Medical College','male','1987-06-01','EVENING',3,4,'5',2000.00,7,'2022-07-21 10:37:18',1,'0000-00-00 00:00:00',NULL,1),
	(2,3,'Father','Mother','FCPS','Sylhet Osmani Medical College','female','2015-06-10','EVENING',2,3,'15',1000.00,10,'2022-07-21 10:58:06',1,'0000-00-00 00:00:00',NULL,1),
	(3,4,'Carter Rosario','Ivy Clemons','Quas Saepe In Dicta ','Harum Deserunt Et Ad','female','2013-04-19','NIGHT',1,1,'Tempor corrupti est',27.00,1,'2023-07-18 02:28:11',1,'0000-00-00 00:00:00',NULL,1);

/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table employee
# ------------------------------------------------------------

DROP TABLE IF EXISTS `employee`;

CREATE TABLE `employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `status` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `modified_by` (`modified_by`),
  KEY `created_by` (`created_by`),
  KEY `designation_id` (`designation_id`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`),
  CONSTRAINT `employee_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`),
  CONSTRAINT `employee_ibfk_4` FOREIGN KEY (`designation_id`) REFERENCES `designation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



# Dump of table patient
# ------------------------------------------------------------

DROP TABLE IF EXISTS `patient`;

CREATE TABLE `patient` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `status` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`),
  KEY `modified_by` (`modified_by`),
  KEY `created_by` (`created_by`),
  CONSTRAINT `patient_ibfk_1` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`),
  CONSTRAINT `patient_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;

INSERT INTO `patient` (`id`, `name`, `father_or_husband_name`, `mother_name`, `religious`, `nid`, `blood_group`, `nationality`, `marital_status`, `phone`, `gender`, `age`, `relagius`, `weight`, `present_address`, `permanent_address`, `created_at`, `created_by`, `modified_at`, `modified_by`, `status`)
VALUES
	(1,'Mr. Rabib Hasan','MR,','Mrs',NULL,'','A+',NULL,'MARRIED','01840083454','male','35',NULL,NULL,'Ctg','Bhula','2022-07-21 09:59:30',1,'0000-00-00 00:00:00',NULL,1),
	(2,'Mr Patient','Mr ','Mrs',NULL,'','',NULL,'UNMARRIED','01845345345','male','56',NULL,NULL,'ctg','','2022-07-21 10:49:01',1,'0000-00-00 00:00:00',NULL,1),
	(3,'Mr. Patient','Abdur Rohman','Sayeda Yasmin Akther',NULL,'','A+',NULL,'UNMARRIED','018534342423','male','23',NULL,NULL,'abc Address','abc Address','2023-07-12 22:42:51',1,'0000-00-00 00:00:00',NULL,1),
	(4,'Hakeem Mcclure','Destiny Huffman','Kirk Gross',NULL,NULL,NULL,NULL,'UNMARRIED','01231231231','male','67',NULL,NULL,'Chastity Turner',NULL,'2023-07-18 01:39:49',7,'0000-00-00 00:00:00',NULL,1),
	(5,'Steven Mcknight',NULL,NULL,NULL,NULL,NULL,NULL,'UNMARRIED','018403242342','male','13',NULL,NULL,NULL,NULL,'2023-07-18 01:48:14',NULL,'0000-00-00 00:00:00',NULL,1),
	(6,'Brenden Orr','Addison Park','Jason Raymond',NULL,'Quia dignissimos rep','A+',NULL,'UNMARRIED','01875432453','male','34',NULL,NULL,'Magni ea nulla unde ','Tempor quos alias es','2023-07-18 02:47:19',5,'0000-00-00 00:00:00',NULL,1),
	(7,'Katelyn Pena','Destiny Serrano','Ingrid Tran',NULL,NULL,NULL,NULL,'UNMARRIED','01840088189','male','69',NULL,NULL,'Vance Hansen',NULL,'2024-09-28 12:35:11',7,'0000-00-00 00:00:00',NULL,1);

/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table prescription
# ------------------------------------------------------------

DROP TABLE IF EXISTS `prescription`;

CREATE TABLE `prescription` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `status` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `appointment_id` (`appointment_id`),
  KEY `modified_by` (`modified_by`),
  KEY `created_by` (`created_by`),
  KEY `patient_id` (`patient_id`),
  KEY `doctor_id` (`doctor_id`),
  KEY `admit_id` (`admit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

LOCK TABLES `prescription` WRITE;
/*!40000 ALTER TABLE `prescription` DISABLE KEYS */;

INSERT INTO `prescription` (`id`, `patient_id`, `doctor_id`, `appointment_id`, `admit_id`, `medicine_id`, `test`, `description`, `advice`, `overal_comment`, `created_at`, `created_by`, `modified_at`, `modified_by`, `status`)
VALUES
	(1,3,NULL,3,NULL,X'5B2231222C2232225D',X'5B22436263225D',X'5B226F6B225D',X'5B226B616C69207065746865225D','','2023-07-12 22:45:47',NULL,'0000-00-00 00:00:00',NULL,1),
	(2,1,NULL,2,NULL,X'5B2233222C2234225D',X'5B22582D726179225D',X'5B22225D',X'5B22225D','','2023-07-13 01:08:45',NULL,'0000-00-00 00:00:00',NULL,1);

/*!40000 ALTER TABLE `prescription` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table room
# ------------------------------------------------------------

DROP TABLE IF EXISTS `room`;

CREATE TABLE `room` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `status` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `room_no` (`room_no`),
  KEY `modified_by` (`modified_by`),
  KEY `created_by` (`created_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;

INSERT INTO `room` (`id`, `room_type`, `room_no`, `rate`, `capacity`, `details`, `floor`, `availability`, `created_at`, `created_by`, `modified_at`, `modified_by`, `status`)
VALUES
	(1,'GENERAL-CABIN','101',0.00,1,'','Ground Floor','YES','2022-07-06 17:43:26',1,'0000-00-00 00:00:00',NULL,1),
	(2,'CHAMBER','102',0.00,1,'','Ground Floor','YES','2022-07-06 17:43:41',1,'0000-00-00 00:00:00',NULL,1),
	(3,'CHAMBER','103',0.00,1,'','Ground Floor','YES','2022-07-06 17:44:01',1,'0000-00-00 00:00:00',NULL,1),
	(5,'CHAMBER','104',0.00,1,'[\"Tv\"]','1st','YES','2022-07-21 10:13:54',1,'0000-00-00 00:00:00',NULL,1),
	(6,'CHAMBER','106',0.00,1,'','Ground Floor','YES','2022-07-21 10:25:45',1,'0000-00-00 00:00:00',NULL,1),
	(7,'GENERAL-CABIN','108',0.00,8,'','Ground Floor','YES','2022-07-21 10:26:26',1,'0000-00-00 00:00:00',NULL,1),
	(8,'ICU','401',0.00,8,'[\"AC\",\"Refrigerator\",\"Locker\"]','4th','NO','2022-07-21 10:51:19',1,'0000-00-00 00:00:00',NULL,1),
	(9,'CCU','301',0.00,4,'[\"AC\",\"Refrigerator\",\"Locker\"]','3RD FLOOR','YES','2022-07-21 10:27:57',1,'0000-00-00 00:00:00',NULL,1);

/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `status` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `email` (`email`),
  KEY `created_by` (`created_by`),
  KEY `modified_by` (`modified_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;

INSERT INTO `user` (`id`, `avatar`, `name`, `email`, `password`, `phone`, `roles`, `address`, `created_at`, `created_by`, `modified_at`, `modified_by`, `status`)
VALUES
	(1,NULL,'Admin','admin@gmail.com','8843028fefce50a6de50acdf064ded27','0143435435435','SUPERADMIN','','2022-07-06 17:34:56',NULL,'2023-07-13 01:11:18',1,1),
	(2,NULL,'Mr. Doctor','doctor@gmail.com','b714337aa8007c433329ef43c7b8252c','01744100139','DOCTOR','Bhola','2022-07-06 17:40:48',1,NULL,NULL,1),
	(3,NULL,'Dr. Tashin Mustafe','tasin@gmail.com','b714337aa8007c433329ef43c7b8252c','01717661719','DOCTOR','chawakbazar','2022-07-15 11:22:07',1,NULL,NULL,1),
	(4,NULL,'Habibur Rohman','habibur@gmail.com','b714337aa8007c433329ef43c7b8252c','01739000999','DOCTOR','Dhaka','2022-07-21 10:59:18',1,NULL,NULL,1),
	(5,NULL,'Assistatnt','asst@gmail.com','125bce26d032f2034e26cf229da4b52e','01345673434','ASSISTANT',NULL,'2023-07-18 02:30:27',NULL,NULL,NULL,1),
	(6,NULL,'Supper Admin','superadmin@gmail.com','8843028fefce50a6de50acdf064ded27','01840088189','SUPERADMIN',NULL,'2024-09-28 12:17:46',NULL,NULL,NULL,1),
	(7,NULL,'Admin','ashab1@gmail.com','125bce26d032f2034e26cf229da4b52e','01840088188','ADMIN',NULL,'2024-09-28 12:33:00',NULL,NULL,NULL,1),
	(9,NULL,'Maria','maria@gmail.com','8843028fefce50a6de50acdf064ded27','01840088187','ASSISTANT',NULL,'2024-09-28 22:17:13',NULL,NULL,NULL,1);

/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
