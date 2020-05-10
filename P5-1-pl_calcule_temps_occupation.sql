-- Fonction pl_calcule_temps_occupation

CREATE OR REPLACE FUNCTION gds.pl_calcule_temps_occupation(un_nom_salle character varying(250)) RETURNS interval AS $$
    DECLARE
        temps_occupation interval := 0;
        un_id_salle gds.salle.id%TYPE;
        reservation_duree RECORD;
    BEGIN
        SELECT id INTO un_id_salle 
        FROM gds.salle 
        WHERE nom = un_nom_salle;

        IF NOT FOUND THEN
            RAISE 'La salle demandée n''existe pas'
            USING ERRCODE='invalid_parameter_value';
        ELSE
            FOR reservation_duree IN
                SELECT age(date_fin, date_debut) as age_res
                FROM gds.reservation
                WHERE salle_id = un_id_salle 
            LOOP
                temps_occupation := temps_occupation + reservation_duree.age_res;
            END LOOP;
        END IF;
        RETURN temps_occupation;
    END;
$$ LANGUAGE plpgsql;