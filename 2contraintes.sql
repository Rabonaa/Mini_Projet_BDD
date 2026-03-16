use kafekalite;

ALTER TABLE Client
    ADD CONSTRAINT pk_client PRIMARY KEY (id_client),
    ADD CONSTRAINT uq_adresse_email UNIQUE (adresse_email),
    ADD CONSTRAINT chk_type_client CHECK (type_client IN ('particulier', 'professionnel'));

ALTER TABLE Commande
    ADD CONSTRAINT pk_commande PRIMARY KEY (id_commande),
    ADD CONSTRAINT chk_statut_commande CHECK (statut_commande IN ('en attente', 'en cours', 'expédiée', 'livrée', 'annulée'));

ALTER TABLE Produits
    ADD CONSTRAINT pk_produit PRIMARY KEY (id_produit),
    ADD CONSTRAINT chk_type_produit CHECK (type_produit IN ('capsule', 'machine', 'accessoire')),
    ADD CONSTRAINT chk_dispo_produit CHECK (disponibilite_produits IN ('disponible', 'indisponible', 'rupture de stock'));

ALTER TABLE Cafe
    ADD CONSTRAINT pk_cafe PRIMARY KEY (id_cafe),
    ADD CONSTRAINT chk_intensite_cafe CHECK (intensite_cafe BETWEEN 1 AND 13),
    ADD CONSTRAINT chk_prix_cafe CHECK (prix_cafe > 0),
    ADD CONSTRAINT chk_dispo_cafe CHECK (disponibilite_cafe IN ('disponible', 'indisponible', 'rupture de stock'));

ALTER TABLE machine_a_cafe
    ADD CONSTRAINT pk_machine PRIMARY KEY (id_machine),
    ADD CONSTRAINT chk_prix_machine CHECK (prix_machine > 0),
    ADD CONSTRAINT chk_capacite_reservoir CHECK (capacite_reservoir > 0),
    ADD CONSTRAINT chk_pression_machine CHECK (pression_machine > 0),
    ADD CONSTRAINT chk_dispo_machine CHECK (disponibilite_machine IN ('disponible', 'indisponible', 'rupture de stock'));

ALTER TABLE accessoire
    ADD CONSTRAINT pk_accessoire PRIMARY KEY (id_accessoire),
    ADD CONSTRAINT chk_prix_accessoire CHECK (prix_accessoire > 0),
    ADD CONSTRAINT chk_dispo_accessoire CHECK (disponibilite_accessoire IN ('disponible', 'indisponible', 'rupture de stock'));

ALTER TABLE abonnement
    ADD CONSTRAINT pk_abonnement PRIMARY KEY (id_abonnement),
    ADD CONSTRAINT chk_dates_abonnement CHECK (date_fin > date_debut);

ALTER TABLE service_client
    ADD CONSTRAINT pk_service_client PRIMARY KEY (id_service_client);

ALTER TABLE faire
    ADD CONSTRAINT pk_faire PRIMARY KEY (id_client, id_commande),
    ADD CONSTRAINT fk_faire_client FOREIGN KEY (id_client) REFERENCES Client(id_client),
    ADD CONSTRAINT fk_faire_commande FOREIGN KEY (id_commande) REFERENCES Commande(id_commande);

ALTER TABLE contenir
    ADD CONSTRAINT pk_contenir PRIMARY KEY (id_commande, id_produit),
    ADD CONSTRAINT fk_contenir_commande FOREIGN KEY (id_commande) REFERENCES Commande(id_commande),
    ADD CONSTRAINT fk_contenir_produit FOREIGN KEY (id_produit) REFERENCES Produits(id_produit);

ALTER TABLE etre
    ADD CONSTRAINT pk_etre PRIMARY KEY (id_produit),
    ADD CONSTRAINT fk_etre_produit FOREIGN KEY (id_produit) REFERENCES Produits(id_produit),
    ADD CONSTRAINT fk_etre_cafe FOREIGN KEY (id_cafe) REFERENCES Cafe(id_cafe),
    ADD CONSTRAINT fk_etre_machine FOREIGN KEY (id_machine) REFERENCES machine_a_cafe(id_machine),
    ADD CONSTRAINT fk_etre_accessoire FOREIGN KEY (id_accessoire) REFERENCES accessoire(id_accessoire),
    ADD CONSTRAINT chk_etre_un_seul CHECK (
        (id_cafe IS NOT NULL AND id_machine IS NULL AND id_accessoire IS NULL) OR
        (id_cafe IS NULL AND id_machine IS NOT NULL AND id_accessoire IS NULL) OR
        (id_cafe IS NULL AND id_machine IS NULL AND id_accessoire IS NOT NULL)
    );

ALTER TABLE souscrire
    ADD CONSTRAINT pk_souscrire PRIMARY KEY (id_client, id_abonnement),
    ADD CONSTRAINT fk_souscrire_client FOREIGN KEY (id_client) REFERENCES Client(id_client),
    ADD CONSTRAINT fk_souscrire_abonnement FOREIGN KEY (id_abonnement) REFERENCES abonnement(id_abonnement);

ALTER TABLE prendre
    ADD CONSTRAINT pk_prendre PRIMARY KEY (id_abonnement, id_cafe),
    ADD CONSTRAINT fk_prendre_abonnement FOREIGN KEY (id_abonnement) REFERENCES abonnement(id_abonnement),
    ADD CONSTRAINT fk_prendre_cafe FOREIGN KEY (id_cafe) REFERENCES Cafe(id_cafe);

ALTER TABLE correspondre
    ADD CONSTRAINT pk_correspondre PRIMARY KEY (id_abonnement, id_machine),
    ADD CONSTRAINT fk_correspondre_abonnement FOREIGN KEY (id_abonnement) REFERENCES abonnement(id_abonnement),
    ADD CONSTRAINT fk_correspondre_machine FOREIGN KEY (id_machine) REFERENCES machine_a_cafe(id_machine);

ALTER TABLE demander
    ADD CONSTRAINT pk_demander PRIMARY KEY (id_client, id_service_client),
    ADD CONSTRAINT fk_demander_client FOREIGN KEY (id_client) REFERENCES Client(id_client),
    ADD CONSTRAINT fk_demander_service FOREIGN KEY (id_service_client) REFERENCES service_client(id_service_client);