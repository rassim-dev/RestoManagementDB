-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 19, 2020 at 10:58 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `management system`
--
CREATE DATABASE IF NOT EXISTS `management system` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `management system`;

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `Dep_ID` int(11) NOT NULL COMMENT 'Department ID',
  `Manager_ID` int(11) NOT NULL,
  `Dep_Location` varchar(20) NOT NULL COMMENT 'Department area'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`Dep_ID`, `Manager_ID`, `Dep_Location`) VALUES
(1, 1, 'Hawally'),
(2, 2, 'Jabriya'),
(3, 3, 'Salmiya');

-- --------------------------------------------------------

--
-- Table structure for table `dismissal`
--

CREATE TABLE `dismissal` (
  `Emp_Dismiss_ID` int(11) NOT NULL,
  `Emp_Name` varchar(20) NOT NULL,
  `Emp_Dismiss` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dismissal`
--

INSERT INTO `dismissal` (`Emp_Dismiss_ID`, `Emp_Name`, `Emp_Dismiss`) VALUES
(1, 'Amir', 'No');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `Emp_ID` int(11) NOT NULL COMMENT 'Employee ID',
  `Emp_Dismiss_ID` int(11) NOT NULL,
  `Manager_ID` int(11) NOT NULL COMMENT 'Manager ID',
  `Emp_Name` varchar(20) NOT NULL COMMENT 'Employee name',
  `Emp_LName` varchar(20) NOT NULL COMMENT 'Employee last name',
  `Emp_Speciality` varchar(15) NOT NULL,
  `Salary` float NOT NULL,
  `Working_hours` varchar(8) NOT NULL,
  `Emp_Checkin_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`Emp_ID`, `Emp_Dismiss_ID`, `Manager_ID`, `Emp_Name`, `Emp_LName`, `Emp_Speciality`, `Salary`, `Working_hours`, `Emp_Checkin_ID`) VALUES
(1, 1, 1, 'Amir', 'Al-Aghbar', 'Chef', 500, '9am-3pm', 1),
(2, 2, 2, 'Rassim', 'Melaab', 'Head Chef', 900, '8am-2pm', 2),
(3, 3, 3, 'Abdullah', 'Subaah', 'Cashier', 700, '10am-4pm', 3);

-- --------------------------------------------------------

--
-- Table structure for table `employee_check_in_out`
--

CREATE TABLE `employee_check_in_out` (
  `Emp_Checkin_ID` int(11) NOT NULL,
  `Manager_ID` int(11) NOT NULL,
  `Emp_Name` varchar(20) NOT NULL,
  `Emp_CheckIn` varchar(3) NOT NULL COMMENT 'check in',
  `Emp_CheckOut` varchar(3) NOT NULL COMMENT 'check out'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee_check_in_out`
--

INSERT INTO `employee_check_in_out` (`Emp_Checkin_ID`, `Manager_ID`, `Emp_Name`, `Emp_CheckIn`, `Emp_CheckOut`) VALUES
(1, 1, 'Amir', 'Yes', 'Yes'),
(2, 2, 'Rassim', 'Yes', 'No'),
(3, 2, 'Abdullah', 'No', 'No');

-- --------------------------------------------------------

--
-- Table structure for table `employee_recruits`
--

CREATE TABLE `employee_recruits` (
  `Emp_Recruit_ID` int(11) NOT NULL,
  `Manager_ID` int(11) NOT NULL,
  `Emp_Name` varchar(20) NOT NULL,
  `Emp_Speciality` varchar(15) NOT NULL,
  `Emp_Recruit` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee_recruits`
--

INSERT INTO `employee_recruits` (`Emp_Recruit_ID`, `Manager_ID`, `Emp_Name`, `Emp_Speciality`, `Emp_Recruit`) VALUES
(1, 2, 'Ali', 'Cashier', 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `Login_ID` int(11) NOT NULL,
  `email` varchar(23) NOT NULL,
  `username` varchar(32) NOT NULL,
  `password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`Login_ID`, `email`, `username`, `password`) VALUES
(1, 'test@gmail.com', 'Manager', 'Managerpassword'),
(2, 'Test@gmail.com', 'testhere', '12345678');

-- --------------------------------------------------------

--
-- Table structure for table `manager`
--

CREATE TABLE `manager` (
  `Manager_ID` int(11) NOT NULL,
  `Manager_Name` varchar(15) NOT NULL,
  `Login_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `manager`
--

INSERT INTO `manager` (`Manager_ID`, `Manager_Name`, `Login_ID`) VALUES
(1, 'Manager', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sale_output`
--

CREATE TABLE `sale_output` (
  `Cash_Company_ID` int(11) NOT NULL,
  `Dep_ID` int(11) NOT NULL,
  `Cash_Branch_Name` varchar(11) NOT NULL COMMENT 'Branch name',
  `Cash_Inflow` float NOT NULL,
  `Cash_Outflow` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sale_output`
--

INSERT INTO `sale_output` (`Cash_Company_ID`, `Dep_ID`, `Cash_Branch_Name`, `Cash_Inflow`, `Cash_Outflow`) VALUES
(1, 1, 'Hawally', 2500, 1500),
(2, 2, 'Jabriya', 3000, 1000),
(3, 3, 'Salmiya', 1000, 1500);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`Dep_ID`),
  ADD UNIQUE KEY `Manager_ID` (`Manager_ID`);

--
-- Indexes for table `dismissal`
--
ALTER TABLE `dismissal`
  ADD PRIMARY KEY (`Emp_Dismiss_ID`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`Emp_ID`),
  ADD UNIQUE KEY `Foreign key for dismiss` (`Emp_Dismiss_ID`),
  ADD UNIQUE KEY `Foreign key for checkin` (`Emp_Checkin_ID`) USING BTREE,
  ADD KEY `Foreign key table check in` (`Emp_Checkin_ID`),
  ADD KEY `Foreign key for manager` (`Manager_ID`) USING BTREE;

--
-- Indexes for table `employee_check_in_out`
--
ALTER TABLE `employee_check_in_out`
  ADD PRIMARY KEY (`Emp_Checkin_ID`),
  ADD KEY `foreign key manager in checkin` (`Manager_ID`);

--
-- Indexes for table `employee_recruits`
--
ALTER TABLE `employee_recruits`
  ADD PRIMARY KEY (`Emp_Recruit_ID`),
  ADD KEY `foreign key manager in recruit` (`Manager_ID`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`Login_ID`);

--
-- Indexes for table `manager`
--
ALTER TABLE `manager`
  ADD PRIMARY KEY (`Manager_ID`),
  ADD UNIQUE KEY `foreign key for Login_ID` (`Login_ID`);

--
-- Indexes for table `sale_output`
--
ALTER TABLE `sale_output`
  ADD PRIMARY KEY (`Cash_Company_ID`),
  ADD UNIQUE KEY `foreign key for Dep_ID in sale` (`Dep_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `Dep_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Department ID', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `dismissal`
--
ALTER TABLE `dismissal`
  MODIFY `Emp_Dismiss_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `Emp_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Employee ID', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `employee_check_in_out`
--
ALTER TABLE `employee_check_in_out`
  MODIFY `Emp_Checkin_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `employee_recruits`
--
ALTER TABLE `employee_recruits`
  MODIFY `Emp_Recruit_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `Login_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `manager`
--
ALTER TABLE `manager`
  MODIFY `Manager_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sale_output`
--
ALTER TABLE `sale_output`
  MODIFY `Cash_Company_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
