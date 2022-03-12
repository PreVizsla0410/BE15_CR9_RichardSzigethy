-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 12, 2022 at 05:54 PM
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
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_ID` int(11) NOT NULL,
  `First_Name` varchar(55) DEFAULT NULL,
  `Last_Name` varchar(55) DEFAULT NULL,
  `address` varchar(55) DEFAULT NULL,
  `username` varchar(55) DEFAULT NULL,
  `email` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_ID`, `First_Name`, `Last_Name`, `address`, `username`, `email`) VALUES
(1, 'John', 'Travolta', 'Trautonstraße 13', 'fiqqer34', 'fiqqer34@gmail.com'),
(2, 'Edmont', 'Dante', 'Josefstraße 13', 'geriqqer34', 'geriqqer34@gmail.com'),
(3, 'Sequire', 'Wiver', 'Austraße 13', 'Gaiqqer34', 'Gaiqqer3434@gmail.com');

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
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_ID`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD UNIQUE KEY `item_ID` (`item_ID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD UNIQUE KEY `order_ID` (`order_ID`),
  ADD KEY `fk_shipping_ID` (`fk_shipping_ID`);

--
-- Indexes for table `sellers`
--
ALTER TABLE `sellers`
  ADD PRIMARY KEY (`seller_ID`),
  ADD KEY `fk_items_ID` (`fk_items_ID`);

--
-- Indexes for table `shipping`
--
ALTER TABLE `shipping`
  ADD PRIMARY KEY (`shipping_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_shipping_ID` FOREIGN KEY (`fk_shipping_ID`) REFERENCES `shipping` (`shipping_id`);

--
-- Constraints for table `sellers`
--
ALTER TABLE `sellers`
  ADD CONSTRAINT `sellers_ibfk_1` FOREIGN KEY (`fk_items_ID`) REFERENCES `item` (`item_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
