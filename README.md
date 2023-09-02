# Réalisation d'une base de données pour une enseigne de cinemas

Afin de créer un logiciel de réservation de place de cinema, mon rôle est de modéliser la base de données qui lui sera associé. 

Le besoin du client était le suivant : 
+ Plusieurs cinémas existants
+ Plusieurs salles dans un cinema
+ Des projections dans les salles de cinéma, parfois à la même date et heure s'il s'agit d'un blockbuster. 
+ Un nombre de place limité selon la salle
+ 3 types de tarifs : - Plein tarif: 9€20 - Étudiant: 7€60 - Moins de 14 ans: 5€90
+ Paiement sur place et en ligne
+ Un manager d'une salle peut gérer les projections de ses salles uniquement.
+ Un administrateur peut tout gérer, notamment l'ajout des blockbusters.

Ainsi, j'ai divisé mes fichiers pour la création de ma base de données en plusieurs fichiers SQL: 

1. Main = Création de la base données et de ses tables
2. ManagementAccess = Creation des managers et admin, des fonctions pour les différentes actions (ajout, modification et suppression projection, ajout blockbuster) et les permissions.
3. Triggers = Ajout d'une reservation à une projection et verification du nombre de places & Event avec script de sauvegarde et dump sql.
4. Views = Permettre de visualiser et comprendre les données plus facilement.
5. testvalues= Un jeu de données pour faire des tests sur la base de données.

# Sécurisation de la base de données
Afin de mieux sécuriser la base de données, il faudrait hasher les mots de passe des utilisateurs ou utiliser des variables d'environnements. 
Tout comme pour la protection contre les injections SQL, la sécurisation des mots de passe devra être faite lors de l'élaboration du logiciel final. 
