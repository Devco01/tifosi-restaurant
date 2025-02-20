# Projet Base de Données - Restaurant Tifosi

Base de données dynamique pour le restaurant de Street-Food italien "Le Tifosi", permettant de gérer les données sur les focaccias, les ingrédients, les marques et les boissons.

## Structure du projet

Le projet contient les scripts SQL suivants :

- `scripts/create_database.sql` :
  - Création de la base de données "tifosi"
  - Création de l'utilisateur avec les droits d'administration

- `scripts/create_schema.sql` :
  - Création des tables avec leurs contraintes
  - Mise en place des relations entre les tables
  - Implémentation des contraintes de sécurité

- `scripts/insert_data.sql` :
  - Insertion des données de test issues des fichiers Excel fournis :
    - focaccia.xlsx
    - ingredient.xlsx
    - boisson.xlsx
    - marque.xlsx

- `scripts/test_queries.sql` :
  - 10 requêtes de test documentées

## Installation avec MySQL Workbench

1. Ouvrir MySQL Workbench
2. Se connecter avec l'utilisateur root
3. Créer un nouvel onglet de requête (File -> New Query Tab ou Ctrl+T)
4. Exécuter les scripts dans l'ordre suivant :

   a. Copier-coller le contenu de `create_database.sql`
   - Cliquer sur l'éclair ⚡ ou appuyer sur Ctrl+Shift+Enter pour exécuter
   
   b. Copier-coller le contenu de `create_schema.sql`
   - Cliquer sur l'éclair ⚡ pour exécuter
   
   c. Copier-coller le contenu de `insert_data.sql`
   - Cliquer sur l'éclair ⚡ pour exécuter
   
   d. Copier-coller le contenu de `test_queries.sql`
   - Cliquer sur l'éclair ⚡ pour exécuter

5. Vérification :
   - Dans le navigateur de gauche, cliquer sur l'icône "refresh" 
   - La base "tifosi" devrait apparaître avec toutes ses tables
   - Les requêtes de test devraient afficher leurs résultats

## Auteur

Devco01