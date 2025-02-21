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
-- Résultat attendu : 8 focaccias triées alphabétiquement (Américaine, Emmentalaccia, Gorgonzolaccia, etc.)
-- Résultat obtenu : 8 focaccias triées correctement
-- Commentaire : Résultat conforme aux attentes

-- 2. Afficher le nombre total d'ingrédients
-- But : Vérifier le nombre d'ingrédients disponibles
SELECT COUNT(*) as nombre_ingredients 
FROM ingredient;
-- Résultat attendu : 25 ingrédients au total
-- Résultat obtenu : 25 ingrédients
-- Commentaire : Résultat conforme aux attentes

-- 3. Afficher le prix moyen des focaccias
-- But : Calculer le prix moyen des focaccias
SELECT ROUND(AVG(prix), 2) as prix_moyen 
FROM focaccia;
-- Résultat attendu : Prix moyen autour de 10€
-- Résultat obtenu : 10.37€
-- Commentaire : Prix moyen cohérent avec les données

-- 4. Afficher la liste des boissons avec leur marque, triée par nom de boisson
-- But : Vérifier l'association boissons-marques
SELECT b.nom as boisson, m.nom as marque 
FROM boisson b 
JOIN appartient a ON b.id_boisson = a.id_boisson
JOIN marque m ON a.id_marque = m.id_marque
ORDER BY b.nom;
-- Résultat attendu : 12 boissons avec leur marque respective
-- Résultat obtenu : 12 associations correctes
-- Commentaire : Toutes les boissons sont bien associées à leur marque

-- 5. Afficher la liste des ingrédients pour une Raclaccia
-- But : Vérifier la composition de la Raclaccia
SELECT i.nom 
FROM ingredient i 
JOIN comprend c ON i.id_ingredient = c.id_ingredient
JOIN focaccia f ON c.id_focaccia = f.id_focaccia 
WHERE f.nom = 'Raclaccia';
-- Résultat attendu : 7 ingrédients (Base tomate, Raclette, Cresson, etc.)
-- Résultat obtenu : 7 ingrédients listés
-- Commentaire : Composition conforme à la recette

-- 6. Afficher le nom et le nombre d'ingrédients pour chaque focaccia
-- But : Vérifier le nombre d'ingrédients par focaccia
SELECT f.nom, COUNT(c.id_ingredient) as nombre_ingredients 
FROM focaccia f 
JOIN comprend c ON f.id_focaccia = c.id_focaccia 
GROUP BY f.nom;
-- Résultat attendu : 8 focaccias avec leur nombre d'ingrédients
-- Résultat obtenu : 8 lignes avec des nombres entre 7 et 12 ingrédients
-- Commentaire : Nombres d'ingrédients cohérents pour chaque focaccia

-- 7. Afficher le nom de la focaccia qui a le plus d'ingrédients
-- But : Identifier la focaccia la plus complexe
SELECT f.nom, COUNT(c.id_ingredient) as nombre_ingredients 
FROM focaccia f 
JOIN comprend c ON f.id_focaccia = c.id_focaccia 
GROUP BY f.nom 
ORDER BY nombre_ingredients DESC 
LIMIT 1;
-- Résultat attendu : La focaccia avec le plus d'ingrédients
-- Résultat obtenu : Paysanne (12 ingrédients)
-- Commentaire : Résultat logique car c'est la recette la plus élaborée

-- 8. Afficher la liste des focaccia qui contiennent de l'ail
-- But : Vérifier les focaccias avec de l'ail
SELECT DISTINCT f.nom 
FROM focaccia f 
JOIN comprend c ON f.id_focaccia = c.id_focaccia 
JOIN ingredient i ON c.id_ingredient = i.id_ingredient 
WHERE i.nom = 'Ail';
-- Résultat attendu : Liste des focaccias contenant de l'ail
-- Résultat obtenu : 4 focaccias (Mozaccia, Gorgonzolaccia, Raclaccia, Paysanne)
-- Commentaire : Résultat conforme aux recettes

-- 9. Afficher la liste des ingrédients inutilisés
-- But : Identifier les ingrédients jamais utilisés
SELECT i.nom 
FROM ingredient i 
LEFT JOIN comprend c ON i.id_ingredient = c.id_ingredient 
WHERE c.id_focaccia IS NULL;
-- Résultat attendu : Ingrédients présents dans la table mais non utilisés
-- Résultat obtenu : 2 ingrédients (Salami, Tomate cerise)
-- Commentaire : Ces ingrédients sont disponibles mais pas encore utilisés dans les recettes

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
-- Résultat attendu : Focaccias sans champignons dans leur recette
-- Résultat obtenu : 2 focaccias (Napaleone, Américaine)
-- Commentaire : Ces focaccias ont une recette différente sans champignons 