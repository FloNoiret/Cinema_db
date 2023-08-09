-- Vue pour le programme CineDumas
CREATE VIEW CineDumas_Programme AS
SELECT
    s.name AS salle_name,
    p.date AS projection_date,
    p.time AS projection_time,
    m.title AS movie_title
FROM
    cinemas c
JOIN
    salles s ON c.id = s.cinema
JOIN
    projections p ON s.id = p.salle
JOIN
    movies m ON p.movie = m.id
WHERE
    c.id = 1;

-- Vue pour le programme Lumières
CREATE VIEW Lumieres_Programme AS
SELECT
    s.name AS salle_name,
    p.date AS projection_date,
    p.time AS projection_time,
    m.title AS movie_title
FROM
    cinemas c
JOIN
    salles s ON c.id = s.cinema
JOIN
    projections p ON s.id = p.salle
JOIN
    movies m ON p.movie = m.id
WHERE
     c.id = 2;

-- Vue pour le Programme au Mozart Cinema
CREATE VIEW Mozart_Programme AS
SELECT
    s.name AS salle_name,
    p.date AS projection_date,
    p.time AS projection_time,
    m.title AS movie_title
FROM
    cinemas c
JOIN
    salles s ON c.id = s.cinema
JOIN
    projections p ON s.id = p.salle
JOIN
    movies m ON p.movie = m.id
WHERE
    c.id = 3;


-- Voir les commandes par client
CREATE VIEW Commandes_Details AS
SELECT
   u.surname AS nom_client,
   u.name AS prenom_client,
   u.email AS email_client,
    
   t.name AS tarifs,
   t.price AS price,

   b.onlinePaiement AS paiement_en_ligne,
  
    p.date AS projection_date,
    p.time AS projection_time,
  
    m.title AS movie_title,

    c.name AS cinema
  
FROM
    tickets b
JOIN
    users u ON b.customer = u.id
JOIN
    tarifs t ON b.tarifs = t.id
JOIN
    projections p ON b.projection = p.id
JOIN
    movies m ON p.movie = m.id
JOIN
    salles s ON p.salle = s.id
JOIN
    cinemas c ON s.cinema = c.id;
  

-- Voir les projections dans les cinémas

CREATE VIEW Projection_by_Cinema AS
SELECT
    c.name AS cinema_name,
    p.date AS projection_date,
    p.time AS projection_time,
    m.title AS movie_title
FROM
    cinemas c
JOIN
    salles s ON c.id = s.cinema
JOIN
    projections p ON s.id = p.salle
JOIN
    movies m ON p.movie = m.id;
