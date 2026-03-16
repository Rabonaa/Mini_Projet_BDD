-- drop database kafekalite;
 create database kafekalite;

use kafekalite;

CREATE TABLE Client (
    id_client INT NOT NULL,
    nom_client VARCHAR(50) NOT NULL,
    prenom_client VARCHAR(50) NOT NULL,
    adresse_email VARCHAR(100) NOT NULL,
    numero_telephone INT,
    type_client VARCHAR(50) NOT NULL,
    adresse_de_livraison VARCHAR(50) NOT NULL,
    moyen_de_paiement VARCHAR(20) NOT NULL,
    historique VARCHAR(100),
    nb_abonnement INT,
    points_de_fidelite INT
);

CREATE TABLE Commande (
    id_commande INT NOT NULL,
    produits_commande VARCHAR(100) NOT NULL,
    statut_commande VARCHAR(20) NOT NULL,
    numero_suivi INT NOT NULL
);

CREATE TABLE Produits (
    id_produit INT NOT NULL,
    disponibilite_produits VARCHAR(20) NOT NULL,
    type_produit VARCHAR(30) NOT NULL
);

-- Table Cafe
CREATE TABLE Cafe (
    id_cafe INT NOT NULL,
    nom_cafe VARCHAR(20) NOT NULL,
    disponibilite_cafe VARCHAR(20) NOT NULL,
    prix_cafe DECIMAL(15,2) NOT NULL,
    type_cafe VARCHAR(20) NOT NULL,
    intensite_cafe INT NOT NULL
);

CREATE TABLE machine_a_cafe (
    id_machine INT NOT NULL,
    nom_machine VARCHAR(30) NOT NULL,
    disponibilite_machine VARCHAR(20) NOT NULL,
    prix_machine DECIMAL(15,2) NOT NULL,
    capacite_reservoir DECIMAL(15,1) NOT NULL,
    couleur_machine VARCHAR(20) NOT NULL,
    pression_machine DECIMAL(15,2) NOT NULL,
    compatibilite VARCHAR(20) NOT NULL
);

-- Table accessoire
CREATE TABLE accessoire (
    id_accessoire INT NOT NULL,
    nom_accessoire VARCHAR(50) NOT NULL,
    couleur_accessoire VARCHAR(20) NOT NULL,
    disponibilite_accessoire VARCHAR(20) NOT NULL,
    prix_accessoire DECIMAL(15,2) NOT NULL
);

-- Table abonnement
CREATE TABLE abonnement (
    id_abonnement INT NOT NULL,
    date_debut DATE NOT NULL,
    date_fin DATE NOT NULL,
    type_abonnement VARCHAR(50) NOT NULL
);

CREATE TABLE service_client (
    id_service_client INT NOT NULL,
    service_apres_vente VARCHAR(50) NOT NULL
);

CREATE TABLE faire (
    id_client INT NOT NULL,
    id_commande INT NOT NULL
);

CREATE TABLE contenir (
    id_commande INT NOT NULL,
    id_produit INT NOT NULL
);

CREATE TABLE etre (
    id_produit INT NOT NULL,
    id_cafe INT,
    id_machine INT,
    id_accessoire INT
);

CREATE TABLE souscrire (
    id_client INT NOT NULL,
    id_abonnement INT NOT NULL
);

CREATE TABLE prendre (
    id_abonnement INT NOT NULL,
    id_cafe INT NOT NULL
);

CREATE TABLE correspondre (
    id_abonnement INT NOT NULL,
    id_machine INT NOT NULL
);

CREATE TABLE demander (
    id_client INT NOT NULL,
    id_service_client INT NOT NULL,
    date_service_client DATE NOT NULL
);