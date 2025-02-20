/*
* Projet : Tifosi - Restaurant de Street-Food italien
* Fichier : test_queries.sql
* Description : Requêtes de test de la base de données
* Date : Mars 2024
*/

USE tifosi;

-- 1. Afficher la liste des noms des focaccias par ordre alphabétique croissant
-- But : Vérifier la présence et l'ordre des focaccias
SELECT nom 
FROM focaccia 
ORDER BY nom ASC;

-- 2. Afficher le nombre total d'ingrédients
-- But : Vérifier le nombre d'ingrédients disponibles
SELECT COUNT(*) as nombre_ingredients 
FROM ingredient;

-- 3. Afficher le prix moyen des focaccias
-- But : Calculer le prix moyen des focaccias
SELECT ROUND(AVG(prix), 2) as prix_moyen 
FROM focaccia;

-- 4. Afficher la liste des boissons avec leur marque, triée par nom de boisson
-- But : Vérifier l'association boissons-marques
SELECT b.nom as boisson, m.nom as marque 
FROM boisson b 
JOIN appartient a ON b.id_boisson = a.id_boisson
JOIN marque m ON a.id_marque = m.id_marque
ORDER BY b.nom;

-- 5. Afficher la liste des ingrédients pour une Raclaccia
-- But : Vérifier la composition de la Raclaccia
SELECT i.nom 
FROM ingredient i 
JOIN comprend c ON i.id_ingredient = c.id_ingredient
JOIN focaccia f ON c.id_focaccia = f.id_focaccia 
WHERE f.nom = 'Raclaccia';

-- 6. Afficher le nom et le nombre d'ingrédients pour chaque focaccia
-- But : Vérifier le nombre d'ingrédients par focaccia
SELECT f.nom, COUNT(c.id_ingredient) as nombre_ingredients 
FROM focaccia f 
JOIN comprend c ON f.id_focaccia = c.id_focaccia 
GROUP BY f.nom;

-- 7. Afficher le nom de la focaccia qui a le plus d'ingrédients
-- But : Identifier la focaccia la plus complexe
SELECT f.nom, COUNT(c.id_ingredient) as nombre_ingredients 
FROM focaccia f 
JOIN comprend c ON f.id_focaccia = c.id_focaccia 
GROUP BY f.nom 
ORDER BY nombre_ingredients DESC 
LIMIT 1;

-- 8. Afficher la liste des focaccia qui contiennent de l'ail
-- But : Vérifier les focaccias avec de l'ail
SELECT DISTINCT f.nom 
FROM focaccia f 
JOIN comprend c ON f.id_focaccia = c.id_focaccia 
JOIN ingredient i ON c.id_ingredient = i.id_ingredient 
WHERE i.nom = 'Ail';

-- 9. Afficher la liste des ingrédients inutilisés
-- But : Identifier les ingrédients jamais utilisés
SELECT i.nom 
FROM ingredient i 
LEFT JOIN comprend c ON i.id_ingredient = c.id_ingredient 
WHERE c.id_focaccia IS NULL;

-- 10. Afficher la liste des focaccia qui n'ont pas de champignons
-- But : Identifier les focaccias sans champignons
SELECT f.nom 
FROM focaccia f 
WHERE f.id_focaccia NOT IN (
    SELECT c.id_focaccia 
    FROM comprend c 
    JOIN ingredient i ON c.id_ingredient = i.id_ingredient 
    WHERE i.nom = 'Champignon'
); 