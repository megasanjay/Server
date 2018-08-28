-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 07, 2018 at 08:28 AM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `psych`
--

-- --------------------------------------------------------

--
-- Table structure for table `crosscheck`
--

CREATE TABLE `crosscheck` (
  `recordnum` int(5) NOT NULL,
  `username` varchar(30) NOT NULL,
  `recordDate` varchar(30) NOT NULL,
  `patientName` varchar(50) NOT NULL,
  `patientAge` int(2) NOT NULL,
  `patientHeight` double(5,2) NOT NULL,
  `patientWeight` double(5,2) NOT NULL,
  `timestamp` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `crosscheck`
--

INSERT INTO `crosscheck` (`recordnum`, `username`, `recordDate`, `patientName`, `patientAge`, `patientHeight`, `patientWeight`, `timestamp`) VALUES
(0, 'test2', '45', '56', 12, 23.00, 23.00, '2018-05-06 18:46:22'),
(1, 'test2', '23', '32', 232, 23.00, 23.00, '2018-05-06 21:56:36'),
(2, 'test2', '43', '343', 4, 34.00, 43.00, '2018-05-06 21:56:43'),
(3, 'test2', '34', '34', 34, 34.00, 34.00, '2018-05-06 21:56:47'),
(4, 'test2', '43', '434', 3, 43.00, 4.00, '2018-05-06 21:56:52'),
(5, 'test2', '56', '56767', 6767, 655.00, 75.00, '2018-05-06 21:58:01'),
(6, 'test2', '567', '56756', 7657, 567.00, 567.00, '2018-05-06 21:58:04'),
(7, 'test2', '567', '657', 65765, 567.00, 567.00, '2018-05-06 21:58:07'),
(8, 'test2', '567', '676', 767, 67.00, 676.00, '2018-05-06 21:58:10');

-- --------------------------------------------------------

--
-- Table structure for table `currenttask`
--

CREATE TABLE `currenttask` (
  `username` varchar(30) NOT NULL,
  `tasknum` int(2) NOT NULL,
  `refresh` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `currenttask`
--

INSERT INTO `currenttask` (`username`, `tasknum`, `refresh`) VALUES
('gru', 5, 0),
('jessica', 6, 0),
('test', 4, 0),
('test2', 2, 0),
('testuser1', 6, 0),
('testuser2', 6, 0);

-- --------------------------------------------------------

--
-- Table structure for table `financialinfo`
--

CREATE TABLE `financialinfo` (
  `recordnum` int(5) NOT NULL,
  `username` varchar(30) NOT NULL,
  `recorddate` varchar(30) NOT NULL,
  `checknumber` int(15) NOT NULL,
  `amount` double(30,2) NOT NULL,
  `timestamp` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `financialinfo`
--

INSERT INTO `financialinfo` (`recordnum`, `username`, `recorddate`, `checknumber`, `amount`, `timestamp`) VALUES
(0, 'gru', '4/5/18', 1, 1.00, '2018-04-25 21:20:51'),
(0, 'jessica', '5/2/18', 0, 50.00, '2018-05-03 20:33:49'),
(0, 'test2', '13123', 12321, 21312.00, '2018-05-06 17:57:19'),
(0, 'testuser1', '12/12/14', 2147483647, 1000.00, '2018-04-25 15:55:30'),
(1, 'gru', '3/3/12', 3, 2.00, '2018-04-25 21:20:51'),
(1, 'jessica', '5/3/18', 0, 100.00, '2018-05-03 20:34:22'),
(1, 'test2', '123', 213, 12312.00, '2018-05-06 17:57:27'),
(2, 'gru', '3/4/12', 2, 3.00, '2018-04-25 21:20:51'),
(2, 'jessica', '5/4/18', 2, 75.00, '2018-05-03 20:39:06'),
(2, 'test2', '23', 23, 23.00, '2018-05-06 18:00:11'),
(3, 'gru', '6/5/19', 4, 4.00, '2018-04-25 21:20:51'),
(3, 'test2', '23', 23, 23.00, '2018-05-06 18:00:13'),
(4, 'gru', '6/4/19', 5, 5.00, '2018-04-25 21:20:51'),
(4, 'test2', '23', 23, 23.00, '2018-05-06 18:00:21'),
(5, 'gru', '4/2/33', 6, 0.00, '2018-04-25 21:20:51'),
(6, 'gru', '', 0, 0.00, '2018-04-25 21:20:52'),
(7, 'gru', '', 0, 0.00, '2018-04-25 21:20:52'),
(8, 'gru', '', 0, 0.00, '2018-04-25 21:20:52'),
(9, 'gru', '', 0, 0.00, '2018-04-25 21:20:52'),
(10, 'gru', '', 0, 0.00, '2018-04-25 21:20:52'),
(11, 'gru', '', 0, 0.00, '2018-04-25 21:20:52'),
(12, 'gru', '', 0, 0.00, '2018-04-25 21:20:52'),
(13, 'gru', '', 0, 0.00, '2018-04-25 21:20:52');

-- --------------------------------------------------------

--
-- Table structure for table `goals`
--

CREATE TABLE `goals` (
  `id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `goaltype` varchar(15) NOT NULL,
  `goalamount` int(4) NOT NULL,
  `goaltimer` double(20,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `goals`
--

INSERT INTO `goals` (`id`, `username`, `goaltype`, `goalamount`, `goaltimer`) VALUES
(1, 'gru', 'financial', 10, 39.08),
(2, 'gru', 'memos', 3, 19.26),
(3, 'gru', 'financial', 1, 5.04),
(4, 'gru', 'calculatePercen', 1, 4.30),
(5, 'gru', 'calculatePercen', 1, 3.68),
(6, 'gru', 'financial', 1, 6.16),
(7, 'gru', 'calculatePercen', 3, 3.85),
(8, 'gru', 'financial', 1, 7.07),
(9, 'gru', 'memos', 1, 2.95),
(10, 'gru', 'financial', 1, 11.52),
(11, 'gru', 'memos', 1, 4.05),
(12, 'gru', 'crossCheck', 1, 17.07),
(13, 'gru', 'crossCheck', 1, 43.74),
(14, 'gru', 'calculatePercen', 2, 8.27),
(15, 'jessica', 'labelAppointmen', 1, 20.09),
(16, 'jessica', 'crossCheck', 1, 23.31),
(17, 'jessica', 'memos', 1, 17.03),
(18, 'jessica', 'financial', 1, 14.60),
(19, 'jessica', 'calculatePercen', 1, 12.59),
(20, 'jessica', 'memos', 1, 2.61),
(21, 'jessica', 'calculatePercen', 1, 2.43),
(22, 'jessica', 'labelAppointmen', 1, 13.87),
(23, 'jessica', 'calculatePercen', 1, 3.37),
(24, 'jessica', 'labelAppointmen', 1, 5.03),
(25, 'jessica', 'calculatePercen', 3, 29.59),
(26, 'jessica', 'sortFiles', 3, 29.05),
(27, 'jessica', 'sortFiles', 3, 17.76),
(28, 'jessica', 'sortFiles', 3, 8.93),
(29, 'jessica', 'labelAppointmen', 2, 9.38),
(30, 'jessica', 'calculatePercen', 1, 3.62),
(31, 'jessica', 'calculatePercen', 1, 2.26),
(32, 'jessica', 'labelAppointmen', 2, 6.08),
(33, 'jessica', 'labelAppointmen', 2, 21.15),
(34, 'jessica', 'calculatePercen', 1, 15.48),
(35, 'jessica', 'calculatePercen', 1, 17.08),
(36, 'jessica', 'calculatePercen', 1, 1812.86),
(37, 'jessica', 'calculatePercen', 1, 9.43),
(38, 'jessica', 'calculatePercen', 1, 7.63),
(39, 'jessica', 'labelAppointmen', 2, 3.77),
(40, 'jessica', 'labelAppointmen', 2, 10.85),
(41, 'jessica', 'labelAppointmen', 2, 7.46),
(42, 'jessica', 'labelAppointmen', 2, 20.47),
(43, 'jessica', 'labelAppointmen', 2, 16.58),
(44, 'jessica', 'labelAppointmen', 2, 8.90),
(45, 'jessica', 'labelAppointmen', 2, 544.48),
(46, 'test', 'sortFiles', 1, 3.56),
(47, 'test', 'labelAppointmen', 1, 6.27),
(48, 'test', 'sortFiles', 1, 5.24),
(49, 'test', 'labelAppointmen', 3, 19.98),
(50, 'test', 'sortFiles', 1, 6.80),
(51, 'test', 'labelAppointmen', 3, 17.59),
(52, 'test', 'sortFiles', 1, 6.29),
(53, 'test', 'labelAppointmen', 3, 12.67),
(54, 'test', 'labelAppointmen', 1, 4.68),
(55, 'test', 'calculatePercen', 1, 30.71),
(56, 'test', 'labelAppointmen', 1, 5.64),
(57, 'test', 'calculatePercen', 1, 11.78),
(58, 'test', 'labelAppointmen', 1, 5.74),
(59, 'test', 'calculatePercen', 1, 18.32),
(60, 'test', 'labelAppointmen', 1, 4.50),
(61, 'test', 'calculatePercen', 1, 5.90),
(62, 'test', 'labelAppointmen', 1, 3.56),
(63, 'test', 'calculatePercen', 1, 5.20),
(64, 'test', 'labelAppointmen', 1, 7.87),
(65, 'test', 'sortFiles', 2, 40.77),
(66, 'test2', 'sortFiles', 1, 4.49),
(67, 'test2', 'calculatePercen', 1, 6.10),
(68, 'test2', 'labelAppointmen', 1, 14.90),
(69, 'test2', 'labelAppointmen', 1, 0.00),
(70, 'test2', 'labelAppointmen', 1, 0.00),
(71, 'test2', 'crossCheck', 1, 5.41),
(72, 'test2', 'calculatePercen', 1, 5.71),
(73, 'test2', 'sortFiles', 1, 3.68),
(74, 'test2', 'labelAppointmen', 1, 2.73),
(75, 'test2', 'sortFiles', 1, 6.58),
(76, 'test2', 'labelAppointmen', 1, 3.84),
(77, 'test2', 'calculatePercen', 1, 8.08),
(78, 'test2', 'sortFiles', 1, 39.10),
(79, 'test2', 'crossCheck', 1, 21.82),
(80, 'test2', 'labelAppointmen', 20, 120.76),
(81, 'test2', 'labelAppointmen', 20, 293.75),
(82, 'test2', 'calculatePercen', 1, 11.20),
(83, 'test2', 'calculatePercen', 1, 2.34),
(84, 'test2', 'calculatePercen', 1, 5.07),
(85, 'test2', 'calculatePercen', 1, 24.39),
(86, 'test2', 'calculatePercen', 1, 6.07),
(87, 'test2', 'calculatePercen', 1, 2.53),
(88, 'test2', 'calculatePercen', 1, 4.05),
(89, 'test2', 'calculatePercen', 1, 6.83),
(90, 'test2', 'calculatePercen', 1, 2.37),
(91, 'test2', 'calculatePercen', 1, 2.76),
(92, 'test2', 'calculatePercen', 1, 2.30),
(93, 'test2', 'calculatePercen', 1, 2.41),
(94, 'test2', 'calculatePercen', 1, 125.08),
(95, 'test2', 'calculatePercen', 1, 4.53),
(96, 'test2', 'calculatePercen', 1, 3.90),
(97, 'test2', 'calculatePercen', 1, 39.99),
(98, 'test2', 'calculatePercen', 1, 3.85),
(99, 'test2', 'calculatePercen', 1, 46.46),
(100, 'test2', 'calculatePercen', 1, 89.90),
(101, 'test2', 'calculatePercen', 1, 3.89),
(102, 'test2', 'calculatePercen', 1, 17.98),
(103, 'test2', 'calculatePercen', 1, 5.18),
(104, 'test2', 'calculatePercen', 1, 11.71),
(105, 'test2', 'calculatePercen', 1, 4.57),
(106, 'test2', 'calculatePercen', 1, 36.88),
(107, 'test2', 'calculatePercen', 1, 228.34),
(108, 'test2', 'calculatePercen', 1, 113.39),
(109, 'test2', 'calculatePercen', 1, 43.74),
(110, 'test2', 'calculatePercen', 1, 6.24),
(111, 'test2', 'calculatePercen', 1, 56.33),
(112, 'test2', 'calculatePercen', 1, 13.08),
(113, 'test2', 'calculatePercen', 1, 35.95),
(114, 'test2', 'calculatePercen', 1, 7.53),
(115, 'test2', 'calculatePercen', 1, 11.23),
(116, 'test2', 'calculatePercen', 1, 196.48),
(117, 'test2', 'calculatePercen', 1, 5.46),
(118, 'test2', 'calculatePercen', 1, 7.86),
(119, 'test2', 'calculatePercen', 1, 15.58),
(120, 'test2', 'calculatePercen', 1, 56.82),
(121, 'test2', 'calculatePercen', 1, 12.88),
(122, 'test2', 'calculatePercen', 1, 8.24),
(123, 'test2', 'calculatePercen', 1, 8.81),
(124, 'test2', 'calculatePercen', 1, 5.75),
(125, 'test2', 'calculatePercen', 1, 12.98),
(126, 'test2', 'calculatePercen', 1, 10.39),
(127, 'test2', 'calculatePercen', 1, 10.15),
(128, 'test2', 'calculatePercen', 1, 5.32),
(129, 'test2', 'calculatePercen', 1, 9.39),
(130, 'test2', 'calculatePercen', 1, 11.29),
(131, 'test2', 'calculatePercen', 1, 64.58),
(132, 'test2', 'sortFiles', 3, 27.07),
(133, 'test2', 'sortFiles', 3, 0.00),
(134, 'test2', 'sortFiles', 3, 0.00),
(135, 'test2', 'sortFiles', 3, 1325.19),
(136, 'test2', 'sortFiles', 3, 0.00),
(137, 'test2', 'memos', 3, 0.00),
(138, 'test2', 'memos', 3, 0.00),
(139, 'test2', 'memos', 3, 0.00),
(140, 'test2', 'memos', 3, 0.00),
(141, 'test2', 'memos', 3, 0.00),
(142, 'test2', 'memos', 3, 0.00),
(143, 'test2', 'memos', 3, 0.00),
(144, 'test2', 'memos', 3, 0.00),
(145, 'test2', 'memos', 3, 0.00),
(146, 'test2', 'memos', 3, 0.00),
(147, 'test2', 'memos', 3, 0.00),
(148, 'test2', 'memos', 3, 0.00),
(149, 'test2', 'memos', 3, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `labelappointmentinfo`
--

CREATE TABLE `labelappointmentinfo` (
  `id` int(5) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `apptnum` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `labelappointmentinfo`
--

INSERT INTO `labelappointmentinfo` (`id`, `firstname`, `lastname`, `apptnum`) VALUES
(1, 'Levi', 'Nazari', 3),
(2, 'Richie', 'Bonnett', 6),
(3, 'Carlotta', 'Nadelson', 4),
(4, 'Regan', 'Livingood', 1),
(5, 'Isobel', 'Hannem', 1),
(6, 'Hildegard', 'Watford', 5),
(7, 'Allan', 'Pierotti', 5),
(8, 'Elizbeth', 'Clutter', 8),
(9, 'Berneice', 'Mihalek', 1),
(10, 'Laine', 'Kaui', 1),
(11, 'Aida', 'Walding', 4),
(12, 'Darrick', 'Halen', 1),
(13, 'Taren', 'Dees', 1),
(14, 'Hank', 'Kawachi', 7),
(15, 'Valeria', 'Krisman', 1),
(16, 'Abram', 'Landan', 2),
(17, 'Kortney', 'Wangerin', 6),
(18, 'Joyce', 'Vandenburg', 1),
(19, 'Miguel', 'Ost', 1),
(20, 'Kate', 'Corriveau', 1),
(21, 'Francesco', 'Quelette', 1),
(22, 'Charlene', 'Chesner', 6),
(23, 'Bridgette', 'Tuman', 8),
(24, 'Alysia', 'Metzker', 1),
(25, 'Fredia', 'Labeots', 1),
(26, 'Cruz', 'Ordoyne', 2),
(27, 'Charmaine', 'Skiles', 7),
(28, 'Margarita', 'Kobis', 1),
(29, 'Ethan', 'Hartfield', 1),
(30, 'Michel', 'Golonka', 4),
(31, 'Aaron', 'Giessler', 1),
(32, 'Maritza', 'Polaco', 1),
(33, 'Ilda', 'Mcwayne', 7),
(34, 'Dirk', 'Firmin', 3),
(35, 'Oswaldo', 'Wilhelm', 1),
(36, 'Gilberte', 'Marvel', 1),
(37, 'Gladis', 'Cooke', 1),
(38, 'Marty', 'Ziemer', 2),
(39, 'Alishia', 'Benzi', 7),
(40, 'Darrel', 'Decou', 7),
(41, 'Ehtel', 'Saeli', 6);

-- --------------------------------------------------------

--
-- Table structure for table `labelappointmentinput`
--

CREATE TABLE `labelappointmentinput` (
  `id` int(5) NOT NULL,
  `username` varchar(30) NOT NULL,
  `position` int(5) NOT NULL,
  `selected` varchar(50) NOT NULL,
  `timestamp` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `labelappointmentinput`
--

INSERT INTO `labelappointmentinput` (`id`, `username`, `position`, `selected`, `timestamp`) VALUES
(1, 'jessica', 1, 'followUp', '2018-05-04 00:06:33'),
(2, 'jessica', 2, 'initial', '2018-05-04 00:07:57'),
(3, 'jessica', 3, 'initial', '2018-05-04 00:12:48'),
(4, 'jessica', 4, 'initial', '2018-05-04 00:16:02'),
(5, 'jessica', 5, 'initial', '2018-05-04 00:16:06'),
(6, 'jessica', 6, 'followUp', '2018-05-04 00:16:10'),
(7, 'test', 1, 'initial', '2018-05-06 17:51:14'),
(8, 'test', 2, 'initial', '2018-05-06 17:51:34'),
(9, 'test', 3, 'initial', '2018-05-06 17:51:54'),
(10, 'test', 4, 'initial', '2018-05-06 17:15:07'),
(11, 'test', 5, 'initial', '2018-05-06 17:15:12'),
(12, 'test', 6, 'followUp', '2018-05-06 17:15:16'),
(13, 'test', 7, 'initial', '2018-05-06 17:15:39'),
(14, 'test', 8, 'initial', '2018-05-06 17:15:43'),
(15, 'test', 9, 'initial', '2018-05-06 17:15:48'),
(16, 'test2', 1, 'followUp', '2018-05-06 21:45:36'),
(17, 'test2', 2, 'followUp', '2018-05-06 21:46:01'),
(18, 'test2', 3, 'followUp', '2018-05-06 22:12:12'),
(19, 'test2', 4, 'initial', '2018-05-06 22:12:54'),
(20, 'test2', 5, 'initial', '2018-05-06 22:16:13'),
(21, 'test2', 6, 'followUp', '2018-05-06 18:59:59'),
(22, 'test2', 7, 'followUp', '2018-05-06 19:00:02'),
(23, 'test2', 8, 'followUp', '2018-05-06 19:00:06'),
(24, 'test2', 9, 'initial', '2018-05-06 19:00:09'),
(25, 'test2', 10, 'initial', '2018-05-06 19:00:16'),
(26, 'test2', 11, 'followUp', '2018-05-06 19:00:28'),
(27, 'test2', 12, 'initial', '2018-05-06 19:00:34'),
(28, 'test2', 13, 'initial', '2018-05-06 19:00:43'),
(29, 'test2', 14, 'followUp', '2018-05-06 19:00:48'),
(30, 'test2', 15, 'initial', '2018-05-06 19:00:53'),
(31, 'test2', 16, 'followUp', '2018-05-06 19:01:17'),
(32, 'test2', 17, 'followUp', '2018-05-06 19:01:23'),
(33, 'test2', 18, 'initial', '2018-05-06 19:01:25'),
(34, 'test2', 19, 'initial', '2018-05-06 19:01:32'),
(35, 'test2', 20, 'initial', '2018-05-06 19:01:37'),
(36, 'test2', 21, 'initial', '2018-05-06 19:01:46'),
(37, 'test2', 22, 'followUp', '2018-05-06 19:01:54'),
(38, 'test2', 23, 'followUp', '2018-05-06 19:04:46'),
(39, 'test2', 24, 'initial', '2018-05-06 19:04:54'),
(40, 'test2', 25, 'initial', '2018-05-06 19:04:58'),
(41, 'test2', 26, 'followUp', '2018-05-06 19:05:01'),
(42, 'test2', 27, 'followUp', '2018-05-06 19:05:04'),
(43, 'test2', 28, 'initial', '2018-05-06 19:05:09'),
(44, 'test2', 29, 'initial', '2018-05-06 19:05:13'),
(45, 'test2', 30, 'followUp', '2018-05-06 19:05:49'),
(46, 'test2', 31, 'initial', '2018-05-06 19:05:52'),
(47, 'test2', 32, 'initial', '2018-05-06 19:05:56'),
(48, 'test2', 33, 'followUp', '2018-05-06 19:06:05'),
(49, 'test2', 34, 'followUp', '2018-05-06 19:06:12'),
(50, 'test2', 35, 'initial', '2018-05-06 19:06:17'),
(51, 'test2', 36, 'initial', '2018-05-06 19:06:20'),
(52, 'test2', 37, 'initial', '2018-05-06 19:06:23'),
(53, 'test2', 38, 'followUp', '2018-05-06 19:06:29'),
(54, 'test2', 39, 'followUp', '2018-05-06 19:06:32'),
(55, 'test2', 40, 'followUp', '2018-05-06 19:06:35');

-- --------------------------------------------------------

--
-- Table structure for table `logininfo`
--

CREATE TABLE `logininfo` (
  `username` varchar(30) NOT NULL,
  `password` varchar(10) NOT NULL,
  `emailaddress` varchar(30) NOT NULL,
  `admin` tinyint(1) NOT NULL,
  `financial` int(2) NOT NULL,
  `memo` int(2) NOT NULL,
  `crosscheck` int(2) NOT NULL,
  `sortfiles` int(2) NOT NULL,
  `percentage` int(2) NOT NULL,
  `appointments` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `logininfo`
--

INSERT INTO `logininfo` (`username`, `password`, `emailaddress`, `admin`, `financial`, `memo`, `crosscheck`, `sortfiles`, `percentage`, `appointments`) VALUES
('', '', '', 0, 0, 0, 0, 0, 0, 0),
('Cece', 'girl', 'new@girl.com', 0, 1, 1, 1, 1, 1, 1),
('Gru', 'minion', 'despicable@me.com', 0, 0, 0, 3, 1, 2, 2),
('Jessica', 'Jessica', 'gmail@gmail.com', 0, 0, 1, 0, 3, 1, 2),
('robbyn', 'admin', 'robbyn@gmail.com', 1, 0, 0, 0, 0, 0, 0),
('test', 'test', 'test@gmail.com', 0, 0, 0, 1, 2, 1, 1),
('test2', 'test', 'test@gmail.com', 0, 3, 3, 3, 3, 3, 1),
('testuser1', 'test', 'test@gmail.com', 0, 10, 3, 10, 10, 10, 10);

-- --------------------------------------------------------

--
-- Table structure for table `memoinfo`
--

CREATE TABLE `memoinfo` (
  `id` int(3) NOT NULL,
  `memotext` varchar(4000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `memoinfo`
--

INSERT INTO `memoinfo` (`id`, `memotext`) VALUES
(1, 'Be sure to check! your emails tod8y. A company wid announcement will be sent by our administration office. Have an awesum day.'),
(2, 'Remember 2 lock up all valuables when out on the floor. Phons are to be left in the break room If a phone si seen on the floor you will be written up.'),
(3, 'It\'s the weekend! No important messages to day. Just take a break and have sum fun theis wekeend.'),
(4, 'If you arrive mor than 10 minutes early do not clock in! you are allowed to clokci in 10 mintes before your shift but no earlier.'),
(5, 'We will be performings eversal software updates on Friday May 9 th . Sevices may be temporarily unavailable from 12pm - 2 pm. Take the necessary precaustions.'),
(6, 'Thank you for all of your hard work. This memo is just to sya that we appreciate each end every 1 of you. Thank you for all you do eavery day!'),
(7, 'Remember to sign off on all appointments once compltd. This is of utmost importantce as it impacts oru billing services and ability to continue services;'),
(8, 'Please see our office manager 4 time off requests. The procedure fo r requesting time off has changed. And he will be happy to assit you with any questions or concerns.');

-- --------------------------------------------------------

--
-- Table structure for table `memoinput`
--

CREATE TABLE `memoinput` (
  `id` int(11) NOT NULL,
  `memoID` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `memotext` varchar(4000) NOT NULL,
  `timestamp` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `memoinput`
--

INSERT INTO `memoinput` (`id`, `memoID`, `username`, `memotext`, `timestamp`) VALUES
(33, 1, 'test2', 'Be sure to check! your emails tod8y. A company wid announcement will be sent by our administration office. Have an awesum day.', '2018-05-06 23:23:13'),
(34, 2, 'test2', 'Remember 2 lock up all valuables when out on the floor. Phons are to be left in the break room If a phone si seen on the floor you will be written up.', '2018-05-06 23:23:22'),
(35, 3, 'test2', 'It\\\'s the weekend! No important messages to day. Just take a break and have sum fun theis wekeend.', '2018-05-06 23:22:59'),
(36, 4, 'test2', 'If you arrive mor than 10 minutes early do not clock in! you are allowed to clokci in 10 mintes before your shift but no earlier.', '2018-05-06 23:18:33');

-- --------------------------------------------------------

--
-- Table structure for table `percentageinput`
--

CREATE TABLE `percentageinput` (
  `recordnum` int(5) NOT NULL,
  `username` varchar(30) NOT NULL,
  `apptattend` int(4) NOT NULL,
  `apptlate` int(4) NOT NULL,
  `apptnotattend` int(4) NOT NULL,
  `percentattend` double(7,4) DEFAULT NULL,
  `percentlate` double(7,4) DEFAULT NULL,
  `timestamp` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `restrictions`
--

CREATE TABLE `restrictions` (
  `username` varchar(30) NOT NULL,
  `limiter` int(2) NOT NULL,
  `limited` int(2) NOT NULL,
  `day` int(1) DEFAULT NULL,
  `limitedgoal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `restrictions`
--

INSERT INTO `restrictions` (`username`, `limiter`, `limited`, `day`, `limitedgoal`) VALUES
('test', 5, 6, 3, 0),
('test2', 4, 6, 2, 3),
('testuser1', 0, 0, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sortedfiles`
--

CREATE TABLE `sortedfiles` (
  `recordnum` int(5) NOT NULL,
  `username` varchar(30) NOT NULL,
  `inputfile` varchar(15) NOT NULL,
  `selected` varchar(2) NOT NULL,
  `timestamp` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sortedfiles`
--

INSERT INTO `sortedfiles` (`recordnum`, `username`, `inputfile`, `selected`, `timestamp`) VALUES
(1, 'jessica', 'Ryg0hCeO.pdf', 'R', '2018-05-03 21:37:24'),
(2, 'jessica', 'XgWGNkRH.pdf', 'X', '2018-05-03 22:29:29'),
(3, 'jessica', 'EjhfhLNx.pdf', 'E', '2018-05-03 22:29:38'),
(4, 'jessica', 'Mnc5Dmxm.pdf', 'M', '2018-05-03 22:29:50'),
(5, 'jessica', 'EZ3fyib3.pdf', 'E', '2018-05-03 22:30:15'),
(6, 'jessica', 'ZAnQcvzJ.pdf', 'Z', '2018-05-03 22:30:18'),
(7, 'jessica', 'PQD9Qvu8.pdf', 'P', '2018-05-03 22:30:28'),
(8, 'jessica', 'Mc9KXCiP.pdf', 'M', '2018-05-03 22:30:36'),
(9, 'jessica', 'GEjV9OLh.pdf', 'G', '2018-05-03 22:30:38'),
(10, 'jessica', 'A21Ax6Dm.pdf', 'A', '2018-05-03 22:30:41'),
(11, 'test', 'RFz7zytY.pdf', 'R', '2018-05-06 17:05:56'),
(12, 'test', 'HzZbzg3C.pdf', 'H', '2018-05-06 17:06:02'),
(13, 'test', 'WXJ4ltQo.pdf', 'W', '2018-05-06 17:06:09'),
(14, 'test', 'WXJ4ltQo.pdf', 'W', '2018-05-06 17:06:22'),
(15, 'test', 'MGeVLUHR.pdf', 'M', '2018-05-06 17:06:30'),
(16, 'test', 'GUjnhnND.pdf', 'G', '2018-05-06 17:10:11'),
(17, 'test', 'FjEqwMKs.pdf', 'F', '2018-05-06 17:13:18'),
(18, 'test', 'RkXfiSch.pdf', 'R', '2018-05-06 17:14:55'),
(19, 'test', 'PNsMMQjX.pdf', 'P', '2018-05-06 17:15:32'),
(20, 'test', 'UpgHlN3w.pdf', 'U', '2018-05-06 17:24:04'),
(21, 'test', 'HXQzxX5i.pdf', 'H', '2018-05-06 17:24:09'),
(22, 'test2', 'M5UQ6Ajc.pdf', 'M', '2018-05-06 17:56:36'),
(23, 'test2', 'Rj3nWmvX.pdf', 'R', '2018-05-06 17:58:06'),
(24, 'test2', 'Lq12khSz.pdf', 'L', '2018-05-06 17:58:12'),
(25, 'test2', 'Xo8g3UxS.pdf', 'X', '2018-05-06 17:59:23'),
(26, 'test', 'R9CdAtXk.pdf', 'R', '2018-05-06 18:02:21'),
(27, 'test', 'ZE9ApZUj.pdf', 'Z', '2018-05-06 18:02:57'),
(28, 'test2', 'U0TKgvS8.pdf', 'U', '2018-05-06 18:03:24'),
(29, 'test2', 'CsOXiN7D.pdf', 'C', '2018-05-06 18:05:58'),
(30, 'test2', 'VQtzWm9S.pdf', 'V', '2018-05-06 18:06:16'),
(31, 'test2', 'C1k5pxKe.pdf', 'C', '2018-05-06 18:08:37'),
(32, 'test2', 'Ph7GqPNn.pdf', 'J', '2018-05-06 18:50:18'),
(33, 'test2', 'JLi9Z8xT.pdf', 'J', '2018-05-06 18:50:22'),
(34, 'test2', 'BwD80txQ.pdf', 'H', '2018-05-06 18:50:26'),
(35, 'test2', 'JvrnjAiK.pdf', 'H', '2018-05-06 18:50:28'),
(36, 'test2', 'PbT7chAC.pdf', 'G', '2018-05-06 18:50:31'),
(37, 'test2', 'TvHbG1xl.pdf', 'D', '2018-05-06 18:50:33'),
(38, 'test2', 'D0MtK951.pdf', 'J', '2018-05-06 18:50:35'),
(39, 'test2', 'YEoaNW2G.pdf', 'J', '2018-05-06 18:50:37'),
(40, 'test2', 'Z0Ji3x3x.pdf', 'I', '2018-05-06 18:50:40'),
(41, 'test2', 'B0wXrz26.pdf', 'C', '2018-05-06 18:50:43'),
(42, 'test2', 'IEV9v5cD.pdf', 'I', '2018-05-06 18:50:55'),
(43, 'test2', 'PWV4fdKL.pdf', 'P', '2018-05-06 18:51:04'),
(44, 'test2', 'DSuv9Xtp.pdf', 'D', '2018-05-06 18:51:06'),
(45, 'test2', 'ABJbmarj.pdf', 'B', '2018-05-06 18:51:08'),
(46, 'test2', 'NECLauro.pdf', 'N', '2018-05-06 18:51:14'),
(47, 'test2', 'ZI4E7Fpx.pdf', 'Z', '2018-05-06 18:51:19'),
(48, 'test2', 'UT6DJkWY.pdf', 'U', '2018-05-06 18:51:27'),
(49, 'test2', 'I4pBlLJF.pdf', 'I', '2018-05-06 18:51:30'),
(50, 'test2', 'X0jxVADm.pdf', 'X', '2018-05-06 18:51:32'),
(51, 'test2', 'PDZUH4vY.pdf', 'P', '2018-05-06 18:51:40'),
(52, 'test2', 'KZ2wvpDi.pdf', 'K', '2018-05-06 18:51:47'),
(53, 'test2', 'TS4wva1N.pdf', 'T', '2018-05-06 18:51:51'),
(54, 'test2', 'JdvNIslF.pdf', 'J', '2018-05-06 18:51:58'),
(55, 'test2', 'KkV3ZWlG.pdf', 'K', '2018-05-06 18:52:01'),
(56, 'test2', 'VIRKNhc4.pdf', 'V', '2018-05-06 18:52:06'),
(57, 'test2', 'DIko1KPO.pdf', 'D', '2018-05-06 18:52:11'),
(58, 'test2', 'PlpF6dy1.pdf', 'P', '2018-05-06 18:53:22'),
(59, 'test2', 'XNx2CR8M.pdf', 'X', '2018-05-06 21:44:34'),
(60, 'test2', 'PEjTx480.pdf', 'P', '2018-05-06 21:44:42'),
(61, 'test2', 'YkKLpMEL.pdf', 'Y', '2018-05-06 21:44:49'),
(62, 'test2', 'FlrbT3Ew.pdf', 'F', '2018-05-06 21:44:56'),
(63, 'test2', 'WmfFIy0q.pdf', 'W', '2018-05-06 21:45:45'),
(64, 'test2', 'XFXPNsCc.pdf', 'X', '2018-05-06 21:45:49'),
(65, 'test2', 'CxQ18qnQ.pdf', 'C', '2018-05-06 21:45:53'),
(66, 'test2', 'BoBYk9mN.pdf', 'B', '2018-05-06 21:46:07'),
(67, 'test2', 'EYQsWeSk.pdf', 'E', '2018-05-06 21:46:11'),
(68, 'test2', 'BjlGCSPK.pdf', 'B', '2018-05-06 21:46:14'),
(69, 'test2', 'LUwlQAFZ.pdf', 'L', '2018-05-06 21:50:27'),
(70, 'test2', 'G7qYz9aC.pdf', 'G', '2018-05-06 21:50:30'),
(71, 'test2', 'DozIRexE.pdf', 'D', '2018-05-06 21:50:36'),
(72, 'test2', 'JUHtVe7o.pdf', 'J', '2018-05-06 22:12:33'),
(73, 'test2', 'FrcxWOxt.pdf', 'F', '2018-05-06 22:12:37'),
(74, 'test2', 'Q6P1QOk9.pdf', 'Q', '2018-05-06 22:12:44'),
(75, 'test2', 'P5EpQuLb.pdf', 'P', '2018-05-06 22:15:46'),
(76, 'test2', 'Jc9kCAPe.pdf', 'J', '2018-05-06 22:15:50'),
(77, 'test2', 'YDu5cNss.pdf', 'Y', '2018-05-06 22:15:55');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `crosscheck`
--
ALTER TABLE `crosscheck`
  ADD PRIMARY KEY (`recordnum`,`username`);

--
-- Indexes for table `currenttask`
--
ALTER TABLE `currenttask`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `financialinfo`
--
ALTER TABLE `financialinfo`
  ADD PRIMARY KEY (`recordnum`,`username`);

--
-- Indexes for table `goals`
--
ALTER TABLE `goals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `labelappointmentinfo`
--
ALTER TABLE `labelappointmentinfo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `labelappointmentinput`
--
ALTER TABLE `labelappointmentinput`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logininfo`
--
ALTER TABLE `logininfo`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `memoinfo`
--
ALTER TABLE `memoinfo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `memoinput`
--
ALTER TABLE `memoinput`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `percentageinput`
--
ALTER TABLE `percentageinput`
  ADD PRIMARY KEY (`recordnum`,`username`);

--
-- Indexes for table `restrictions`
--
ALTER TABLE `restrictions`
  ADD PRIMARY KEY (`username`,`limiter`,`limited`);

--
-- Indexes for table `sortedfiles`
--
ALTER TABLE `sortedfiles`
  ADD PRIMARY KEY (`recordnum`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `goals`
--
ALTER TABLE `goals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=150;

--
-- AUTO_INCREMENT for table `labelappointmentinfo`
--
ALTER TABLE `labelappointmentinfo`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `labelappointmentinput`
--
ALTER TABLE `labelappointmentinput`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `memoinfo`
--
ALTER TABLE `memoinfo`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `memoinput`
--
ALTER TABLE `memoinput`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `sortedfiles`
--
ALTER TABLE `sortedfiles`
  MODIFY `recordnum` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
