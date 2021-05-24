-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 21, 2021 at 11:38 AM
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
-- Database: `botiga d'ulleres`
--

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `ID Client` int(11) NOT NULL,
  `Nom client` varchar(50) NOT NULL,
  `Cognom client` varchar(50) NOT NULL,
  `Direcció` varchar(200) NOT NULL,
  `Telefon contacte` int(15) NOT NULL,
  `Mail` varchar(30) NOT NULL,
  `Alta registre` date NOT NULL,
  `ID Empleat venta` int(11) NOT NULL,
  `Codi recomenació` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `comanda`
--

CREATE TABLE `comanda` (
  `ID Comanda` int(11) NOT NULL,
  `Data comanda` date NOT NULL,
  `Data entrega` date NOT NULL,
  `Estat` varchar(20) NOT NULL,
  `Comentaris` text NOT NULL,
  `ID Client` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `detall comanda`
--

CREATE TABLE `detall comanda` (
  `ID Comanda` int(11) NOT NULL,
  `ID Ulleres` int(11) NOT NULL,
  `Quantitat` int(11) NOT NULL,
  `Preu unitat` decimal(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `empleat`
--

CREATE TABLE `empleat` (
  `ID Empleat` int(11) NOT NULL,
  `Nom empleat` varchar(50) NOT NULL,
  `Cognom empleat` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Lloc de feina` varchar(50) NOT NULL,
  `Responsable` varchar(100) NOT NULL,
  `ID Oficina` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `gama ulleres`
--

CREATE TABLE `gama ulleres` (
  `Gama` varchar(50) NOT NULL,
  `Descripcio` text NOT NULL,
  `Imatge URL` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `oficina centre`
--

CREATE TABLE `oficina centre` (
  `ID Oficina` int(11) NOT NULL,
  `Nom oficina` varchar(50) NOT NULL,
  `Direcció` varchar(250) NOT NULL,
  `Telefon` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pago`
--

CREATE TABLE `pago` (
  `ID Cliente` int(11) NOT NULL,
  `Forma de pago` varchar(40) NOT NULL,
  `ID Transacción` varchar(50) NOT NULL,
  `Fecha pago` date NOT NULL,
  `Total` decimal(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `proveidor`
--

CREATE TABLE `proveidor` (
  `ID Proveidor` int(11) NOT NULL,
  `Nom del proveidor` varchar(50) NOT NULL,
  `Població` varchar(80) NOT NULL,
  `Codi Postal` int(6) NOT NULL,
  `Direcció` varchar(100) NOT NULL,
  `Numero` int(4) NOT NULL,
  `Pis` int(3) NOT NULL,
  `Porta` int(3) NOT NULL,
  `Telefon` int(15) NOT NULL,
  `Fax` int(20) NOT NULL,
  `NIF` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `taula recomanacions`
--

CREATE TABLE `taula recomanacions` (
  `Codi recomanació` varchar(10) NOT NULL,
  `ID Client nou` int(11) NOT NULL,
  `ID Client beneficiari` int(11) NOT NULL,
  `Comptador clients recomanats` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `ulleres`
--

CREATE TABLE `ulleres` (
  `ID Ulleres` int(11) NOT NULL,
  `Marca Ulleres` varchar(70) NOT NULL,
  `Model Ulleres` varchar(100) NOT NULL,
  `Gama` varchar(50) NOT NULL,
  `Tipus de montura` text NOT NULL,
  `Color montura` varchar(50) NOT NULL,
  `Graduació vidre esquerra` varchar(50) NOT NULL,
  `Graduació vidre dreta` varchar(50) NOT NULL,
  `Quantitat en stock` smallint(6) NOT NULL,
  `Preu venta` decimal(15,2) NOT NULL,
  `Preu proveidor` decimal(15,2) NOT NULL,
  `ID Proveidor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`ID Client`),
  ADD UNIQUE KEY `ID Empleat venta` (`ID Empleat venta`),
  ADD UNIQUE KEY `Codi recomenació` (`Codi recomenació`);

--
-- Indexes for table `comanda`
--
ALTER TABLE `comanda`
  ADD PRIMARY KEY (`ID Comanda`);

--
-- Indexes for table `detall comanda`
--
ALTER TABLE `detall comanda`
  ADD PRIMARY KEY (`ID Comanda`),
  ADD KEY `Relació Detall comenda/Ulleres` (`ID Ulleres`);

--
-- Indexes for table `empleat`
--
ALTER TABLE `empleat`
  ADD PRIMARY KEY (`ID Empleat`),
  ADD UNIQUE KEY `ID Oficina` (`ID Oficina`),
  ADD UNIQUE KEY `ID Oficina_2` (`ID Oficina`);

--
-- Indexes for table `gama ulleres`
--
ALTER TABLE `gama ulleres`
  ADD PRIMARY KEY (`Gama`);

--
-- Indexes for table `oficina centre`
--
ALTER TABLE `oficina centre`
  ADD PRIMARY KEY (`ID Oficina`);

--
-- Indexes for table `pago`
--
ALTER TABLE `pago`
  ADD PRIMARY KEY (`ID Cliente`);

--
-- Indexes for table `proveidor`
--
ALTER TABLE `proveidor`
  ADD PRIMARY KEY (`ID Proveidor`);

--
-- Indexes for table `taula recomanacions`
--
ALTER TABLE `taula recomanacions`
  ADD PRIMARY KEY (`Codi recomanació`);

--
-- Indexes for table `ulleres`
--
ALTER TABLE `ulleres`
  ADD PRIMARY KEY (`ID Ulleres`),
  ADD UNIQUE KEY `ID Proveidor` (`ID Proveidor`),
  ADD KEY `Relació gama` (`Gama`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comanda`
--
ALTER TABLE `comanda`
  ADD CONSTRAINT `Relacio Comanda/Detall comanda` FOREIGN KEY (`ID Comanda`) REFERENCES `detall comanda` (`ID Comanda`) ON UPDATE CASCADE;

--
-- Constraints for table `detall comanda`
--
ALTER TABLE `detall comanda`
  ADD CONSTRAINT `Relació Detall comenda/Ulleres` FOREIGN KEY (`ID Ulleres`) REFERENCES `ulleres` (`ID Ulleres`) ON UPDATE CASCADE;

--
-- Constraints for table `empleat`
--
ALTER TABLE `empleat`
  ADD CONSTRAINT `Relacio empleat/client` FOREIGN KEY (`ID Empleat`) REFERENCES `client` (`ID Empleat venta`) ON UPDATE CASCADE;

--
-- Constraints for table `oficina centre`
--
ALTER TABLE `oficina centre`
  ADD CONSTRAINT `Relacio oficina/empleat` FOREIGN KEY (`ID Oficina`) REFERENCES `empleat` (`ID Oficina`) ON UPDATE CASCADE;

--
-- Constraints for table `pago`
--
ALTER TABLE `pago`
  ADD CONSTRAINT `Relacio pago/client` FOREIGN KEY (`ID Cliente`) REFERENCES `client` (`ID Client`) ON UPDATE CASCADE;

--
-- Constraints for table `proveidor`
--
ALTER TABLE `proveidor`
  ADD CONSTRAINT `Relacio proveidor/ulleres` FOREIGN KEY (`ID Proveidor`) REFERENCES `ulleres` (`ID Proveidor`) ON UPDATE CASCADE;

--
-- Constraints for table `taula recomanacions`
--
ALTER TABLE `taula recomanacions`
  ADD CONSTRAINT `Relacio taula recomanacio/client` FOREIGN KEY (`Codi recomanació`) REFERENCES `client` (`Codi recomenació`);

--
-- Constraints for table `ulleres`
--
ALTER TABLE `ulleres`
  ADD CONSTRAINT `Relació gama` FOREIGN KEY (`Gama`) REFERENCES `gama ulleres` (`Gama`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
