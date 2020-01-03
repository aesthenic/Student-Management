-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 03, 2020 at 01:32 AM
-- Server version: 5.7.26
-- PHP Version: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `stdmgmtdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `exam`
--

DROP TABLE IF EXISTS `exam`;
CREATE TABLE IF NOT EXISTS `exam` (
  `idExam` bigint(20) NOT NULL AUTO_INCREMENT,
  `titleExam` varchar(255) NOT NULL,
  `descriptExam` varchar(500) NOT NULL,
  `timeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idExam`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `examgrade`
--

DROP TABLE IF EXISTS `examgrade`;
CREATE TABLE IF NOT EXISTS `examgrade` (
  `idGrade` bigint(20) NOT NULL AUTO_INCREMENT,
  `scoreGrade` int(11) NOT NULL,
  `timeStampGrade` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idStd` bigint(20) NOT NULL,
  `idExam` bigint(20) NOT NULL,
  PRIMARY KEY (`idGrade`),
  KEY `idStd` (`idStd`),
  KEY `idExam` (`idExam`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
CREATE TABLE IF NOT EXISTS `message` (
  `idMsg` bigint(20) NOT NULL AUTO_INCREMENT,
  `contentMsg` varchar(1000) NOT NULL,
  `attachmentMsg` varchar(255) NOT NULL,
  `timeStampMsg` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idStd` bigint(20) NOT NULL,
  `idProf` bigint(20) NOT NULL,
  PRIMARY KEY (`idMsg`),
  KEY `idStd` (`idStd`),
  KEY `idProf` (`idProf`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `professor`
--

DROP TABLE IF EXISTS `professor`;
CREATE TABLE IF NOT EXISTS `professor` (
  `idProf` bigint(20) NOT NULL AUTO_INCREMENT,
  `nameProf` varchar(255) NOT NULL,
  `emailProf` varchar(255) NOT NULL,
  `pswdProf` text NOT NULL,
  `timeStampProf` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idProf`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `professor`
--

INSERT INTO `professor` (`idProf`, `nameProf`, `emailProf`, `pswdProf`, `timeStampProf`) VALUES
(1, 'Professor 1', 'prof1@gmail.com', '$2y$10$SjxVyNJSIi6TXlszDwm/QunuCpNRSPgFl1IVh4sI0LLEjQ5xfOCS2', '2020-01-02 23:24:38'),
(2, 'Professor 2', 'prof2@gmail.com', '$2y$10$e/ieSDO7xaEwiVW/J/1ud.HDLHH.oopPmNiIX2qSnc2DbfFhOGZ86', '2020-01-03 00:04:29'),
(3, 'Professor 3', 'prof3@gmail.com', '$2y$10$SZs3wg7onc9GK3TbnxPuC.fGk341IKgVldJddQs1JI05Jt.ZH8uEa', '2020-01-03 00:17:27');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
CREATE TABLE IF NOT EXISTS `student` (
  `idStd` bigint(20) NOT NULL AUTO_INCREMENT,
  `nameStd` varchar(255) NOT NULL,
  `emailStd` varchar(255) NOT NULL,
  `pswdStd` text NOT NULL,
  `timeStampStd` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idStd`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`idStd`, `nameStd`, `emailStd`, `pswdStd`, `timeStampStd`) VALUES
(44, 'Student 1', 'std1@gmail.com', '$2y$10$ysVuxzkOn.3eounedoxSdu8UsXjp5ifyvBbVCrzG7BTeFtZgu1eja', '2019-12-31 22:15:29'),
(45, 'student 2', 'std2@gmail.com', '$2y$10$ZRt..i57wWwCfQz9mI7bye6Ohg8sotIvuSEyDlQc2HtHEdplibJ8G', '2020-01-02 18:30:01'),
(46, 'Student 3', 'std3@gmail.com', '$2y$10$IHtiFvdqTntoazAsxZPZ8uDTqE9XcMy7OaTPhprIcoJ9KNYeFg4Xq', '2020-01-03 00:15:52');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `examgrade`
--
ALTER TABLE `examgrade`
  ADD CONSTRAINT `examgrade_ibfk_1` FOREIGN KEY (`idStd`) REFERENCES `student` (`idStd`),
  ADD CONSTRAINT `examgrade_ibfk_2` FOREIGN KEY (`idExam`) REFERENCES `exam` (`idExam`);

--
-- Constraints for table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `message_ibfk_1` FOREIGN KEY (`idStd`) REFERENCES `student` (`idStd`),
  ADD CONSTRAINT `message_ibfk_2` FOREIGN KEY (`idProf`) REFERENCES `professor` (`idProf`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
