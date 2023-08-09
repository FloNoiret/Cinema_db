-- Management de la base de données par les managers & administrateurs

DELIMITER //
CREATE USER 'Cinema_DB'@'localhost' IDENTIFIED BY PASSWORD 'vgzeuirè25de';
CREATE USER 'CineDumas'@'localhost' IDENTIFIED BY PASSWORD 'fzeccezfr';
CREATE USER 'Lumieres'@'localhost' IDENTIFIED BY PASSWORD 'JuihfUbbur12';
CREATE USER 'Mozart'@'localhost' IDENTIFIED BY PASSWORD 'lcjie2vrev';
DELIMITER ;

INSERT INTO users (surname, name, roles, email)
 VALUES
 ('Cinema_DB', 'Admin', 'ROLE_ADMIN', 'cinema_db@test.fr'),
 ('CineDumas', 'Manager', 'cinema_manager', 'cinedumas@test.fr'),
 ('Lumieres', 'Manager', 'cinema_manager', 'lumieres@test.fr'),
 ('Mozart', 'Manager', 'cinema_manager', 'mozart@test.fr');

-- Set Id to manager
UPDATE users
SET id = 1
WHERE surname = 'Cinema_DB';

UPDATE users
SET id = 2
WHERE surname = 'CineDumas';

UPDATE users
SET id = 3
WHERE surname = 'Lumieres';

UPDATE users
SET id = 4
WHERE surname = 'Mozart';

-- Set Id to cinema

UPDATE cinemas
SET id = 1
WHERE name = 'CineDumas';

UPDATE cinemas
SET id = 2
WHERE name = 'Lumieres';

UPDATE cinemas
SET id = 3
WHERE name = 'Mozart Cinema';



-- Add a projection 

DELIMITER //
CREATE PROCEDURE AddProjection(
    IN projection_date DATE,
    IN projection_time TIME,
    IN movie_id INT,
    IN salle_id INT,
    IN reserved_seats INT
)
BEGIN 

        INSERT INTO projections (date, time, movie, salle, reservedSeats)
        VALUES (projection_date, projection_time, movie_id, salle_id, reserved_seats);
END //
DELIMITER ;

--Add a Projection to cineDumas

DELIMITER //
CREATE PROCEDURE AddProjectionCineDumas(
    IN projection_date DATE,
    IN projection_time TIME,
    IN movie_id INT,
    IN salle_id INT,
    IN reserved_seats INT
)
BEGIN
    DECLARE cinema_id_for_salle INT;
    
    -- Check if the salle belongs to cinema = 1
    SELECT cinema INTO cinema_id_for_salle
    FROM salles
    WHERE salle_id = salle_id
    LIMIT 1;

    IF cinema_id_for_salle = 1 THEN
        -- Cinema manager is authorized, and salle belongs to cinema = 1
        -- Insert the projection
        INSERT INTO projections (date, time, movie, salle, reservedSeats)
        VALUES (projection_date, projection_time, movie_id, salle_id, reserved_seats);
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Unauthorized: La salle n'appartient pas au CineDumas";
    END IF;
END //
DELIMITER ;

--Add a Projection to Lumieres

DELIMITER //
CREATE PROCEDURE AddProjectionLumieres(
    IN projection_date DATE,
    IN projection_time TIME,
    IN movie_id INT,
    IN salle_id INT,
    IN reserved_seats INT
)
BEGIN
    DECLARE cinema_id_for_salle INT;
    
    -- Check if the salle belongs to cinema = 2
    SELECT cinema INTO cinema_id_for_salle
    FROM salles
    WHERE salle_id = salle_id
    LIMIT 1;

    IF cinema_id_for_salle = 2 THEN
        -- Cinema manager is authorized, and salle belongs to cinema = 2
        -- Insert the projection
        INSERT INTO projections (date, time, movie, salle, reservedSeats)
        VALUES (projection_date, projection_time, movie_id, salle_id, reserved_seats);
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Unauthorized: La salle n'appartient pas au Cinema Lumieres !";
    END IF;
END //
DELIMITER ;

--Add a Projection to Mozart Cinema

DELIMITER //
CREATE PROCEDURE AddProjectionMozart(
    IN projection_date DATE,
    IN projection_time TIME,
    IN movie_id INT,
    IN salle_id INT,
    IN reserved_seats INT
)
BEGIN
    DECLARE cinema_id_for_salle INT;
    
    -- Check if the salle belongs to cinema = 3
    SELECT cinema INTO cinema_id_for_salle
    FROM salles
    WHERE salle_id = salle_id
    LIMIT 1;

    IF cinema_id_for_salle = 3 THEN
        -- Cinema manager is authorized, and salle belongs to cinema = 3
        -- Insert the projection
        INSERT INTO projections (date, time, movie, salle, reservedSeats)
        VALUES (projection_date, projection_time, movie_id, salle_id, reserved_seats);
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Unauthorized: La salle n'appartient pas au Mozart Cinema";
    END IF;
END //
DELIMITER ;

-- Delete a projections in the cinema CineDumas

DELIMITER //
CREATE PROCEDURE DeleteProjectionCineDumas(
    IN projection_id INT
)
BEGIN
    DECLARE cinema_id_for_salle INT;

    -- Check if the projection_id belongs to cinema = 1
    SELECT p.salle INTO cinema_id_for_salle
    FROM projections p
    INNER JOIN salles s ON p.salle = s.id
    WHERE p.id = projection_id
    AND s.cinema = 1
    LIMIT 1;

    IF cinema_id_for_salle IS NOT NULL THEN
        -- Cinema manager is authorized, and the projection belongs to cinema = 1
        -- Delete the projection
        DELETE FROM projections WHERE id = projection_id;
    ELSE
       SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Unauthorized: La salle n'appartient pas au CineDumas";
    END IF;
END //
DELIMITER ;

-- Delete a projections in the cinema Lumieres

DELIMITER //
CREATE PROCEDURE DeleteProjectionLumieres(
    IN projection_id INT
)
BEGIN
    DECLARE cinema_id_for_salle INT;

    -- Check if the projection_id belongs to cinema = 2
    SELECT p.salle INTO cinema_id_for_salle
    FROM projections p
    INNER JOIN salles s ON p.salle = s.id
    WHERE p.id = projection_id
    AND s.cinema = 2
    LIMIT 2;

    IF cinema_id_for_salle IS NOT NULL THEN
        -- Cinema manager is authorized, and the projection belongs to cinema = 2
        -- Delete the projection
        DELETE FROM projections WHERE id = projection_id;
    ELSE
     SIGNAL SQLSTATE '45000'  SET MESSAGE_TEXT = "Unauthorized: La salle n'appartient pas au Cinema Lumieres";
    END IF;
END //
DELIMITER ;

-- Delete a projections in the cinema Mozart

DELIMITER //
CREATE PROCEDURE DeleteProjectionMozart(
    IN projection_id INT
)
BEGIN
    DECLARE cinema_id_for_salle INT;

    -- Check if the projection_id belongs to cinema = 3
    SELECT p.salle INTO cinema_id_for_salle
    FROM projections p
    INNER JOIN salles s ON p.salle = s.id
    WHERE p.id = projection_id
    AND s.cinema = 3
    LIMIT 3;

    IF cinema_id_for_salle IS NOT NULL THEN
        -- Cinema manager is authorized, and the projection belongs to cinema = 3
        -- Delete the projection
        DELETE FROM projections WHERE id = projection_id;
    ELSE
       SIGNAL SQLSTATE '45000'  SET MESSAGE_TEXT = "Unauthorized: La salle n'appartient pas au cinéma Mozart";
    END IF;
END //
DELIMITER ;

-- Update CineDumas projection

DELIMITER //

CREATE PROCEDURE ModifyProjectionCineDumas(
    IN projection_id INT,
    IN projection_date DATE,
    IN projection_time TIME,
    IN movie_id INT,
    IN salle_id INT,
    IN reserved_seats INT
)
BEGIN
    -- Check if the salle belongs to cinema Dumas
    DECLARE cinema_id_for_salle INT;
    SELECT cinema INTO cinema_id_for_salle
    FROM salles
    WHERE salle_id = salle_id
    LIMIT 1; -- Use LIMIT 1, as we expect only one result

    IF cinema_id_for_salle = 1 THEN
        -- Cinema manager is authorized, and salle belongs to cinema = 1 (cineDumas)
        -- Modify the projection
        UPDATE projections
        SET
            date = projection_date,
            time = projection_time,
            movie = movie_id,
            salle = salle_id,
            reservedSeats = reserved_seats
        WHERE id = projection_id; -- Assuming 'id' is the primary key of the 'projections' table
    ELSE
       SIGNAL SQLSTATE '45000'  SET MESSAGE_TEXT = "Unauthorized: La salle n'appartient pas au CineDumas";
    END IF;
END //

DELIMITER ;


-- Update Lumiere projection

DELIMITER //

CREATE PROCEDURE ModifyProjectionLumieres(
    IN projection_id INT,
    IN projection_date DATE,
    IN projection_time TIME,
    IN movie_id INT,
    IN salle_id INT,
    IN reserved_seats INT
)
BEGIN
    -- Check if the salle belongs to cinema Lumieres
    DECLARE cinema_id_for_salle INT;
    SELECT cinema INTO cinema_id_for_salle
    FROM salles
    WHERE salle_id = salle_id
    LIMIT 1; -- Use LIMIT 1, as we expect only one result

    IF cinema_id_for_salle = 2 THEN
        -- Cinema manager is authorized, and salle belongs to cinema = 2(Lumieres)
        -- Modify the projection
        UPDATE projections
        SET
            date = projection_date,
            time = projection_time,
            movie = movie_id,
            salle = salle_id,
            reservedSeats = reserved_seats
        WHERE id = projection_id; -- Assuming 'id' is the primary key of the 'projections' table
    ELSE
      SIGNAL SQLSTATE '45000'   SET MESSAGE_TEXT = "Unauthorized: La salle n'appartient pas au Cinema Lumieres";
    END IF;
END //

DELIMITER ;

-- Update Mozart projection

DELIMITER //

CREATE PROCEDURE ModifyProjectionMozart(
    IN projection_id INT,
    IN projection_date DATE,
    IN projection_time TIME,
    IN movie_id INT,
    IN salle_id INT,
    IN reserved_seats INT
)
BEGIN
    -- Check if the salle belongs to cinema Lumieres
    DECLARE cinema_id_for_salle INT;
    SELECT cinema INTO cinema_id_for_salle
    FROM salles
    WHERE salle_id = salle_id
    LIMIT 1; -- Use LIMIT 1, as we expect only one result

    IF cinema_id_for_salle = 3 THEN
        -- Cinema manager is authorized, and salle belongs to cinema = 3(Mozart)
        -- Modify the projection
        UPDATE projections
        SET
            date = projection_date,
            time = projection_time,
            movie = movie_id,
            salle = salle_id,
            reservedSeats = reserved_seats
        WHERE id = projection_id; -- Assuming 'id' is the primary key of the 'projections' table
    ELSE
       SIGNAL SQLSTATE '45000'  SET MESSAGE_TEXT = "Unauthorized: La salle n'appartient pas au cinéma Mozart";
    END IF;
END //

DELIMITER ;

-- Ajout d'un film blockbuster à la plus grande salle de chaque cinema à la même date et à la même heure (géré par l'Administrateur)

DELIMITER //

CREATE PROCEDURE AddBlockbusterToBiggestSalles(
    IN projection_date DATE,
    IN projection_time TIME,
    IN blockbuster_movie_id INT,
    OUT result_message TEXT
)
BEGIN
    DECLARE done INT;
    DECLARE cinema_id INT;
    DECLARE biggest_salle_id INT;
    DECLARE biggest_salles INT;
    DECLARE cursor_cinemas CURSOR FOR SELECT id FROM cinemas;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    SET result_message = 'Projections Ajoutées';
    SET done = FALSE;

    OPEN cursor_cinemas;
    read_loop: LOOP
        FETCH cursor_cinemas INTO cinema_id;
        IF done THEN
            LEAVE read_loop;
        END IF;

        -- Find the biggest salle in the current cinema
        SELECT salle.id, salle.seats INTO biggest_salle_id, biggest_salles
        FROM salles salle
        WHERE salle.cinema = cinema_id
        ORDER BY salle.seats DESC
        LIMIT 1;

        -- Insert the projection
        INSERT INTO projections (date, time, movie, salle, reservedSeats)
        VALUES (projection_date, projection_time, blockbuster_movie_id, biggest_salle_id, 0);

        SET result_message = CONCAT('Projection ajouté au cinema ID: ', cinema_id, ', salle ID: ', biggest_salle_id, '\n');

    END LOOP;
    CLOSE cursor_cinemas;

     SET result_message = result_message;

END //

DELIMITER ;

-- Grant permission 
GRANT ALL PRIVILEGES ON cinema_db.* TO 'Cinema_DB'@'localhost'; 

GRANT EXECUTE ON PROCEDURE cinema_db.AddProjectionCineDumas TO 'CineDumas'@'localhost';
GRANT EXECUTE ON PROCEDURE cinema_db.DeleteProjectionCineDumas TO 'CineDumas'@'localhost';
GRANT EXECUTE ON PROCEDURE cinema_db.ModifyProjectionCineDumas TO 'CineDumas'@'localhost';


GRANT EXECUTE ON PROCEDURE cinema_db.AddProjectionLumieres TO 'Lumieres'@'localhost';
GRANT EXECUTE ON PROCEDURE cinema_db.DeleteProjectionLumieres TO 'Lumieres'@'localhost';
GRANT EXECUTE ON PROCEDURE cinema_db.ModifyProjectionLumieres TO 'Lumieres'@'localhost';

GRANT EXECUTE ON PROCEDURE cinema_db.AddProjectionMozart TO 'Mozart'@'localhost';
GRANT EXECUTE ON PROCEDURE cinema_db.DeleteProjectionMozart TO 'Mozart'@'localhost';
GRANT EXECUTE ON PROCEDURE cinema_db.ModifyProjectionMozart TO 'Mozart'@'localhost';

-- Test to add/ delete or modify a projection
CALL AddProjectionCineDumas(@projection_date, @projection_time,  @movie_id, @salle_id, @reserved_seats);
CALL AddProjectionCineDumas('2023-03-15', '17:00:00', 1, 2, 0);


Call DeleteProjectionCineDumas(@projection_id);
Call DeleteProjectionCineDumas(24);

CALL ModifyProjectionCineDumas(@projection_id, @projection_date, @projection_time, @movie_id, @salle_id, @reserved_seats);


-- Test ajout Blockbuster par administrateur
 CALL AddBlockbusterToBiggestSalles(@projection_date, @projection_time, @movie_id, @result_message);

 CALL AddBlockbusterToBiggestSalles('2023-08-15', '20:00:00', 1, @result_message);