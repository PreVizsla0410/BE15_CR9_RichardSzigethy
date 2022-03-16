-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 16, 2022 at 01:13 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `be15_cr9_famazon_richardszigethy`
--

-- --------------------------------------------------------

--
-- Table structure for table `country_of_suppliers`
--

CREATE TABLE `country_of_suppliers` (
  `country_ID` int(11) NOT NULL,
  `country` varchar(55) DEFAULT NULL,
  `custom_price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `country_of_suppliers`
--

INSERT INTO `country_of_suppliers` (`country_ID`, `country`, `custom_price`) VALUES
(1, 'Germany', 0),
(2, 'Marrocco', 50),
(3, 'USA', 100);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_ID` int(11) NOT NULL,
  `First_Name` varchar(55) DEFAULT NULL,
  `Last_Name` varchar(55) DEFAULT NULL,
  `address` varchar(55) DEFAULT NULL,
  `username` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_ID`, `First_Name`, `Last_Name`, `address`, `username`) VALUES
(1, 'John', 'Travolta', 'Trautonstraße 13', 'fiqqer34'),
(2, 'Edmont', 'Dante', 'Josefstraße 13', 'geriqqer34'),
(3, 'Sequire', 'Wiver', 'Austraße 13', 'Gaiqqer34');

-- --------------------------------------------------------

--
-- Table structure for table `discount`
--

CREATE TABLE `discount` (
  `discount_ID` int(11) NOT NULL,
  `discount_Type` varchar(55) DEFAULT NULL,
  `validity_until` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `discount`
--

INSERT INTO `discount` (`discount_ID`, `discount_Type`, `validity_until`) VALUES
(1, 'spring offer', '2022-04-21 00:00:00'),
(2, 'empoloyee bonus', '2022-12-31 00:00:00'),
(3, 'first time bonus', '2023-01-01 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `employee_ID` int(11) NOT NULL,
  `name` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`employee_ID`, `name`) VALUES
(1, 'Richard Szigethy'),
(2, 'Nicolas Cage'),
(3, 'Ronaldinho');

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `item_ID` int(11) NOT NULL,
  `price` int(11) DEFAULT NULL,
  `availability` bit(1) DEFAULT NULL,
  `category` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`item_ID`, `price`, `availability`, `category`) VALUES
(1, 33, b'1', 'bottles'),
(2, 44, b'0', 'electronical supplies'),
(3, 55, b'1', 'beverages');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_ID` int(11) NOT NULL,
  `sum` int(11) NOT NULL,
  `order_address` varchar(55) DEFAULT NULL,
  `customer_order` varchar(55) DEFAULT NULL,
  `fk_customer_ID` varchar(255) DEFAULT NULL,
  `fk_shipping_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_ID`, `sum`, `order_address`, `customer_order`, `fk_customer_ID`, `fk_shipping_ID`) VALUES
(1, 77, 'Trautonstraße 13', 'John Travolta', '1', 1),
(2, 83, 'Josefstraße 13', 'Edmont Dante', '2', 2),
(3, 66, 'Austraße 13', 'Sequire Wiver', '3', 3);

-- --------------------------------------------------------

--
-- Table structure for table `potential_customers`
--

CREATE TABLE `potential_customers` (
  `pt_customer_ID` int(11) NOT NULL,
  `refferal` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `potential_customers`
--

INSERT INTO `potential_customers` (`pt_customer_ID`, `refferal`) VALUES
(1, 'Customer'),
(2, 'YOUTUBE'),
(3, 'Facebook');

-- --------------------------------------------------------

--
-- Table structure for table `remarketing`
--

CREATE TABLE `remarketing` (
  `remarketing_ID` int(11) NOT NULL,
  `sex` varchar(6) NOT NULL,
  `email` varchar(55) NOT NULL,
  `marketing_source` varchar(55) DEFAULT NULL,
  `fk_pt_customers_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `remarketing`
--

INSERT INTO `remarketing` (`remarketing_ID`, `sex`, `email`, `marketing_source`, `fk_pt_customers_ID`) VALUES
(1, 'MALE', 'fiqqer34@gmail.com', 'facebook', 1),
(2, 'MALE', 'geriqqer34@gmail.com', 'YouTube', 2),
(3, 'FEMALE', 'Gaiqqer3434@gmail.com', 'Google', 3);

-- --------------------------------------------------------

--
-- Table structure for table `sellers`
--

CREATE TABLE `sellers` (
  `seller_ID` int(11) NOT NULL,
  `Seller_name` varchar(55) DEFAULT NULL,
  `ContactPerson` varchar(55) DEFAULT NULL,
  `category_of_sell` varchar(55) DEFAULT NULL,
  `products` varchar(55) DEFAULT NULL,
  `fk_items_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sellers`
--

INSERT INTO `sellers` (`seller_ID`, `Seller_name`, `ContactPerson`, `category_of_sell`, `products`, `fk_items_ID`) VALUES
(1, 'Kevin Durants Basketballshop', 'Kevind Durant', 'bottels', 'bottle of milk', 1),
(2, 'Lionel Messis Soccarballshop', 'Cristiano Ronaldo', 'electric supplies', 'condensatores', 2),
(3, 'Jack Daniels beverages', 'Jack Daniels', 'beverages', 'whisky', 3);

-- --------------------------------------------------------

--
-- Table structure for table `shipping`
--

CREATE TABLE `shipping` (
  `shipping_id` int(11) NOT NULL,
  `shipping_date` datetime DEFAULT NULL,
  `shipping_done` bit(1) DEFAULT NULL,
  `shipping_method` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shipping`
--

INSERT INTO `shipping` (`shipping_id`, `shipping_date`, `shipping_done`, `shipping_method`) VALUES
(1, '2022-03-09 16:13:14', b'1', 'dpd'),
(2, '2022-03-19 16:13:33', b'0', 'Post'),
(3, '2022-03-08 16:13:40', b'1', 'UPS');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `country_of_suppliers`
--
ALTER TABLE `country_of_suppliers`
  ADD PRIMARY KEY (`country_ID`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_ID`);

--
-- Indexes for table `discount`
--
ALTER TABLE `discount`
  ADD PRIMARY KEY (`discount_ID`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`employee_ID`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`item_ID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_ID`);

--
-- Indexes for table `potential_customers`
--
ALTER TABLE `potential_customers`
  ADD PRIMARY KEY (`pt_customer_ID`);

--
-- Indexes for table `remarketing`
--
ALTER TABLE `remarketing`
  ADD PRIMARY KEY (`remarketing_ID`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `fk_pt_customers_ID` (`fk_pt_customers_ID`);

--
-- Indexes for table `sellers`
--
ALTER TABLE `sellers`
  ADD PRIMARY KEY (`seller_ID`),
  ADD UNIQUE KEY `Seller_name` (`Seller_name`),
  ADD KEY `fk_items_ID` (`fk_items_ID`);

--
-- Indexes for table `shipping`
--
ALTER TABLE `shipping`
  ADD PRIMARY KEY (`shipping_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
