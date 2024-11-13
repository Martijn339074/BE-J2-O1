-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Gegenereerd op: 26 sep 2024 om 09:49
-- Serverversie: 9.0.1
-- PHP-versie: 8.3.11

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
CREATE DATABASE IF NOT EXISTS `jamin_a` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `jamin_a`;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `country`
--

DROP TABLE IF EXISTS Country;
CREATE TABLE IF NOT EXISTS Country 
(
   Id               INT           UNSIGNED   NOT NULL AUTO_INCREMENT
  ,Name             VARCHAR(250)             NOT NULL
  ,CapitalCity      VARCHAR(250)             NOT NULL
  ,Continent        VARCHAR(250)             NOT NULL
  ,Population       INT           UNSIGNED   NOT NULL
  ,Zipcode          VARCHAR(6)               NOT NULL
  ,IsActief         BIT                      NOT NULL DEFAULT 1
  ,Opmerkingen      VARCHAR(255)                 NULL DEFAULT NULL
  ,DatumAangemaakt  DATETIME(6)              NOT NULL
  ,DatumGewijzigd   DATETIME(6)              NOT NULL
  ,CONSTRAINT     PK_Country_Id            PRIMARY KEY CLUSTERED (Id) 
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `country`
--

INSERT INTO Country
(
     Name
    ,CapitalCity
    ,Continent
    ,Population
    ,Zipcode
    ,IsActief
    ,Opmerkingen
    ,DatumAangemaakt
    ,DatumGewijzigd
) 
VALUES
('Tanzania', 'Dodoma', 'Afrika', 63590000, '1234SD', 1, NULL, SYSDATE(6), SYSDATE(6)),
('Japan', 'Tokio', 'Azi&euml;', 125700000, '2354RR', 1, NULL, SYSDATE(6), SYSDATE(6)),
('Zwitserlandd', 'Bern', 'Europa', 8703000, '3267AS', 1, NULL, SYSDATE(6), SYSDATE(6)),
('Noorwegen', 'Oslo', 'Europa', 5550203, '8967DD', 1, NULL, SYSDATE(6), SYSDATE(6)),
('Litouwen', 'Vilnius', 'Europa', 340000000, '4376WS', 1, NULL, SYSDATE(6), SYSDATE(6)),
('Marokko', 'Rabat', 'Afrika', 37500000, '2982ER', 1, NULL, SYSDATE(6), SYSDATE(6)),
('Nepal', 'Kathmandu', 'Azi&euml;', 30000000, '3925DF', 1, NULL, SYSDATE(6), SYSDATE(6)),
('Chili', 'Santiago', 'Zuid-Amerika', 18276870, '2300SD', 1, NULL, SYSDATE(6), SYSDATE(6));


-- Step:01
-- Goal: Create a new table Product
-- *************************************************************
-- Version:       Date:         Author:             Description:
-- ********       *****         *******             ************
-- 01             17-10-2024    Arjan de Ruijter    New table
-- **************************************************************
DROP TABLE IF EXISTS Magazijn;
DROP TABLE IF EXISTS Product;

CREATE TABLE IF NOT EXISTS Product
(
   Id               MEDIUMINT        UNSIGNED    NOT NULL    AUTO_INCREMENT
  ,Naam             VARCHAR(255)                 NOT NULL
  ,Barcode          VARCHAR(13)                  NOT NULL
  ,IsActief         BIT                          NOT NULL    DEFAULT 1
  ,Opmerkingen      VARCHAR(255)                     NULL    DEFAULT NULL
  ,DatumAangemaakt  Datetime(6)                  NOT NULL
  ,DatumGewijzigd   Datetime(6)                  NOT NULL  
  ,CONSTRAINT   PK_Product_Id                PRIMARY KEY CLUSTERED (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Step:02
-- Goal: Fill table Product with data
-- ***************************************************************
-- Version:       Date:         Author:             Description:
-- ********       *****         *******             ************
-- 01             17-10-2024    Arjan de Ruijter    Insert records
-- ****************************************************************
INSERT INTO Product 
(
     Naam 
    ,Barcode
    ,IsActief
    ,Opmerkingen
    ,DatumAangemaakt
    ,DatumGewijzigd 
) 
VALUES
    ('Mintnopjes', '8719587231278', 1, NULL, SYSDATE(6), SYSDATE(6)),
    ('Schoolkrijt', '8719587326713', 1, NULL, SYSDATE(6), SYSDATE(6)),
    ('Honingdrop', '8719587327836', 1, NULL, SYSDATE(6), SYSDATE(6)),
    ('Zure Beren', '8719587321441', 1, NULL, SYSDATE(6), SYSDATE(6)),
    ('Cola Flesjes', '8719587321237', 1, NULL, SYSDATE(6), SYSDATE(6)),
    ('Turtles', '8719587322245', 1, NULL, SYSDATE(6), SYSDATE(6)),
    ('Witte Muizen', '8719587328256', 1, NULL, SYSDATE(6), SYSDATE(6)),
    ('Reuzen Slangen', '8719587325641', 1, NULL, SYSDATE(6), SYSDATE(6)),
    ('Zoute Rijen', '8719587322739', 1, NULL, SYSDATE(6), SYSDATE(6)),
    ('Winegums', '8719587327527', 1, NULL, SYSDATE(6), SYSDATE(6)),
    ('Drop Munten', '8719587322345', 1, NULL, SYSDATE(6), SYSDATE(6)),
    ('Kruis Drop', '8719587322265', 1, NULL, SYSDATE(6), SYSDATE(6)),
    ('Zoute Ruitjes', '8719587323256', 1, NULL, SYSDATE(6), SYSDATE(6));

-- Step:03
-- Goal: Create a new table Magazijn
-- *************************************************************
-- Version:       Date:         Author:             Description:
-- ********       *****         *******             ************
-- 01             17-10-2024    Arjan de Ruijter    New table
-- **************************************************************
CREATE TABLE IF NOT EXISTS Magazijn
(
    Id                    MEDIUMINT       UNSIGNED    NOT NULL  AUTO_INCREMENT
    ,ProductId            MEDIUMINT       UNSIGNED    NOT NULL
    ,VerpakkingsEenheid   DECIMAL(4,1)                NOT NULL
    ,AantalAanwezig       SMALLINT        UNSIGNED    NOT NULL
    ,IsActief             BIT                         NOT NULL  DEFAULT 1
    ,Opmerkingen          VARCHAR(255)                    NULL  DEFAULT NULL
    ,DatumAangemaakt      DATETIME(6)                 NOT NULL
    ,DatumGewijzigd       DATETIME(6)                 NOT NULL
    ,CONSTRAINT           PK_Magazijn_Id  PRIMARY KEY CLUSTERED(Id)
    ,CONSTRAINT           FK_Magazijn_ProductId_Product_Id  FOREIGN KEY (ProductId) REFERENCES Product(Id)
) ENGINE=InnoDB;


-- Step:04
-- Goal: Fill table Magazijn with data
-- ***************************************************************
-- Version:       Date:         Author:             Description:
-- ********       *****         *******             ************
-- 01             17-10-2024    Arjan de Ruijter    Insert records
-- ****************************************************************
INSERT INTO Magazijn
(
   ProductId
  ,VerpakkingsEenheid
  ,AantalAanwezig
  ,IsActief
  ,Opmerkingen
  ,DatumAangemaakt
  ,DatumGewijzigd
)
VALUES
   (1, 5, 453, 1, NULL, SYSDATE(6), SYSDATE(6))
  ,(2, 2.5, 400, 1, NULL, SYSDATE(6), SYSDATE(6))
  ,(3, 5, 1, 1, NULL, SYSDATE(6), SYSDATE(6))
  ,(4, 1, 800, 1 , NULL, SYSDATE(6), SYSDATE(6))
  ,(5, 3, 234, 1, NULL, SYSDATE(6), SYSDATE(6))
  ,(6, 2, 345, 1, NULL, SYSDATE(6), SYSDATE(6))
  ,(7, 1, 795, 1, NULL, SYSDATE(6), SYSDATE(6))
  ,(8, 10, 233, 1, NULL, SYSDATE(6), SYSDATE(6))
  ,(9, 2.5, 123, 1, NULL, SYSDATE(6), SYSDATE(6))
  ,(10, 3, 0, 1, NULL, SYSDATE(6), SYSDATE(6))
  ,(11, 2, 367, 1, NULL, SYSDATE(6), SYSDATE(6))
  ,(12, 1, 467, 1, NULL, SYSDATE(6), SYSDATE(6))
  ,(13, 5, 20, 1, NULL, SYSDATE(6), SYSDATE(6));

-- Nieuwe tabel voor leveringen
CREATE TABLE IF NOT EXISTS product_leveringen (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    ProductId INT NOT NULL,
    AantalGeleverd INT NOT NULL,
    DatumLevering DATE NOT NULL,
    VerwachteLeveringsDatum DATE,
    FOREIGN KEY (ProductId) REFERENCES magazijn(Id)
);

-- Nieuwe tabel voor leveranciers
CREATE TABLE IF NOT EXISTS leveranciers (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Naam VARCHAR(100) NOT NULL,
    Contactpersoon VARCHAR(100),
    Leveranciernummer VARCHAR(50),
    MobielNummer VARCHAR(20)
);

-- Koppeltabel tussen producten en leveranciers
CREATE TABLE IF NOT EXISTS product_leverancier (
    ProductId INT,
    LeverancierId INT,
    PRIMARY KEY (ProductId, LeverancierId),
    FOREIGN KEY (ProductId) REFERENCES magazijn(Id),
    FOREIGN KEY (LeverancierId) REFERENCES leveranciers(Id)
);




