
/* INITIALISATION DE LA BDD (SANS DATA), MERCI DE RECUPERER 
               LES SAUVEGARDES POUR LA DATA                    */

-------------------------------------------------
-- Étape 1 : Création de la base de données
-------------------------------------------------

CREATE DATABASE aubondeal;
\c aubondeal;  

--------------------------------------------------------------------------------
-- Étape 2 : Création de l'utilisateur et des rôles avec des permissions limitées
---------------------------------------------------------------------------------

CREATE USER martial WITH PASSWORD 'mdp';
CREATE ROLE manager;

--------------------------------------------------------
-- Étape 3 : Attribution du rôle à l'user martial
---------------------------------------------------------

GRANT manager TO martial;

--------------------------------------------------------------------------------------------
-- Étape 4 : Création de l'extension pgcrypto pour le hachage et uuid-ossp pour les UUIDs
------------------------------------------------------------------------------------------

CREATE EXTENSION IF NOT EXISTS "pgcrypto";
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

------------------------------------------------------------------
-- Étape 5 : Création des tables 
-----------------------------------------------------------

CREATE TABLE Users (
    user_uuid UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_pseudo VARCHAR(100) NOT NULL,
    username VARCHAR(100) UNIQUE NOT NULL,
    user_password VARCHAR(100) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT NOW()
);


CREATE TABLE Orders (
    order_number SERIAL PRIMARY KEY,
    order_total_cost_ht NUMERIC(10, 2) NOT NULL,
    order_total_quantity INTEGER NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    deliver_at TIMESTAMP,
    user_uuid UUID NOT NULL,
    FOREIGN KEY (user_uuid) REFERENCES Users(user_uuid) ON UPDATE CASCADE
);


CREATE TABLE Products (
    product_uuid UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    product_name VARCHAR(100) NOT NULL,
    product_description TEXT,
    product_price NUMERIC(10, 2) NOT NULL,
    product_quantity INTEGER NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP
);


CREATE TABLE Belong (
    product_uuid UUID NOT NULL,
    order_number INTEGER NOT NULL,
    PRIMARY KEY (product_uuid, order_number),
    FOREIGN KEY (product_uuid) REFERENCES Products(product_uuid) ON UPDATE CASCADE,
    FOREIGN KEY (order_number) REFERENCES Orders(order_number) ON UPDATE CASCADE
);


CREATE OR REPLACE FUNCTION hash_password() RETURNS TRIGGER AS $$
BEGIN
    NEW.user_password := crypt(NEW.user_password, gen_salt('bf'));
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

----------------------------------------------------------------------------------------------------
-- Trigger pour hacher automatiquement le mot de passe lors de l'insertion ou de la mise à jour
---------------------------------------------------------------------------------------------------------

CREATE TRIGGER hash_user_password
BEFORE INSERT OR UPDATE OF user_password ON Users
FOR EACH ROW
EXECUTE FUNCTION hash_password();

-------------------------------------------------------------------------------------
-- Fonction de trigger pour mettre à jour le champ updated_at lors d'un update
----------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION set_updated_at() RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at := NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-------------------------------------------------------------------------------------
-- Trigger pour mettre à jour automatiquement updated_at lors d'un update sur Products
---------------------------------------------------------------------------------------

CREATE TRIGGER update_timestamp
BEFORE UPDATE ON Products
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

---------------------------------------------------------
-- Étape 7 : Attribution des privilèges au rôle
---------------------------------------------------------

-- Accorder les privilèges de sélection et de mise à jour au rôle manager
GRANT SELECT, UPDATE ON TABLE Users, Orders, Products, Belong TO manager;

-- Révoquer les privilèges de mise à jour pour les autres utilisateurs (sauf manager)
REVOKE UPDATE ON TABLE Users, Orders, Products, Belong FROM PUBLIC;


