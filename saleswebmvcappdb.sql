-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 30-Nov-2020 às 21:34
-- Versão do servidor: 10.4.16-MariaDB
-- versão do PHP: 7.3.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `saleswebmvcappdb`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `department`
--

CREATE TABLE `department` (
  `Id` int(11) NOT NULL,
  `Name` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `department`
--

INSERT INTO `department` (`Id`, `Name`) VALUES
(2, 'Electronics'),
(3, 'Books');

-- --------------------------------------------------------

--
-- Estrutura da tabela `salesrecord`
--

CREATE TABLE `salesrecord` (
  `Id` int(11) NOT NULL,
  `Date` datetime(6) NOT NULL,
  `Amount` double NOT NULL,
  `Status` int(11) NOT NULL,
  `SellerId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `seller`
--

CREATE TABLE `seller` (
  `Id` int(11) NOT NULL,
  `Name` longtext DEFAULT NULL,
  `Email` longtext DEFAULT NULL,
  `BirthDate` datetime(6) NOT NULL,
  `BaseSalary` double NOT NULL,
  `DepartmentId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `__efmigrationshistory`
--

CREATE TABLE `__efmigrationshistory` (
  `MigrationId` varchar(95) NOT NULL,
  `ProductVersion` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `__efmigrationshistory`
--

INSERT INTO `__efmigrationshistory` (`MigrationId`, `ProductVersion`) VALUES
('20201130154520_Initial', '2.1.14-servicing-32113'),
('20201130163429_OtherEntities', '2.1.14-servicing-32113');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`Id`);

--
-- Índices para tabela `salesrecord`
--
ALTER TABLE `salesrecord`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_SalesRecord_SellerId` (`SellerId`);

--
-- Índices para tabela `seller`
--
ALTER TABLE `seller`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_Seller_DepartmentId` (`DepartmentId`);

--
-- Índices para tabela `__efmigrationshistory`
--
ALTER TABLE `__efmigrationshistory`
  ADD PRIMARY KEY (`MigrationId`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `department`
--
ALTER TABLE `department`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `salesrecord`
--
ALTER TABLE `salesrecord`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `seller`
--
ALTER TABLE `seller`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `salesrecord`
--
ALTER TABLE `salesrecord`
  ADD CONSTRAINT `FK_SalesRecord_Seller_SellerId` FOREIGN KEY (`SellerId`) REFERENCES `seller` (`Id`) ON DELETE NO ACTION;

--
-- Limitadores para a tabela `seller`
--
ALTER TABLE `seller`
  ADD CONSTRAINT `FK_Seller_Department_DepartmentId` FOREIGN KEY (`DepartmentId`) REFERENCES `department` (`Id`) ON DELETE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
