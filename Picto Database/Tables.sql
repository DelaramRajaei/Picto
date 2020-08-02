SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Database: artshow
--

-- --------------------------------------------------------

--
-- Table structure for table artist
--

CREATE TABLE artist (
  SocialID int(11) NOT NULL,
  FName varchar(255) NOT NULL,
  LName varchar(255) NOT NULL,
  Phone int(11) NOT NULL,
  Age int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncate table before insert artist
--

TRUNCATE TABLE artist;
--
-- Dumping data for table artist
--

INSERT DELAYED INTO artist VALUES(1, 'Delaram', 'Rajaei', 1, 1);
INSERT DELAYED INTO artist VALUES(2, 'Sam', 'Mullins', 2, 2);
INSERT DELAYED INTO artist VALUES(3, 'Charlie', 'Weaver', 3, 3);
INSERT DELAYED INTO artist VALUES(4, 'Albert ', 'Rogers', 4, 4);
INSERT DELAYED INTO artist VALUES(5, 'Aimee', 'Bird', 5, 5);
INSERT DELAYED INTO artist VALUES(6, 'Marie', 'Bird', 6, 6);
INSERT DELAYED INTO artist VALUES(7, 'Jared', 'Mccoy', 7, 7);
INSERT DELAYED INTO artist VALUES(8, 'Jared', 'Shelton', 8, 8);

-- --------------------------------------------------------

--
-- Table structure for table artwork
--

CREATE TABLE artwork (
  ArtID int(11) NOT NULL,
  Name varchar(255) NOT NULL,
  Info varchar(255) NOT NULL,
  Category varchar(255) NOT NULL,
  ArtistID int(11) NOT NULL,
  ExhibitionID int(11) NOT NULL,
  Price int(11) DEFAULT NULL
) ;

--
-- Truncate table before insert artwork
--

TRUNCATE TABLE artwork;
--
-- Dumping data for table artwork
--

INSERT DELAYED INTO artwork VALUES(1, 'A Day in the Life of Anonymous', 'none', 'Painting', 4, 1, 1500);
INSERT DELAYED INTO artwork VALUES(2, 'A Day in the Life of Anonymous', 'none', 'Statue', 7, 2, 2000);
INSERT DELAYED INTO artwork VALUES(3, 'Truly, Madly, Vile', 'none', 'Statue', 1, 3, 4050);
INSERT DELAYED INTO artwork VALUES(4, 'The Light', 'none', 'Photo', 2, 4, 5555);
INSERT DELAYED INTO artwork VALUES(5, 'The Light', 'none', 'Painting', 8, 5, 6000);
INSERT DELAYED INTO artwork VALUES(6, 'The Light', 'none', 'Photo', 2, 1, 3415);
INSERT DELAYED INTO artwork VALUES(7, 'King of Daring Chaps', 'none', 'Statue', 7, 2, 5454);
INSERT DELAYED INTO artwork VALUES(8, 'The Final Battle', 'none', 'Painting', 8, 3, 6562);
INSERT DELAYED INTO artwork VALUES(9, 'Dorothy', 'none', 'Photo', 3, 4, 46546);
INSERT DELAYED INTO artwork VALUES(10, 'change over time', 'none', 'Painting', 5, 5, 8785);
INSERT DELAYED INTO artwork VALUES(11, 'Improving', 'none', 'Statue', 6, 5, 5656);
INSERT DELAYED INTO artwork VALUES(13, 'Humble pixie', 'none', 'Statue', 1, 3, 15156);
INSERT DELAYED INTO artwork VALUES(14, 'Jacqueline', 'none', 'Painting', 5, 2, 15156);
INSERT DELAYED INTO artwork VALUES(15, 'Unique Culture', 'none', 'Painting', 3, 1, 4546);
INSERT DELAYED INTO artwork VALUES(16, 'The role of the humble pixie', 'none', 'Photo', 4, 4, 3545);
INSERT DELAYED INTO artwork VALUES(17, 'Enemy', 'none', 'Statue', 4, 3, 6345);

-- --------------------------------------------------------

--
-- Table structure for table auction
--

CREATE TABLE auction (
  AuctionID int(11) NOT NULL,
  ExhibitionID int(11) DEFAULT NULL,
  Date varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncate table before insert auction
--

TRUNCATE TABLE auction;
--
-- Dumping data for table auction
--

INSERT DELAYED INTO auction VALUES(1, 3, '29 July 2020');
INSERT DELAYED INTO auction VALUES(2, 5, '29 July 2020');
INSERT DELAYED INTO auction VALUES(3, 4, '29 July 2020');
INSERT DELAYED INTO auction VALUES(4, 2, '29 July 2020');
INSERT DELAYED INTO auction VALUES(5, 1, '29 July 2020');
INSERT DELAYED INTO auction VALUES(6, 3, '29 July 2020');
INSERT DELAYED INTO auction VALUES(7, 5, '29 July 2020');
INSERT DELAYED INTO auction VALUES(8, 1, '29 July 2020');
INSERT DELAYED INTO auction VALUES(9, 4, '29 July 2020');
INSERT DELAYED INTO auction VALUES(10, 2, '29 July 2020');

-- --------------------------------------------------------

--
-- Table structure for table customer
--

CREATE TABLE customer (
  CustomerID int(11) NOT NULL,
  FName varchar(255) NOT NULL,
  LName varchar(255) NOT NULL,
  Phone int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncate table before insert customer
--

TRUNCATE TABLE customer;
--
-- Dumping data for table customer
--

INSERT DELAYED INTO customer VALUES(1, 'Scarlet', 'Mcmillan', 0);
INSERT DELAYED INTO customer VALUES(2, 'Scarlet', 'Fowler', 0);
INSERT DELAYED INTO customer VALUES(3, 'Thea', 'Humphrey', 0);
INSERT DELAYED INTO customer VALUES(4, 'Andre', 'Humphrey', 0);
INSERT DELAYED INTO customer VALUES(5, 'Rupert', 'Castillo', 0);

-- --------------------------------------------------------

--
-- Table structure for table exhibition
--

CREATE TABLE exhibition (
  ExhibitionID int(11) NOT NULL,
  Name varchar(255) NOT NULL,
  StartT varchar(255) NOT NULL,
  FinishT varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncate table before insert exhibition
--

TRUNCATE TABLE exhibition;
--
-- Dumping data for table exhibition
--

INSERT DELAYED INTO exhibition VALUES(1, 'Generally Electric', '1PM', '3PM');
INSERT DELAYED INTO exhibition VALUES(2, 'Art for a Forgotten Faith', '4:30PM', '6PM');
INSERT DELAYED INTO exhibition VALUES(3, 'Teamwork', '9:15AM', '12PM');
INSERT DELAYED INTO exhibition VALUES(4, 'Communications', '2PM', '4PM');
INSERT DELAYED INTO exhibition VALUES(5, 'Possibilities', '3:45PM', '6:15PM');

-- --------------------------------------------------------

--
-- Table structure for table winner
--

CREATE TABLE winner (
  CustomerID int(11) NOT NULL,
  AuctionID int(11) NOT NULL,
  ArtworkID int(11) NOT NULL,
  OfferPrice int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncate table before insert winner
--

TRUNCATE TABLE winner;
--
-- Dumping data for table winner
--

INSERT DELAYED INTO winner VALUES(1, 4, 6, 1542004);
INSERT DELAYED INTO winner VALUES(4, 8, 8, 63564);

