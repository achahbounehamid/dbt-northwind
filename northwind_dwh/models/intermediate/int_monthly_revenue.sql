
with monthly_orders as(

SELECT
 DATE_TRUNC('month', order_date) AS mois,
 COUNT(order_id) AS nb_commandes,
 SUM(montant_total) AS ca_mensuel,
 SUM(montant_total) / COUNT(order_id) AS panier_moyen

FROM {{ ref('int_orders_enriched')}}
GROUP BY DATE_TRUNC('month', order_date)


)
SELECT
mois,
nb_commandes,
ca_mensuel,
panier_moyen,

 LAG(ca_mensuel) OVER (ORDER BY mois) AS ca_mois_precedent,

 --variation
 ca_mensuel -LAG(ca_mensuel) OVER (ORDER BY mois) AS variation_pct

 FROM monthly_orders
 ORDER BY mois