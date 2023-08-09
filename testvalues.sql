-- Jeu de Données de tests

INSERT INTO users (surname, name, roles, email)
 VALUES
 ('CEZAIRE', 'Virginie', 'ROLE_CUSTOMER', 'c.virginie@test.fr'),
('Carambar', 'Haribo', 'ROLE_CUSTOMER', 'haribo@test.fr'),
('Dragibus', 'Gus', 'ROLE_CUSTOMER', 'gus@test.fr');



INSERT INTO tarifs (name, price)
 VALUES
 ('Plein', 9.20),
 ('Etudiant', 7.60),
 ('-14', 5.90);


INSERT INTO movies (title, description, blockbuster)
 VALUES
 ('Barbie', "Barbie, qui vit à Barbie Land, est expulsée du pays pour être loin dêtre une poupée à lapparence parfaite; n'ayant nulle part où aller, elle part pour le monde humain et cherche le vrai bonheur.", 1),
 ('Incendie', "Lorsque le notaire Lebel fait à Jeanne et Simon Marwan la lecture du testament de leur mère Nawal, les jumeaux sont sidérés de se voir remettre deux enveloppes, l'une destinée à un père qu'ils croyaient mort et l'autre à un frère dont ils ignoraient l'existence. Jeanne voit dans cet énigmatique legs la clé du silence de Nawal, enfermée ces dernières années dans un mutisme obstiné depuis son lit d'hôpital. Elle part au Moyen-Orient exhumer le passé de cette famille dont elle ne sait presque rien.", 0),
 ('Oppenheimer', "Pendant la Seconde Guerre mondiale, le lieutenant-général Leslie Groves Jr. nomme le physicien J. Robert Oppenheimer pour travailler sur le projet ultra-secret Manhattan. Oppenheimer et une équipe de scientifiques passent des années à développer et à concevoir la bombe atomique. Leur travail se concrétise le 16 juillet 1945, alors qu'ils assistent à la première explosion nucléaire au monde, changeant à jamais le cours de l'histoire.", 1),
   ('Dragons', "Hiccup est un adolescent viking de l'île de Berk, où se battre avec des dragons est un mode de vie. Ses idées progressistes et son sens de l'humour étrange le tiennent à part des autres, malgré le fait que son père est le chef du clan. Entraîné dans une école de combat de dragon, il essaie de prouvr qu'il est un vrai viking. Mais quand il se lie d'amitier avec un dragon blessé qu'il nomme Kromou, il a la chance de tracer une nouvelle voie pour l'avenir de son peuple.", 0),
   ('WANTED', "Ayant appris que son père, tué la veille, était un assassin d'élite faisant partie d'une organisation millénaire appelée la Fraternité, un modeste employé de bureau accepte de se joindre à ce groupe et de se soumettre à un entraînement exigeant au terme duquel il se découvre une habileté insoupçonnée. Se sentant fin prêt, il part pour l'Europe, berceau de la Fraternité, afin d'affronter l'assassin de son père, qui fait lui aussi partie de l'organisation.", 0);



INSERT INTO cinemas (name, address, manager)
 VALUES
  ('CinéDumas', '2 rue Magellan, 13000 AIX EN PROVENCE', 2),
  ('Lumières !', '40 avenue Hubert, 33000 BORDEAUX', 3),
  ('Mozart Cinema', '15 rue Claude Nicolas Ledoux, 94000 CRETEIL', 4);



INSERT INTO salles (name, seats, cinema)
 VALUES
 ('1', 100, 1),
 ('2', 500, 1),
 ('3', 60, 1),
 ('4', 1200, 1),
 ('5', 1200, 1),
 ('6', 800, 1),
 ('Babar', 400, 2),
 ('Pikachu', 100, 2),
 ('SOS Fantome', 3500, 2),
 ('Avatar', 1600, 2),
 ('ComedyClub', 400, 2),
 ('10', 2000, 3),
 ('11', 500, 3),
 ('12', 500, 3),
 ('20', 800, 3),
 ('21', 400, 3),
 ('22', 200, 3),
 ('30', 230, 3),
 ('31', 230, 3);




INSERT INTO projections (date,time, movie, salle, reservedSeats)
 VALUES
 ('2023-08-05','18:30' , 1, 5, 1180),
  ('2023-08-05','18:30' , 1, 9, 3495),
  ('2023-08-05','18:30' , 1, 12, 1500),
  ('2023-08-05','21:00' , 1, 5, 100),
  ('2023-08-05','21:00' , 1, 9, 3000),
  ('2023-08-05','21:00' , 1, 12, 2000),
  ('2023-08-05','19:30', 2, 1, 80),
  ('2023-08-05','21:30', 4, 2, 470),
  ('2023-08-05','17:30', 5, 3, 40),
   ('2023-08-05','18:30', 4, 4, 1180),
  ('2023-08-05','16:00', 5, 6, 800),
  ('2023-08-05','18:30', 2, 7, 300),
   ('2023-08-05','15:00', 5, 8, 60),
  ('2023-08-05','18:17', 4, 10, 1551),
  ('2023-08-05','18:00', 2, 11, 390),
   ('2023-08-05','18:30', 5, 13, 385),
  ('2023-08-05','20:30', 4, 14, 452),
  ('2023-08-05','15:30' , 3, 5, 1180),
  ('2023-08-05','15:30' , 3, 9, 3500),
  ('2023-08-05','15:30' , 3, 12, 1604),
  ('2023-08-05','23:15' , 3, 5, 100),
  ('2023-08-05','23:15' , 3, 9, 3000),
  ('2023-08-05','23:15' , 3, 12, 1890);

INSERT INTO tickets (customer, projection, tarifs, onlinePaiement)
 VALUES
 (5, 1, 1, 0),
 (5, 1, 1, 0),
 (5, 1, 3, 0),
 (6, 8, 2, 1),
 (7, 15, 1, 1),
 (7, 2, 1, 1);