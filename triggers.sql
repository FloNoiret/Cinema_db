-- Reservation d'un siège à chaque ticket à la projection associée
DELIMITER //
CREATE TRIGGER update_reserved_seats AFTER INSERT ON tickets
FOR EACH ROW
BEGIN
    UPDATE projections
    SET reservedSeats = reservedSeats + 1
    WHERE id = NEW.projection;
END;
//
DELIMITER ;


-- Empêcher l'ajout de reservations de sièges si la salle est complète

DELIMITER //
CREATE TRIGGER check_reserved_seats
AFTER UPDATE ON projections
FOR EACH ROW
BEGIN
    DECLARE salle_seats INT;
    DECLARE reserved_seats INT;
    
    -- Get the number of seats in the associated salle
    SELECT seats INTO salle_seats FROM salles WHERE id = NEW.salle;
    
    -- Get the total number of reserved seats for the salle 
    SELECT reservedSeats INTO reserved_seats FROM projections WHERE id = NEW.id;
    
    -- Check if the new total reserved seats exceed the salle seats
    IF reserved_seats > salle_seats THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Impossible : Le nombre de places réservées excède le nombre de sièges existants dans la salle choisie';
    END IF;
END;
//
DELIMITER ;


