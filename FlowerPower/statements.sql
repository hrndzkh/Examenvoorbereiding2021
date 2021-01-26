CREATE DATABASE FlowerPower;

USE FlowerPower;

CREATE TABLE Klant(
    Klantcode INT NOT NULL,
    Voorletters VARCHAR(255),
    Tussenvoegsels VARCHAR(255),
    Achternaam VARCHAR(255),
    Adres VARCHAR(255),
    Postcode VARCHAR(255),
    Woonplaats VARCHAR(255),
    Geboortedatum DATE NOT NULL,
    Gebruikersnaam VARCHAR(255),
    Wachtwoord VARCHAR(255),
    PRIMARY KEY(Klantcode)
);

CREATE TABLE Factuur(
    Factuurnummer INT NOT NULL,
    Factuurdatum DATETIME,
    Klantcode INT,
    PRIMARY KEY(Factuurnummer),
    FOREIGN KEY(Klantcode) REFERENCES Klant(Klantcode)
);

CREATE TABLE Artikel(
    Artikelcode INT NOT NULL,
    Artikel VARCHAR(255),
    Prijs DECIMAL(5,2),
    PRIMARY KEY(Artikelcode)   
);

CREATE TABLE Factuurregel(
    Factuurnummer INT NOT NULL,
    Artikelcode INT,
    Aantal INT,
    Prijs DECIMAL(5,2),
    FOREIGN KEY(Factuurnummer) REFERENCES Factuur(Factuurnummer),
    FOREIGN KEY(Artikelcode) REFERENCES Artikel(Artikelcode)    
);

CREATE TABLE Winkel(
    Winkelcode INT NOT NULL,
    Winkelnaam VARCHAR(255),
    Winkeladres VARCHAR(255),
    Winkelpostcode VARCHAR(255),
    Vestigingsplaats VARCHAR(255),
    Telefoonnummer INT,
    PRIMARY KEY(Winkelcode)
);

CREATE TABLE Medewerker(
    Medewerkerscode INT NOT NULL,
    Voorletters VARCHAR(255),
    Voorvoegsels VARCHAR(255),
    Achternaam VARCHAR(255),
    Gebruikersnaam VARCHAR(255),
    Wachtwoord VARCHAR(255),
    PRIMARY KEY(Medewerkerscode)
);

CREATE TABLE Bestelling(
    Artikelcode INT NOT NULL,
    Winkelcode INT,
    Aantal INT,
    Klantcode INT,
    Medewerkerscode INT,
    Afgehaald DATETIME,
    FOREIGN KEY(Artikelcode) REFERENCES Artikel(Artikelcode),
    FOREIGN KEY(Winkelcode) REFERENCES Winkel(Winkelcode),
    FOREIGN KEY(Klantcode) REFERENCES Klant(Klantcode),
    FOREIGN KEY(Medewerkerscode) REFERENCES Medewerker(Medewerkerscode)
);