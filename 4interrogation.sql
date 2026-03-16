use kafekalite;

-- On affiche les prix et le nom des cafés ayant comme nom : "volluto" ou "arpeggio"
SELECT prix_cafe, nom_cafe
FROM cafe
WHERE nom_cafe IN('Volluto', 'Arpeggio');

-- On affiche les machines ayant un prix entre 100 euros et 150 euros
SELECT nom_machine, prix_machine
FROM machine_a_cafe
WHERE prix_machine BETWEEN 100 AND 150;

-- On affiche les produits disponibles et en rupture de stock
SELECT type_produit, disponibilite_produits
FROM produits
WHERE disponibilite_produits IN('disponible', 'rupture de stock');

-- On affiche les abonnements ainsi que son type, qui vont finir entre l'année 2024 et 2025
SELECT id_abonnement, type_abonnement
FROM abonnement
WHERE year(date_fin) BETWEEN 2024 AND 2025;

-- On affiche les produits commandés en cours et expédié
SELECT produits_commande, statut_commande
FROM commande
WHERE statut_commande IN('en cours', 'expédiée');


-- On affiche les clients de type professionnel
SELECT nom_client, prenom_client, adresse_email, adresse_de_livraison
FROM client
WHERE type_client = 'professionnel'
ORDER BY nom_client ASC;

-- On affiche les commandes livrées et expédiées par ordre croissant de leurs identifiants
SELECT id_commande, produits_commande, statut_commande, numero_suivi
FROM Commande
WHERE statut_commande IN ('livrée', 'expédiée')
ORDER BY id_commande ASC;

-- On affiche les clients ayant plus de 100 points de fidélité par ordre alphabétique
SELECT id_client, nom_client, prenom_client
FROM client
WHERE points_de_fidelite > 100
ORDER BY nom_client ASC;

-- On affiche la moyenne des prix des machines regroupées par couleurs depassant 120 euros 
SELECT  couleur_machine, AVG(prix_machine) AS prix_moyen
FROM machine_a_cafe
GROUP BY couleur_machine
HAVING AVG(prix_machine) > 120;

-- On affiche le nombre d'abonnement si c'est supérieur à 1, par type d'abonnement 
SELECT type_abonnement, COUNT(*) AS nb_abonnements
FROM abonnement
GROUP BY type_abonnement
HAVING COUNT(*) > 1;

-- On affiche le nombre de clients par type de client
SELECT type_client, COUNT(*) AS nb_clients
FROM client
GROUP BY type_client;

-- On affiche le total et la moyenne des points de fidélité pour chaque type de client
SELECT type_client,
       SUM(points_de_fidelite) AS total_points,
       AVG(points_de_fidelite) AS moyenne_points
FROM client
GROUP BY type_client;

/*-----------------------*/
-- On affiche le nom des capsules de café qui sont disponibles
SELECT  nom_cafe 
FROM produits p
JOIN etre e ON p.id_produit = e.id_produit
JOIN cafe c ON e.id_cafe = c.id_cafe
WHERE disponibilite_produits = 'disponible';

-- On affiche les identifiants des produits compatibles avec "vertuo"
SELECT p.id_produit
FROM Produits p
JOIN etre e ON p.id_produit = e.id_produit
JOIN machine_a_cafe m_a_c ON e.id_machine = m_a_c.id_machine
WHERE m_a_c.compatibilite = 'Vertuo';

-- On affiche tous les clients avec leurs commandes associées, y compris les clients qui n'ont passé aucune commande
SELECT c.nom_client, c.prenom_client, co.id_commande, co.statut_commande
FROM client c
LEFT JOIN faire f ON c.id_client = f.id_client
LEFT JOIN Commande co ON f.id_commande = co.id_commande;

-- On affiche tous les services client avec les clients qui ont fait une demande, y compris les services qui n'ont reçu aucune demande
SELECT sc.service_apres_vente, c.nom_client, c.prenom_client, d.date_service_client
FROM Client c
RIGHT JOIN demander d ON c.id_client = d.id_client
RIGHT JOIN service_client sc ON d.id_service_client = sc.id_service_client;


-- les machines ayant un prix supérieur à la moyenne des prix des machines
SELECT nom_machine, prix_machine
FROM machine_a_cafe
WHERE prix_machine > (
    SELECT AVG(prix_machine) FROM machine_a_cafe
);
-- On affiche les clients ayant fait une demande pour une panne de machine
SELECT nom_client, prenom_client, adresse_email
FROM Client
WHERE id_client IN (
    SELECT id_client FROM demander
    WHERE id_service_client IN (
        SELECT id_service_client FROM service_client WHERE service_apres_vente = 'panne machine'
    )
);

-- On affiche les abonnements correspondant à une machine qui doit être disponible
SELECT id_abonnement, type_abonnement, date_debut, date_fin
FROM abonnement
WHERE id_abonnement IN (
    SELECT id_abonnement FROM correspondre
    WHERE id_machine IN (
        SELECT id_machine FROM machine_a_cafe WHERE disponibilite_machine = 'disponible'
    )
);

-- On affiche les produits contenus dans une commande livrée
SELECT id_produit, type_produit
FROM Produits
WHERE id_produit IN (
    SELECT id_produit FROM contenir
    WHERE id_commande IN (
        SELECT id_commande FROM Commande WHERE statut_commande = 'livrée'
    )
);

-- On affiche les clients avec leur type ayant souscrit à un abonnement
SELECT nom_client, prenom_client, type_client
FROM Client c
WHERE EXISTS (
    SELECT * FROM souscrire s WHERE s.id_client = c.id_client
);







