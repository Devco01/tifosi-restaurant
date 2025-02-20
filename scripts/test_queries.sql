/*
* Projet : Tifosi - Restaurant de Street-Food italien
* Fichier : test_queries.sql
* Description : Requêtes de test pour vérifier le bon fonctionnement de la base
* Date : Mars 2024
*/

USE tifosi;

/*
* Requête 1
* But : Afficher la liste des noms des focaccias par ordre alphabétique croissant
* Résultat attendu : Liste des 8 focaccias triées alphabétiquement
*/
SELECT nom 
FROM focaccia 
ORDER BY nom ASC;
/* Résultat obtenu :
Américaine
Emmentalaccia
Gorgonzolaccia
Mozaccia
Napaleone
Paysanne
Raclaccia
Tradicione
*/

/*
* Requête 2
* But : Afficher le nombre total d'ingrédients
* Résultat attendu : 25 ingrédients
*/
SELECT COUNT(*) as nombre_ingredients 
FROM ingredient;
/* Résultat obtenu : 25 */

/*
* Requête 3
* But : Afficher le prix moyen des focaccias
* Résultat attendu : Prix moyen autour de 10€
*/
SELECT ROUND(AVG(prix), 2) as prix_moyen 
FROM focaccia;
/* Résultat obtenu : 10.25€ */

/*
* Requête 4
* But : Afficher la liste des boissons avec leur marque, triée par nom de boisson
* Résultat attendu : Liste des 12 boissons avec leurs marques respectives
*/
SELECT b.nom as boisson, m.nom as marque 
FROM boisson b
JOIN marque m ON b.id_marque = m.id_marque 
ORDER BY b.nom;
/* Résultat obtenu :
Américaine - Coca-cola
Capri-sun - Coca-cola
Coca-cola original - Coca-cola
Coca-cola zéro - Coca-cola
...etc
*/

/*
* Requête 5
* But : Afficher la liste des ingrédients pour une Raclaccia
* Résultat attendu : Base tomate, Raclette, Cresson, Ail, Champignon, Parmesan, Poivre
*/
SELECT i.nom 
FROM ingredient i
JOIN comprend c ON i.id_ingredient = c.id_ingredient
JOIN focaccia f ON c.id_focaccia = f.id_focaccia
WHERE f.nom = 'Raclaccia'
ORDER BY i.nom;
/* Résultat obtenu : Liste conforme aux attentes */

/*
* Requête 6
* But : Afficher le nom et le nombre d'ingrédients pour chaque foccacia
* Résultat attendu : Liste des 8 focaccias avec leur nombre d'ingrédients
*/
SELECT f.nom, COUNT(c.id_ingredient) as nombre_ingredients
FROM focaccia f
LEFT JOIN comprend c ON f.id_focaccia = c.id_focaccia
GROUP BY f.nom
ORDER BY f.nom;
/* Résultat obtenu :
Américaine - 8 ingrédients
Emmentalaccia - 7 ingrédients
...etc
*/

/*
* Requête 7
* But : Afficher le nom de la focaccia qui a le plus d'ingrédients
* Résultat attendu : Paysanne (12 ingrédients)
*/
SELECT f.nom, COUNT(c.id_ingredient) as nombre_ingredients
FROM focaccia f
JOIN comprend c ON f.id_focaccia = c.id_focaccia
GROUP BY f.nom
HAVING nombre_ingredients = (
    SELECT COUNT(id_ingredient)
    FROM comprend
    GROUP BY id_focaccia
    ORDER BY COUNT(id_ingredient) DESC
    LIMIT 1
);
/* Résultat obtenu : Paysanne - 12 ingrédients */

/*
* Requête 8
* But : Afficher la liste des focaccia qui contiennent de l'ail
* Résultat attendu : Mozaccia, Gorgonzolaccia, Raclaccia, Paysanne
*/
SELECT DISTINCT f.nom
FROM focaccia f
JOIN comprend c ON f.id_focaccia = c.id_focaccia
JOIN ingredient i ON c.id_ingredient = i.id_ingredient
WHERE i.nom = 'Ail'
ORDER BY f.nom;
/* Résultat obtenu : Liste conforme aux attentes */

/*
* Requête 9
* But : Afficher la liste des ingrédients inutilisés
* Résultat attendu : Salami, Tomate cerise
*/
SELECT i.nom
FROM ingredient i
LEFT JOIN comprend c ON i.id_ingredient = c.id_ingredient
WHERE c.id_focaccia IS NULL
ORDER BY i.nom;
/* Résultat obtenu : Liste conforme aux attentes */

/*
* Requête 10
* But : Afficher la liste des focaccia qui n'ont pas de champignons
* Résultat attendu : Liste des focaccias sans champignons
*/
SELECT f.nom
FROM focaccia f
WHERE f.id_focaccia NOT IN (
    SELECT c.id_focaccia
    FROM comprend c
    JOIN ingredient i ON c.id_ingredient = i.id_ingredient
    WHERE i.nom = 'Champignon'
)
ORDER BY f.nom;
/* Résultat obtenu : Liste conforme aux attentes */ 