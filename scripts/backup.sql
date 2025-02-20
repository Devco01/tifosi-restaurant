/*
* Projet : Tifosi - Restaurant de Street-Food italien
* Fichier : backup.sql
* Description : Script de sauvegarde de la base de données
* Date : Mars 2024
*/

-- Structure et données des tables
SELECT '-- Structure de la base tifosi' AS '';
SHOW CREATE DATABASE tifosi;

-- Tables
SELECT '-- Structure des tables' AS '';
SHOW TABLES;

-- Pour chaque table
SELECT CONCAT('SHOW CREATE TABLE ', table_name, ';')
FROM information_schema.tables
WHERE table_schema = 'tifosi';

-- Données
SELECT '-- Contenu des tables' AS '';
SELECT * FROM marque;
SELECT * FROM boisson;
SELECT * FROM appartient;
SELECT * FROM ingredient;
SELECT * FROM focaccia;
SELECT * FROM comprend;
SELECT * FROM menu;
SELECT * FROM est_constitue;
SELECT * FROM contient;
SELECT * FROM client;
SELECT * FROM achete;

-- Utilisateur et privilèges
SELECT '-- Droits utilisateur' AS '';
SHOW GRANTS FOR 'tifosi'@'localhost'; 