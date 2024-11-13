-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Gegenereerd op: 13 nov 2024 om 18:26
-- Serverversie: 8.2.0
-- PHP-versie: 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jamin_a`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `allergenen`
--

DROP TABLE IF EXISTS `allergenen`;
CREATE TABLE IF NOT EXISTS `allergenen` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Naam` varchar(100) NOT NULL,
  `Beschrijving` text,
  `IsActief` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `allergenen`
--

INSERT INTO `allergenen` (`Id`, `Naam`, `Beschrijving`, `IsActief`) VALUES
(1, 'Pinda', 'Pinda\'s en pindaproducten', 1),
(2, 'Noten', 'Verschillende soorten noten', 1),
(3, 'Melk', 'Melk en melkproducten (inclusief lactose)', 1),
(4, 'Soja', 'Soja en sojaproducten', 1),
(5, 'Gluten', 'Bevat gluten (tarwe, rogge, gerst, haver)', 1),
(6, 'Ei', 'Ei en eiproducten', 1),
(7, 'Sesam', 'Sesam en sesamproducten', 1),
(8, 'Sulfiet', 'Zwaveldioxide en sulfieten', 1);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `leveranciers`
--

DROP TABLE IF EXISTS `leveranciers`;
CREATE TABLE IF NOT EXISTS `leveranciers` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Naam` varchar(100) NOT NULL,
  `Contactpersoon` varchar(100) DEFAULT NULL,
  `Leveranciernummer` varchar(50) DEFAULT NULL,
  `MobielNummer` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `leveranciers`
--

INSERT INTO `leveranciers` (`Id`, `Naam`, `Contactpersoon`, `Leveranciernummer`, `MobielNummer`) VALUES
(1, 'Dutch Supplies BV', 'Jan de Vries', 'LEV001', '06-12345678'),
(2, 'Global Trading Co', 'Sarah Johnson', 'LEV002', '06-23456789'),
(3, 'Local Partners', 'Peter Bakker', 'LEV003', '06-34567890'),
(4, 'Euro Distributors', 'Marie Lambert', 'LEV004', '06-45678901'),
(5, 'Quality Goods NL', 'Erik Jansen', 'LEV005', '06-56789012');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `magazijn`
--

DROP TABLE IF EXISTS `magazijn`;
CREATE TABLE IF NOT EXISTS `magazijn` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `ProductId` varchar(100) NOT NULL,
  `Barcode` varchar(50) DEFAULT NULL,
  `ProductNaam` varchar(100) NOT NULL,
  `VerpakkingsEenheid` varchar(50) DEFAULT NULL,
  `AantalAanwezig` int DEFAULT '0',
  `IsActief` tinyint(1) DEFAULT '1',
  `Opmerkingen` text,
  `DatumAangemaakt` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `magazijn`
--

INSERT INTO `magazijn` (`Id`, `ProductId`, `Barcode`, `ProductNaam`, `VerpakkingsEenheid`, `AantalAanwezig`, `IsActief`, `Opmerkingen`, `DatumAangemaakt`) VALUES
(1, 'PROD001', '8712345678901', 'Zoute Ruitjes', 'Doos', 150, 1, 'Standaard verpakking', '2024-11-13 19:22:08'),
(2, 'PROD002', '8712345678902', 'Dropveters', 'Pallet', 45, 1, 'Bulk verpakking', '2024-11-13 19:22:08'),
(3, 'PROD003', '8712345678903', 'Cola Flesjes', 'Stuk', 750, 1, 'Losse items', '2024-11-13 19:22:08'),
(4, 'PROD004', '8712345678904', 'Chocolade Repen', 'Doos', 200, 0, 'Uitlopend product', '2024-11-13 19:22:08'),
(5, 'PROD005', '8712345678905', 'Winegums', 'Container', 25, 1, 'Grote volumes', '2024-11-13 19:22:08'),
(6, 'PROD006', '8712345678906', 'Nieuw Product', 'Stuk', 0, 1, 'Product zonder leveringen', '2024-11-13 19:22:08');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `product_allergenen`
--

DROP TABLE IF EXISTS `product_allergenen`;
CREATE TABLE IF NOT EXISTS `product_allergenen` (
  `ProductId` int NOT NULL,
  `AllergeenId` int NOT NULL,
  PRIMARY KEY (`ProductId`,`AllergeenId`),
  KEY `AllergeenId` (`AllergeenId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `product_allergenen`
--

INSERT INTO `product_allergenen` (`ProductId`, `AllergeenId`) VALUES
(1, 1),
(1, 5),
(2, 3),
(4, 3),
(4, 4),
(4, 5),
(5, 4);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `product_leverancier`
--

DROP TABLE IF EXISTS `product_leverancier`;
CREATE TABLE IF NOT EXISTS `product_leverancier` (
  `ProductId` int NOT NULL,
  `LeverancierId` int NOT NULL,
  PRIMARY KEY (`ProductId`,`LeverancierId`),
  KEY `LeverancierId` (`LeverancierId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `product_leverancier`
--

INSERT INTO `product_leverancier` (`ProductId`, `LeverancierId`) VALUES
(1, 1),
(1, 2),
(2, 2),
(3, 3),
(4, 4),
(4, 5),
(5, 1),
(6, 1);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `product_leveringen`
--

DROP TABLE IF EXISTS `product_leveringen`;
CREATE TABLE IF NOT EXISTS `product_leveringen` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `ProductId` int NOT NULL,
  `AantalGeleverd` int NOT NULL,
  `DatumLevering` date NOT NULL,
  `VerwachteLeveringsDatum` date DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `ProductId` (`ProductId`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `product_leveringen`
--

INSERT INTO `product_leveringen` (`Id`, `ProductId`, `AantalGeleverd`, `DatumLevering`, `VerwachteLeveringsDatum`) VALUES
(1, 1, 50, '2024-01-15', '2024-01-14'),
(2, 2, 20, '2024-02-01', '2024-02-01'),
(3, 3, 100, '2024-02-15', '2024-02-16'),
(4, 1, 75, '2024-03-01', '2024-03-01'),
(5, 4, 30, '2024-03-15', '2024-03-14'),
(6, 5, 10, '2024-03-20', '2024-03-21'),
(7, 2, 25, '2024-04-01', '2024-04-01'),
(8, 3, 150, '2024-04-15', '2024-04-15');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
