-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 23, 2016 at 09:24 AM
-- Server version: 5.7.15-0ubuntu0.16.04.1
-- PHP Version: 7.0.8-0ubuntu0.16.04.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `company`
--

-- --------------------------------------------------------

--
-- Table structure for table `KM_TEST`
--

CREATE TABLE `KM_TEST` (
  `ID` int(11) NOT NULL,
  `CREATED_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CREATED_DT` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `INSERT_TS` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `INSERT_DT` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `KM_TEST`
--

INSERT INTO `KM_TEST` (`ID`, `CREATED_TS`, `CREATED_DT`, `INSERT_TS`, `INSERT_DT`) VALUES
(1, '2016-04-28 00:17:26', '2016-04-27 17:17:26', '2016-04-20 22:33:53', '2016-04-22 18:19:03'),
(2, '2016-04-28 04:34:22', '2016-04-27 21:34:22', NULL, NULL),
(3, '2016-04-28 04:35:47', '2016-04-27 21:35:47', NULL, NULL),
(4, '2016-04-28 04:39:09', '2016-04-27 21:39:09', NULL, NULL),
(5, '2016-04-28 04:42:04', '2016-04-27 21:42:04', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, '2016-04-28 04:42:36', '2016-04-27 21:42:36', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, '2016-04-28 04:43:12', '2016-04-27 21:43:12', '2016-04-25 04:44:44', '2016-04-27 20:33:37');

-- --------------------------------------------------------

--
-- Table structure for table `tblreports`
--

CREATE TABLE `tblreports` (
  `id` int(11) NOT NULL,
  `appliedConditions` longtext,
  `txtReportName` text,
  `lstSortName` text,
  `lstSortOrder` text,
  `txtRecPerPage` text,
  `selectedFields` text,
  `selectedTables` text,
  `status` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblreports`
--

INSERT INTO `tblreports` (`id`, `appliedConditions`, `txtReportName`, `lstSortName`, `lstSortOrder`, `txtRecPerPage`, `selectedFields`, `selectedTables`, `status`) VALUES
(1, NULL, 'Employee List', '`T_EMP`.`FIRST_NAME`', 'ASC', '20', '`T_EMP`.`ID`~`T_EMP`.`EMP_CODE`~`T_EMP`.`FIRST_NAME`~`T_EMP`.`LAST_NAME`~', '`T_EMP`~', 0);

-- --------------------------------------------------------

--
-- Table structure for table `T_ADDR`
--

CREATE TABLE `T_ADDR` (
  `ID` int(11) NOT NULL,
  `CREATED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ADDR1` varchar(50) NOT NULL,
  `ADDR2` varchar(50) NOT NULL,
  `CITY` varchar(25) NOT NULL,
  `STATE` varchar(25) NOT NULL,
  `COUNTRY` varchar(50) NOT NULL,
  `ZIP_CODE` varchar(10) NOT NULL,
  `ADDR_TYPE` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `T_ADDR`
--

INSERT INTO `T_ADDR` (`ID`, `CREATED`, `ADDR1`, `ADDR2`, `CITY`, `STATE`, `COUNTRY`, `ZIP_CODE`, `ADDR_TYPE`) VALUES
(1, '2016-09-23 00:38:10', '100 Main St', '', 'Seattle', 'WA', 'USA', '98000', 'R');

-- --------------------------------------------------------

--
-- Table structure for table `T_CUSTOMER`
--

CREATE TABLE `T_CUSTOMER` (
  `ID` int(11) NOT NULL,
  `CREATED_DT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CUST_TYPE` varchar(10) DEFAULT NULL,
  `FIRST_NAME` varchar(50) NOT NULL,
  `LAST_NAME` varchar(50) NOT NULL,
  `COMPANY_NAME` varchar(50) DEFAULT NULL,
  `ADDR_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `T_CUSTOMER`
--

INSERT INTO `T_CUSTOMER` (`ID`, `CREATED_DT`, `CUST_TYPE`, `FIRST_NAME`, `LAST_NAME`, `COMPANY_NAME`, `ADDR_ID`) VALUES
(1, '2016-09-23 00:41:27', NULL, 'Donald', 'Duck', NULL, NULL),
(2, '2016-09-23 00:41:48', NULL, 'Mickey', 'Mouse', NULL, NULL),
(3, '2016-09-23 00:42:00', NULL, 'Peter', 'Pan', NULL, NULL),
(4, '2016-09-23 01:50:50', NULL, 'Ron', 'Ron', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `T_DEPT`
--

CREATE TABLE `T_DEPT` (
  `ID` int(11) NOT NULL,
  `DEPT_NAME` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `T_DEPT`
--

INSERT INTO `T_DEPT` (`ID`, `DEPT_NAME`) VALUES
(1, 'IT'),
(2, 'Operations'),
(3, 'Field Support');

-- --------------------------------------------------------

--
-- Table structure for table `T_EMP`
--

CREATE TABLE `T_EMP` (
  `ID` int(11) NOT NULL,
  `CREATED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `EMP_CODE` varchar(20) DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `FIRST_NAME` varchar(50) NOT NULL,
  `LAST_NAME` varchar(50) NOT NULL,
  `DEPT_ID` int(11) DEFAULT NULL,
  `ADDR_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `T_EMP_PRD_MST`
--

CREATE TABLE `T_EMP_PRD_MST` (
  `ID` int(11) NOT NULL,
  `EMP_ID` int(11) NOT NULL,
  `PRD_ID` int(11) NOT NULL,
  `QTY` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `T_EMP_SALES`
--

CREATE TABLE `T_EMP_SALES` (
  `ID` int(11) NOT NULL,
  `EMP_ID` int(11) NOT NULL,
  `SALE_DT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ORD_LN_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `T_INVT`
--

CREATE TABLE `T_INVT` (
  `ID` int(11) NOT NULL,
  `CREATED_DT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `PROD_ID` int(11) NOT NULL,
  `WH_ID` int(11) NOT NULL,
  `QTY` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `T_INVT_DTL`
--

CREATE TABLE `T_INVT_DTL` (
  `ID` int(11) NOT NULL,
  `CREATED_DT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `INVT_ID` int(11) NOT NULL COMMENT 'Inventory Master ID',
  `QTY` int(11) NOT NULL DEFAULT '1',
  `OPERATION` varchar(20) NOT NULL,
  `OP_DT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `OP_EMP_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `T_MANUFACTURER`
--

CREATE TABLE `T_MANUFACTURER` (
  `ID` int(11) NOT NULL,
  `CREATED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `NAME` varchar(50) NOT NULL,
  `CONTACT_ID` varchar(50) DEFAULT NULL,
  `ADDR_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `T_MANUFACTURER`
--

INSERT INTO `T_MANUFACTURER` (`ID`, `CREATED`, `NAME`, `CONTACT_ID`, `ADDR_ID`) VALUES
(1, '2016-09-23 00:30:02', 'Apple', NULL, NULL),
(8, '2016-09-23 00:33:37', 'Samsung', NULL, NULL),
(9, '2016-09-23 00:33:45', 'LG', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `T_ORDERS`
--

CREATE TABLE `T_ORDERS` (
  `ID` int(11) NOT NULL,
  `CREATED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ORD_NO` varchar(25) NOT NULL,
  `ORD_DT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CUST_ID` int(11) DEFAULT NULL,
  `EMP_ID` int(11) DEFAULT NULL,
  `ITEMS_PRICE` decimal(10,2) DEFAULT NULL,
  `DISCOUNT` decimal(10,2) DEFAULT '0.00',
  `TAX_AMT` decimal(10,2) DEFAULT '0.00',
  `ORD_TTL` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `T_ORDERS`
--

INSERT INTO `T_ORDERS` (`ID`, `CREATED`, `ORD_NO`, `ORD_DT`, `CUST_ID`, `EMP_ID`, `ITEMS_PRICE`, `DISCOUNT`, `TAX_AMT`, `ORD_TTL`) VALUES
(22, '2016-09-23 00:44:53', '10001', '2016-09-23 00:44:53', 1, NULL, NULL, '0.00', '0.00', NULL),
(23, '2016-09-23 00:49:47', '10002', '2016-09-23 00:49:47', 2, NULL, NULL, '0.00', '0.00', NULL),
(24, '2016-09-23 00:53:27', '10003', '2016-09-23 00:53:27', 3, NULL, NULL, '0.00', '0.00', NULL),
(25, '2016-09-23 01:51:51', '10004', '2016-09-23 01:51:51', 4, NULL, NULL, '0.00', '0.00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `T_ORDER_LINES`
--

CREATE TABLE `T_ORDER_LINES` (
  `ID` int(11) NOT NULL,
  `CREATED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ORD_ID` int(11) NOT NULL,
  `PROD_ID` int(11) NOT NULL,
  `QTY` int(11) NOT NULL,
  `AMOUNT` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `T_ORDER_LINES`
--

INSERT INTO `T_ORDER_LINES` (`ID`, `CREATED`, `ORD_ID`, `PROD_ID`, `QTY`, `AMOUNT`) VALUES
(1, '2016-09-23 00:46:02', 22, 1, 1, '599.00'),
(25, '2016-09-23 00:47:03', 22, 3, 1, '499.00'),
(26, '2016-09-23 00:47:33', 22, 4, 1, '599.00'),
(27, '2016-09-23 00:50:15', 23, 2, 1, '599.00'),
(28, '2016-09-23 00:50:48', 23, 3, 1, '499.00'),
(29, '2016-09-23 00:56:56', 24, 4, 1, '599.00'),
(30, '2016-09-23 00:57:52', 24, 5, 1, '200.00'),
(31, '2016-09-23 01:52:42', 25, 3, 2, '998.00');

-- --------------------------------------------------------

--
-- Table structure for table `T_PRODUCTS`
--

CREATE TABLE `T_PRODUCTS` (
  `ID` int(11) NOT NULL,
  `CREATED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPC_CD` varchar(50) NOT NULL,
  `NAME` varchar(50) NOT NULL,
  `PROD_LINE_ID` int(50) DEFAULT NULL,
  `MNF_ID` int(11) DEFAULT NULL,
  `LIST_PRICE` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `T_PRODUCTS`
--

INSERT INTO `T_PRODUCTS` (`ID`, `CREATED`, `UPC_CD`, `NAME`, `PROD_LINE_ID`, `MNF_ID`, `LIST_PRICE`) VALUES
(1, '2016-09-23 00:32:11', '1001', 'iPhone 6S 16GB', 1, 1, '599.00'),
(2, '2016-09-23 00:32:57', '1002', 'iPhone 6S 32GB', 1, 1, '699.00'),
(3, '2016-09-23 00:34:34', '1003', 'Galaxy S7', 1, 8, '499.00'),
(4, '2016-09-23 00:36:30', '1004', 'Galaxy S7 Edge', 1, 8, '599.00'),
(5, '2016-09-23 00:54:42', '1005', 'iPad Mini', 1, 1, '200.00'),
(6, '2016-09-23 00:55:44', '1005', 'iPad Air2', 1, 1, '300.00');

-- --------------------------------------------------------

--
-- Table structure for table `T_PROD_FROM_EMP`
--

CREATE TABLE `T_PROD_FROM_EMP` (
  `ID` int(11) NOT NULL,
  `CREATED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `GIVEN_DT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `EMP_ID` int(11) NOT NULL COMMENT 'Technician ID',
  `INVT_DTL_ID` int(11) NOT NULL COMMENT 'Product ID',
  `COMMENTS` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `T_PROD_INCNTV`
--

CREATE TABLE `T_PROD_INCNTV` (
  `ID` int(11) NOT NULL,
  `PROD_ID` int(11) NOT NULL,
  `INCNTV_TYPE` varchar(25) NOT NULL DEFAULT 'UNIT',
  `INCNTV_UNIT` decimal(10,2) NOT NULL,
  `BGN_DT` timestamp NULL DEFAULT NULL,
  `END_DT` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `T_PROD_LINE`
--

CREATE TABLE `T_PROD_LINE` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(50) NOT NULL,
  `DESCRIP` varchar(50) DEFAULT NULL,
  `CREATED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `T_PROD_LINE`
--

INSERT INTO `T_PROD_LINE` (`ID`, `NAME`, `DESCRIP`, `CREATED`) VALUES
(1, 'Electronics', 'Electronic Items', '2016-04-16 04:51:13'),
(2, 'Books', 'Books', '2016-04-16 04:51:13');

-- --------------------------------------------------------

--
-- Table structure for table `T_PROD_TO_EMP`
--

CREATE TABLE `T_PROD_TO_EMP` (
  `ID` int(11) NOT NULL,
  `CREATED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `EMP_ID` int(11) NOT NULL COMMENT 'Emp ID',
  `INVT_DTL_ID` int(11) NOT NULL COMMENT 'Inventory Detail ID',
  `GIVEN_DT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `COMMENTS` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `T_RETURNS`
--

CREATE TABLE `T_RETURNS` (
  `ID` int(11) NOT NULL,
  `RETURN_DT` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ORD_ITEM_ID` int(11) NOT NULL,
  `REASON` varchar(50) NOT NULL,
  `QTY` int(11) NOT NULL,
  `RETURN_AMT` decimal(10,2) NOT NULL,
  `SHIPPER_ID` int(11) DEFAULT NULL,
  `CREATED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `T_RETURNS`
--

INSERT INTO `T_RETURNS` (`ID`, `RETURN_DT`, `ORD_ITEM_ID`, `REASON`, `QTY`, `RETURN_AMT`, `SHIPPER_ID`, `CREATED`) VALUES
(1, '2016-09-22 17:52:51', 28, 'Not happy', 1, '499.00', NULL, '2016-09-23 00:52:51'),
(5, '2016-09-22 17:58:51', 29, 'Open item', 1, '599.00', NULL, '2016-09-23 00:58:51'),
(6, '2016-09-22 17:59:17', 30, 'Slow performance', 1, '200.00', NULL, '2016-09-23 00:59:17'),
(7, '2016-09-22 18:53:39', 31, 'Defective', 1, '499.00', NULL, '2016-09-23 01:53:39');

-- --------------------------------------------------------

--
-- Table structure for table `T_SHIPMENTS`
--

CREATE TABLE `T_SHIPMENTS` (
  `ID` int(11) NOT NULL,
  `ORD_ITEM_ID` int(11) NOT NULL,
  `SHIPPER_ID` int(11) NOT NULL,
  `TRACKING_NUM` varchar(50) NOT NULL,
  `CREATED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `T_USER`
--

CREATE TABLE `T_USER` (
  `ID` int(11) NOT NULL,
  `USERNAME` varchar(16) NOT NULL,
  `USR_TYPE_ID` int(11) NOT NULL,
  `PASSWD` varchar(100) NOT NULL,
  `EMAIL` varchar(100) NOT NULL,
  `SECRETQ` varchar(50) NOT NULL,
  `SECRETA` varchar(20) NOT NULL,
  `ADDR_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `T_USER`
--

INSERT INTO `T_USER` (`ID`, `USERNAME`, `USR_TYPE_ID`, `PASSWD`, `EMAIL`, `SECRETQ`, `SECRETA`, `ADDR_ID`) VALUES
(1, 'km', 0, 'f58cf5e7e10f195e21b553096d092c763ed18b0e', 'km@km.com', 'What is your birth city?', 'suryapet', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `T_USR_TYPE`
--

CREATE TABLE `T_USR_TYPE` (
  `ID` int(11) NOT NULL,
  `USR_TYPE` varchar(20) NOT NULL,
  `COMMENTS` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `T_USR_TYPE`
--

INSERT INTO `T_USR_TYPE` (`ID`, `USR_TYPE`, `COMMENTS`) VALUES
(1, 'SUPERADMIN', 'Super Admin'),
(2, 'USER', 'Regular User'),
(3, 'ADMIN', 'Admin User');

-- --------------------------------------------------------

--
-- Table structure for table `T_WAREHOUSE`
--

CREATE TABLE `T_WAREHOUSE` (
  `ID` int(11) NOT NULL,
  `WH_CODE` varchar(15) NOT NULL,
  `CONTACT_ID` int(11) DEFAULT NULL,
  `ADDR_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `T_WAREHOUSE`
--

INSERT INTO `T_WAREHOUSE` (`ID`, `WH_CODE`, `CONTACT_ID`, `ADDR_ID`) VALUES
(2, 'Warehouse', NULL, NULL),
(3, 'Front-office', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `KM_TEST`
--
ALTER TABLE `KM_TEST`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblreports`
--
ALTER TABLE `tblreports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `T_ADDR`
--
ALTER TABLE `T_ADDR`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `T_CUSTOMER`
--
ALTER TABLE `T_CUSTOMER`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `T_DEPT`
--
ALTER TABLE `T_DEPT`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `T_EMP`
--
ALTER TABLE `T_EMP`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `T_EMP_PRD_MST`
--
ALTER TABLE `T_EMP_PRD_MST`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `T_EMP_SALES`
--
ALTER TABLE `T_EMP_SALES`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `T_INVT`
--
ALTER TABLE `T_INVT`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `T_INVT_DTL`
--
ALTER TABLE `T_INVT_DTL`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `T_MANUFACTURER`
--
ALTER TABLE `T_MANUFACTURER`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `T_ORDERS`
--
ALTER TABLE `T_ORDERS`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ORD_NO` (`ORD_NO`),
  ADD KEY `CUST_ID` (`CUST_ID`,`EMP_ID`),
  ADD KEY `EMP_ID` (`EMP_ID`);

--
-- Indexes for table `T_ORDER_LINES`
--
ALTER TABLE `T_ORDER_LINES`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ORD_ID` (`ORD_ID`,`PROD_ID`),
  ADD KEY `PROD_ID` (`PROD_ID`);

--
-- Indexes for table `T_PRODUCTS`
--
ALTER TABLE `T_PRODUCTS`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID` (`ID`,`PROD_LINE_ID`),
  ADD KEY `ID_2` (`ID`,`PROD_LINE_ID`),
  ADD KEY `MNF_ID` (`MNF_ID`),
  ADD KEY `T_PRODUCTS_ibfk_1` (`PROD_LINE_ID`);

--
-- Indexes for table `T_PROD_FROM_EMP`
--
ALTER TABLE `T_PROD_FROM_EMP`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `T_PROD_INCNTV`
--
ALTER TABLE `T_PROD_INCNTV`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `T_PROD_LINE`
--
ALTER TABLE `T_PROD_LINE`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `T_PROD_TO_EMP`
--
ALTER TABLE `T_PROD_TO_EMP`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `T_RETURNS`
--
ALTER TABLE `T_RETURNS`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ORD_ITEM_ID` (`ORD_ITEM_ID`);

--
-- Indexes for table `T_SHIPMENTS`
--
ALTER TABLE `T_SHIPMENTS`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `T_USER`
--
ALTER TABLE `T_USER`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `USERNAME` (`USERNAME`);

--
-- Indexes for table `T_USR_TYPE`
--
ALTER TABLE `T_USR_TYPE`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `T_WAREHOUSE`
--
ALTER TABLE `T_WAREHOUSE`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `KM_TEST`
--
ALTER TABLE `KM_TEST`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `tblreports`
--
ALTER TABLE `tblreports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `T_ADDR`
--
ALTER TABLE `T_ADDR`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `T_CUSTOMER`
--
ALTER TABLE `T_CUSTOMER`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `T_DEPT`
--
ALTER TABLE `T_DEPT`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `T_EMP`
--
ALTER TABLE `T_EMP`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `T_EMP_PRD_MST`
--
ALTER TABLE `T_EMP_PRD_MST`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `T_EMP_SALES`
--
ALTER TABLE `T_EMP_SALES`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `T_INVT`
--
ALTER TABLE `T_INVT`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `T_INVT_DTL`
--
ALTER TABLE `T_INVT_DTL`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `T_MANUFACTURER`
--
ALTER TABLE `T_MANUFACTURER`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `T_ORDERS`
--
ALTER TABLE `T_ORDERS`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `T_ORDER_LINES`
--
ALTER TABLE `T_ORDER_LINES`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT for table `T_PRODUCTS`
--
ALTER TABLE `T_PRODUCTS`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `T_PROD_FROM_EMP`
--
ALTER TABLE `T_PROD_FROM_EMP`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `T_PROD_INCNTV`
--
ALTER TABLE `T_PROD_INCNTV`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `T_PROD_LINE`
--
ALTER TABLE `T_PROD_LINE`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `T_PROD_TO_EMP`
--
ALTER TABLE `T_PROD_TO_EMP`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `T_RETURNS`
--
ALTER TABLE `T_RETURNS`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `T_SHIPMENTS`
--
ALTER TABLE `T_SHIPMENTS`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `T_USER`
--
ALTER TABLE `T_USER`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `T_USR_TYPE`
--
ALTER TABLE `T_USR_TYPE`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `T_WAREHOUSE`
--
ALTER TABLE `T_WAREHOUSE`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `T_ORDERS`
--
ALTER TABLE `T_ORDERS`
  ADD CONSTRAINT `T_ORDERS_ibfk_1` FOREIGN KEY (`CUST_ID`) REFERENCES `T_CUSTOMER` (`ID`),
  ADD CONSTRAINT `T_ORDERS_ibfk_2` FOREIGN KEY (`EMP_ID`) REFERENCES `T_EMP` (`ID`);

--
-- Constraints for table `T_ORDER_LINES`
--
ALTER TABLE `T_ORDER_LINES`
  ADD CONSTRAINT `T_ORDER_LINES_ibfk_1` FOREIGN KEY (`ORD_ID`) REFERENCES `T_ORDERS` (`ID`),
  ADD CONSTRAINT `T_ORDER_LINES_ibfk_2` FOREIGN KEY (`PROD_ID`) REFERENCES `T_PRODUCTS` (`ID`);

--
-- Constraints for table `T_PRODUCTS`
--
ALTER TABLE `T_PRODUCTS`
  ADD CONSTRAINT `T_PRODUCTS_ibfk_1` FOREIGN KEY (`PROD_LINE_ID`) REFERENCES `T_PROD_LINE` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `T_PRODUCTS_ibfk_2` FOREIGN KEY (`MNF_ID`) REFERENCES `T_MANUFACTURER` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `T_RETURNS`
--
ALTER TABLE `T_RETURNS`
  ADD CONSTRAINT `T_RETURNS_ibfk_1` FOREIGN KEY (`ORD_ITEM_ID`) REFERENCES `T_ORDER_LINES` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
