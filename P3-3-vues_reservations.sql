-- vue de la table de réservations

CREATE VIEW gds.vue_reservations AS
        SELECT
          gds.reservation.id as id,
          gds.salle.nom as nom_salle,
          gds.reservation.date_debut as date_debut,
          gds.reservation.date_fin as date_fin
        FROM gds.reservation
        JOIN gds.salle
        ON gds.reservation.salle_id = gds.salle.id
        ORDER BY gds.salle.nom, gds.reservation.date_debut;
