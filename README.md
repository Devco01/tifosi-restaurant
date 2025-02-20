Projet Base de Données - Restaurant Tifosi
Base de données dynamique pour le restaurant de Street-Food italien "Le Tifosi", permettant de gérer les données sur les focaccias, les ingrédients, les marques et les boissons.

Structure du projet

Le projet contient les scripts SQL suivants :

scripts/create_database.sql :
Création de la base de données "tifosi"
Création de l'utilisateur avec les droits d'administration

scripts/create_schema.sql :
Création des tables avec leurs contraintes
Mise en place des relations entre les tables
Implémentation des contraintes de sécurité (champs obligatoires, unicité, intégrité référentielle)

scripts/insert_data.sql :
Insertion des données de test issues des fichiers Excel fournis :
focaccia.xlsx
ingredient.xlsx
boisson.xlsx
marque.xlsx

scripts/test_queries.sql :
10 requêtes de test documentées
Chaque requête inclut :
Son but
Le code SQL
Le résultat attendu
Le résultat obtenu
Les commentaires sur les écarts éventuels

Installation

Se connecter à MySQL en tant qu'administrateur,
Exécuter les scripts dans l'ordre suivant :

source scripts/create_database.sql
source scripts/create_schema.sql
source scripts/insert_data.sql
source scripts/test_queries.sql

Auteur:

Devco01