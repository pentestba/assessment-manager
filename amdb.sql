-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 14, 2021 at 08:30 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `amdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `assessments`
--

CREATE TABLE `assessments` (
  `assessmentID` int(2) NOT NULL,
  `assessment` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `assessments`
--

INSERT INTO `assessments` (`assessmentID`, `assessment`) VALUES
(1, 'External'),
(2, 'Internal'),
(3, 'Mobile'),
(4, 'Physical'),
(5, 'Social Engineering'),
(6, 'War Dail'),
(7, 'Web'),
(8, 'Wireless');

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `clientID` int(11) NOT NULL,
  `client` varchar(50) NOT NULL,
  `modified` datetime NOT NULL,
  `web` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `client_account_managers`
--

CREATE TABLE `client_account_managers` (
  `clientID` int(11) NOT NULL,
  `employeeID` int(11) NOT NULL,
  `statusID` int(2) NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `client_contacts`
--

CREATE TABLE `client_contacts` (
  `contactID` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `contact` varchar(50) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `work` varchar(20) DEFAULT NULL,
  `cell` varchar(12) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `notes` text,
  `clientID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `client_locations`
--

CREATE TABLE `client_locations` (
  `locationID` int(11) NOT NULL,
  `clientID` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `address` varchar(50) DEFAULT NULL,
  `city` varchar(25) DEFAULT NULL,
  `state` varchar(2) DEFAULT NULL,
  `zip` varchar(10) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `notes` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `contactID` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `contact` varchar(50) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `work` varchar(20) DEFAULT NULL,
  `cell` varchar(12) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `notes` text,
  `clientID` int(11) NOT NULL,
  `projectID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `employeeID` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `employee` varchar(50) NOT NULL,
  `title` varchar(25) DEFAULT NULL,
  `cell` varchar(12) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `notes` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `findings`
--

CREATE TABLE `findings` (
  `findingID` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `type` varchar(25) NOT NULL,
  `finding` varchar(50) NOT NULL,
  `severity` text,
  `observation` text,
  `remediation` text,
  `see_also` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hostvulns`
--

CREATE TABLE `hostvulns` (
  `hostvulnID` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `tool` varchar(16) NOT NULL,
  `vulnerability` varchar(128) NOT NULL,
  `findingID` int(11) NOT NULL,
  `cvss_base` int(2) DEFAULT NULL,
  `internal` varchar(8) DEFAULT NULL,
  `external` varchar(8) DEFAULT NULL,
  `description` text,
  `remediation` text,
  `see_also` text,
  `published` varchar(12) DEFAULT NULL,
  `updated` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `projectID` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `project` varchar(50) NOT NULL,
  `assessmentID` int(11) NOT NULL,
  `clientID` int(11) NOT NULL,
  `kickoff` varchar(12) DEFAULT NULL,
  `start` varchar(12) DEFAULT NULL,
  `finish` varchar(12) DEFAULT NULL,
  `tech_qa` varchar(12) DEFAULT NULL,
  `draft_delivery` varchar(12) DEFAULT NULL,
  `final_delivery` varchar(12) DEFAULT NULL,
  `notes` text,
  `status` varchar(255) NOT NULL,
  `external_objective` text,
  `external_targets` text,
  `external_exclude` text,
  `external_notes` text,
  `internal_objective` text,
  `internal_targets` text,
  `internal_exclude` text,
  `internal_notes` text,
  `mobile_objective` text,
  `mobile_notes` text,
  `physical_objective` text,
  `physical_notes` text,
  `social_objective` text,
  `social_notes` text,
  `war_objective` text,
  `war_notes` text,
  `web_objective` text,
  `web_notes` text,
  `wireless_objective` text,
  `wireless_notes` text,
  `resource_title1` varchar(50) NOT NULL,
  `resource_name1` varchar(50) NOT NULL,
  `resource_email1` varchar(50) NOT NULL,
  `resource_cell1` varchar(15) NOT NULL,
  `resource_title2` varchar(50) NOT NULL,
  `resource_name2` varchar(50) NOT NULL,
  `resource_email2` varchar(50) NOT NULL,
  `resource_cell2` varchar(15) NOT NULL,
  `resource_title3` varchar(50) NOT NULL,
  `resource_name3` varchar(50) NOT NULL,
  `resource_email3` varchar(50) NOT NULL,
  `resource_cell3` varchar(15) NOT NULL,
  `resource_title4` varchar(50) NOT NULL,
  `resource_name4` varchar(50) NOT NULL,
  `resource_email4` varchar(50) NOT NULL,
  `resource_cell4` varchar(15) NOT NULL,
  `resource_title5` varchar(50) NOT NULL,
  `resource_name5` varchar(50) NOT NULL,
  `resource_email5` varchar(50) NOT NULL,
  `resource_cell5` varchar(15) NOT NULL,
  `resource_title6` varchar(50) NOT NULL,
  `resource_name6` varchar(50) NOT NULL,
  `resource_email6` varchar(50) NOT NULL,
  `resource_cell6` varchar(15) NOT NULL,
  `resource_title7` varchar(50) NOT NULL,
  `resource_name7` varchar(50) NOT NULL,
  `resource_email7` varchar(50) NOT NULL,
  `resource_cell7` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project_assessment`
--

CREATE TABLE `project_assessment` (
  `id` int(11) NOT NULL,
  `projectID` int(11) NOT NULL,
  `assessmentID` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project_employees`
--

CREATE TABLE `project_employees` (
  `projectID` int(11) NOT NULL,
  `employeeID` int(11) NOT NULL,
  `roleID` int(2) NOT NULL,
  `statusID` int(2) NOT NULL,
  `modified` datetime NOT NULL,
  `notes` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project_locations`
--

CREATE TABLE `project_locations` (
  `locationID` int(11) NOT NULL,
  `projectID` int(11) NOT NULL,
  `address` varchar(50) DEFAULT NULL,
  `city` varchar(25) DEFAULT NULL,
  `state` varchar(2) DEFAULT NULL,
  `zip` varchar(10) DEFAULT NULL,
  `phone` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project_location_contacts`
--

CREATE TABLE `project_location_contacts` (
  `projectID` int(11) NOT NULL,
  `clientLocationID` int(11) NOT NULL,
  `contactID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project_status`
--

CREATE TABLE `project_status` (
  `projectID` int(11) NOT NULL,
  `statusID` int(3) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `roleID` int(2) NOT NULL,
  `role` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`roleID`, `role`) VALUES
(1, 'Account Manager'),
(2, 'Program Manager'),
(3, 'Project Manager'),
(4, 'Tech Lead'),
(5, 'Engineer');

-- --------------------------------------------------------

--
-- Table structure for table `scans`
--

CREATE TABLE `scans` (
  `scanID` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `scan` varchar(50) NOT NULL,
  `location` varchar(10) DEFAULT NULL,
  `severity` varchar(10) NOT NULL,
  `ip_address` varchar(15) DEFAULT NULL,
  `fqdn` varchar(25) DEFAULT NULL,
  `os` varchar(50) DEFAULT NULL,
  `port` int(5) DEFAULT NULL,
  `proof` text,
  `date` date DEFAULT NULL,
  `projectID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `statusID` int(2) NOT NULL,
  `status` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`statusID`, `status`) VALUES
(1, 'Unknown'),
(2, 'Contract'),
(3, 'Scoping'),
(4, 'In Progress'),
(5, 'Reporting'),
(6, 'Review'),
(7, 'Delivered'),
(8, 'Complete');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userID` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(128) NOT NULL,
  `salt` varchar(128) NOT NULL,
  `userRoleID` int(2) NOT NULL,
  `activated` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userID`, `modified`, `username`, `email`, `password`, `salt`, `userRoleID`, `activated`, `approved`) VALUES
(1, '2017-09-18 19:11:15', 'admin', 'admin@acme.com', 'f542eebb272ff24784ddc8f53f1a930532cdfbc1df30e5e6ffbd7e4c01925ee1', '2946e24c29c4368d', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `userRoleID` int(2) NOT NULL,
  `user_role` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`userRoleID`, `user_role`) VALUES
(1, 'admin'),
(2, 'user');

-- --------------------------------------------------------

--
-- Table structure for table `vulnerabilities`
--

CREATE TABLE `vulnerabilities` (
  `vulnerabilityID` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `vulnerability` varchar(100) NOT NULL,
  `description` text,
  `solution` text,
  `cvss_base_score` decimal(3,1) DEFAULT NULL,
  `see_also` text,
  `cve` varchar(50) DEFAULT NULL,
  `internal` varchar(10) DEFAULT NULL,
  `external` varchar(10) DEFAULT NULL,
  `scanID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `webvulns`
--

CREATE TABLE `webvulns` (
  `webvulnID` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `tool` varchar(16) NOT NULL,
  `vulnerability` varchar(50) NOT NULL,
  `findingID` int(3) NOT NULL,
  `severity` varchar(8) NOT NULL,
  `description` text,
  `remediation` text,
  `see_also` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assessments`
--
ALTER TABLE `assessments`
  ADD PRIMARY KEY (`assessmentID`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`clientID`);

--
-- Indexes for table `client_account_managers`
--
ALTER TABLE `client_account_managers`
  ADD PRIMARY KEY (`clientID`,`employeeID`),
  ADD KEY `fk_cam02` (`employeeID`),
  ADD KEY `fk_cam03` (`statusID`);

--
-- Indexes for table `client_contacts`
--
ALTER TABLE `client_contacts`
  ADD PRIMARY KEY (`contactID`),
  ADD KEY `fk_ccontact01` (`clientID`);

--
-- Indexes for table `client_locations`
--
ALTER TABLE `client_locations`
  ADD PRIMARY KEY (`locationID`),
  ADD KEY `fk_clocation01` (`clientID`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`contactID`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`employeeID`);

--
-- Indexes for table `findings`
--
ALTER TABLE `findings`
  ADD PRIMARY KEY (`findingID`);

--
-- Indexes for table `hostvulns`
--
ALTER TABLE `hostvulns`
  ADD PRIMARY KEY (`hostvulnID`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`projectID`),
  ADD KEY `fk_client01` (`clientID`),
  ADD KEY `fk_assessment01` (`assessmentID`);

--
-- Indexes for table `project_assessment`
--
ALTER TABLE `project_assessment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_employees`
--
ALTER TABLE `project_employees`
  ADD PRIMARY KEY (`projectID`,`employeeID`,`roleID`),
  ADD KEY `fk_pe02` (`employeeID`),
  ADD KEY `fk_pe03` (`roleID`),
  ADD KEY `fk_pe04` (`statusID`);

--
-- Indexes for table `project_locations`
--
ALTER TABLE `project_locations`
  ADD PRIMARY KEY (`locationID`),
  ADD KEY `fk_plocation01` (`projectID`);

--
-- Indexes for table `project_location_contacts`
--
ALTER TABLE `project_location_contacts`
  ADD PRIMARY KEY (`projectID`,`clientLocationID`,`contactID`),
  ADD KEY `fk_plc02` (`clientLocationID`),
  ADD KEY `fk_plc03` (`contactID`);

--
-- Indexes for table `project_status`
--
ALTER TABLE `project_status`
  ADD PRIMARY KEY (`projectID`,`statusID`),
  ADD KEY `fk_ps01` (`statusID`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`roleID`);

--
-- Indexes for table `scans`
--
ALTER TABLE `scans`
  ADD PRIMARY KEY (`scanID`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`statusID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userID`),
  ADD KEY `fk_urole01` (`userRoleID`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`userRoleID`);

--
-- Indexes for table `vulnerabilities`
--
ALTER TABLE `vulnerabilities`
  ADD PRIMARY KEY (`vulnerabilityID`);

--
-- Indexes for table `webvulns`
--
ALTER TABLE `webvulns`
  ADD PRIMARY KEY (`webvulnID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `clientID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `client_contacts`
--
ALTER TABLE `client_contacts`
  MODIFY `contactID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `client_locations`
--
ALTER TABLE `client_locations`
  MODIFY `locationID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `contactID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `employeeID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `findings`
--
ALTER TABLE `findings`
  MODIFY `findingID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hostvulns`
--
ALTER TABLE `hostvulns`
  MODIFY `hostvulnID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `projectID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `project_assessment`
--
ALTER TABLE `project_assessment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `project_locations`
--
ALTER TABLE `project_locations`
  MODIFY `locationID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `scans`
--
ALTER TABLE `scans`
  MODIFY `scanID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `vulnerabilities`
--
ALTER TABLE `vulnerabilities`
  MODIFY `vulnerabilityID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `webvulns`
--
ALTER TABLE `webvulns`
  MODIFY `webvulnID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `client_account_managers`
--
ALTER TABLE `client_account_managers`
  ADD CONSTRAINT `fk_cam01` FOREIGN KEY (`clientID`) REFERENCES `clients` (`clientID`),
  ADD CONSTRAINT `fk_cam02` FOREIGN KEY (`employeeID`) REFERENCES `employees` (`employeeID`),
  ADD CONSTRAINT `fk_cam03` FOREIGN KEY (`statusID`) REFERENCES `status` (`statusID`);

--
-- Constraints for table `client_contacts`
--
ALTER TABLE `client_contacts`
  ADD CONSTRAINT `fk_ccontact01` FOREIGN KEY (`clientID`) REFERENCES `clients` (`clientID`);

--
-- Constraints for table `client_locations`
--
ALTER TABLE `client_locations`
  ADD CONSTRAINT `fk_clocation01` FOREIGN KEY (`clientID`) REFERENCES `clients` (`clientID`);

--
-- Constraints for table `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `fk_assessment01` FOREIGN KEY (`assessmentID`) REFERENCES `assessments` (`assessmentID`),
  ADD CONSTRAINT `fk_client01` FOREIGN KEY (`clientID`) REFERENCES `clients` (`clientID`);

--
-- Constraints for table `project_employees`
--
ALTER TABLE `project_employees`
  ADD CONSTRAINT `fk_pe01` FOREIGN KEY (`projectID`) REFERENCES `projects` (`projectID`),
  ADD CONSTRAINT `fk_pe02` FOREIGN KEY (`employeeID`) REFERENCES `employees` (`employeeID`),
  ADD CONSTRAINT `fk_pe03` FOREIGN KEY (`roleID`) REFERENCES `roles` (`roleID`),
  ADD CONSTRAINT `fk_pe04` FOREIGN KEY (`statusID`) REFERENCES `status` (`statusID`);

--
-- Constraints for table `project_locations`
--
ALTER TABLE `project_locations`
  ADD CONSTRAINT `fk_plocation01` FOREIGN KEY (`projectID`) REFERENCES `projects` (`projectID`);

--
-- Constraints for table `project_location_contacts`
--
ALTER TABLE `project_location_contacts`
  ADD CONSTRAINT `fk_plc01` FOREIGN KEY (`projectID`) REFERENCES `projects` (`projectID`),
  ADD CONSTRAINT `fk_plc02` FOREIGN KEY (`clientLocationID`) REFERENCES `client_locations` (`locationID`),
  ADD CONSTRAINT `fk_plc03` FOREIGN KEY (`contactID`) REFERENCES `contacts` (`contactID`);

--
-- Constraints for table `project_status`
--
ALTER TABLE `project_status`
  ADD CONSTRAINT `fk_ps01` FOREIGN KEY (`statusID`) REFERENCES `status` (`statusID`),
  ADD CONSTRAINT `fk_ps02` FOREIGN KEY (`projectID`) REFERENCES `projects` (`projectID`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_urole01` FOREIGN KEY (`userRoleID`) REFERENCES `user_roles` (`userRoleID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
