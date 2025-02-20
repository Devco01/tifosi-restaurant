/*
* Projet : Tifosi - Restaurant de Street-Food italien
* Fichier : create_database.sql
* Description : Création de la base de données et de l'utilisateur
* Date : Mars 2024
*/

-- Création de la base de données
CREATE DATABASE IF NOT EXISTS tifosi;

-- Création de l'utilisateur avec les privilèges nécessaires
CREATE USER IF NOT EXISTS 'tifosi'@'localhost' IDENTIFIED BY 'TifosiPass123!';
GRANT ALL PRIVILEGES ON tifosi.* TO 'tifosi'@'localhost';
FLUSH PRIVILEGES; 