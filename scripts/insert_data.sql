/*
* Projet : Tifosi - Restaurant de Street-Food italien
* Fichier : insert_data.sql
* Description : Insertion des données de test
* Source : Fichiers Excel fournis
* Date : Mars 2024
*/

USE tifosi;

-- Désactivation temporaire des contraintes de clés étrangères
SET FOREIGN_KEY_CHECKS = 0;

-- Nettoyage des tables dans l'ordre inverse des dépendances
TRUNCATE TABLE achete;
TRUNCATE TABLE contient;
TRUNCATE TABLE est_constitue;
TRUNCATE TABLE comprend;
TRUNCATE TABLE appartient;  -- Nouvelle table
TRUNCATE TABLE focaccia;
TRUNCATE TABLE menu;
TRUNCATE TABLE boisson;
TRUNCATE TABLE marque;
TRUNCATE TABLE ingredient;
TRUNCATE TABLE client;      -- Table client restaurée

-- Réactivation des contraintes de clés étrangères
SET FOREIGN_KEY_CHECKS = 1;

-- Insertion des marques
INSERT INTO marque (nom) VALUES 
('Coca-cola'),
('Cristalline'),
('Monster'),
('Pepsico');

-- Insertion des boissons
INSERT INTO boisson (nom) VALUES  -- Suppression de id_marque
('Coca-cola zéro'),
('Coca-cola original'),
('Fanta citron'),
('Fanta orange'),
('Capri-sun'),
('Pepsi'),
('Pepsi Max Zéro'),
('Lipton zéro citron'),
('Lipton Peach'),
('Monster energy ultra gold'),
('Monster energy ultra blue'),
('Eau de source');

-- Insertion des relations marque-boisson
INSERT INTO appartient (id_marque, id_boisson) VALUES
(1, 1), -- Coca-cola - Coca-cola zéro
(1, 2), -- Coca-cola - Coca-cola original
(1, 3), -- Coca-cola - Fanta citron
(1, 4), -- Coca-cola - Fanta orange
(1, 5), -- Coca-cola - Capri-sun
(2, 6), -- Pepsico - Pepsi
(2, 7), -- Pepsico - Pepsi Max Zéro
(2, 8), -- Pepsico - Lipton zéro citron
(2, 9), -- Pepsico - Lipton Peach
(3, 10), -- Monster - Monster energy ultra gold
(3, 11), -- Monster - Monster energy ultra blue
(4, 12); -- Cristalline - Eau de source

-- Insertion des clients de test
INSERT INTO client (nom, email, code_postal) VALUES
('Dupont Jean', 'jean.dupont@email.com', 75001),
('Martin Sophie', 'sophie.martin@email.com', 69001),
('Bernard Paul', 'paul.bernard@email.com', 13001);

-- Insertion des ingrédients
INSERT INTO ingredient (nom) VALUES 
('Ail'),
('Ananas'),
('Artichaut'),
('Bacon'),
('Base Tomate'),
('Base crème'),
('Champignon'),
('Chèvre'),
('Cresson'),
('Emmental'),
('Gorgonzola'),
('Jambon cuit'),
('Jambon fumé'),
('Œuf'),
('Oignon'),
('Olive noire'),
('Olive verte'),
('Parmesan'),
('Piment'),
('Poivre'),
('Pomme de terre'),
('Raclette'),
('Salami'),
('Tomate cerise'),
('Mozarella');

-- Insertion des focaccias
INSERT INTO focaccia (nom, prix) VALUES 
('Mozaccia', 9.80),
('Gorgonzolaccia', 10.80),
('Raclaccia', 8.90),
('Emmentalaccia', 9.80),
('Tradicione', 8.90),
('Napaleone', 11.20),
('Américaine', 10.80),
('Paysanne', 12.80);

-- Insertion des relations focaccia-ingrédient avec quantités
INSERT INTO comprend (id_focaccia, id_ingredient, quantite) VALUES 
-- Mozaccia (id: 1)
(1, 5, 200),  -- Base tomate
(1, 25, 50),  -- Mozarella
(1, 9, 20),   -- Cresson
(1, 13, 80),  -- Jambon fumé
(1, 1, 2),    -- Ail
(1, 3, 20),   -- Artichaut
(1, 7, 40),   -- Champignon
(1, 18, 50),  -- Parmesan
(1, 20, 1),   -- Poivre
(1, 16, 20),  -- Olive noire

-- Gorgonzolaccia (id: 2)
(2, 5, 200),  -- Base tomate
(2, 11, 50),  -- Gorgonzola
(2, 9, 20),   -- Cresson
(2, 1, 2),    -- Ail
(2, 7, 40),   -- Champignon
(2, 18, 50),  -- Parmesan
(2, 20, 1),   -- Poivre
(2, 16, 20),  -- Olive noire

-- Raclaccia (id: 3)
(3, 5, 200),  -- Base tomate
(3, 22, 50),  -- Raclette
(3, 9, 20),   -- Cresson
(3, 1, 2),    -- Ail
(3, 7, 40),   -- Champignon
(3, 18, 50),  -- Parmesan
(3, 20, 1),   -- Poivre

-- Emmentalaccia (id: 4)
(4, 6, 200),  -- Base crème
(4, 10, 50),  -- Emmental
(4, 9, 20),   -- Cresson
(4, 7, 40),   -- Champignon
(4, 18, 50),  -- Parmesan
(4, 20, 1),   -- Poivre
(4, 15, 20),  -- Oignon

-- Tradicione (id: 5)
(5, 5, 200),  -- Base tomate
(5, 25, 50),  -- Mozarella
(5, 9, 20),   -- Cresson
(5, 12, 80),  -- Jambon cuit
(5, 7, 40),   -- Champignon
(5, 18, 50),  -- Parmesan
(5, 20, 1),   -- Poivre
(5, 16, 10),  -- Olive noire
(5, 17, 10),  -- Olive verte

-- Napaleone (id: 6)
(6, 5, 200),  -- Base tomate
(6, 25, 50),  -- Mozarella
(6, 9, 20),   -- Cresson
(6, 4, 80),   -- Bacon
(6, 2, 40),   -- Ananas
(6, 19, 2),   -- Piment
(6, 18, 50),  -- Parmesan
(6, 20, 1),   -- Poivre
(6, 16, 20),  -- Olive noire

-- Américaine (id: 7)
(7, 5, 200),  -- Base tomate
(7, 25, 50),  -- Mozarella
(7, 9, 20),   -- Cresson
(7, 4, 80),   -- Bacon
(7, 21, 40),  -- Pomme de terre
(7, 18, 50),  -- Parmesan
(7, 20, 1),   -- Poivre
(7, 16, 20),  -- Olive noire

-- Paysanne (id: 8)
(8, 6, 200),  -- Base crème
(8, 8, 50),   -- Chèvre
(8, 9, 20),   -- Cresson
(8, 21, 80),  -- Pomme de terre
(8, 13, 80),  -- Jambon fumé
(8, 1, 2),    -- Ail
(8, 3, 20),   -- Artichaut
(8, 7, 40),   -- Champignon
(8, 18, 50),  -- Parmesan
(8, 20, 1),   -- Poivre
(8, 16, 20),  -- Olive noire
(8, 14, 50);  -- Œuf

-- Insertion des menus
INSERT INTO menu (nom, prix) VALUES 
('Menu Classique', 12.00),
('Menu Végétarien', 11.50),
('Menu Spécial', 14.00);

-- Insertion des relations menu-focaccia
INSERT INTO est_constitue (id_menu, id_focaccia) VALUES 
(1, 1), -- Menu Classique - Mozaccia
(1, 4), -- Menu Classique - Emmentalaccia
(2, 5), -- Menu Végétarien - Tradicione
(3, 3); -- Menu Spécial - Raclaccia

-- Insertion des relations menu-boisson
INSERT INTO contient (id_menu, id_boisson) VALUES 
(1, 1), -- Menu Classique - Coca-cola zéro
(2, 3), -- Menu Végétarien - Fanta orange
(3, 4); -- Menu Spécial - Pepsi 