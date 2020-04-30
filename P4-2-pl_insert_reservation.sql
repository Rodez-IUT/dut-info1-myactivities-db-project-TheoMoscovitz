-- Fonction pl_insert_reservation

CREATE OR REPLACE FUNCTION gds.pl_insert_reservation ( 
        une_date_debut timestamp without time zone, 
        une_date_fin timestamp without time zone, 
        un_nom_de_salle character varying(250))
    RETURNS gds.reservation AS $$
        DECLARE
            salle_id gds.salle.id%TYPE;
            reservation gds.reservation%ROWTYPE;
        BEGIN
            SELECT id INTO salle_id 
            FROM gds.salle
            WHERE nom = un_nom_de_salle;

            IF FOUND
                THEN

                -- Insertion de la réservation
                INSERT INTO gds.reservation (id, date_debut, date_fin, date_creation, date_modification, salle_id)
                VALUES (nextval('gds.reservation_seq'), une_date_debut, une_date_fin, now(), now(), salle_id)
                RETURNING * INTO reservation;
            ELSE
                RAISE NOTICE 'La salle sélectionnée n''existe pas';
            END IF;
        RETURN reservation;
        END;
$$
LANGUAGE plpgsql;

        