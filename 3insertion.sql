use kafekalite;
INSERT INTO Client (id_client, nom_client, prenom_client, adresse_email, numero_telephone, type_client, adresse_de_livraison, moyen_de_paiement, historique, nb_abonnement, points_de_fidelite) VALUES
(1, 'Dupont', 'Michel', 'michel.dupont@email.com', 0612345678, 'particulier', '12 rue de la Paix, Paris', 'carte bancaire', NULL, 1, 150),
(2, 'Potter', 'Harry', 'harry.potter@email.com', 0623456789, 'particulier', '4 Privet Drive, Londres', 'carte bancaire', NULL, 0, 80),
(3, 'Martin', 'Sophie', 'sophie.martin@email.com', 0634567890, 'professionnel', '5 avenue Victor Hugo, Lyon', 'virement', NULL, 1, 320),
(4, 'Bernard', 'Lucas', 'lucas.bernard@email.com', 0645678901, 'particulier', '8 rue du Moulin, Bordeaux', 'carte bancaire', NULL, 0, 50),
(5, 'Leclerc', 'Emma', 'emma.leclerc@email.com', 0656789012, 'professionnel', '22 boulevard Haussmann, Paris', 'virement', NULL, 1, 410);

INSERT INTO Commande (id_commande, produits_commande, statut_commande, numero_suivi) VALUES
(1, 'Capsule Arpeggio x10', 'livrée', 100000001),
(2, 'Machine Vertuo Next', 'en cours', 100000002),
(3, 'Mug collection x2', 'expédiée', 100000003),
(4, 'Capsule Volluto x20', 'en attente', 100000004),
(5, 'Machine Essenza Mini', 'livrée', 100000005);

INSERT INTO Produits (id_produit, disponibilite_produits, type_produit) VALUES
(1, 'disponible', 'capsule'),
(2, 'disponible', 'machine'),
(3, 'disponible', 'accessoire'),
(4, 'rupture de stock', 'capsule');

INSERT INTO Cafe (id_cafe, nom_cafe, disponibilite_cafe, prix_cafe, type_cafe, intensite_cafe) VALUES
(1, 'Arpeggio', 'disponible', 5.90, 'intense', 9),
(2, 'Volluto', 'disponible', 5.90, 'doux', 4),
(3, 'Livanto', 'disponible', 5.90, 'rond', 6),
(4, 'Kazaar', 'rupture de stock', 6.50, 'puissant', 12),
(5, 'Dharkan', 'disponible', 6.50, 'amer', 11);

INSERT INTO machine_a_cafe (id_machine, nom_machine, disponibilite_machine, prix_machine, capacite_reservoir, couleur_machine, pression_machine, compatibilite) VALUES
(1, 'Vertuo Next', 'disponible', 129.99, 1.1, 'noir', 19.00, 'Vertuo'),
(2, 'Essenza Mini', 'disponible', 99.99, 0.6, 'blanc', 19.00, 'Original'),
(3, 'Lattissima One', 'disponible', 199.99, 1.0, 'argent', 19.00, 'Original'),
(4, 'Citiz', 'disponible', 149.99, 1.0, 'rouge', 19.00, 'Original'),
(5, 'Pixie', 'rupture de stock', 119.99, 0.7, 'noir', 19.00, 'Original');

INSERT INTO accessoire (id_accessoire, nom_accessoire, couleur_accessoire, disponibilite_accessoire, prix_accessoire) VALUES
(1, 'Mug collection', 'noir', 'disponible', 12.00),
(2, 'Tasse espresso', 'blanc', 'disponible', 8.00),
(3, 'Aeroccino 4', 'argent', 'disponible', 69.99),
(4, 'Capsulier', 'noir', 'disponible', 25.00),
(5, 'Set tasses x6', 'rouge', 'rupture de stock', 35.00);

INSERT INTO abonnement (id_abonnement, date_debut, date_fin, type_abonnement) VALUES
(1, '2024-01-01', '2025-01-01', 'mensuel'),
(2, '2024-03-15', '2025-03-15', 'annuel'),
(3, '2024-06-01', '2025-06-01', 'mensuel'),
(4, '2024-09-01', '2025-09-01', 'annuel'),
(5, '2024-11-01', '2025-11-01', 'mensuel');

INSERT INTO service_client (id_service_client, service_apres_vente) VALUES
(1, 'retour produit'),
(2, 'panne machine'),
(3, 'commande incorrecte'),
(4, 'remboursement'),
(5, 'renseignement');

INSERT INTO faire (id_client, id_commande) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

INSERT INTO contenir (id_commande, id_produit) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);

INSERT INTO etre (id_produit, id_cafe, id_machine, id_accessoire) VALUES
(1, 1, NULL, NULL),
(2, NULL, 1, NULL),
(3, NULL, NULL, 1),
(4, 2, NULL, NULL);

INSERT INTO souscrire (id_client, id_abonnement) VALUES
(1, 1),
(3, 2),
(5, 3),
(1, 4),
(3, 5);

INSERT INTO prendre (id_abonnement, id_cafe) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

INSERT INTO correspondre (id_abonnement, id_machine) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

INSERT INTO demander (id_client, id_service_client, date_service_client) VALUES
(1, 1, '2024-02-10'),
(2, 2, '2024-04-22'),
(3, 3, '2024-07-05'),
(4, 4, '2024-10-18'),
(5, 5, '2024-12-01');