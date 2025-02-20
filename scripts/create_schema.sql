/*
* Projet : Tifosi - Restaurant de Street-Food italien
* Fichier : create_schema.sql
* Description : Création du schéma de la base de données
* Date : Mars 2024
*/

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
CREATE TABLE marque (
    id_marque INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL UNIQUE
    -- Contrainte d'unicité sur le nom pour éviter les doublons
);

-- Table des boissons avec leur marque associée
CREATE TABLE boisson (
    id_boisson INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL,
    id_marque INT NOT NULL,
    FOREIGN KEY (id_marque) REFERENCES marque(id_marque)
    -- Clé étrangère pour garantir l'intégrité référentielle avec la table marque
);

-- Table des ingrédients disponibles
CREATE TABLE ingredient (
    id_ingredient INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL UNIQUE
    -- Contrainte d'unicité pour éviter les doublons d'ingrédients
);

-- Table des clients du restaurant
CREATE TABLE client (
    id_client INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    -- Contrainte d'unicité sur l'email pour éviter les doublons de compte
    code_postal INT NOT NULL
);

-- Table des menus proposés
CREATE TABLE menu (
    id_menu INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL,
    prix DECIMAL(5,2) NOT NULL CHECK (prix > 0)
    -- Contrainte CHECK pour garantir un prix positif
);

-- Table des focaccias disponibles
CREATE TABLE focaccia (
    id_focaccia INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL UNIQUE,
    -- Contrainte d'unicité sur le nom pour éviter les doublons
    prix DECIMAL(5,2) NOT NULL CHECK (prix > 0)
    -- Contrainte CHECK pour garantir un prix positif
);

-- Table de liaison entre focaccias et ingrédients
CREATE TABLE comprend (
    id_focaccia INT,
    id_ingredient INT,
    quantite INT NOT NULL CHECK (quantite > 0),
    -- Contrainte CHECK pour garantir une quantité positive
    PRIMARY KEY (id_focaccia, id_ingredient),
    -- Clé primaire composite pour éviter les doublons d'ingrédients dans une focaccia
    FOREIGN KEY (id_focaccia) REFERENCES focaccia(id_focaccia),
    FOREIGN KEY (id_ingredient) REFERENCES ingredient(id_ingredient)
    -- Clés étrangères pour garantir l'intégrité référentielle
);

-- Table de liaison entre menus et focaccias
CREATE TABLE est_constitue (
    id_menu INT,
    id_focaccia INT,
    PRIMARY KEY (id_menu, id_focaccia),
    -- Clé primaire composite pour éviter les doublons de focaccias dans un menu
    FOREIGN KEY (id_menu) REFERENCES menu(id_menu),
    FOREIGN KEY (id_focaccia) REFERENCES focaccia(id_focaccia)
    -- Clés étrangères pour garantir l'intégrité référentielle
);

-- Table de liaison entre menus et boissons
CREATE TABLE contient (
    id_menu INT,
    id_boisson INT,
    PRIMARY KEY (id_menu, id_boisson),
    -- Clé primaire composite pour éviter les doublons de boissons dans un menu
    FOREIGN KEY (id_menu) REFERENCES menu(id_menu),
    FOREIGN KEY (id_boisson) REFERENCES boisson(id_boisson)
    -- Clés étrangères pour garantir l'intégrité référentielle
);

-- Table des achats effectués par les clients
CREATE TABLE achete (
    id_client INT,
    id_menu INT,
    date_achat DATE NOT NULL,
    PRIMARY KEY (id_client, id_menu, date_achat),
    -- Clé primaire composite incluant la date pour permettre plusieurs achats
    FOREIGN KEY (id_client) REFERENCES client(id_client),
    FOREIGN KEY (id_menu) REFERENCES menu(id_menu)
    -- Clés étrangères pour garantir l'intégrité référentielle
); 