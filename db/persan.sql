-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 28, 2017 at 01:49 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mosys`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `accounts_id` varchar(25) NOT NULL,
  `accounts_clients_id` varchar(25) NOT NULL,
  `accounts_status` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`accounts_id`, `accounts_clients_id`, `accounts_status`) VALUES
('ACC571883d0031f3', 'CL571883cfe6e21', 'active'),
('ACC5718840b5ad69', 'CL5718840b4ed1c', 'active'),
('ACC58d912ec7cf14', 'CL58d912ec4d781', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` varchar(30) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `status`) VALUES
('1', 'Eunice', 'Student', 'inactive'),
('2', 'Jaja', 'Student', 'active'),
('cat58d91ced9f77c', 'Eunic', 'Student', 'active'),
('cat58d91d2d910fe', 'Carmina', 'Student', 'active'),
('cat58d91d3beb96f', 'niz', 'student', 'active'),
('cat58d98e0f0a996', 'O\'hara', 'Teacher', 'active'),
('cat58d99f33a0450', 'Joseph', 'Belts', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `categories_beta`
--

CREATE TABLE `categories_beta` (
  `id` varchar(30) NOT NULL,
  `ref_id` varchar(7) DEFAULT '0',
  `ct_name` varchar(255) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories_beta`
--

INSERT INTO `categories_beta` (`id`, `ref_id`, `ct_name`, `status`) VALUES
('1', 'EML002', 'Heavy Equipment', 'active'),
('cat58d9eff38495f', 'EML003', '', 'inactive'),
('cat58d9f0e1dcfcb', 'EML004', 'undefined', 'inactive'),
('cat58d9f2c70e76c', 'EML005', 'Construction Vehicle', 'active'),
('cat58d9f4658dda9', 'EML006', 'aa', 'active'),
('cat58da2accbbf35', 'EML007', 'Sample', 'active');

--
-- Triggers `categories_beta`
--
DELIMITER $$
CREATE TRIGGER `tg_id_insert` BEFORE INSERT ON `categories_beta` FOR EACH ROW begin
insert into id_gen values (null);
SET new.ref_id = concat ('EML', LPAD(LAST_INSERT_ID(), 3, '0'));
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `clients_id` varchar(25) NOT NULL,
  `clients_name` varchar(100) NOT NULL,
  `clients_address` varchar(150) NOT NULL,
  `clients_contact` varchar(15) NOT NULL,
  `clients_bdate` date NOT NULL,
  `clients_gender` char(10) NOT NULL,
  `clients_job` varchar(50) NOT NULL,
  `clients_mstatus` varchar(10) NOT NULL,
  `clients_spousename` varchar(100) DEFAULT NULL,
  `clients_dependents` int(99) DEFAULT NULL,
  `clients_status` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`clients_id`, `clients_name`, `clients_address`, `clients_contact`, `clients_bdate`, `clients_gender`, `clients_job`, `clients_mstatus`, `clients_spousename`, `clients_dependents`, `clients_status`) VALUES
('CL571883cfe6e21', 'Moses Lucas', 'Dressrosa, Grandline St.', '09063402308', '1996-10-02', 'male', 'Rails Engineer', 'divorced', '', 0, 'active'),
('CL5718840b4ed1c', 'Jake Finn', 'Arabasta', '0906390928', '1995-11-02', 'male', 'Dogger', 'married', 'Rainbow Ponyia', 8, 'active'),
('CL58d912ec4d781', 'dsfgsdfg', 'asdfasdfasdf', '23423423', '1992-03-03', 'male', 'asdfasdf', 'single', '', 0, 'inactive');

-- --------------------------------------------------------

--
-- Table structure for table `discounts`
--

CREATE TABLE `discounts` (
  `discounts_id` varchar(25) NOT NULL,
  `discounts_name` varchar(50) NOT NULL,
  `discounts_rate` int(99) NOT NULL,
  `discounts_status` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `discounts`
--

INSERT INTO `discounts` (`discounts_id`, `discounts_name`, `discounts_rate`, `discounts_status`) VALUES
('DS5718841db6b24', 'Valentines', 12, 'active'),
('DS571884315009a', 'Special Client', 25, 'active'),
('DS58d9132f4e02e', 'eunice', 1, 'active'),
('DS58d91bd4453dc', 'aa', 0, 'inactive'),
('DS58d91c50c6a89', 'Eunice', 0, 'active');

-- --------------------------------------------------------

--
-- Table structure for table `id_gen`
--

CREATE TABLE `id_gen` (
  `ref_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `id_gen`
--

INSERT INTO `id_gen` (`ref_id`) VALUES
(2),
(3),
(4),
(5),
(6),
(7);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `users_name` varchar(15) NOT NULL,
  `users_password` varchar(50) NOT NULL,
  `users_type` varchar(15) NOT NULL,
  `users_status` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`users_name`, `users_password`, `users_type`, `users_status`) VALUES
('admin', '21232f297a57a5a743894a0e4a801fc3', 'ADMIN', 'active'),
('moses', '594aa0a9de0c75cd4d4037b6b65c683e', 'ADMIN', 'active'),
('test', '098f6bcd4621d373cade4e832627b4f6', 'USER', 'inactive'),
('tester', 'f5d1278e8109edd94e1e4197e04873b9', 'USER', 'active'),
('user1', '24c9e15e52afc47c225b757e7bee1f9d', 'USER', 'active');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`accounts_id`),
  ADD UNIQUE KEY `accounts_clients_id` (`accounts_clients_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `categories_beta`
--
ALTER TABLE `categories_beta`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ref_id` (`ref_id`),
  ADD KEY `ct_name` (`ct_name`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`clients_id`);

--
-- Indexes for table `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`discounts_id`);

--
-- Indexes for table `id_gen`
--
ALTER TABLE `id_gen`
  ADD UNIQUE KEY `ref_id` (`ref_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`users_name`),
  ADD UNIQUE KEY `users_name` (`users_name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `id_gen`
--
ALTER TABLE `id_gen`
  MODIFY `ref_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
