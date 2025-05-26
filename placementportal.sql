-- phpMyAdmin SQL Dump
-- version 2.9.2
-- http://www.phpmyadmin.net
-- 
-- Host: localhost
-- Generation Time: May 26, 2025 at 09:14 PM
-- Server version: 5.0.27
-- PHP Version: 5.2.1
-- 
-- Database: `placementportal`
-- 

-- --------------------------------------------------------

-- 
-- Table structure for table `admin`
-- 

CREATE TABLE `admin` (
  `admin_id` char(10) NOT NULL,
  `name` varchar(60) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `department` varchar(50) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `year_of_joining` year(4) NOT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY  (`admin_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `admin`
-- 

INSERT INTO `admin` (`admin_id`, `name`, `email`, `password`, `department`, `contact`, `year_of_joining`, `image`) VALUES 
('ABMETCH23', 'Radghav Sharma', 'raghavsharmaa@banasthali.in', 'Jyoti@1112007', 'ME', '9876543210', 2005, 'images/bvp4.jpg'),
('adm123', 'Amit Kumar', 'am123@banasthali.in', 'abcD@123', 'CSE', '9876543210', 2023, 'images/Screenshot (16).png'),
('adm143', 'Ajay Singh', 'adm143@banasthali.in', 'abcF@123', 'ME', '9876543210', 2025, 'images/bvp3.jpg');

-- --------------------------------------------------------

-- 
-- Table structure for table `alumni`
-- 

CREATE TABLE `alumni` (
  `alumni_id` int(11) NOT NULL auto_increment,
  `student_id` char(20) NOT NULL,
  `company_id` int(11) unsigned default NULL,
  `year_of_join` year(4) NOT NULL,
  `domain` varchar(100) NOT NULL,
  `session` varchar(50) NOT NULL,
  PRIMARY KEY  (`alumni_id`),
  UNIQUE KEY `student_id` (`student_id`),
  KEY `company_id` (`company_id`),
  KEY `year_of_join` (`year_of_join`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

-- 
-- Dumping data for table `alumni`
-- 

INSERT INTO `alumni` (`alumni_id`, `student_id`, `company_id`, `year_of_join`, `domain`, `session`) VALUES 
(1, 'abmca12312', 1, 2024, 'software engineer', '2023-2025'),
(2, 'abmca24028', 2, 2025, 'SDE', '2023-2025'),
(3, 'abmtech222', 3, 2019, 'Management Consultant', '2015-2019');

-- --------------------------------------------------------

-- 
-- Table structure for table `application_status`
-- 

CREATE TABLE `application_status` (
  `application_id` int(11) NOT NULL auto_increment,
  `student_id` char(20) NOT NULL,
  `placement_id` int(11) NOT NULL,
  `current_status` varchar(30) NOT NULL,
  `last_updated` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `round_no` int(10) NOT NULL,
  PRIMARY KEY  (`application_id`),
  KEY `student_id` (`student_id`),
  KEY `placement_id` (`placement_id`),
  KEY `current_status` (`current_status`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=33 ;

-- 
-- Dumping data for table `application_status`
-- 

INSERT INTO `application_status` (`application_id`, `student_id`, `placement_id`, `current_status`, `last_updated`, `round_no`) VALUES 
(1, 'abmca111', 3, '0', '2025-04-17 02:19:03', 0),
(2, 'abmtech222', 4, '0', '2025-04-17 02:19:03', 0),
(3, 'abmba333', 5, '0', '2025-04-17 02:19:03', 0),
(4, 'abmbca444', 6, '0', '2025-04-17 02:19:03', 0),
(5, 'abmece555', 7, '0', '2025-04-17 02:19:03', 0),
(6, 'abmphy666', 8, '0', '2025-04-17 02:19:03', 0),
(7, 'abmbtech77', 9, '0', '2025-04-17 02:19:03', 0),
(8, 'abmmsc888', 10, '0', '2025-04-17 02:19:03', 0),
(9, 'abmeee999', 11, '0', '2025-04-17 02:19:03', 0),
(10, 'abmcs000', 12, '0', '2025-04-17 02:19:03', 0),
(11, 'abmca111', 3, '0', '2025-04-17 02:19:08', 0),
(12, 'abmtech222', 4, '0', '2025-04-17 02:19:08', 0),
(13, 'abmba333', 5, '0', '2025-04-17 02:19:08', 0),
(14, 'abmbca444', 6, '0', '2025-04-17 02:19:08', 0),
(15, 'abmece555', 7, '0', '2025-04-17 02:19:08', 0),
(16, 'abmphy666', 8, '0', '2025-04-17 02:19:08', 0),
(17, 'abmbtech77', 9, '0', '2025-04-17 02:19:08', 0),
(18, 'abmmsc888', 10, '0', '2025-04-17 02:19:08', 0),
(19, 'abmeee999', 11, '0', '2025-04-17 02:19:08', 0),
(20, 'abmcs000', 12, '0', '2025-04-17 02:19:08', 0),
(21, 'abmca111', 3, '0', '2025-04-17 02:19:13', 0),
(22, 'abmtech222', 4, '0', '2025-04-17 02:19:13', 0),
(23, 'abmba333', 5, '0', '2025-04-17 02:19:13', 0),
(24, 'abmbca444', 6, '0', '2025-04-17 02:19:13', 0),
(25, 'abmece555', 7, '0', '2025-04-17 02:19:13', 0),
(26, 'abmphy666', 8, '0', '2025-04-17 02:19:13', 0),
(27, 'abmbtech77', 9, '0', '2025-04-17 02:19:13', 0),
(28, 'abmmsc888', 10, '0', '2025-04-17 02:19:13', 0),
(29, 'abmeee999', 11, '0', '2025-04-17 02:19:13', 0),
(30, 'abmcs000', 12, '0', '2025-04-17 02:19:13', 0),
(31, 'abmca24028', 6, '0', '2025-05-02 10:50:40', 3),
(32, 'abmca24028', 18, 'Processing', '2025-05-01 17:25:31', 2);

-- --------------------------------------------------------

-- 
-- Table structure for table `apply_in`
-- 

CREATE TABLE `apply_in` (
  `apply_id` int(11) NOT NULL auto_increment,
  `student_id` char(20) NOT NULL,
  `placement_id` int(11) NOT NULL,
  `apply_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`apply_id`),
  KEY `student_id` (`student_id`),
  KEY `placement_id` (`placement_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

-- 
-- Dumping data for table `apply_in`
-- 

INSERT INTO `apply_in` (`apply_id`, `student_id`, `placement_id`, `apply_date`) VALUES 
(1, 'abmba333', 6, '2025-05-01 12:28:55'),
(2, 'abmba345', 6, '2025-05-01 12:28:55'),
(3, 'abmbca444', 12, '2025-05-01 12:28:55'),
(4, 'abmbca678', 10, '2025-05-01 12:28:55'),
(5, 'abmbtech77', 9, '2025-05-01 12:28:55'),
(6, 'abmbtech78', 9, '2025-05-01 12:28:55'),
(7, 'abmca111', 12, '2025-05-01 12:28:55'),
(8, 'abmca123', 12, '2025-05-01 12:28:55'),
(9, 'abmca12312', 8, '2025-05-01 12:28:55'),
(10, 'abmca12313', 8, '2025-05-01 12:28:55'),
(11, 'abmca24028', 18, '2025-05-01 12:48:47'),
(12, 'abmca24028', 6, '2025-05-01 12:48:47');

-- --------------------------------------------------------

-- 
-- Table structure for table `company`
-- 

CREATE TABLE `company` (
  `company_id` int(11) unsigned NOT NULL auto_increment,
  `c_name` varchar(50) NOT NULL,
  `address` varchar(200) default NULL,
  `industry_type` varchar(50) NOT NULL,
  PRIMARY KEY  (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=32 ;

-- 
-- Dumping data for table `company`
-- 

INSERT INTO `company` (`company_id`, `c_name`, `address`, `industry_type`) VALUES 
(1, 'Google', '1600 Amphitheatre Parkway, Mountain View, CA', 'Technology'),
(2, 'Microsoft', 'One Microsoft Way, Redmond, WA', 'Software'),
(3, 'Amazon', '410 Terry Ave N, Seattle, WA', 'E-Commerce'),
(4, 'Facebook', '1 Hacker Way, Menlo Park, CA', 'Social Media'),
(5, 'Apple', 'Apple Park Way, Cupertino, CA', 'Consumer Electronics'),
(6, 'Netflix', '100 Winchester Circle, Los Gatos, CA', 'Streaming'),
(7, 'Adobe', '345 Park Avenue, San Jose, CA', 'Creative Software'),
(8, 'Intel', '2200 Mission College Blvd, Santa Clara, CA', 'Semiconductors'),
(9, 'IBM', '1 New Orchard Rd, Armonk, NY', 'IT Services'),
(10, 'Oracle', '500 Oracle Parkway, Redwood Shores, CA', 'Enterprise Software'),
(11, 'Google', '1600 Amphitheatre Parkway, Mountain View, CA', 'Technology'),
(12, 'Microsoft', 'One Microsoft Way, Redmond, WA', 'Software'),
(13, 'Amazon', '410 Terry Ave N, Seattle, WA', 'E-Commerce'),
(14, 'Facebook', '1 Hacker Way, Menlo Park, CA', 'Social Media'),
(15, 'Apple', 'Apple Park Way, Cupertino, CA', 'Consumer Electronics'),
(16, 'Netflix', '100 Winchester Circle, Los Gatos, CA', 'Streaming'),
(17, 'Adobe', '345 Park Avenue, San Jose, CA', 'Creative Software'),
(18, 'Intel', '2200 Mission College Blvd, Santa Clara, CA', 'Semiconductors'),
(19, 'IBM', '1 New Orchard Rd, Armonk, NY', 'IT Services'),
(20, 'Oracle', '500 Oracle Parkway, Redwood Shores, CA', 'Enterprise Software'),
(21, 'Google', '1600 Amphitheatre Parkway, Mountain View, CA', 'Technology'),
(22, 'Microsoft', 'One Microsoft Way, Redmond, WA', 'Software'),
(23, 'Amazon', '410 Terry Ave N, Seattle, WA', 'E-Commerce'),
(24, 'Facebook', '1 Hacker Way, Menlo Park, CA', 'Social Media'),
(25, 'Apple', 'Apple Park Way, Cupertino, CA', 'Consumer Electronics'),
(26, 'Netflix', '100 Winchester Circle, Los Gatos, CA', 'Streaming'),
(27, 'Adobe', '345 Park Avenue, San Jose, CA', 'Creative Software'),
(28, 'Intel', '2200 Mission College Blvd, Santa Clara, CA', 'Semiconductors'),
(29, 'IBM', '1 New Orchard Rd, Armonk, NY', 'IT Services'),
(30, 'Oracle', '500 Oracle Parkway, Redwood Shores, CA', 'Enterprise Software'),
(31, 'MCC', 'sadfvdb', 'Consulting');

-- --------------------------------------------------------

-- 
-- Table structure for table `course`
-- 

CREATE TABLE `course` (
  `course_id` char(10) NOT NULL,
  `course_name` varchar(100) NOT NULL,
  `department` varchar(50) NOT NULL,
  PRIMARY KEY  (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `course`
-- 

INSERT INTO `course` (`course_id`, `course_name`, `department`) VALUES 
('ABMCA', 'MCA', 'COMPUTER SCIENCE'),
('BCM12', 'BCOM', 'COMMERCE'),
('BTECS', 'BTECH CS', 'COMPUTER SCIENCE'),
('CIV101', 'Structural Analysis', 'Civil'),
('CIV202', 'Environmental Engineering', 'Civil'),
('CSE101', 'Intro to Computer Science', 'Computer Science'),
('CSE202', 'Data Structures', 'Computer Science'),
('CSE303', 'Machine Learning', 'Computer Science'),
('ECE101', 'Basic Electronics', 'Electronics'),
('ECE202', 'Digital Circuits', 'Electronics'),
('EE101', 'Electrical Machines', 'Electrical'),
('ME101', 'Thermodynamics', 'Mechanical'),
('ME202', 'Fluid Mechanics', 'Mechanical'),
('MSMTH', 'MSC MATHS', 'SCIENCE');

-- --------------------------------------------------------

-- 
-- Table structure for table `feedback`
-- 

CREATE TABLE `feedback` (
  `fq_id` int(11) NOT NULL auto_increment,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `query` text NOT NULL,
  `submitted_at` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`fq_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

-- 
-- Dumping data for table `feedback`
-- 

INSERT INTO `feedback` (`fq_id`, `name`, `email`, `query`, `submitted_at`) VALUES 
(1, 'Vishakha Rathore', 'vishakha234@gmail.com', 'What are the placement statistics for past few years for MCA course?', '2025-04-08 22:12:53'),
(2, 'Radhika Singh', 'radhikaS@gmail.com', 'How can i apply for campus placement?', '2025-04-08 22:17:28'),
(3, 'Karishma Gupta', 'karishmagupta@gmail.com', 'I am not getting any notices on my noticeboard after i log in\r\n', '2025-04-08 22:18:36'),
(4, 'Pragya Varshney', 'pragyajoney2005@gmail.com', 'What documents are required for placement registration?', '2025-04-08 22:25:59'),
(5, 'Tanshi Sharma', 'tanshisharma05@gmail.com', 'asdhxbvhdbh', '2025-04-09 18:05:02'),
(6, 'Garima', 'abmca12312_riya@banasthali.in', 'mndshj', '2025-04-17 19:03:35'),
(7, 'Garima', 'abmca12312_riya@banasthali.in', 'avdghaqwqey', '2025-05-02 09:39:44'),
(8, 'Garima', 'garimash7604@gmail.com', 'xnkad', '2025-05-02 09:41:07');

-- --------------------------------------------------------

-- 
-- Table structure for table `notifications`
-- 

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `course_id` char(10) NOT NULL,
  `created_at` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `expires_at` timestamp NULL default NULL,
  `is_global` tinyint(1) default '0',
  `priority` enum('Low','Medium','High') default 'Medium',
  PRIMARY KEY  (`id`),
  KEY `fk_course` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=56 ;

-- 
-- Dumping data for table `notifications`
-- 

INSERT INTO `notifications` (`id`, `title`, `message`, `course_id`, `created_at`, `expires_at`, `is_global`, `priority`) VALUES 
(6, 'Exam Schedule Released', 'The final exam schedule is now available on the portal.', 'CSE101', '2025-04-17 02:00:07', '2025-05-10 23:59:59', 0, 'High'),
(7, 'Guest Lecture on AI', 'Attend a session on AI and ML trends.', 'CSE303', '2025-04-17 02:00:07', '2025-04-25 18:00:00', 0, 'Medium'),
(8, 'Lab Cancellation Notice', 'Tomorrow''s Basic Electronics lab is cancelled.', 'ECE101', '2025-04-17 02:00:07', '2025-04-18 09:00:00', 0, 'Low'),
(9, 'Placement Drive: Infosys', 'Infosys placement drive scheduled next week.', 'CSE202', '2025-04-17 02:00:07', '2025-04-22 17:00:00', 0, 'High'),
(10, 'IoT Workshop Registration', 'Join the IoT workshop. Limited seats!', 'ECE202', '2025-04-17 02:00:07', '2025-05-01 17:00:00', 0, 'Medium'),
(11, 'College Holiday', 'Institute will remain closed on April 21.', 'BCM12', '2025-04-17 02:00:07', '2025-04-21 00:00:00', 1, 'Low'),
(12, 'Civil Seminar', 'Attend a seminar on Structural Innovations.', 'CIV101', '2025-04-17 02:00:07', '2025-04-30 15:00:00', 0, 'Medium'),
(13, 'Assignment Due', 'Submit your Data Structures assignment by 19th.', 'CSE202', '2025-04-17 02:00:07', '2025-04-19 23:59:59', 0, 'High'),
(14, 'Result Declared', 'Thermodynamics midterm results are out.', 'ME101', '2025-04-17 02:00:07', '2025-04-25 23:59:59', 0, 'Medium'),
(15, 'Maintenance Alert', 'Scheduled power outage in Electrical labs.', 'EE101', '2025-04-17 02:00:07', '2025-04-20 17:00:00', 1, 'Low'),
(16, 'Exam Schedule Released', 'The final exam schedule is now available on the portal.', 'CSE101', '2025-04-17 02:00:10', '2025-05-10 23:59:59', 0, 'High'),
(17, 'Guest Lecture on AI', 'Attend a session on AI and ML trends.', 'CSE303', '2025-04-17 02:00:10', '2025-04-25 18:00:00', 0, 'Medium'),
(18, 'Lab Cancellation Notice', 'Tomorrow''s Basic Electronics lab is cancelled.', 'ECE101', '2025-04-17 02:00:10', '2025-04-18 09:00:00', 0, 'Low'),
(19, 'Placement Drive: Infosys', 'Infosys placement drive scheduled next week.', 'CSE202', '2025-04-17 02:00:10', '2025-04-22 17:00:00', 0, 'High'),
(20, 'IoT Workshop Registration', 'Join the IoT workshop. Limited seats!', 'ECE202', '2025-04-17 02:00:10', '2025-05-01 17:00:00', 0, 'Medium'),
(21, 'College Holiday', 'Institute will remain closed on April 21.', 'BCM12', '2025-04-17 02:00:10', '2025-04-21 00:00:00', 1, 'Low'),
(22, 'Civil Seminar', 'Attend a seminar on Structural Innovations.', 'CIV101', '2025-04-17 02:00:10', '2025-04-30 15:00:00', 0, 'Medium'),
(23, 'Assignment Due', 'Submit your Data Structures assignment by 19th.', 'CSE202', '2025-04-17 02:00:10', '2025-04-19 23:59:59', 0, 'High'),
(24, 'Result Declared', 'Thermodynamics midterm results are out.', 'ME101', '2025-04-17 02:00:10', '2025-04-25 23:59:59', 0, 'Medium'),
(25, 'Maintenance Alert', 'Scheduled power outage in Electrical labs.', 'EE101', '2025-04-17 02:00:10', '2025-04-20 17:00:00', 1, 'Low'),
(26, 'Exam Schedule Released', 'The final exam schedule is now available on the portal.', 'CSE101', '2025-04-17 02:00:11', '2025-05-10 23:59:59', 0, 'High'),
(27, 'Guest Lecture on AI', 'Attend a session on AI and ML trends.', 'ABMCA', '2025-04-17 02:00:11', '2025-05-25 18:00:00', 0, 'Medium'),
(28, 'Lab Cancellation Notice', 'Tomorrow''s Basic Electronics lab is cancelled.', 'ECE101', '2025-04-17 02:00:11', '2025-04-18 09:00:00', 0, 'Low'),
(29, 'Placement Drive: Infosys', 'Infosys placement drive scheduled next week.', 'CSE202', '2025-04-17 02:00:11', '2025-04-22 17:00:00', 0, 'High'),
(30, 'IoT Workshop Registration', 'Join the IoT workshop. Limited seats!', 'ABMCA', '2025-04-17 02:00:11', '2025-05-01 17:00:00', 0, 'Medium'),
(31, 'College Holiday', 'Institute will remain closed on April 21.', 'BCM12', '2025-04-17 02:00:11', '2025-04-21 00:00:00', 1, 'Low'),
(32, 'Civil Seminar', 'Attend a seminar on Structural Innovations.', 'CIV101', '2025-04-17 02:00:11', '2025-04-30 15:00:00', 0, 'Medium'),
(33, 'Assignment Due', 'Submit your Data Structures assignment by 19th.', 'CSE202', '2025-04-17 02:00:11', '2025-04-19 23:59:59', 0, 'High'),
(34, 'Result Declared', 'Thermodynamics midterm results are out.', 'ME101', '2025-04-17 02:00:11', '2025-04-25 23:59:59', 0, 'Medium'),
(35, 'Maintenance Alert', 'Scheduled power outage in Electrical labs.', 'EE101', '2025-04-17 02:00:11', '2025-04-20 17:00:00', 1, 'Low'),
(36, 'Exam Schedule Released', 'The final exam schedule is now available on the portal.', 'CSE101', '2025-04-17 02:00:13', '2025-05-10 23:59:59', 0, 'High'),
(37, 'Guest Lecture on AI', 'Attend a session on AI and ML trends.', 'CSE303', '2025-04-17 02:00:13', '2025-04-25 18:00:00', 0, 'Medium'),
(38, 'Lab Cancellation Notice', 'Tomorrow''s Basic Electronics lab is cancelled.', 'ECE101', '2025-04-17 02:00:13', '2025-04-18 09:00:00', 0, 'Low'),
(39, 'Placement Drive: Infosys', 'Infosys placement drive scheduled next week.', 'CSE202', '2025-04-17 02:00:13', '2025-04-22 17:00:00', 0, 'High'),
(40, 'IoT Workshop Registration', 'Join the IoT workshop. Limited seats!', 'ECE202', '2025-04-17 02:00:13', '2025-05-01 17:00:00', 0, 'Medium'),
(41, 'College Holiday', 'Institute will remain closed on April 21.', 'BCM12', '2025-04-17 02:00:13', '2025-04-21 00:00:00', 1, 'Low'),
(42, 'Civil Seminar', 'Attend a seminar on Structural Innovations.', 'CIV101', '2025-04-17 02:00:13', '2025-04-30 15:00:00', 0, 'Medium'),
(43, 'Assignment Due', 'Submit your Data Structures assignment by 19th.', 'CSE202', '2025-04-17 02:00:13', '2025-04-19 23:59:59', 0, 'High'),
(44, 'Result Declared', 'Thermodynamics midterm results are out.', 'ME101', '2025-04-17 02:00:13', '2025-04-25 23:59:59', 0, 'Medium'),
(45, 'Maintenance Alert', 'Scheduled power outage in Electrical labs.', 'EE101', '2025-04-17 02:00:13', '2025-04-20 17:00:00', 1, 'Low'),
(46, 'Exam Schedule Released', 'The final exam schedule is now available on the portal.', 'CSE101', '2025-04-17 02:00:24', '2025-05-10 23:59:59', 0, 'High'),
(47, 'Guest Lecture on AI', 'Attend a session on AI and ML trends.', 'CSE303', '2025-04-17 02:00:24', '2025-04-25 18:00:00', 0, 'Medium'),
(48, 'Lab Cancellation Notice', 'Tomorrow''s Basic Electronics lab is cancelled.', 'ECE101', '2025-04-17 02:00:24', '2025-04-18 09:00:00', 0, 'Low'),
(49, 'Placement Drive: Infosys', 'Infosys placement drive scheduled next week.', 'CSE202', '2025-04-17 02:00:24', '2025-04-22 17:00:00', 0, 'High'),
(50, 'IoT Workshop Registration', 'Join the IoT workshop. Limited seats!', 'ECE202', '2025-04-17 02:00:24', '2025-05-01 17:00:00', 0, 'Medium'),
(51, 'College Holiday', 'Institute will remain closed on April 21.', 'BCM12', '2025-04-17 02:00:24', '2025-04-21 00:00:00', 1, 'Low'),
(52, 'Civil Seminar', 'Attend a seminar on Structural Innovations.', 'CIV101', '2025-04-17 02:00:24', '2025-04-30 15:00:00', 0, 'Medium'),
(53, 'Assignment Due', 'Submit your Data Structures assignment by 19th.', 'CSE202', '2025-04-17 02:00:24', '2025-04-19 23:59:59', 0, 'High'),
(54, 'Result Declared', 'Thermodynamics midterm results are out.', 'ME101', '2025-04-17 02:00:24', '2025-04-25 23:59:59', 0, 'Medium'),
(55, 'Maintenance Alert', 'Scheduled power outage in Electrical labs.', 'EE101', '2025-04-17 02:00:24', '2025-04-20 17:00:00', 1, 'Low');

-- --------------------------------------------------------

-- 
-- Table structure for table `placement`
-- 

CREATE TABLE `placement` (
  `placement_id` int(11) NOT NULL auto_increment,
  `company_id` int(11) unsigned default NULL,
  `domain` varchar(100) NOT NULL,
  `drive_Date` date NOT NULL,
  `no_of_openiing` int(11) NOT NULL,
  `min_cgpa` decimal(10,2) NOT NULL,
  `allowed_backlog` int(11) NOT NULL,
  `eligible_courses` varchar(255) NOT NULL,
  `eligible_branches` varchar(255) NOT NULL,
  `aptitude_test` tinyint(1) NOT NULL,
  `coding_test` tinyint(1) NOT NULL,
  `interview_Rounds` int(11) NOT NULL,
  `ctc` decimal(10,2) NOT NULL,
  PRIMARY KEY  (`placement_id`),
  KEY `company_id` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=33 ;

-- 
-- Dumping data for table `placement`
-- 

INSERT INTO `placement` (`placement_id`, `company_id`, `domain`, `drive_Date`, `no_of_openiing`, `min_cgpa`, `allowed_backlog`, `eligible_courses`, `eligible_branches`, `aptitude_test`, `coding_test`, `interview_Rounds`, `ctc`) VALUES 
(2, 12, 'computer', '2024-02-04', 56, 7.00, 2, 'bsc', 'cs', 1, 1, 2, 6.00),
(3, 1, 'Software Development', '2025-05-10', 5, 7.00, 0, 'CSE101,CSE202', 'Computer Science', 1, 1, 3, 8.50),
(4, 2, 'Finance', '2025-05-12', 3, 6.50, 1, 'BCM12', 'Commerce', 1, 0, 2, 6.20),
(5, 3, 'Data Science', '2025-05-15', 4, 7.50, 0, 'CSE303', 'Computer Science', 1, 1, 4, 10.00),
(6, 4, 'Electronics Design', '2025-05-18', 2, 6.80, 1, 'ECE101,ECE202', 'Electronics', 1, 1, 3, 7.00),
(7, 5, 'Civil Engineering', '2025-05-20', 6, 6.00, 2, 'CIV101,CIV202', 'Civil', 1, 0, 2, 5.75),
(8, 6, 'Consulting', '2025-05-22', 5, 7.20, 0, 'ABMCA,BTECS', 'Computer Science', 1, 1, 3, 9.50),
(9, 7, 'Electrical Core', '2025-05-25', 3, 6.70, 1, 'EE101', 'Electrical', 1, 1, 2, 6.80),
(10, 8, 'Mechanical Design', '2025-05-27', 4, 6.50, 0, 'ME101,ME202', 'Mechanical', 1, 0, 2, 6.90),
(11, 9, 'EdTech', '2025-05-28', 2, 8.00, 0, 'MSMTH', 'Science', 1, 1, 2, 7.50),
(12, 10, 'Cloud Computing', '2025-05-30', 6, 7.00, 0, 'CSE101,CSE202,CSE303', 'Computer Science', 1, 1, 4, 11.00),
(13, 1, 'Software Development', '2025-05-10', 5, 7.00, 0, 'CSE101,CSE202', 'Computer Science', 1, 1, 3, 8.50),
(14, 2, 'Finance', '2025-05-12', 3, 6.50, 1, 'BCM12', 'Commerce', 1, 0, 2, 6.20),
(15, 3, 'Data Science', '2025-05-15', 4, 7.50, 0, 'CSE303', 'Computer Science', 1, 1, 4, 10.00),
(16, 4, 'Electronics Design', '2025-05-18', 2, 6.80, 1, 'ECE101,ECE202', 'Electronics', 1, 1, 3, 7.00),
(17, 5, 'Civil Engineering', '2025-05-20', 6, 6.00, 2, 'CIV101,CIV202', 'Civil', 1, 0, 2, 5.75),
(18, 6, 'Consulting', '2025-05-22', 5, 7.20, 0, 'ABMCA,BTECS', 'Computer Science', 1, 1, 3, 9.50),
(19, 7, 'Electrical Core', '2025-05-25', 3, 6.70, 1, 'EE101', 'Electrical', 1, 1, 2, 6.80),
(20, 8, 'Mechanical Design', '2025-05-27', 4, 6.50, 0, 'ME101,ME202', 'Mechanical', 1, 0, 2, 6.90),
(22, 10, 'Cloud Computing', '2025-05-30', 6, 7.00, 0, 'CSE101,CSE202,CSE303', 'Computer Science', 1, 1, 4, 11.00),
(23, 1, 'Software Development', '2025-05-10', 5, 7.00, 0, 'CSE101,CSE202', 'Computer Science', 1, 1, 3, 8.50),
(24, 2, 'Finance', '2025-05-12', 3, 6.50, 1, 'BCM12', 'Commerce', 1, 0, 2, 6.20),
(25, 3, 'Data Science', '2025-05-15', 4, 7.50, 0, 'CSE303', 'Computer Science', 1, 1, 4, 10.00),
(26, 4, 'Electronics Design', '2025-05-18', 2, 6.80, 1, 'ECE101,ECE202', 'Electronics', 1, 1, 3, 7.00),
(27, 5, 'Civil Engineering', '2025-05-20', 6, 6.00, 2, 'CIV101,CIV202', 'Civil', 1, 0, 2, 5.75),
(28, 6, 'Consulting', '2025-05-22', 5, 7.20, 0, 'ABMCA,BTECS', 'Computer Science', 1, 1, 3, 9.50),
(29, 7, 'Electrical Core', '2025-05-25', 3, 6.70, 1, 'EE101', 'Electrical', 1, 1, 2, 6.80),
(30, 8, 'Mechanical Design', '2025-05-27', 4, 6.50, 0, 'ME101,ME202', 'Mechanical', 1, 0, 2, 6.90),
(31, 9, 'EdTech', '2025-05-28', 2, 8.00, 0, 'MSMTH', 'Science', 1, 1, 2, 7.50),
(32, 10, 'Cloud Computing', '2025-05-30', 6, 7.00, 0, 'CSE101,CSE202,CSE303', 'Computer Science', 1, 1, 4, 11.00);

-- --------------------------------------------------------

-- 
-- Table structure for table `placement_course`
-- 

CREATE TABLE `placement_course` (
  `placement_id` int(11) NOT NULL,
  `course_id` char(10) NOT NULL,
  PRIMARY KEY  (`placement_id`,`course_id`),
  KEY `course_id` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `placement_course`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `placement_schedule`
-- 

CREATE TABLE `placement_schedule` (
  `schedule_id` int(11) NOT NULL auto_increment,
  `placement_id` int(11) NOT NULL,
  `round_no` int(11) NOT NULL,
  `round_name` varchar(100) NOT NULL,
  `scheduled_date` datetime NOT NULL,
  `venue` varchar(255) default NULL,
  `remarks` text,
  PRIMARY KEY  (`schedule_id`),
  KEY `placement_id` (`placement_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=26 ;

-- 
-- Dumping data for table `placement_schedule`
-- 

INSERT INTO `placement_schedule` (`schedule_id`, `placement_id`, `round_no`, `round_name`, `scheduled_date`, `venue`, `remarks`) VALUES 
(1, 2, 1, 'Aptitude Round', '2025-05-02 14:39:00', 'Apaji 201', 'Infosys Aptitude Round scheduled'),
(2, 3, 1, 'Aptitude Test', '2025-05-01 10:00:00', 'Main Hall A', 'Written test covering general aptitude'),
(3, 3, 2, 'Technical Interview', '2025-05-02 11:00:00', 'Room B2', 'Focus on core subjects and logic'),
(4, 4, 1, 'Online Assessment', '2025-05-03 09:30:00', 'Virtual - Google Meet', 'MCQ-based screening'),
(5, 5, 1, 'Group Discussion', '2025-05-04 14:00:00', 'Seminar Room 1', 'Communication and teamwork evaluation'),
(6, 6, 1, 'Aptitude Round', '2025-05-05 15:00:00', 'Lab 3', 'Online HackerRank-style test'),
(7, 7, 1, 'Technical Interview', '2025-05-06 10:00:00', 'Room D4', 'Real-time problem solving'),
(8, 8, 1, 'HR Interview', '2025-05-07 13:00:00', 'Conference Hall', 'Discussion about strengths and background'),
(9, 9, 1, 'Written Test', '2025-05-08 10:30:00', 'Main Hall B', 'Includes logical reasoning and English'),
(10, 10, 1, 'Final Interview', '2025-05-09 12:00:00', 'Room E1', 'Panel with company leadership'),
(11, 11, 1, 'Tech + HR Combo Round', '2025-05-10 11:00:00', 'Online - Zoom', 'Final selection round'),
(12, 3, 1, 'Aptitude Test', '2025-05-01 10:00:00', 'Main Hall A', 'Written test covering general aptitude'),
(13, 3, 2, 'Technical Interview', '2025-05-02 11:00:00', 'Room B2', 'Focus on core subjects and logic'),
(14, 4, 1, 'Online Assessment', '2025-05-03 09:30:00', 'Virtual - Google Meet', 'MCQ-based screening'),
(15, 5, 1, 'Group Discussion', '2025-05-04 14:00:00', 'Seminar Room 1', 'Communication and teamwork evaluation'),
(16, 6, 2, 'Coding Round', '2025-05-05 15:00:00', 'Lab 3', 'Online HackerRank-style test'),
(17, 7, 1, 'Technical Interview', '2025-05-06 10:00:00', 'Room D4', 'Real-time problem solving'),
(18, 8, 1, 'HR Interview', '2025-05-07 13:00:00', 'Conference Hall', 'Discussion about strengths and background'),
(19, 9, 1, 'Written Test', '2025-05-08 10:30:00', 'Main Hall B', 'Includes logical reasoning and English'),
(20, 10, 1, 'Final Interview', '2025-05-09 12:00:00', 'Room E1', 'Panel with company leadership'),
(21, 11, 1, 'Tech + HR Combo Round', '2025-05-10 11:00:00', 'Online - Zoom', 'Final selection round'),
(22, 18, 2, 'Coding Round', '2025-05-03 17:26:15', 'IT Center Lab 2', NULL),
(23, 18, 1, 'Aptitude Test', '2025-04-30 19:21:53', 'IT Center', NULL),
(24, 18, 3, 'Interview', '2025-05-21 19:22:10', 'IT Center', NULL),
(25, 6, 3, 'Coding Round', '2025-05-27 20:02:18', 'IT Center Lab 2', 'Please arrive 15 minutes prior.');

-- --------------------------------------------------------

-- 
-- Table structure for table `statistics`
-- 

CREATE TABLE `statistics` (
  `stats_id` int(11) NOT NULL auto_increment,
  `company_id` int(11) unsigned NOT NULL,
  `student_hired` int(11) NOT NULL,
  `year` year(4) NOT NULL,
  `course_id` char(10) NOT NULL,
  PRIMARY KEY  (`stats_id`),
  KEY `company_id` (`company_id`),
  KEY `course_id` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

-- 
-- Dumping data for table `statistics`
-- 

INSERT INTO `statistics` (`stats_id`, `company_id`, `student_hired`, `year`, `course_id`) VALUES 
(1, 2, 13, 2021, 'ABMCA'),
(2, 2, 5, 2021, 'ECE101'),
(3, 2, 5, 2020, 'ABMCA'),
(4, 4, 32, 2021, 'BTECS'),
(5, 7, 3, 2020, 'CSE202'),
(6, 3, 11, 2020, 'BTECS');

-- --------------------------------------------------------

-- 
-- Table structure for table `student`
-- 

CREATE TABLE `student` (
  `student_id` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `bnsmail` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `dob` date NOT NULL,
  `fathers_name` varchar(100) NOT NULL,
  `course_id` char(10) default NULL,
  `session` varchar(20) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `resume` varchar(2083) NOT NULL,
  `mothers_name` varchar(100) NOT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY  (`student_id`),
  UNIQUE KEY `bnsmail_UNIQUE` (`bnsmail`),
  KEY `fk_student_course` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `student`
-- 

INSERT INTO `student` (`student_id`, `name`, `bnsmail`, `password`, `dob`, `fathers_name`, `course_id`, `session`, `contact`, `resume`, `mothers_name`, `image`) VALUES 
('abmba333', 'Sanya Singh', 'sanya333@banasthali.in', 'sanya@789', '2003-03-10', 'Mahesh Singh', 'ECE101', '2021-2025', '9876543103', 'resume_sanya.pdf', 'Poonam Singh', 'sanya.jpg'),
('abmba345', 'Rahul Singh', 'rahul345@banasthali.in', 'rahul@789', '2003-03-10', 'Mahesh Singh', 'ECE101', '2021-2025', '9876543212', 'resume_rahul.pdf', 'Poonam Singh', 'rahul.jpg'),
('abmbca444', 'Sneha Gupta', 'sneha444@banasthali.in', 'snehaPass', '2003-07-25', 'Rakesh Gupta', 'CSE101', '2021-2025', '9876543104', 'resume_sneha.pdf', 'Suman Gupta', 'sneha.jpg'),
('abmbca678', 'Ishita Roy', 'ishita678@banasthali.in', 'roy456ish', '2003-08-18', 'Niraj Roy', 'ME101', '2021-2025', '9876543215', 'resume_ishita.pdf', 'Indira Roy', 'ishita.jpg'),
('abmbtech77', 'Shreya Das', 'shreya777@banasthali.in', 'das789shr', '2003-01-05', 'Suraj Das', 'EE101', '2021-2025', '9876543107', 'resume_shreya.pdf', 'Meena Das', 'shreya.jpg'),
('abmbtech78', 'Aditya Das', 'aditya789@banasthali.in', 'das789ad', '2003-01-05', 'Suraj Das', 'EE101', '2021-2025', '9876543216', 'resume_aditya.pdf', 'Meena Das', 'aditya.jpg'),
('abmca111', 'Aarohi Sharma', 'aarohi111@banasthali.in', 'pass@123', '2003-06-15', 'Rajesh Sharma', 'CSE101', '2021-2025', '9876543101', 'resume_aarohi.pdf', 'Sunita Sharma', 'aarohi.jpg'),
('abmca123', 'Aryan Sharma', 'aryan123@banasthali.in', 'pass@123', '2003-06-15', 'Rajesh Sharma', 'CSE101', '2021-2025', '9876543210', 'resume_aryan.pdf', 'Sunita Sharma', 'aryan.jpg'),
('abmca12312', 'Riya Sharma', 'abmca12312_riya@banasthali.in', '', '2002-06-22', 'Mr. Ajay Sharma', 'ABMCA', '2023-2025', '9876543219', 'resumes/Resume_Drashti.pdf', 'Mrs. Ritu Sharma', 'images/bvp4.jpg'),
('abmca12313', 'Amisha Agarwal', 'abmca123123_amisha@banasthali.in', '6a2fcc5aff57ae9ea6f79a3405b8b1874fd08491c2aab5827d472c6173e3bff7', '2002-04-30', 'Mr. Neeraj Agarwal', 'ABMCA', '2023-2025', '9182736450', 'resumes/Resume_Drashti.pdf', 'Mrs. Seema Agarwal', 'images/bvp3.jpg'),
('abmca24019', 'Tanshi Sharma', 'abmca24019_tanshi@banasthali.in', '1f6e0b5a4bb0bf90e034aafe618b492cfb3d23e5d3e788a31d1dda4844b9e407', '2003-09-07', 'Mr. Arun Kumar', 'ABMCA', '2023-2025', '7698675990', 'resumes/Resume_Drashti.pdf', 'Mrs. Kiran Sharma', 'images/bvp1.jpg'),
('abmca24028', 'DRASHTI VARSHNEY', 'abmca24028_drashti@banasthali.in', '40de254d65da2575bc8a1797f11ddeaad0d39d2509e7c45db0af75064a42243c', '2002-07-29', 'Mr. Sanjeev Kumar', 'ABMCA', '2023-2025', '9867542301', 'resumes/Resume_Drashti.pdf', 'Mrs. Priti Varshney', 'images/img7.jpeg'),
('abmca24178', 'Garima Sharma', 'abmca_garima3@banasthali.in', '049ba055585ad12a455f145a4c56976a256f55b94a293ddd77248d9282513053', '2004-07-06', 'Shyam Bihari Sharma', 'ABMCA', '2024-2025', '9897384933', 'resumes/Resume_Drashti.pdf', 'Brijlata Sharma', 'images/bvp4.jpg'),
('abmca24179', 'Garima Sharma', 'abmca_garima23@banasthali.in', '049ba055585ad12a455f145a4c56976a256f55b94a293ddd77248d9282513053', '2006-07-06', 'Shyam Bihari Sharma', 'ABMCA', '2024-2025', '9897384933', 'resumes/Resume_Drashti.pdf', 'Brijlata Sharma', 'images/bvp3.jpg'),
('abmca37', 'Gaauri', 'abmca_garima567@banasthali.in', '46240259edd02e626a0fe95b5cefaccccb94d4ca235d42e50c2dfae00c6dcd7c', '2004-02-12', 'madhav', 'ME202', '2024-2025', '9889542224', 'resumes/Resume_Drashti.pdf', 'kirti', 'images/bvp3.jpg'),
('abmcs000', 'Meera Iyer', 'meera000@banasthali.in', 'iyer@meera', '2003-05-22', 'Shankar Iyer', 'CSE303', '2021-2025', '9876543110', 'resume_meera.pdf', 'Radha Iyer', 'meera.jpg'),
('abmcs456', 'Sneha Gupta', 'sneha456@banasthali.in', 'snehaPass', '2003-07-25', 'Rakesh Gupta', 'CSE101', '2021-2025', '9876543213', 'resume_sneha.pdf', 'Suman Gupta', 'sneha.jpg'),
('abmece555', 'Kritika Mehta', 'kritika555@banasthali.in', 'kritika123', '2002-11-30', 'Vinod Mehta', 'CIV101', '2021-2025', '9876543105', 'resume_kritika.pdf', 'Pallavi Mehta', 'kritika.jpg'),
('abmece567', 'Karan Mehta', 'karan567@banasthali.in', 'karan123', '2002-11-30', 'Vinod Mehta', 'CIV101', '2021-2025', '9876543214', 'resume_karan.pdf', 'Pallavi Mehta', 'karan.jpg'),
('abmeee901', 'Harsh Vora', 'harsh901@banasthali.in', 'voraPass9', '2002-09-08', 'Dinesh Vora', 'ECE202', '2021-2025', '9876543218', 'resume_harsh.pdf', 'Lata Vora', 'harsh.jpg'),
('abmeee999', 'Harshita Vora', 'harshita999@banasthali.in', 'voraPass9', '2002-09-08', 'Dinesh Vora', 'ECE202', '2021-2025', '9876543109', 'resume_harshita.pdf', 'Lata Vora', 'harshita.jpg'),
('abmmsc888', 'Nisha Jain', 'nisha888@banasthali.in', 'nisha@321', '2003-10-12', 'Ramesh Jain', 'CSE202', '2021-2025', '9876543108', 'resume_nisha.pdf', 'Sarita Jain', 'nisha.jpg'),
('abmmsc890', 'Nisha Jain', 'nisha890@banasthali.in', 'nisha@321', '2003-10-12', 'Ramesh Jain', 'CSE202', '2021-2025', '9876543217', 'resume_nisha.pdf', 'Sarita Jain', 'nisha.jpg'),
('abmphy012', 'Meera Iyer', 'meera012@banasthali.in', 'iyer@meera', '2003-05-22', 'Shankar Iyer', 'CSE303', '2021-2025', '9876543219', 'resume_meera.pdf', 'Radha Iyer', 'meera.jpg'),
('abmphy666', 'Ishita Roy', 'ishita666@banasthali.in', 'roy456ish', '2003-08-18', 'Niraj Roy', 'ME101', '2021-2025', '9876543106', 'resume_ishita.pdf', 'Indira Roy', 'ishita.jpg'),
('abmtech222', 'Priya Verma', 'priya222@banasthali.in', 'secure456', '2002-12-20', 'Amit Verma', 'CSE202', '2021-2025', '9876543102', 'resume_priya.pdf', 'Anjali Verma', 'priya.jpg'),
('abmtech234', 'Priya Verma', 'priya234@banasthali.in', 'secure456', '2002-12-20', 'Amit Verma', 'CSE202', '2021-2025', '9876543211', 'resume_priya.pdf', 'Anjali Verma', 'priya.jpg');

-- --------------------------------------------------------

-- 
-- Table structure for table `student_course`
-- 

CREATE TABLE `student_course` (
  `student_id` varchar(20) NOT NULL,
  `course_id` char(10) NOT NULL,
  PRIMARY KEY  (`student_id`,`course_id`),
  KEY `course_id` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `student_course`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `track`
-- 

CREATE TABLE `track` (
  `track_id` int(11) NOT NULL auto_increment,
  `application_id` int(11) NOT NULL,
  `current_status` varchar(30) NOT NULL,
  `status_update_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `remarks` text,
  `round_no` int(10) NOT NULL,
  PRIMARY KEY  (`track_id`),
  KEY `application_id` (`application_id`),
  KEY `status` (`current_status`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

-- 
-- Dumping data for table `track`
-- 

INSERT INTO `track` (`track_id`, `application_id`, `current_status`, `status_update_date`, `remarks`, `round_no`) VALUES 
(1, 1, '0', '2025-05-01 12:33:23', 'Initial submission received.', 0),
(2, 2, '0', '2025-05-01 12:33:23', 'Shortlisting in progress.', 0),
(3, 3, '0', '2025-05-01 12:33:23', 'Student selected for next round.', 0),
(4, 4, '0', '2025-05-01 12:33:23', 'Did not meet eligibility criteria.', 0),
(5, 5, '0', '2025-05-01 12:33:23', 'Waiting for coding test result.', 0),
(6, 6, '0', '2025-05-01 12:33:23', 'Student shortlisted for final interview.', 0),
(7, 7, '0', '2025-05-01 12:33:23', 'Low CGPA and multiple backlogs.', 0),
(8, 8, '0', '2025-05-01 12:33:23', 'Excellent performance in aptitude round.', 0),
(9, 9, '0', '2025-05-01 12:33:23', 'Awaiting review from company.', 0),
(10, 10, '0', '2025-05-01 12:33:23', 'Failed aptitude test.', 0),
(11, 31, 'Processing', '2025-05-01 13:01:48', NULL, 1),
(12, 32, 'Processing', '2025-05-01 13:01:48', NULL, 2);

-- 
-- Constraints for dumped tables
-- 

-- 
-- Constraints for table `alumni`
-- 
ALTER TABLE `alumni`
  ADD CONSTRAINT `alumni_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `alumni_ibfk_2` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- 
-- Constraints for table `application_status`
-- 
ALTER TABLE `application_status`
  ADD CONSTRAINT `application_status_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `application_status_ibfk_2` FOREIGN KEY (`placement_id`) REFERENCES `placement` (`placement_id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- 
-- Constraints for table `apply_in`
-- 
ALTER TABLE `apply_in`
  ADD CONSTRAINT `apply_in_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `apply_in_ibfk_2` FOREIGN KEY (`placement_id`) REFERENCES `placement` (`placement_id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- 
-- Constraints for table `notifications`
-- 
ALTER TABLE `notifications`
  ADD CONSTRAINT `fk_course` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE;

-- 
-- Constraints for table `placement`
-- 
ALTER TABLE `placement`
  ADD CONSTRAINT `placement_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`);

-- 
-- Constraints for table `placement_course`
-- 
ALTER TABLE `placement_course`
  ADD CONSTRAINT `placement_course_ibfk_1` FOREIGN KEY (`placement_id`) REFERENCES `placement` (`placement_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `placement_course_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- 
-- Constraints for table `placement_schedule`
-- 
ALTER TABLE `placement_schedule`
  ADD CONSTRAINT `placement_schedule_ibfk_1` FOREIGN KEY (`placement_id`) REFERENCES `placement` (`placement_id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- 
-- Constraints for table `statistics`
-- 
ALTER TABLE `statistics`
  ADD CONSTRAINT `fk_company` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `statistics_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- 
-- Constraints for table `student`
-- 
ALTER TABLE `student`
  ADD CONSTRAINT `fk_student_course` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- 
-- Constraints for table `student_course`
-- 
ALTER TABLE `student_course`
  ADD CONSTRAINT `student_course_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student_course_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- 
-- Constraints for table `track`
-- 
ALTER TABLE `track`
  ADD CONSTRAINT `track_ibfk_1` FOREIGN KEY (`application_id`) REFERENCES `application_status` (`application_id`) ON DELETE CASCADE ON UPDATE CASCADE;
