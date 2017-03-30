-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 30, 2017 at 01:05 PM
-- Server version: 10.1.9-MariaDB
-- PHP Version: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `persan`
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
('cat58da557a63751', 'Aggregates', 'Materials', 'active'),
('cat58da56fb43017', 'qwert', 'Equipment', 'inactive'),
('cat58da907df2ddc', 'qwer', 'Employee', 'inactive'),
('cat58daaf3561416', 'Heavy Equipment', 'Equipment', 'active');

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
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `emp_id` varchar(20) NOT NULL,
  `empname` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `position` varchar(100) NOT NULL,
  `Status` varchar(50) NOT NULL,
  `contact_num` varchar(25) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Address` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`emp_id`, `empname`, `username`, `password`, `position`, `Status`, `contact_num`, `Email`, `Address`) VALUES
('emp-0001', 'Bernie Zabala Remollo', 'lucid', 'unix', 'president', 'working', '+639066073883', 'bernie.remollo@yahoo.com', '#80-A Gen.Bautista st'),
('emp-0002', 'Eunice Saus Beltran', 'belty', '12345', 'President', 'Retired ', '+639157161253', 'eunicesausbeltran@yahoo.com', '#12 Gen. Lim St.'),
('emp-0003', 'Carmina Escobiñas', 'Carmina ', '12345', 'Vice President', 'working', '+639876543210', 'Carmina_ganda@email.com', 'San juan '),
('Emp-0004', 'Jaja', 'Jaja', '1234', 'Labandero', 'Single Mom', '1234567890', 'Jajapabatao@yahoo.com', 'Pasig City');

-- --------------------------------------------------------

--
-- Table structure for table `equipment`
--

CREATE TABLE `equipment` (
  `eqpt_id` varchar(7) NOT NULL DEFAULT '0',
  `type_eqpt` varchar(100) NOT NULL,
  `desc_eqpt` varchar(150) NOT NULL,
  `model_eqpt` varchar(100) NOT NULL,
  `cp_eqpt` varchar(50) NOT NULL,
  `plate_no` varchar(50) NOT NULL,
  `serial_no` varchar(50) NOT NULL,
  `condition_eqpt` varchar(50) NOT NULL,
  `ownership` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `equipment`
--

INSERT INTO `equipment` (`eqpt_id`, `type_eqpt`, `desc_eqpt`, `model_eqpt`, `cp_eqpt`, `plate_no`, `serial_no`, `condition_eqpt`, `ownership`) VALUES
('wer id', 'wer', 'wer', 'qwer', 'qwert', 'wer', 'wer', 'Good Condition', 'qwer'),
('wert id', 'wert', 'ert', 'ert', 'ert', 'ert', 'ert', 'Good Condition', 'wer'),
('\0', '\0', '\0', '\0', '\0', '\0', '\0', '\0', '\0'),
('\0', '\0', '\0', '\0', '\0', '\0', '\0', '\0', '\0');

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
-- Table structure for table `labor`
--

CREATE TABLE `labor` (
  `labor_id` varchar(7) NOT NULL DEFAULT '0',
  `labor_desc` varchar(50) NOT NULL,
  `labor_type` varchar(50) NOT NULL,
  `uom` varchar(50) NOT NULL,
  `rate` decimal(30,2) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `labor`
--

INSERT INTO `labor` (`labor_id`, `labor_desc`, `labor_type`, `uom`, `rate`, `status`) VALUES
('LBID001', 'Mason', 'Skilled Laborer', '/hr', '50.00', 'active'),
('LBID002', 'Foreman', 'Skilled Laborer', '/hr', '90.00', 'active'),
('LBID003', 'Painter', 'Unskilled Laborer', '/hr', '60.00', 'active'),
('LBID004', 'Carpenter', 'Skilled Laborer', '/hr', '50.00', 'active'),
('0', 'Electrician', 'Skilled', 'hr', '70.00', 'active'),
('lab-58d', '', '', '', '0.00', 'active'),
('lab-58d', '', '', '', '0.00', 'active'),
('lab-58d', 'ber', 'Skilled', '', '0.00', 'active'),
('lab-58d', 'berea', 'Skilled', '', '0.00', 'active'),
('lab-58d', 'vewq', 'Skilled', 'hour', '12.00', 'active'),
('lab-58d', '1342', 'Skilled', 'hour', '121234.00', 'active'),
('lab-58d', 'carpinter', 'Skilled', '/day', '25.00', 'active'),
('lab-58d', 'wewr', 'Skilled', '/hr', '111.00', 'active'),
('lab-58d', 'QEWRQ', 'Skilled', '/hr', '111.00', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `materials`
--

CREATE TABLE `materials` (
  `id` varchar(20) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL,
  `names` varchar(255) NOT NULL,
  `material_desc` varchar(200) NOT NULL,
  `uom` varchar(50) NOT NULL,
  `rate` decimal(30,2) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `materials`
--

INSERT INTO `materials` (`id`, `name`, `names`, `material_desc`, `uom`, `rate`, `status`) VALUES
('MTRL001', '', '', 'Cement', 'kg', '60.00', 'active'),
('MTRL002', '', '', 'Embankment Materials', 'cu.m.', '380.00', 'active'),
('MTRL003', '', '', 'Fine Aggregates', 'cu.m.', '540.00', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `subcategories`
--

CREATE TABLE `subcategories` (
  `id` varchar(30) NOT NULL,
  `names` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subcategories`
--

INSERT INTO `subcategories` (`id`, `names`, `description`, `name`, `status`) VALUES
('cat58da56fb43016', 'wew', 'Labor', 'qwert', 'active'),
('cat58da56fb43106', 'Fine', 'Materials', 'Aggregates', 'active'),
('cat58daabbcea313', '1234', 'Equipment', 'hi', 'active'),
('cat58daae83cdf38', 'Try', 'Materials', 'hi', 'inactive'),
('cat58daaf6f0d033', 'Excavator', 'Equipment', 'hi', 'active'),
('cat58dab08738058', 'Bulldozer', 'Heavy Equipment', 'hi', 'inactive'),
('cat58dab09b2bbb8', 'Bulldozer', 'Heavy Equipment', 'hi', 'active'),
('cat58dab0d351e7d', 'Roller', 'Equipment', 'hi', 'inactive'),
('cat58dac8fb85bb6', 'qwer', 'Materials', 'Materials', 'active'),
('cat58dac9e94ff25', 'berae', 'Labor', 'Heavy Equipment', 'active'),
('cat58db2d5e2a37d', 'sand', 'Materials', 'Aggregates', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `uom`
--

CREATE TABLE `uom` (
  `unit_id` varchar(20) NOT NULL,
  `category` varchar(100) NOT NULL,
  `subcategory` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `uom`
--

INSERT INTO `uom` (`unit_id`, `category`, `subcategory`) VALUES
('0', 'linear measurement', 'foot'),
('1', 'linear measurement', 'kilometre '),
('11', 'weight measurement', 'tonne '),
('12', 'weight measurement', 'kilogram '),
('13', 'weight measurement', 'gram'),
('14', 'weight measurement', 'quintal  '),
('15', 'weight measurement', 'ounce'),
('16', 'weight measurement', 'pound'),
('17', 'weight measurement', 'tola'),
('19', 'area measurement', 'square kilometre'),
('2', 'linear measurement', 'meter'),
('20', 'area measurement', 'square metre'),
('21', 'area measurement', 'acre '),
('22', 'area measurement', 'guntha '),
('23', 'area measurement', 'hectare'),
('24', 'area measurement', 'are'),
('25', 'area measurement', 'brass'),
('27', 'area measurement', 'square mile'),
('28', 'area measurement', 'square centimeter'),
('29', 'area measurement', 'square foot'),
('3', 'linear measurement', 'mile '),
('30', 'area measurement', 'square yard'),
('31', 'area measurement', 'meter squared'),
('4', 'linear measurement', 'centimetre '),
('5', 'linear measurement', 'furlong  '),
('6', 'linear measurement', 'yard  '),
('7', 'linear measurement', 'millimetre   '),
('8', 'linear measurement', 'foot'),
('9', 'linear measurement', 'inch');

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
('Bernie', '594aa0a9de0c75cd4d4037b6b65c683e', 'ADMIN', 'active'),
('test', '098f6bcd4621d373cade4e832627b4f6', 'USER', 'inactive'),
('tester', 'f5d1278e8109edd94e1e4197e04873b9', 'USER', 'active'),
('user1', '24c9e15e52afc47c225b757e7bee1f9d', 'USER', 'inactive');

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
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`emp_id`);

--
-- Indexes for table `id_gen`
--
ALTER TABLE `id_gen`
  ADD UNIQUE KEY `ref_id` (`ref_id`);

--
-- Indexes for table `materials`
--
ALTER TABLE `materials`
  ADD KEY `name` (`name`);

--
-- Indexes for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`names`);

--
-- Indexes for table `uom`
--
ALTER TABLE `uom`
  ADD PRIMARY KEY (`unit_id`);

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
