-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 15, 2022 at 07:17 PM
-- Server version: 10.6.7-MariaDB-2ubuntu1.1
-- PHP Version: 8.1.2


SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


create table `users`(
    id int auto_increment primary key,
    avatar varchar(255),
    name varchar(255) not null,
    email varchar(40) unique,
    password char(40) not null,
    phone varchar(13) unique not null,
    roles ENUM('SUPERADMIN','ADMIN','DOCTOR','ASSISTANT') default 'ASSISTANT',
    address text,
    created_at timestamp default now(),
    created_by int,
    modified_at datetime,
    modified_by int,
    status int not null default 1,
    foreign key (created_by) references users(id),
    foreign key (modified_by) references users(id)
);



-- tested
create table `designation` (id int auto_increment primary key, designation_name varchar(255) not null, base_salary decimal(10,2) not null, bounus_by_percent decimal(5,2), total_bounus int ,created_at  timestamp default now(), created_by int , modified_at timestamp, modified_by int, status int not null default 1, foreign key (modified_by) references user(id),foreign key (created_by) references user(id));

create table `department` (id int auto_increment primary key,name varchar(255) not null unique, created_by int,created_at  timestamp default now(), modified_at timestamp, modified_by int, status int not null default 1, foreign key (modified_by) references user(id),foreign key (created_by) references user(id));



--  room_no='A5' ,details='ac' , floor='2nd' , created_by=3;
create table `room` (id int auto_increment primary key, room_type ENUM('GENERAL-CABIN','NON-AC-CABIN','AC-CABIN','VIP-CABIN','CHAMBER','OT','WAITING-ROOM','ICU','CCU') default 'GENERAL-CABIN', room_no varchar(30) unique, rate decimal(10, 2) not null, capacity decimal(2) not null default 1, details varchar(255) default null , floor varchar(20),availability ENUM('YES','NO') default 'YES',created_at  timestamp default now(),  created_by int, modified_at timestamp, modified_by int, status int not null default 1, foreign key (modified_by) references user(id),foreign key (created_by) references user(id));



-- tested
-- doctor schema
create table `doctor` (id int auto_increment primary key,user_id int,father_name varchar(40) not null, mother_name varchar(40) not null,qualification varchar(100), gratuated_from varchar(100),gender varchar(10) null,date_of_birth  date not null, shift ENUM('MORNING','EVENING','NIGHT'),daily_approval_patient varchar(20), chamber_id int, designation_id int, visit_fee decimal(7,2),department_id int, created_at  timestamp default now(),  created_by int, modified_at timestamp, modified_by int, status int not null default 1,foreign key (user_id) references user(id), foreign key (modified_by) references user(id),foreign key (created_by) references user(id),foreign key (designation_id) references designation(id),foreign key (chamber_id) references room(id),foreign key (department_id) references department(id));



create table `patient` (id int auto_increment primary key,name varchar(40) not null,father_or_husband_name varchar(40) not null,mother_name varchar(40) default null, religious varchar(10),nid varchar(40),blood_group varchar(10),nationality varchar(20),marital_status enum('MARRIED', 'UNMARRIED', 'OTHERS') default 'UNMARRIED',phone varchar(13) not null unique, gender varchar(10) not null , age varchar(3) not null,relagius varchar(10), weight int, present_address varchar(255),permanent_address varchar(255), created_at  timestamp default now(),  created_by int, modified_at timestamp, modified_by int, status int not null default 1, foreign key (modified_by) references user(id),foreign key (created_by) references user(id));


-- appointment
create table `appointment` (id int auto_increment primary key,name varchar(40) not null,phone varchar(15) ,patient_id int, message text,doctor_id int, department_id int, date date, time varchar(20), created_at  timestamp default now(), created_by int, modified_at datetime , modified_by int, status int not null default 1, foreign key (modified_by) references user(id),foreign key (created_by) references user(id),foreign key (doctor_id) references doctor(id),foreign key (patient_id) references patient(id),foreign key (department_id) references department(id));

-- patient schema

-- employee schema
create table `employee` (id int auto_increment primary key,user_id int,father_name varchar(40) not null, mother_name varchar(40) not null,gender varchar(10) null,date_of_birth  date not null, shift ENUM('MORNING','EVENING','NIGHT'),  designation_id int, base_salary int, created_at  timestamp default now(),  created_by int, modified_at timestamp, modified_by int, status int not null default 1,foreign key (user_id) references user(id), foreign key (modified_by) references user(id),foreign key (created_by) references user(id),foreign key (designation_id) references designation(id));


create table `employeehistory` (id int auto_increment primary key, emplopyee_id int, joined_date date not null, leave_date date not null, atentance int, absense int , created_at  timestamp default now(),  created_by int, modified_at timestamp, modified_by int, status int not null default 1,foreign key (emplopyee_id) references employee(id), foreign key (modified_by) references user(id),foreign key (created_by) references user(id));


-- salary
create table `salary` (id int auto_increment primary key, _id varchar(20) unique not null, created_at  timestamp default now(),  created_by int, modified_at timestamp, modified_by int, status int not null default 1, foreign key (modified_by) references user(id),foreign key (created_by) references user(id));

-- rate
create table `rate` (id int auto_increment primary key, service_name varchar(255), rate decimal(10,2) not null , created_at  timestamp default now(),  created_by int, modified_at timestamp, modified_by int, status int not null default 1, foreign key (modified_by) references user(id),foreign key (created_by) references user(id));


-- addmit
create table `admit` (id int auto_increment primary key,patient_id int, `guardian_name` varchar(255) not null,emargency_contact varchar(13),`relationship_with_patient` varchar(100),`refarecne_by` varchar(100),`patient_of` int not null, room_id int not null, `entry_time` datetime not null, `out_time` datetime,duration int,`patient_condition` varchar(255),roles ENUM('ADMITTED','RELEASED') not null,created_at  timestamp default now(),  created_by int not null, modified_at timestamp, modified_by int, status int not null default 1,foreign key (`patient_of`) references doctor(id),foreign key (room_id) references room(id), foreign key (modified_by) references user(id),foreign key (created_by) references user(id),foreign key (patient_id) references patient(id));


create table medical_history(id int auto_increment primary key,patient_id int, created_at  timestamp default now(),  created_by int not null, modified_at timestamp, modified_by int, status int not null default 1, foreign key (modified_by) references user(id),foreign key (created_by) references user(id),foreign key (patient_id) references patient(id));


create table medicine( id int auto_increment primary key,patient_id int not null, type ENUM("TAB","INJ") not null,medicine_name varchar(100) not null,mg decimal(5) UNSIGNED ,dose varchar(20) not null,day varchar(20),comment varchar(255),created_at  timestamp default now(),  created_by int, modified_at timestamp, modified_by int, status int not null default 1, foreign key (modified_by) references user(id),foreign key (created_by) references user(id) ,foreign key (patient_id) references patient(id));

create table `prescription`(
    id int auto_increment primary key,
    patient_id int,
    doctor_id int,
    appointment_id int unique,
    admit_id int,
    medicine_id JSON DEFAULT NULL,
    test JSON DEFAULT NULL,
    description JSON DEFAULT NULL,
    advice JSON DEFAULT NULL,
    overal_comment text,
    created_at timestamp default now(),
    created_by int,
    modified_at timestamp,
    modified_by int,
    status int not null default 1,
    foreign key (modified_by) references users(id),
    foreign key (created_by) references users(id),
    foreign key (patient_id) references patient(id),
    foreign key (doctor_id) references doctor(id),
    foreign key (appointment_id) references appointment(id),
    foreign key (admit_id) references admit(id)
);


create table generalcheckup( id int auto_increment primary key,patient_id int not null, presure varchar(20) not null,temperature varchar(20) not null,bp varchar(30) , saturation varchar(20), status int not null default 1,created_at  timestamp default now(),  created_by int, modified_at timestamp, modified_by int, foreign key (modified_by) references user(id),foreign key (created_by) references user(id),foreign key (patient_id) references patient(id));





INSERT INTO `user` (`id`, `avatar`, `name`, `email`, `password`, `phone`, `roles`, `address`, `created_at`, `created_by`, `modified_at`, `modified_by`, `status`) VALUES
(1, NULL, 'Maria', 'maria@gmail.com', '125bce26d032f2034e26cf229da4b52e', '0134232432', 'SUPERADMIN', NULL, '2022-07-06 11:34:56', NULL, NULL, NULL, 1),
(2, NULL, 'Mr. Doctor', 'doctor@gmail.com', 'b714337aa8007c433329ef43c7b8252c', '01744100139', 'DOCTOR', 'Bhola', '2022-07-06 11:40:48', 1, NULL, NULL, 1),


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
(1, 'Assistant', '32000.00', '0.15', 2, '2022-07-06 11:42:07', 1, '0000-00-00 00:00:00', NULL, 1),
(2, 'Supervisor', '25000.00', '0.15', 2, '2022-07-06 11:42:34', 1, '0000-00-00 00:00:00', NULL, 1),
(3, 'Medical Officer', '25000.00', '0.15', 2, '2022-07-06 11:42:54', 1, '0000-00-00 00:00:00', NULL, 1),
(4, 'Medical Surgent', '50000.00', '0.15', 2, '2022-07-21 04:11:31', 1, '0000-00-00 00:00:00', NULL, 1);


INSERT INTO `room` (`id`, `room_type`, `room_no`, `capacity`, `details`, `floor`, `availability`, `created_at`, `created_by`, `modified_at`, `modified_by`, `status`) VALUES
(1, 'GENERAL-CABIN', '101', '1', '', 'Ground Floor', 'YES', '2022-07-06 11:43:26', 1, '0000-00-00 00:00:00', NULL, 1),
(2, 'CHAMBER', '102', '1', '', 'Ground Floor', 'YES', '2022-07-06 11:43:41', 1, '0000-00-00 00:00:00', NULL, 1),
(3, 'CHAMBER', '103', '1', '', 'Ground Floor', 'YES', '2022-07-06 11:44:01', 1, '0000-00-00 00:00:00', NULL, 1),
(5, 'CHAMBER', '104', '1', '[\"Tv\"]', '1st', 'YES', '2022-07-21 04:13:54', 1, '0000-00-00 00:00:00', NULL, 1),
(6, 'CHAMBER', '106', '1', '', 'Ground Floor', 'YES', '2022-07-21 04:25:45', 1, '0000-00-00 00:00:00', NULL, 1),
(7, 'GENERAL-CABIN', '108', '8', '', 'Ground Floor', 'YES', '2022-07-21 04:26:26', 1, '0000-00-00 00:00:00', NULL, 1),
(8, 'ICU', '401', '8', '[\"AC\",\"Refrigerator\",\"Locker\"]', '4th', 'NO', '2022-07-21 04:51:19', 1, '0000-00-00 00:00:00', NULL, 1),
(9, 'CCU', '301', '4', '[\"AC\",\"Refrigerator\",\"Locker\"]', '3RD FLOOR', 'YES', '2022-07-21 04:27:57', 1, '0000-00-00 00:00:00', NULL, 1);


INSERT INTO `doctor` (`id`, `user_id`, `father_name`, `mother_name`, `qualification`, `gratuated_from`, `gender`, `date_of_birth`, `shift`, `chamber_id`, `designation_id`, `visit_fee`, `department_id`, `created_at`, `created_by`, `modified_at`, `modified_by`, `status`) VALUES
(1, 2, 'Father', 'Mother', 'MBBS, FCPS, FCPS-2', 'Chittagong Medical College', 'male', '1987-06-01', 'EVENING', 3, 4, '2000.00', 7, '2022-07-21 04:37:18', 1, '0000-00-00 00:00:00', NULL, 1),
(2, 3, 'Father', 'Mother', 'FCPS', 'Sylhet Osmani Medical College', 'female', '2015-06-10', 'EVENING', 2, 3, '1000.00', 10, '2022-07-21 04:58:06', 1, '0000-00-00 00:00:00', NULL, 1);


INSERT INTO `patient` (`id`, `name`, `father_or_husband_name`, `mother_name`, `religious`, `nid`, `blood_group`, `nationality`, `marital_status`, `phone`, `gender`, `age`, `relagius`, `weight`, `present_address`, `permanent_address`, `created_at`, `created_by`, `modified_at`, `modified_by`, `status`) VALUES
(1, 'Mr. Rabib Hasan', 'MR,', 'Mrs', NULL, '', 'A+', NULL, 'MARRIED', '01840083454', 'male', '35', NULL, NULL, 'Ctg', 'Bhula', '2022-07-21 03:59:30', 1, '0000-00-00 00:00:00', NULL, 1),
(2, 'Mr Patient', 'Mr ', 'Mrs', NULL, '', '', NULL, 'UNMARRIED', '01845345345', 'male', '56', NULL, NULL, 'ctg', '', '2022-07-21 04:49:01', 1, '0000-00-00 00:00:00', NULL, 1);




INSERT INTO `appointment` (`id`, `name`, `phone`, `patient_id`, `message`, `doctor_id`, `department_id`, `date`, `time`, `created_at`, `created_by`, `modified_at`, `modified_by`, `status`) VALUES
(1, 'Mr. Rabib Hasan', '01840083454', 1, '', 1, 7, '2022-07-23', '02:00PM', '2022-07-21 04:37:48', 1, NULL, NULL, 1),
(2, 'Mr. Rabib Hasan', '01840083454', 1, '', 1, 7, '2022-07-22', '01:00PM', '2022-07-21 04:39:44', 1, NULL, NULL, 1);


