SELECT
    customer_id,

    -- Nomber de commandes
    COUNT(order_id) AS nb_commandes,

    -- CA total
    SUM(montant_total) AS ca_total,

     --Dates 
     MIN(order_date) AS date_premiere_commande,
     Max(order_date) AS date_derniere_commande,

     --Calcule de délai moyen

     CASE
        WHEN COUNT (order_id) <= 1 THEN 0
        ELSE (MAX(order_date) - MIN(order_date))/(COUNT(order_id-1))
     END AS delai_moyen_entre_commandes   

FROM {{ref('int_orders_enriched')}}

GROUP BY
   customer_id