-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 20, 2021 at 09:29 AM
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
-- Database: `software stube`
--

-- --------------------------------------------------------

--
-- Table structure for table `user videos`
--

CREATE TABLE `user videos` (
  `ID user` int(11) NOT NULL,
  `ID video` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `usuari stube`
--

CREATE TABLE `usuari stube` (
  `ID` int(11) NOT NULL,
  `mail` varchar(100) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `videos stube`
--

CREATE TABLE `videos stube` (
  `ID` int(11) NOT NULL,
  `Títol` varchar(50) NOT NULL,
  `Descripció` varchar(300) NOT NULL,
  `URL` varchar(250) NOT NULL,
  `Identificador` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `user videos`
--
ALTER TABLE `user videos`
  ADD KEY `ID` (`ID user`);

--
-- Indexes for table `usuari stube`
--
ALTER TABLE `usuari stube`
  ADD KEY `ID Conector` (`ID`);

--
-- Indexes for table `videos stube`
--
ALTER TABLE `videos stube`
  ADD PRIMARY KEY (`ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `user videos`
--
ALTER TABLE `user videos`
  ADD CONSTRAINT `ID` FOREIGN KEY (`ID user`) REFERENCES `videos stube` (`ID`) ON UPDATE CASCADE;

--
-- Constraints for table `usuari stube`
--
ALTER TABLE `usuari stube`
  ADD CONSTRAINT `ID Conector` FOREIGN KEY (`ID`) REFERENCES `user videos` (`ID user`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
