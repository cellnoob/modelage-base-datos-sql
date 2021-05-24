-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 20, 2021 at 06:40 PM
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
-- Database: `database social media`
--

-- --------------------------------------------------------

--
-- Table structure for table `amigos`
--

CREATE TABLE `amigos` (
  `ID01_Amigos` int(11) NOT NULL,
  `ID02_Amigos` int(11) NOT NULL,
  `Conexion` varchar(45) NOT NULL,
  `Usuari ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `fotos subidas`
--

CREATE TABLE `fotos subidas` (
  `ID Fotografia` int(11) NOT NULL,
  `Codigo` varchar(100) NOT NULL,
  `Geolocalizacion` varchar(200) NOT NULL,
  `URL` varchar(145) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user photos`
--

CREATE TABLE `user photos` (
  `ID_User` int(11) NOT NULL,
  `ID_Photo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `usuari`
--

CREATE TABLE `usuari` (
  `Nom` varchar(45) NOT NULL,
  `Email` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `ID_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `amigos`
--
ALTER TABLE `amigos`
  ADD KEY `Relacion Amigos 01` (`ID01_Amigos`),
  ADD KEY `Relacion Amigos 02` (`ID02_Amigos`);

--
-- Indexes for table `fotos subidas`
--
ALTER TABLE `fotos subidas`
  ADD PRIMARY KEY (`ID Fotografia`);

--
-- Indexes for table `user photos`
--
ALTER TABLE `user photos`
  ADD PRIMARY KEY (`ID_User`),
  ADD KEY `ID_Photo` (`ID_Photo`);

--
-- Indexes for table `usuari`
--
ALTER TABLE `usuari`
  ADD PRIMARY KEY (`ID_user`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `amigos`
--
ALTER TABLE `amigos`
  ADD CONSTRAINT `Relacion Amigos 01` FOREIGN KEY (`ID01_Amigos`) REFERENCES `usuari` (`ID_user`) ON UPDATE CASCADE,
  ADD CONSTRAINT `Relacion Amigos 02` FOREIGN KEY (`ID02_Amigos`) REFERENCES `usuari` (`ID_user`) ON UPDATE CASCADE;

--
-- Constraints for table `fotos subidas`
--
ALTER TABLE `fotos subidas`
  ADD CONSTRAINT `Relacion Fotos Subidas` FOREIGN KEY (`ID Fotografia`) REFERENCES `user photos` (`ID_Photo`) ON UPDATE CASCADE;

--
-- Constraints for table `user photos`
--
ALTER TABLE `user photos`
  ADD CONSTRAINT `Relacion user photos` FOREIGN KEY (`ID_User`) REFERENCES `usuari` (`ID_user`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
