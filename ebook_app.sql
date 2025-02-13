-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 05, 2023 at 03:02 PM
-- Server version: 8.0.32
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ebook_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `book_dtls`
--

CREATE TABLE `book_dtls` (
  `bookId` int NOT NULL,
  `bookName` varchar(45) DEFAULT NULL,
  `author` varchar(45) DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `bookCategory` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `photo` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `book_dtls`
--

INSERT INTO `book_dtls` (`bookId`, `bookName`, `author`, `price`, `bookCategory`, `status`, `photo`, `email`) VALUES
(1, 'C Programming', 'Yashvant Kanetkar', '500', 'New', 'Active', 'C.jpg', 'admin'),
(2, 'Java Programming', 'Balgurusamy', '564', 'New', 'Active', 'java.jpg', 'admin'),
(3, 'C++ Programming', 'Robert Hoffman', '450', 'New', 'Active', 'C++.jpg', 'admin'),
(4, 'Python Programming', 'James Herron', '400', 'New', 'Active', 'Python.jpeg', 'admin'),
(5, 'R Programming', 'Daniel Bell', '600', 'New', 'Active', 'R_prog.jpg', 'admin'),
(6, 'Once Upon A Time', 'Marthina Smith', '230', 'Old', 'Active', 'once.jpg', 'admin'),
(7, 'UPSC General Studies', 'V.V.K. Subburaj', '700', 'Old', 'Active', 'Indian_polity.jpg', 'admin'),
(8, 'c', 'Yashvant Kanetkar', '230', 'Old', 'Active', 'C.jpg', 'admin'),
(9, 'c', 'Yashvant Kanetkar', '500', 'Old', 'Active', 'C.jpg', 'admin'),
(10, 'java', 'galvin', '560', 'Old', 'Active', 'java.jpg', 'admin'),
(11, 'Python Programming', 'Robert Hoffman', '600', 'Old', 'Active', 'Python.jpeg', 'admin'),
(12, 'C++ Programming', 'galvin', '545', 'Old', 'Active', 'C++.jpg', 'shubh@gmail.com'),
(13, 'Once Upon A Time', 'Marthina Smith', '200', 'New', 'Active', 'once.jpg', NULL),
(14, 'C++ Programming', 'Yashvant Kanetkar', '500', 'Old', 'Active', 'C++.jpg', 'shubh@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cid` int NOT NULL,
  `bid` int DEFAULT NULL,
  `uid` int DEFAULT NULL,
  `bookName` varchar(45) DEFAULT NULL,
  `author` varchar(45) DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `total_price` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `oid` int NOT NULL,
  `uid` int DEFAULT NULL,
  `date` date DEFAULT NULL,
  `payment_mode` char(20) DEFAULT NULL,
  `bid` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`oid`, `uid`, `date`, `payment_mode`, `bid`) VALUES
(1, 1, '2023-02-14', 'COD', 1),
(2, 1, '2023-02-20', 'COD', 5),
(3, 2, '2023-02-20', 'COD', 5),
(4, 3, '2023-03-20', 'COD', 2),
(5, 1, '2023-03-20', 'COD', 3),
(6, 5, '2022-07-12', 'COD', 3),
(7, 4, '2022-03-23', 'COD', 4),
(8, 4, '2022-03-23', 'COD', 1),
(9, 2, '2022-04-04', 'COD', 2),
(10, 3, '2023-01-04', 'COD', 4),
(11, 2, '2023-03-20', 'COD', 4),
(12, 2, '2023-03-20', 'COD', 3),
(13, 5, '2023-03-20', 'COD', 4),
(14, 4, '2023-03-20', 'COD', 5);

-- --------------------------------------------------------

--
-- Table structure for table `orders1`
--

CREATE TABLE `orders1` (
  `oid` int NOT NULL,
  `uid` int DEFAULT NULL,
  `date` date DEFAULT NULL,
  `payment_mode` varchar(45) DEFAULT NULL,
  `bid` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `orders1`
--

INSERT INTO `orders1` (`oid`, `uid`, `date`, `payment_mode`, `bid`) VALUES
(1, 1, NULL, 'payment_mode', 3),
(2, 1, NULL, 'payment_mode', 3),
(3, 1, NULL, 'payment_mode', 3),
(4, 1, NULL, 'payment_mode', 4),
(5, 1, NULL, 'payment_mode', 3),
(6, 1, NULL, 'payment_mode', 5),
(7, 1, NULL, 'payment_mode', 3),
(8, 1, NULL, 'payment_mode', 4),
(9, 1, '2023-03-20', 'Cash on Delivery', 3);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `phno` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `adress` varchar(45) DEFAULT NULL,
  `landmark` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `pincode` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `phno`, `password`, `adress`, `landmark`, `city`, `state`, `pincode`) VALUES
(1, 'shubhada', 'shubh@gmail.com', '1234567890', 'abcd', 'kauinwdyunkx', 'India', 'pune', 'maharashtra', '411019'),
(2, 'priyanka', 'pr@gmail.com', '1234589670', 'uoite', 'oiepifoinucnj', NULL, NULL, NULL, NULL),
(3, 'anita', 'an@gmail.com', '9874563210', 'anita@123', 'ijwoihoencn', NULL, NULL, NULL, NULL),
(4, 'raj', 'r@gmail.com', '9632587410', 'abcd35@12', 'oiihjncuwbxbuyG', NULL, NULL, NULL, NULL),
(5, 'shubhada', 'shubh@gmail.com', '9876543210', 'sh@1234', 'kauinwdyunkx', NULL, NULL, NULL, NULL),
(6, 'abcdkuhn', 'liaksm@gmail', '1234', 'ankubs', 'klkam c', NULL, NULL, NULL, NULL),
(7, 'nkjnam, ', 'nkansmkjb@gmail.com', '123456', 'Shubhada@01', ' kdjw c ', NULL, NULL, NULL, NULL),
(8, 'njaianx', 'nanniw@gmail.com', '564879132', 'Shubhada@564', 'ninkc', NULL, NULL, NULL, NULL),
(9, 'raj', 'r@gmail.com', '9874563210', 'Raj#1234', 'pune', NULL, NULL, NULL, NULL),
(10, 'Mrinal', 'm@gmail.com', '985647', 'Mrin@1234', 'mumbai', NULL, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `book_dtls`
--
ALTER TABLE `book_dtls`
  ADD PRIMARY KEY (`bookId`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`oid`);

--
-- Indexes for table `orders1`
--
ALTER TABLE `orders1`
  ADD PRIMARY KEY (`oid`),
  ADD KEY `uid` (`uid`),
  ADD KEY `bid` (`bid`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `book_dtls`
--
ALTER TABLE `book_dtls`
  MODIFY `bookId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cid` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `oid` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders1`
--
ALTER TABLE `orders1`
  MODIFY `oid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders1`
--
ALTER TABLE `orders1`
  ADD CONSTRAINT `orders1_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `orders1_ibfk_2` FOREIGN KEY (`bid`) REFERENCES `book_dtls` (`bookId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
