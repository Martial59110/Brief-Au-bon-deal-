
# Dictionnaire de données

| Nom de la Table | Nom du Champ               | Description                                               | Type de Données | Contraintes       | Exemples de Valeurs                      |
|-----------------|----------------------------|-----------------------------------------------------------|-----------------|-------------------|------------------------------------------|
| **Users**       | user_uuid                  | Identifiant unique de l'utilisateur                       | UUID            | Clé primaire      | "123e4567-e89b-12d3-a456-426614174000"   |
|                 | user_pseudo                | Pseudo de l'utilisateur                                   | Texte           | Non nul           | "SuperUser123"                           |
|                 | username                   | Nom de l'utilisateur (pour identification)                | Texte           | Non nul, Unique   | "jdoe"                                   |
|                 | user_password_created_at   | Date de création du mot de passe de l'utilisateur         | Date/Heure      | Non nul           | "2023-09-15 10:45:00"                    |
| **Orders**      | order_number               | Identifiant unique de la commande                         | Entier          | Clé primaire      | 1001                                     |
|                 | order_total_cost_ht        | Coût total HT de la commande                              | Décimal         | Non nul           | 150.50                                   |
|                 | order_total_quantity       | Quantité totale des produits dans la commande             | Entier          | Non nul           | 3                                        |
|                 | created_at                 | Date de création de la commande                           | Date/Heure      | Non nul           | "2024-10-01 12:30:00"                    |
|                 | deliver_at                 | Date de livraison prévue pour la commande                 | Date/Heure      |                   | "2024-10-07 09:00:00"                    |
| **Products**    | product_uuid               | Identifiant unique du produit                             | UUID            | Clé primaire      | "456e7890-e89b-12d3-a456-426614174001"   |
|                 | product_name               | Nom du produit                                            | Texte           | Non nul           | "Stylos bleus"                           |
|                 | product_description        | Description détaillée du produit                          | Texte           |                   | "Stylos à bille bleue"                   |
|                 | product_price              | Prix unitaire du produit                                  | Décimal         | Non nul           | 2.99                                     |
|                 | product_quantity           | Quantité disponible en stock                              | Entier          |                   | 120                                      |
|                 | created_at                 | Date de création du produit                               | Date/Heure      | Non nul           | "2023-08-15 11:00:00"                    |
|                 | updated_at                 | Dernière date de mise à jour des informations du produit  | Date/Heure      |                   | "2023-10-01 15:45:00"                    |
