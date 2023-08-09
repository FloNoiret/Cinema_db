-- Creation of the database
-- create database cinema_db; 

-- Go into database
-- use cinema_db

-- User table

CREATE TABLE `users`(
`id` int(11) NOT NULL,
`surname` varchar(50) not null,
`name` varchar(50) not null,
`roles` varchar(80),
`email` varchar(250) not null);

-- Index pour la table `users`

ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

-- AUTO_INCREMENT pour la table `users`

ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;



-- tickets Table

CREATE TABLE `tickets`(
`id` int(11) NOT NULL,
`customer` int(11) NOT NULL,
`projection` int(11) not null,
`tarifs` int(11) not null,
`onlinePaiement` boolean DEFAULT 0);

-- Index pour la table `tickets`

ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer` (`customer`), 
  ADD KEY `projection` (`projection`), 
  ADD KEY `tarifs` (`tarifs`);

-- AUTO_INCREMENT pour la table `tickets`

ALTER TABLE `tickets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;




-- Tarifs table

CREATE TABLE `tarifs`(
`id` int(11) NOT NULL,
`name` varchar(50) not null,
`price` DECIMAL(4,1) not null);

-- Index pour la table `tarifs`

ALTER TABLE `tarifs`
  ADD PRIMARY KEY (`id`);

-- AUTO_INCREMENT pour la table `tarifs`

ALTER TABLE `tarifs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;



-- Movies Table

CREATE TABLE `movies`(
`id` int(11) NOT NULL,
`title` varchar(50) not null,
`description` longtext, 
`blockbuster` boolean DEFAULT 0);

-- Index pour la table `movies`

ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`);

-- AUTO_INCREMENT pour la table `movies`

ALTER TABLE `movies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;


-- Salles Table

CREATE TABLE `salles`(
`id` int(11) NOT NULL,
`name` varchar(50) not null,
`seats` int(11) NOT NULL,
`cinema` int(11) not null);

-- Index pour la table `salles`

ALTER TABLE `salles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cinema` (`cinema`);

-- AUTO_INCREMENT pour la table `salles`

ALTER TABLE `salles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;





-- Cinemas Table

CREATE TABLE `cinemas`(
`id` int(11) NOT NULL,
`name` varchar(50) not null,
`address` varchar(180) not null, 
`manager` int(11) NOT NULL);

-- Index pour la table `cinemas`

ALTER TABLE `cinemas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `manager` (`manager`);

-- AUTO_INCREMENT pour la table `cinemas`

ALTER TABLE `cinemas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;




-- Seances Projections Table

CREATE TABLE `projections`(
`id` int(11) NOT NULL,
`date` date NOT NULL,
`time` time not null,
`movie` int(11) not null,
`salle` int(11) not null,
`reservedSeats` int(11) DEFAULT 0);

-- Index pour la table `projections`

ALTER TABLE `projections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `movie` (`movie`), 
  ADD KEY `salle` (`salle`);

-- AUTO_INCREMENT pour la table `projections`

ALTER TABLE `projections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;




-- Contraintes relationnelles pour la table `cinema`
ALTER TABLE `cinemas`
  ADD CONSTRAINT `cinemas_ibfk_1` FOREIGN KEY (`manager`) REFERENCES `users` (`id`);

-- Contraintes relationnelles pour la table `salles`

ALTER TABLE `salles`
  ADD CONSTRAINT `salles_ibfk_1` FOREIGN KEY (`cinema`) REFERENCES `cinemas` (`id`);

-- Contraintes relationnelles pour la table `projections`

ALTER TABLE `projections`
  ADD CONSTRAINT `projections_ibfk_1` FOREIGN KEY (`movie`) REFERENCES `movies` (`id`),
  ADD CONSTRAINT `projections_ibfk_2` FOREIGN KEY (`salle`) REFERENCES `salles` (`id`);

-- Contraintes relationnelles pour la table `tickets`
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`customer`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `tickets_ibfk_2` FOREIGN KEY (`projection`) REFERENCES `projections` (`id`),
  ADD CONSTRAINT `tickets_ibfk_3` FOREIGN KEY (`tarifs`) REFERENCES `tarifs` (`id`);