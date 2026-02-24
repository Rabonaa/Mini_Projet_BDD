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
- Un client possède une adresse de livraison et un moyen de paiement enregistrés dans son compte
- Un client dispose d'un historique de ses commandes passées
- Un client peut s'abonner à un programme de fidélité lui permettant d'accumuler des points
- Un client peut souscrire à zéro ou un abonnement actif à la fois
- Un client peut faire zéro ou plusieurs demandes au service client
- Un client peut passer zéro ou plusieurs commandes

**Produits**

- L'entreprise vend trois catégories de produits : les capsules de café, les machines à café et les accessoires
- Chaque produit est identifié par une référence unique et est caractérisé par un type et un statut de disponibilité
- Une capsule de café est caractérisée par un nom, un prix, un type d'arôme, une disponibilité et une intensité (de 1 à 13)
- Une machine à café est caractérisée par un nom, un prix, une disponibilité, une capacité de réservoir, une couleur, une pression et une compatibilité avec certaines gammes de capsules
- Un accessoire est caractérisé par un nom, une couleur, une disponibilité et un prix
- Un produit est obligatoirement soit une capsule, soit une machine à café, soit un accessoire

**Commandes**

- Une commande est passée par un client ; un client peut passer plusieurs commandes
- Une commande peut contenir un ou plusieurs produits
- Un produit peut être contenu dans zéro ou plusieurs commandes
- Une commande possède un statut, un numéro de suivi et une liste de produits commandés

**Abonnements**

- Un client peut souscrire à zéro ou un abonnement
- Un abonnement est souscrit par zéro ou plusieurs clients
- Un abonnement est caractérisé par une date de début, une date de fin et un type
- Un abonnement correspond obligatoirement à une machine à café
- Un abonnement peut inclure une ou plusieurs capsules de café

**Service client**

- Un client peut faire zéro ou plusieurs demandes au service client
- Une demande de service client est associée à une date et un type de service après-vente

---

## Dictionnaire de données brutes

| Signification de la donnée | Type | Taille |
|---|---|---|
| Identifiant unique du client | Numérique | 10 chiffres |
| Nom du client | Alphabétique | 50 caractères |
| Prénom du client | Alphabétique | 50 caractères |
| Adresse e-mail du client | Alphanumérique | 100 caractères |
| Numéro de téléphone du client | Numérique | 15 chiffres |
| Type de client | Alphabétique | 50 caractères |
| Adresse de livraison du client | Alphanumérique | 50 caractères |
| Moyen de paiement du client | Alphanumérique | 20 caractères |
| Historique des commandes du client | Alphanumérique | 100 caractères |
| Nombre d'abonnements du client | Numérique | 5 chiffres |
| Points de fidélité du client | Numérique | 10 chiffres |
| Identifiant unique du produit | Numérique | 10 chiffres |
| Disponibilité du produit | Alphabétique | 20 caractères |
| Type de produit | Alphabétique | 30 caractères |
| Identifiant unique de la capsule de café | Numérique | 10 chiffres |
| Nom de la capsule de café | Alphabétique | 20 caractères |
| Disponibilité de la capsule | Alphabétique | 20 caractères |
| Prix de la capsule | Numérique décimal | 15 chiffres |
| Type / arôme de la capsule | Alphabétique | 20 caractères |
| Intensité de la capsule | Numérique | 2 chiffres |
| Identifiant unique de la machine à café | Numérique | 10 chiffres |
| Nom de la machine à café | Alphabétique | 30 caractères |
| Disponibilité de la machine | Alphabétique | 20 caractères |
| Prix de la machine | Numérique décimal | 15 chiffres |
| Capacité du réservoir de la machine | Numérique décimal | 15 chiffres |
| Couleur de la machine | Alphabétique | 20 caractères |
| Pression de la machine | Numérique décimal | 15 chiffres |
| Compatibilité de la machine avec les gammes de capsules | Alphabétique | 20 caractères |
| Identifiant unique de l'accessoire | Numérique | 10 chiffres |
| Nom de l'accessoire | Alphabétique | 50 caractères |
| Couleur de l'accessoire | Alphabétique | 20 caractères |
| Disponibilité de l'accessoire | Alphabétique | 20 caractères |
| Prix de l'accessoire | Numérique décimal | 15 chiffres |
| Identifiant unique de la commande | Numérique | 10 chiffres |
| Produits inclus dans la commande | Alphanumérique | 100 caractères |
| Statut de la commande | Alphabétique | 20 caractères |
| Numéro de suivi du transporteur | Numérique | 10 chiffres |
| Identifiant unique de l'abonnement | Numérique | 10 chiffres |
| Date de début de l'abonnement | Date | 10 caractères |
| Date de fin de l'abonnement | Date | 10 caractères |
| Type de l'abonnement | Alphanumérique | 50 caractères |
| Date de la demande au service client | Date | 10 caractères |
| Identifiant unique de la demande service client | Numérique | 10 chiffres |
| Type de service après-vente | Alphanumérique | 50 caractères |
