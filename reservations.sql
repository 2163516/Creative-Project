-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 30, 2018 at 02:52 PM
-- Server version: 5.7.19
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `reservations`
--

-- --------------------------------------------------------

--
-- Table structure for table `facilities`
--

DROP TABLE IF EXISTS `facilities`;
CREATE TABLE IF NOT EXISTS `facilities` (
  `roomName` varchar(45) NOT NULL,
  `maxAccomodation` int(10) UNSIGNED NOT NULL,
  `faciDesc` varchar(500) DEFAULT NULL,
  `pathToImage` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`roomName`),
  UNIQUE KEY `roomNo_UNIQUE` (`roomName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `facilities`
--

INSERT INTO `facilities` (`roomName`, `maxAccomodation`, `faciDesc`, `pathToImage`) VALUES
('D1000 Mini AVR', 35, ' The Mini AVR is a room right beside the Devesse AVR and is a typical room for orientations, faculty meetings, student organization meetings, and \nis sometimes used by event orgaizers as a holding are for materials to be later on used in the Devesse AVR. This room is equipped with a 21-inch \nmonitor that may be used in projecting visual aids.', NULL),
('D1001 Devesse AVR', 500, 'D1001, commonly known as the \'Devesse Audio Visial Room,\' is an ideal venue for school events such as university-wide faculty meetings, seminars, and social gatherings.\r This school facility is equipped with a stage, a backstage, a side room for chairs, a sound booth, and a gradually elevating floor for the audience at the back to still have a clear view of the stage.', NULL),
('D902 Student Quality Circle Office', 35, 'The SQC Office is a room dedicated to student organizations and the student council for meetings and sometimes\nserve as a practice area. This room is equipped with at least 12 long tables, 35 chairs, and a blackboard.', NULL),
('D908', 100, 'This room is long enough to accommodate university-wide faculy meetings, university-wide student organization meetings and functions, and even\nNSTP classes. It is twice the size of an ordinary classroom and is able to fit 2 or more blocks of students. Its setup comprises of long tables\nwith three monoblock chairs each. It is also equipped with a blackboard and a whiteboard.', NULL),
('Devesse Lobby', 200, 'The Devesse Lobby is located at the 6th floor entrance of the Devesse bldg. and is usually the venue for seminars, mass sponsorships, and campus\nevents. It is equipped with two (2) monitors and a sound system. It also has the 7th floor veranda overlooking the entire floor below.', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `organization`
--

DROP TABLE IF EXISTS `organization`;
CREATE TABLE IF NOT EXISTS `organization` (
  `orgName` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `school` varchar(7) DEFAULT NULL,
  `status` enum('pending','active','inactive') DEFAULT NULL,
  PRIMARY KEY (`orgName`),
  UNIQUE KEY `orgName_UNIQUE` (`orgName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `organization`
--

INSERT INTO `organization` (`orgName`, `password`, `school`, `status`) VALUES
('Admin', 'Admin', 'Admin', NULL),
('BAGGS', 'BAGGS', NULL, NULL),
('BIBAK', 'BIBAK', NULL, NULL),
('CCPG', 'CCPG', NULL, NULL),
('DEBATESOCIETY', 'DEBATESOCIETY', NULL, NULL),
('ECOLODIANS', 'ECOLODIANS', NULL, NULL),
('FACULTY-SAMCIS', 'FACULTY-SAMCIS', 'SAMCIS', NULL),
('FACULTY-SCIS', 'FACULTY-SCIS', 'SCIS', NULL),
('FACULTY-SEA', 'FACULTY-SEA', 'SEA', NULL),
('FACULTY-SNS', 'FACULTY-SNS', 'SNS', NULL),
('FACULTY-SOL', 'FACULTY-SOL', 'SOL', NULL),
('FACULTY-SOM', 'FACULTY-SOM', 'SOM', NULL),
('FACULTY-SON', 'FACULTY-SON', 'SON', NULL),
('FACULTY-STELA', 'FACULTY-STELA', 'STELA', NULL),
('NURSCENE', 'NURSCENE', 'SON', NULL),
('REDCROSS', 'REDCROSS', NULL, NULL),
('SCHEMA', 'SCHEMA', 'SAMCIS', NULL),
('SLAS', 'SLAS', NULL, NULL),
('SSC-EXECOM', 'SSC-EXECOM', NULL, NULL),
('SSC-SAMCIS', 'SSC-SAMCIS', 'SAMCIS', NULL),
('SSC-SEA', 'SSC-SEA', 'SEA', NULL),
('SSC-SNS', 'SSC-SNS', 'SNS', NULL),
('SSC-SOL', 'SSC-SOL', 'SOL', NULL),
('SSC-SOM', 'SSC-SOM', 'SOM', NULL),
('SSC-SON', 'SSC-SON', 'SON', NULL),
('SSC-STELA', 'SSC-STELA', 'STELA', NULL),
('STELLARIS', 'STELLARIS', 'STELA', NULL),
('THEBUTTRESS', 'THE BUTTRESS', 'SEA', NULL),
('TINIGHIMIG', 'TINIGHIMIG', NULL, NULL),
('VINCULUM', 'VINCULUM', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
CREATE TABLE IF NOT EXISTS `reservation` (
  `resNo` int(11) NOT NULL AUTO_INCREMENT,
  `roomName` varchar(45) NOT NULL,
  `orgName` varchar(45) NOT NULL,
  `repName` varchar(45) NOT NULL,
  `sDateTime` datetime(6) NOT NULL,
  `eDateTime` datetime(6) NOT NULL,
  `status` enum('pending','confirmed','rejected') NOT NULL DEFAULT 'pending',
  `remarks` varchar(150) DEFAULT NULL,
  `purpose` varchar(100) NOT NULL,
  PRIMARY KEY (`resNo`),
  KEY `orgName` (`orgName`),
  KEY `roomName` (`roomName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `orgName` FOREIGN KEY (`orgName`) REFERENCES `organization` (`orgName`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `roomName` FOREIGN KEY (`roomName`) REFERENCES `facilities` (`roomName`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
