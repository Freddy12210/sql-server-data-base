USE TP4;
GO

/*
TP4 "SELECT"
Afficher les factures à partir d'un client_id
Afficher le client qui a le plus de factures
Calculer le montant total facturé pour un Client
Afficher le nombre de devis par client
Calculer le CA 

Calculer le montant des factures en attente de paiement
Calculer les factures en retard de paiement
*/

/* Afficher les factures à partir d'un client_id */

SELECT client.nom, projet.client_id, facture.* FROM facture 
JOIN devis ON facture.devis_id = devis.id
JOIN projet ON devis.projet_id = projet.id
JOIN client ON projet.client_id = client.id


/* Afficher le client qui a le plus de factures */

SELECT client.nom, COUNT(*) AS nb_factures FROM client
JOIN projet ON client.id = projet.client_id
JOIN devis ON projet.id = devis.projet_id
JOIN facture ON devis.id = facture.devis_id
GROUP BY client.nom
HAVING COUNT(*) = (
    SELECT MAX(nb_factures)
    FROM (
        SELECT COUNT(*) AS nb_factures
        FROM facture
        JOIN devis ON facture.devis_id = devis.id
        JOIN projet ON devis.projet_id = projet.id
        JOIN client ON projet.client_id = client.id
        GROUP BY client.nom
    ) AS subquery
);


/* Calculer le montant total facturé pour un Client */

SELECT client.nom, SUM(facture.total) AS total_facture FROM client
JOIN projet ON client.id = projet.client_id
JOIN devis ON projet.id = devis.projet_id
JOIN facture ON devis.id = facture.devis_id
GROUP BY client.nom


/* Afficher le nombre de devis par client 
*/
SELECT client.nom, COUNT(*) AS nb_devis FROM client
JOIN projet ON client.id = projet.client_id
JOIN devis ON projet.id = devis.projet_id
GROUP BY client.nom


/* Calculer le CA */

SELECT SUM(total) AS total_facture
FROM facture

/* Calculer le montant des factures en attente de paiement */

SELECT total FROM facture
WHERE date_paiement IS NULL

/* Calculer les factures en retard de paiement */

SELECT *
FROM facture
WHERE date_paiement IS NULL AND DATEADD(DAY, 30, date_crea) > date_paiement