/*
* Projet : Tifosi - Restaurant de Street-Food italien
* Fichier : create_schema.sql
* Description : Création de la base de données et de son schéma
* Date : Mars 2024
*/

-- Création de la base de données et de l'utilisateur
CREATE DATABASE IF NOT EXISTS tifosi;
CREATE USER IF NOT EXISTS 'tifosi'@'localhost' IDENTIFIED BY 'TifosiPass123!';
GRANT ALL PRIVILEGES ON tifosi.* TO 'tifosi'@'localhost';
FLUSH PRIVILEGES;

USE tifosi;

-- Suppression des tables si elles existent (dans l'ordre inverse des dépendances)
DROP TABLE IF EXISTS achete;
DROP TABLE IF EXISTS contient;
DROP TABLE IF EXISTS est_constitue;
DROP TABLE IF EXISTS comprend;
DROP TABLE IF EXISTS focaccia;
DROP TABLE IF EXISTS menu;
DROP TABLE IF EXISTS boisson;
DROP TABLE IF EXISTS marque;
DROP TABLE IF EXISTS ingredient;
DROP TABLE IF EXISTS client;

-- Table des marques de boissons
-- Contrainte d'unicité sur le nom pour éviter les doublons
CREATE TABLE marque (
    id_marque INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL UNIQUE
);

-- Table des boissons avec leur marque associée
-- Clé étrangère pour garantir l'intégrité référentielle avec la table marque
CREATE TABLE boisson (
    id_boisson INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL,
    id_marque INT NOT NULL,
    FOREIGN KEY (id_marque) REFERENCES marque(id_marque)
);

-- Table des ingrédients disponibles
-- Contrainte d'unicité pour éviter les doublons d'ingrédients
CREATE TABLE ingredient (
    id_ingredient INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL UNIQUE
);

-- Table des clients du restaurant
-- Contrainte d'unicité sur l'email pour éviter les doublons de compte
CREATE TABLE client (
    id_client INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    code_postal INT NOT NULL
);

-- Table des menus proposés
-- Contrainte CHECK pour garantir un prix positif
CREATE TABLE menu (
    id_menu INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL,
    prix DECIMAL(5,2) NOT NULL CHECK (prix > 0)
);

-- Table des focaccias disponibles
-- Contrainte d'unicité sur le nom pour éviter les doublons
-- Contrainte CHECK pour garantir un prix positif
CREATE TABLE focaccia (
    id_focaccia INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL UNIQUE,
    prix DECIMAL(5,2) NOT NULL CHECK (prix > 0)
);

-- Table de liaison entre focaccias et ingrédients
-- Contrainte CHECK pour garantir une quantité positive
-- Clé primaire composite pour éviter les doublons d'ingrédients dans une focaccia
-- Clés étrangères pour garantir l'intégrité référentielle
CREATE TABLE comprend (
    id_focaccia INT,
    id_ingredient INT,
    quantite INT NOT NULL CHECK (quantite > 0),
    PRIMARY KEY (id_focaccia, id_ingredient),
    FOREIGN KEY (id_focaccia) REFERENCES focaccia(id_focaccia),
    FOREIGN KEY (id_ingredient) REFERENCES ingredient(id_ingredient)
);

-- Table de liaison entre menus et focaccias
-- Clé primaire composite pour éviter les doublons de focaccias dans un menu
-- Clés étrangères pour garantir l'intégrité référentielle
CREATE TABLE est_constitue (
    id_menu INT,
    id_focaccia INT,
    PRIMARY KEY (id_menu, id_focaccia),
    FOREIGN KEY (id_menu) REFERENCES menu(id_menu),
    FOREIGN KEY (id_focaccia) REFERENCES focaccia(id_focaccia)
);

-- Table de liaison entre menus et boissons
-- Clé primaire composite pour éviter les doublons de boissons dans un menu
-- Clés étrangères pour garantir l'intégrité référentielle
CREATE TABLE contient (
    id_menu INT,
    id_boisson INT,
    PRIMARY KEY (id_menu, id_boisson),
    FOREIGN KEY (id_menu) REFERENCES menu(id_menu),
    FOREIGN KEY (id_boisson) REFERENCES boisson(id_boisson)
);

-- Table des achats effectués par les clients
-- Clé primaire composite incluant la date pour permettre plusieurs achats
-- Clés étrangères pour garantir l'intégrité référentielle
CREATE TABLE achete (
    id_client INT,
    id_menu INT,
    date_achat DATE NOT NULL,
    PRIMARY KEY (id_client, id_menu, date_achat),
    FOREIGN KEY (id_client) REFERENCES client(id_client),
    FOREIGN KEY (id_menu) REFERENCES menu(id_menu)
); 