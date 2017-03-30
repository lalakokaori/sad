-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 21, 2016 at 09:41 AM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `mosys`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE IF NOT EXISTS `accounts` (
  `accounts_id` varchar(25) NOT NULL,
  `accounts_clients_id` varchar(25) NOT NULL,
  `accounts_status` char(10) NOT NULL,
  PRIMARY KEY (`accounts_id`),
  UNIQUE KEY `accounts_clients_id` (`accounts_clients_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`accounts_id`, `accounts_clients_id`, `accounts_status`) VALUES
('ACC571883d0031f3', 'CL571883cfe6e21', 'active'),
('ACC5718840b5ad69', 'CL5718840b4ed1c', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE IF NOT EXISTS `clients` (
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
  `clients_status` char(10) NOT NULL,
  PRIMARY KEY (`clients_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`clients_id`, `clients_name`, `clients_address`, `clients_contact`, `clients_bdate`, `clients_gender`, `clients_job`, `clients_mstatus`, `clients_spousename`, `clients_dependents`, `clients_status`) VALUES
('CL571883cfe6e21', 'Moses Jerome Lucas', 'Dressrosa, Grandline St.', '09063402308', '1996-10-02', 'male', 'Rails Engineer', 'divorced', '', 0, 'active'),
('CL5718840b4ed1c', 'Jake Finn', 'Arabasta', '0906390928', '1995-11-02', 'male', 'Dogger', 'married', 'Rainbow Ponyia', 8, 'active');

-- --------------------------------------------------------

--
-- Table structure for table `discounts`
--

CREATE TABLE IF NOT EXISTS `discounts` (
  `discounts_id` varchar(25) NOT NULL,
  `discounts_name` varchar(50) NOT NULL,
  `discounts_rate` int(99) NOT NULL,
  `discounts_status` char(10) NOT NULL,
  PRIMARY KEY (`discounts_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `discounts`
--

INSERT INTO `discounts` (`discounts_id`, `discounts_name`, `discounts_rate`, `discounts_status`) VALUES
('DS5718841db6b24', 'Valentines', 12, 'active'),
('DS571884315009a', 'Special Client', 25, 'active');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `users_name` varchar(15) NOT NULL,
  `users_password` varchar(50) NOT NULL,
  `users_type` varchar(15) NOT NULL,
  `users_status` char(10) NOT NULL,
  PRIMARY KEY (`users_name`),
  UNIQUE KEY `users_name` (`users_name`)
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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
