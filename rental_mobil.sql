-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 06, 2024 at 12:15 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rental_mobil`
--

-- --------------------------------------------------------

--
-- Table structure for table `car`
--

CREATE TABLE `car` (
  `Car_Id` char(15) NOT NULL,
  `Brand_Car` varchar(15) DEFAULT NULL,
  `Merek_Car` varchar(15) DEFAULT NULL,
  `Warna_Car` varchar(15) DEFAULT NULL,
  `Year_car` int(5) DEFAULT NULL,
  `Rental_Rate` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `car`
--

INSERT INTO `car` (`Car_Id`, `Brand_Car`, `Merek_Car`, `Warna_Car`, `Year_car`, `Rental_Rate`) VALUES
('B 1234 HH', 'Honda', 'HRV', 'Merah', 2019, 8),
('B 8888 BB', 'Honda', 'Jazz', 'Putih', 2018, 7),
('H 1298 DD', 'Toyota', 'Calya', 'Putih', 2019, 8);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `Cust_Id` char(5) NOT NULL,
  `Name_Cust` varchar(25) DEFAULT NULL,
  `Email_cust` varchar(25) DEFAULT NULL,
  `Telp` varchar(15) DEFAULT NULL,
  `Cust_Address` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`Cust_Id`, `Name_Cust`, `Email_cust`, `Telp`, `Cust_Address`) VALUES
('C-001', 'Gina', 'Ginoynoy@gmail.com', '0812 5689 0926', 'Manado'),
('C-002', 'Sabila', 'Bilbil@gmail.com', '0812 2468 2478', 'Bali'),
('C-003', 'Nabila', 'Bila@gmail.com', '0812 2536 5975', 'Semarang');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `Pay_Id` char(5) NOT NULL,
  `Rent_Id` char(5) DEFAULT NULL,
  `Pay_Date` date DEFAULT NULL,
  `Jumlah_Pay` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`Pay_Id`, `Rent_Id`, `Pay_Date`, `Jumlah_Pay`) VALUES
('P-001', 'R-003', '2023-07-25', '700.000'),
('P-002', 'R-001', '2023-09-09', '800.000'),
('P-003', 'R-002', '2023-02-20', '800.000');

-- --------------------------------------------------------

--
-- Table structure for table `rental`
--

CREATE TABLE `rental` (
  `Rent_Id` char(5) NOT NULL,
  `Cust_Id` char(5) DEFAULT NULL,
  `Car_Id` char(15) DEFAULT NULL,
  `Star_Date` date DEFAULT NULL,
  `End_Date` date DEFAULT NULL,
  `Total_Rent` decimal(25,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rental`
--

INSERT INTO `rental` (`Rent_Id`, `Cust_Id`, `Car_Id`, `Star_Date`, `End_Date`, `Total_Rent`) VALUES
('R-001', 'C-001', 'B 1234 HH', '2023-09-07', '2023-09-09', 800),
('R-002', 'C-002', 'B 8888 BB', '2023-02-19', '2023-02-20', 350),
('R-003', 'C-003', 'H 1298 DD', '2023-07-23', '2023-07-25', 700);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`Car_Id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`Cust_Id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`Pay_Id`),
  ADD KEY `fk_Rental` (`Rent_Id`);

--
-- Indexes for table `rental`
--
ALTER TABLE `rental`
  ADD PRIMARY KEY (`Rent_Id`),
  ADD KEY `fk_Customers` (`Cust_Id`),
  ADD KEY `fk_Car` (`Car_Id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `fk_Rental` FOREIGN KEY (`Rent_Id`) REFERENCES `rental` (`Rent_Id`);

--
-- Constraints for table `rental`
--
ALTER TABLE `rental`
  ADD CONSTRAINT `fk_Car` FOREIGN KEY (`Car_Id`) REFERENCES `car` (`Car_Id`),
  ADD CONSTRAINT `fk_Customers` FOREIGN KEY (`Cust_Id`) REFERENCES `customers` (`Cust_Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
