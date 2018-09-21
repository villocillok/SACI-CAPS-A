-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 25, 2018 at 11:13 AM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `saci_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `acquisition`
--

CREATE TABLE `acquisition` (
  `Acquisition_ID` int(11) NOT NULL,
  `Accession_Number` varchar(255) NOT NULL,
  `Number_Purchased` varchar(255) NOT NULL,
  `Date_Purchased` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `archieve`
--

CREATE TABLE `archieve` (
  `Archieve_ID` int(11) NOT NULL,
  `Accession_Number` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `Attendance_ID` int(11) NOT NULL,
  `Borrower_ID` int(11) NOT NULL,
  `Date_Entered` date NOT NULL,
  `Time_Entered` time NOT NULL,
  `Borrower_Type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `author`
--

CREATE TABLE `author` (
  `Author_ID` int(11) NOT NULL,
  `First_Name` varchar(255) NOT NULL,
  `Last_Name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `Book_ID` int(11) NOT NULL,
  `Accession_Number` varchar(255) NOT NULL,
  `Author_ID` int(11) NOT NULL,
  `Publisher_ID` int(11) NOT NULL,
  `Section_ID` int(11) NOT NULL,
  `Title` varchar(255) NOT NULL,
  `Call_Number` varchar(255) NOT NULL,
  `Edition` varchar(255) NOT NULL,
  `Year_Published` varchar(255) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Unit_Of_Price` varchar(255) NOT NULL,
  `Status` varchar(255) NOT NULL,
  `Image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `borrow`
--

CREATE TABLE `borrow` (
  `Borrow_ID` int(11) NOT NULL,
  `Borrower_ID` int(11) NOT NULL,
  `Librarian_ID` varchar(255) NOT NULL,
  `Accession_Number` varchar(255) NOT NULL,
  `Date_Borrowed` datetime NOT NULL,
  `Due_Date` datetime NOT NULL,
  `Transaction_Status` varchar(255) NOT NULL,
  `Official_Receipt_Number` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `borrower`
--

CREATE TABLE `borrower` (
  `Borrower_ID` int(11) NOT NULL,
  `Department_ID` int(11) NOT NULL,
  `First_Name` varchar(255) NOT NULL,
  `Middle_Name` varchar(255) NOT NULL,
  `Last_Name` varchar(255) NOT NULL,
  `Contact_Number` varchar(255) NOT NULL,
  `Gender` varchar(255) NOT NULL,
  `Borrower_Type` varchar(255) NOT NULL,
  `Status` varchar(255) NOT NULL,
  `Course` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `Department_ID` int(11) NOT NULL,
  `Department_Name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `librarian`
--

CREATE TABLE `librarian` (
  `Librarian_ID` int(11) NOT NULL,
  `First_Name` varchar(255) NOT NULL,
  `Midde_Name` varchar(255) NOT NULL,
  `Last_Name` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `penalty`
--

CREATE TABLE `penalty` (
  `Penalty_ID` int(11) NOT NULL,
  `Return_ID` int(11) NOT NULL,
  `Penalty_Status` varchar(255) NOT NULL,
  `Number_Of_Days_Over` int(11) NOT NULL,
  `Penalty_Amount` varchar(255) NOT NULL,
  `Amount_Paid` varchar(255) NOT NULL,
  `Change` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `publisher`
--

CREATE TABLE `publisher` (
  `Publisher_ID` int(11) NOT NULL,
  `Publisher_Name` varchar(255) NOT NULL,
  `Publisher_Address` varchar(255) NOT NULL,
  `Contact_Number` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reservations`
--

CREATE TABLE `reservations` (
  `Reservation_ID` int(11) NOT NULL,
  `Borrower_ID` int(11) NOT NULL,
  `Book_ID` int(11) NOT NULL,
  `Date_Reserved` datetime NOT NULL,
  `Status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `return`
--

CREATE TABLE `return` (
  `Return_ID` int(11) NOT NULL,
  `Borrower_ID` varchar(255) NOT NULL,
  `Accession_Number` varchar(255) NOT NULL,
  `Date_Returned` datetime NOT NULL,
  `Transaction_Status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `section`
--

CREATE TABLE `section` (
  `Section_ID` int(11) NOT NULL,
  `Section_Type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `Transaction_ID` int(11) NOT NULL,
  `Reservation_ID` int(11) NOT NULL,
  `Borrow_ID` int(11) NOT NULL,
  `Return_ID` int(11) NOT NULL,
  `Librarian_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `weeding`
--

CREATE TABLE `weeding` (
  `Weeding_ID` int(11) NOT NULL,
  `Book_ID` int(11) NOT NULL,
  `Date_Weeded` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `acquisition`
--
ALTER TABLE `acquisition`
  ADD PRIMARY KEY (`Acquisition_ID`);

--
-- Indexes for table `archieve`
--
ALTER TABLE `archieve`
  ADD PRIMARY KEY (`Archieve_ID`);

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`Attendance_ID`);

--
-- Indexes for table `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`Author_ID`);

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`Book_ID`);

--
-- Indexes for table `borrow`
--
ALTER TABLE `borrow`
  ADD PRIMARY KEY (`Borrow_ID`);

--
-- Indexes for table `borrower`
--
ALTER TABLE `borrower`
  ADD PRIMARY KEY (`Borrower_ID`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`Department_ID`);

--
-- Indexes for table `librarian`
--
ALTER TABLE `librarian`
  ADD PRIMARY KEY (`Librarian_ID`);

--
-- Indexes for table `penalty`
--
ALTER TABLE `penalty`
  ADD PRIMARY KEY (`Penalty_ID`);

--
-- Indexes for table `publisher`
--
ALTER TABLE `publisher`
  ADD PRIMARY KEY (`Publisher_ID`);

--
-- Indexes for table `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`Reservation_ID`);

--
-- Indexes for table `return`
--
ALTER TABLE `return`
  ADD PRIMARY KEY (`Return_ID`);

--
-- Indexes for table `section`
--
ALTER TABLE `section`
  ADD PRIMARY KEY (`Section_ID`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`Transaction_ID`);

--
-- Indexes for table `weeding`
--
ALTER TABLE `weeding`
  ADD PRIMARY KEY (`Weeding_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `acquisition`
--
ALTER TABLE `acquisition`
  MODIFY `Acquisition_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `archieve`
--
ALTER TABLE `archieve`
  MODIFY `Archieve_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `Attendance_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `author`
--
ALTER TABLE `author`
  MODIFY `Author_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `book`
--
ALTER TABLE `book`
  MODIFY `Book_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `borrow`
--
ALTER TABLE `borrow`
  MODIFY `Borrow_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `borrower`
--
ALTER TABLE `borrower`
  MODIFY `Borrower_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `Department_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `librarian`
--
ALTER TABLE `librarian`
  MODIFY `Librarian_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `penalty`
--
ALTER TABLE `penalty`
  MODIFY `Penalty_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `publisher`
--
ALTER TABLE `publisher`
  MODIFY `Publisher_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `reservations`
--
ALTER TABLE `reservations`
  MODIFY `Reservation_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `return`
--
ALTER TABLE `return`
  MODIFY `Return_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `section`
--
ALTER TABLE `section`
  MODIFY `Section_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `Transaction_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `weeding`
--
ALTER TABLE `weeding`
  MODIFY `Weeding_ID` int(11) NOT NULL AUTO_INCREMENT;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
