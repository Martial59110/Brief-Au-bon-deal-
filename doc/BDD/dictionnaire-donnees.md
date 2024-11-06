

# 📑 Dictionnaire de Données

---

## Table `Users`

| Nom du Champ               | Type de Données    | Contrainte              | Description                                     |
|----------------------------|--------------------|-------------------------|-------------------------------------------------|
| `user_uuid`                | UUID              | PRIMARY KEY             | Identifiant unique de l'utilisateur             |
| `user_pseudo`              | VARCHAR(100)      | NOT NULL                | Pseudo de l'utilisateur                         |
| `username`                 | VARCHAR(100)      | UNIQUE, NOT NULL        | Identifiant unique utilisé par l'utilisateur    |
| `user_password`                 | VARCHAR(100)      | NOT NULL        | Mot de passe utilisé par l'utilisateur    |
| `created_at` | TIMESTAMP         | NOT NULL                | Date de création du mot de passe                |

---

## Table `Orders`

| Nom du Champ               | Type de Données    | Contrainte              | Description                                     |
|----------------------------|--------------------|-------------------------|-------------------------------------------------|
| `order_number`             | SERIAL            | PRIMARY KEY             | Numéro unique de la commande                    |
| `order_total_cost_ht`      | NUMERIC(10,2)    | NOT NULL                | Coût total HT de la commande                    |
| `order_total_quantity`     | INTEGER           | NOT NULL                | Quantité totale de produits dans la commande    |
| `created_at`               | TIMESTAMP         | NOT NULL                | Date de création de la commande                 |
| `deliver_at`               | TIMESTAMP         |                         | Date de livraison prévue pour la commande       |
| `user_uuid`                | UUID              | FOREIGN KEY             | Référence à l'identifiant de l'utilisateur      |

> **Clé étrangère** : `user_uuid` référence `Users(user_uuid)`, créant une relation entre les commandes et leurs utilisateurs respectifs.

---

## Table `Products`

| Nom du Champ               | Type de Données    | Contrainte              | Description                                     |
|----------------------------|--------------------|-------------------------|-------------------------------------------------|
| `product_uuid`             | UUID              | PRIMARY KEY             | Identifiant unique du produit                   |
| `product_name`             | VARCHAR(100)      | NOT NULL                | Nom du produit                                  |
| `product_description`      | TEXT              |                         | Description du produit                          |
| `product_price`            | NUMERIC(10,2)    | NOT NULL                | Prix unitaire du produit                        |
| `product_quantity`         | INTEGER           | NOT NULL                | Quantité disponible en stock                    |
| `created_at`               | TIMESTAMP         | NOT NULL                | Date de création du produit                     |
| `updated_at`               | TIMESTAMP         |                         | Dernière date de mise à jour du produit         |

---

## Table d’Association `Belong`

| Nom du Champ               | Type de Données    | Contrainte                                | Description                                     |
|----------------------------|--------------------|-------------------------------------------|-------------------------------------------------|
| `product_uuid`             | UUID              | PRIMARY KEY (partielle), FOREIGN KEY      | Référence à l'identifiant unique du produit     |
| `order_number`             | INTEGER           | PRIMARY KEY (partielle), FOREIGN KEY      | Référence au numéro de commande                 |

> **Clé primaire composée** : La combinaison (`product_uuid`, `order_number`) forme la clé primaire de la table `Belong`, garantissant l'unicité de chaque association produit-commande.
>
> **Clés étrangères** : 
> - `product_uuid` référence `Products(product_uuid)`.
> - `order_number` référence `Orders(order_number)`.

---
