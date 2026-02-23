# Mini_Projet_BDD
<img width="1352" height="811" alt="screenshot_pjbdd" src="https://github.com/user-attachments/assets/add39643-f759-4f16-88db-b52176575015" />

Règles de gestion et dictionnaire de données utilisées générées par l'IA Générative avec le prompt suivant :

"Tu travailles dans le domaine du café. Ton entreprise a comme activité la vente de café en capsules, de machine à café et des accessoires (tasses, mug…). C’est une entreprise comme Nespresso. Les données de clients et réservation doivent être collectées. Inspire-toi du site web suivant : https://www.nespresso.com/fr/fr.
Ton entreprise veut appliquer MERISE pour concevoir un système d'information. Tu es chargé de la partie analyse, c’est-à-dire de collecter les besoins auprès de l’entreprise. Elle a fait appel à un étudiant en ingénierie informatique pour réaliser ce projet, tu dois lui fournir les informations nécessaires pour qu’il applique ensuite lui-même les étapes suivantes de conception et développement de la base de données. 
D’abord, établis les règles de gestions des données de ton entreprise, sous la forme d'une liste à puce. Elle doit correspondre aux informations que fournit quelqu’un qui connaît le fonctionnement de l’entreprise, mais pas comment se construit un système d’information.
Ensuite, à partir de ces règles, fournis un dictionnaire de données brutes avec les colonnes suivantes, regroupées dans un tableau : signification de la donnée, type, taille en nombre de caractères ou de chiffres. Il doit y avoir entre 25 et 35 données. Il sert à fournir des informations supplémentaires sur chaque donnée (taille et type) mais sans a priori sur comment les données vont être modélisées ensuite.
Fournis donc les règles de gestion et le dictionnaire de données."

Voici alors ce que l'IA a généré :

## Règles de gestion des données

**Clients**

- Un client peut être particulier ou professionnel (entreprise, hôtel, restaurant…)
- Un client est identifié par son adresse e-mail, qui est unique
- Un client peut posséder plusieurs adresses de livraison enregistrées dans son compte
- Un client peut enregistrer plusieurs moyens de paiement dans son espace personnel
- Un client dispose d'un historique de toutes ses commandes passées
- Un client peut s'abonner à un programme de fidélité lui permettant d'accumuler des points

**Produits**

- L'entreprise vend trois catégories de produits : les capsules, les machines à café et les accessoires
- Une capsule est caractérisée par un nom, une intensité (de 1 à 13), un type d'arôme, un volume de tasse compatible (espresso, lungo, mug…) et un conditionnement (nombre de capsules par boîte)
- Une machine à café est caractérisée par une couleur, une pression en bars, une capacité du réservoir d'eau et une compatibilité avec certaines gammes de capsules
- Un accessoire (tasse, mug, mousseur…) est caractérisé par une matière, une contenance et une couleur
- Chaque produit possède une référence unique, un nom commercial, un prix unitaire TTC et un statut (disponible, en rupture, discontinué)
- Un produit peut appartenir à une collection ou une édition limitée

**Commandes**

- Une commande est passée par un client authentifié ou, pour les achats ponctuels, par un client invité
- Une commande peut contenir plusieurs produits de catégories différentes, en quantités variables
- Chaque commande est associée à une adresse de livraison et à un mode de paiement
- Une commande a un statut qui évolue : en attente de validation, confirmée, en préparation, expédiée, livrée, annulée, retournée
- Un numéro de suivi de transporteur est associé à la commande dès son expédition
- Une commande peut être le résultat d'un abonnement récurrent (livraison automatique à fréquence choisie)

**Abonnements**

- Un client peut souscrire à un abonnement pour recevoir automatiquement des capsules à intervalles réguliers (toutes les 2, 4, 6 ou 8 semaines)
- Un abonnement porte sur un ou plusieurs produits avec une quantité définie pour chaque
- Un abonnement peut être suspendu, modifié ou résilié par le client à tout moment
- Un abonnement a une date de début et, le cas échéant, une date de fin

**Boutiques et service client**

- L'entreprise dispose de boutiques physiques, chacune associée à une ville, une adresse et des horaires d'ouverture
- Un client peut réserver un rendez-vous en boutique pour un essai de machine ou un conseil personnalisé
- Une réservation est associée à un client, une boutique, une date et un créneau horaire
- Le service client enregistre les demandes de contact (type de demande, message, statut de traitement)

---

## Dictionnaire de données brutes

| Signification de la donnée | Type | Taille |
|---|---|---|
| Adresse e-mail du client | Alphanumérique | 100 caractères |
| Mot de passe du client (haché) | Alphanumérique | 255 caractères |
| Prénom du client | Alphabétique | 50 caractères |
| Nom du client | Alphabétique | 50 caractères |
| Numéro de téléphone du client | Numérique | 15 chiffres |
| Type de client (particulier / professionnel) | Alphabétique | 15 caractères |
| Nom de l'entreprise (si client professionnel) | Alphanumérique | 100 caractères |
| Adresse postale de livraison (rue et numéro) | Alphanumérique | 150 caractères |
| Code postal de livraison | Numérique | 5 chiffres |
| Ville de livraison | Alphabétique | 80 caractères |
| Pays de livraison | Alphabétique | 60 caractères |
| Solde de points de fidélité du client | Numérique | 6 chiffres |
| Référence unique du produit | Alphanumérique | 20 caractères |
| Nom commercial du produit | Alphanumérique | 100 caractères |
| Catégorie du produit (capsule / machine / accessoire) | Alphabétique | 15 caractères |
| Prix unitaire TTC du produit | Numérique décimal | 7 chiffres (2 décimales) |
| Statut du produit (disponible, rupture, discontinué) | Alphabétique | 15 caractères |
| Intensité de la capsule | Numérique | 2 chiffres |
| Volume de tasse compatible (espresso, lungo…) | Alphabétique | 20 caractères |
| Nombre de capsules par boîte | Numérique | 3 chiffres |
| Numéro de commande | Alphanumérique | 20 caractères |
| Date de passation de la commande | Date | 10 caractères |
| Statut de la commande | Alphabétique | 20 caractères |
| Numéro de suivi du transporteur | Alphanumérique | 30 caractères |
| Quantité d'un produit dans la commande | Numérique | 4 chiffres |
| Fréquence de l'abonnement (en semaines) | Numérique | 2 chiffres |
| Date de début de l'abonnement | Date | 10 caractères |
| Statut de l'abonnement (actif, suspendu, résilié) | Alphabétique | 15 caractères |
| Nom de la boutique | Alphanumérique | 100 caractères |
| Adresse de la boutique | Alphanumérique | 150 caractères |
| Ville de la boutique | Alphabétique | 80 caractères |
| Horaires d'ouverture de la boutique | Alphanumérique | 200 caractères |
| Date de la réservation en boutique | Date | 10 caractères |
| Créneau horaire de la réservation | Alphanumérique | 10 caractères |
| Type de demande au service client | Alphabétique | 50 caractères |
