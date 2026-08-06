SELECT
employee_id,
--Nombre de commande traitées
COUNT(order_id) AS nb_commandes_traitees,
--CA total par employé
SUM(montant_total) AS ca_total,
--  delai moyen livraison
AVG(shipped_date - order_date) AS delai_moyen_livraison_jours,
--taux de livraison
SUM(CASE WHEN shipped_date <= required_date THEN 1 ELSE 0 END) * 100.0 / COUNT(order_id) AS taux_livraison_a_temps

FROM {{ ref('int_orders_enriched')}}
GROUP BY
employee_id