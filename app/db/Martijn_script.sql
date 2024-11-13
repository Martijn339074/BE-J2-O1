-- Dit is de database die ik heb gebruikt. Run dit script om de app te laten werken --

DROP DATABASE jamin_a;
CREATE DATABASE jamin_a;

USE jamin_a;

CREATE TABLE IF NOT EXISTS magazijn (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    ProductId VARCHAR(100) NOT NULL,
    Barcode VARCHAR(50),
    ProductNaam VARCHAR(100) NOT NULL,
    VerpakkingsEenheid VARCHAR(50),
    AantalAanwezig INT DEFAULT 0,
    IsActief BOOLEAN DEFAULT true,
    Opmerkingen TEXT,
    DatumAangemaakt DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS leveranciers (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Naam VARCHAR(100) NOT NULL,
    Contactpersoon VARCHAR(100),
    Leveranciernummer VARCHAR(50),
    MobielNummer VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS product_leverancier (
    ProductId INT,
    LeverancierId INT,
    PRIMARY KEY (ProductId, LeverancierId),
    FOREIGN KEY (ProductId) REFERENCES magazijn(Id),
    FOREIGN KEY (LeverancierId) REFERENCES leveranciers(Id)
);

CREATE TABLE IF NOT EXISTS product_leveringen (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    ProductId INT NOT NULL,
    AantalGeleverd INT NOT NULL,
    DatumLevering DATE NOT NULL,
    VerwachteLeveringsDatum DATE,
    FOREIGN KEY (ProductId) REFERENCES magazijn(Id)
);

CREATE TABLE IF NOT EXISTS allergenen (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Naam VARCHAR(100) NOT NULL,
    Beschrijving TEXT,
    IsActief BOOLEAN DEFAULT true
);

CREATE TABLE IF NOT EXISTS product_allergenen (
    ProductId INT,
    AllergeenId INT,
    PRIMARY KEY (ProductId, AllergeenId),
    FOREIGN KEY (ProductId) REFERENCES magazijn(Id),
    FOREIGN KEY (AllergeenId) REFERENCES allergenen(Id)
);

INSERT INTO magazijn (ProductId, Barcode, ProductNaam, VerpakkingsEenheid, AantalAanwezig, IsActief, Opmerkingen) VALUES
('PROD001', '8712345678901', 'Zoute Ruitjes', 'Doos', 150, true, 'Standaard verpakking'),
('PROD002', '8712345678902', 'Dropveters', 'Pallet', 45, true, 'Bulk verpakking'),
('PROD003', '8712345678903', 'Cola Flesjes', 'Stuk', 750, true, 'Losse items'),
('PROD004', '8712345678904', 'Chocolade Repen', 'Doos', 200, false, 'Uitlopend product'),
('PROD005', '8712345678905', 'Winegums', 'Container', 25, true, 'Grote volumes');

INSERT INTO leveranciers (Naam, Contactpersoon, Leveranciernummer, MobielNummer) VALUES
('Dutch Supplies BV', 'Jan de Vries', 'LEV001', '06-12345678'),
('Global Trading Co', 'Sarah Johnson', 'LEV002', '06-23456789'),
('Local Partners', 'Peter Bakker', 'LEV003', '06-34567890'),
('Euro Distributors', 'Marie Lambert', 'LEV004', '06-45678901'),
('Quality Goods NL', 'Erik Jansen', 'LEV005', '06-56789012');

INSERT INTO product_leverancier (ProductId, LeverancierId) VALUES
(1, 1),
(1, 2),
(2, 2),
(3, 3),
(3, 4),
(4, 5),
(5, 1);

INSERT INTO product_leveringen (ProductId, AantalGeleverd, DatumLevering, VerwachteLeveringsDatum) VALUES
(1, 50, '2024-01-15', '2024-01-14'),
(2, 20, '2024-02-01', '2024-02-01'),
(3, 100, '2024-02-15', '2024-02-16'),
(1, 75, '2024-03-01', '2024-03-01'),
(4, 30, '2024-03-15', '2024-03-14'),
(5, 10, '2024-03-20', '2024-03-21'),
(2, 25, '2024-04-01', '2024-04-01'),
(3, 150, '2024-04-15', '2024-04-15');

INSERT INTO allergenen (Naam, Beschrijving, IsActief) VALUES
('Pinda', 'Pinda''s en pindaproducten', true),
('Noten', 'Verschillende soorten noten', true),
('Melk', 'Melk en melkproducten (inclusief lactose)', true),
('Soja', 'Soja en sojaproducten', true),
('Gluten', 'Bevat gluten (tarwe, rogge, gerst, haver)', true),
('Ei', 'Ei en eiproducten', true),
('Sesam', 'Sesam en sesamproducten', true),
('Sulfiet', 'Zwaveldioxide en sulfieten', true);

INSERT INTO product_allergenen (ProductId, AllergeenId) VALUES
(1, 1),
(1, 5),
(2, 3),
(4, 3),
(4, 4),
(4, 5),
(5, 4);
