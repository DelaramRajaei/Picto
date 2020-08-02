SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Database: `artshow`
--
CREATE DATABASE IF NOT EXISTS `artshow` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `artshow`;

-- --------------------------------------------------------

--
-- Table structure for table `artist`
--

CREATE TABLE `artist` (
  `SocialID` int(11) NOT NULL,
  `FName` varchar(255) NOT NULL,
  `LName` varchar(255) NOT NULL,
  `Phone` int(11) NOT NULL,
  `Age` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `artist`:
--


-- --------------------------------------------------------

--
-- Table structure for table `artwork`
--

CREATE TABLE `artwork` (
  `ArtID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Info` varchar(255) NOT NULL,
  `Category` varchar(255) NOT NULL,
  `ArtistID` int(11) NOT NULL,
  `ExhibitionID` int(11) NOT NULL,
  `Price` int(11) DEFAULT NULL
) ;

--
-- RELATIONSHIPS FOR TABLE `artwork`:
--   `ExhibitionID`
--       `exhibition` -> `ExhibitionID`
--   `ArtistID`
--       `artist` -> `SocialID`
--

-- --------------------------------------------------------

--
-- Table structure for table `auction`
--


CREATE TABLE `auction` (
  `AuctionID` int(11) NOT NULL,
  `ExhibitionID` int(11) DEFAULT NULL,
  `Date` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `auction`:
--   `ExhibitionID`
--       `exhibition` -> `ExhibitionID`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--


CREATE TABLE `customer` (
  `CustomerID` int(11) NOT NULL,
  `FName` varchar(255) NOT NULL,
  `LName` varchar(255) NOT NULL,
  `Phone` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `customer`:
--

-- --------------------------------------------------------

--
-- Table structure for table `exhibition`
--

CREATE TABLE `exhibition` (
  `ExhibitionID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `StartT` varchar(255) NOT NULL,
  `FinishT` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `exhibition`:
--

-- --------------------------------------------------------

--
-- Table structure for table `winner`
--
-- Creation: Jul 29, 2020 at 01:13 PM
-- Last update: Jul 29, 2020 at 02:12 PM
--

CREATE TABLE `winner` (
  `CustomerID` int(11) NOT NULL,
  `AuctionID` int(11) NOT NULL,
  `ArtistID` int(11) NOT NULL,
  `OfferPrice` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `winner`:
--   `CustomerID`
--       `customer` -> `CustomerID`
--   `ArtistID`
--       `artist` -> `SocialID`
--   `AuctionID`
--       `auction` -> `AuctionID`
--

-- --------------------------------------------------------

--
-- Indexes for table `artist`
--
ALTER TABLE `artist`
  ADD PRIMARY KEY (`SocialID`);

--
-- Indexes for table `artwork`
--
ALTER TABLE `artwork`
  ADD PRIMARY KEY (`ArtID`),
  ADD KEY `ExhibitionID` (`ExhibitionID`),
  ADD KEY `ArtistID` (`ArtistID`);

--
-- Indexes for table `auction`
--
ALTER TABLE `auction`
  ADD PRIMARY KEY (`AuctionID`),
  ADD KEY `ExhibitionID` (`ExhibitionID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`CustomerID`);

--
-- Indexes for table `exhibition`
--
ALTER TABLE `exhibition`
  ADD PRIMARY KEY (`ExhibitionID`);

--
-- Indexes for table `winner`
--
ALTER TABLE `winner`
  ADD PRIMARY KEY (`CustomerID`,`AuctionID`,`ArtistID`),
  ADD KEY `ArtistID` (`ArtistID`),
  ADD KEY `AuctionID` (`AuctionID`),
  ADD KEY `CustomerID` (`CustomerID`);


-- --------------------------------------------------------

--
-- Constraints for table `artwork`
--
ALTER TABLE `artwork`
  ADD CONSTRAINT `artwork_ibfk_1` FOREIGN KEY (`ExhibitionID`) REFERENCES `exhibition` (`ExhibitionID`),
  ADD CONSTRAINT `artwork_ibfk_2` FOREIGN KEY (`ArtistID`) REFERENCES `artist` (`SocialID`);

--
-- Constraints for table `auction`
--
ALTER TABLE `auction`
  ADD CONSTRAINT `auction_ibfk_1` FOREIGN KEY (`ExhibitionID`) REFERENCES `exhibition` (`ExhibitionID`);

--
-- Constraints for table `winner`
--
ALTER TABLE `winner`
  ADD CONSTRAINT `winner_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`),
  ADD CONSTRAINT `winner_ibfk_2` FOREIGN KEY (`ArtistID`) REFERENCES `artist` (`SocialID`),
  ADD CONSTRAINT `winner_ibfk_3` FOREIGN KEY (`AuctionID`) REFERENCES `auction` (`AuctionID`);
COMMIT;
