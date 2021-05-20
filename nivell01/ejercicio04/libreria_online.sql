-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 20, 2021 at 11:01 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `libreria online`
--

-- --------------------------------------------------------

--
-- Table structure for table `catalogo libros`
--

CREATE TABLE `catalogo libros` (
  `ID Libro` int(11) NOT NULL,
  `Nombre Libro` varchar(120) NOT NULL,
  `Precio` decimal(7,2) NOT NULL,
  `Stock` int(11) NOT NULL,
  `Autor` varchar(100) NOT NULL,
  `Vendedor ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `cliente`
--

CREATE TABLE `cliente` (
  `ID Cliente` int(11) NOT NULL,
  `Nombre` varchar(40) NOT NULL,
  `Apellidos` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Password` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `factura`
--

CREATE TABLE `factura` (
  `ID Factura` int(11) NOT NULL,
  `Fecha` date NOT NULL,
  `Subtotal` decimal(7,2) NOT NULL,
  `Precio IVA` decimal(7,2) NOT NULL,
  `Total precio` decimal(7,2) NOT NULL,
  `Cliente ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `item carro`
--

CREATE TABLE `item carro` (
  `ID Pedido` int(11) NOT NULL,
  `ID Libro` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `vendedor`
--

CREATE TABLE `vendedor` (
  `ID Vendedor` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Direccion` varchar(150) NOT NULL,
  `Total Libros` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `catalogo libros`
--
ALTER TABLE `catalogo libros`
  ADD PRIMARY KEY (`ID Libro`),
  ADD KEY `Vendedor ID` (`Vendedor ID`);

--
-- Indexes for table `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`ID Cliente`);

--
-- Indexes for table `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`ID Factura`),
  ADD KEY `Cliente ID` (`Cliente ID`);

--
-- Indexes for table `item carro`
--
ALTER TABLE `item carro`
  ADD PRIMARY KEY (`ID Pedido`),
  ADD KEY `ID Libro` (`ID Libro`);

--
-- Indexes for table `vendedor`
--
ALTER TABLE `vendedor`
  ADD PRIMARY KEY (`ID Vendedor`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `catalogo libros`
--
ALTER TABLE `catalogo libros`
  ADD CONSTRAINT `Conector ID Libro` FOREIGN KEY (`ID Libro`) REFERENCES `item carro` (`ID Libro`) ON UPDATE CASCADE;

--
-- Constraints for table `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `Conector cliente id` FOREIGN KEY (`Cliente ID`) REFERENCES `cliente` (`ID Cliente`) ON UPDATE CASCADE;

--
-- Constraints for table `item carro`
--
ALTER TABLE `item carro`
  ADD CONSTRAINT `Conector ID pedido` FOREIGN KEY (`ID Pedido`) REFERENCES `factura` (`Cliente ID`) ON UPDATE CASCADE;

--
-- Constraints for table `vendedor`
--
ALTER TABLE `vendedor`
  ADD CONSTRAINT `Conector ID Vendedor` FOREIGN KEY (`ID Vendedor`) REFERENCES `catalogo libros` (`Vendedor ID`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
