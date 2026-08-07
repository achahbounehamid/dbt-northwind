SELECT 
    ship_via AS transporteur_id,
    COUNT(*) AS total_commandes,
    SUM(freight) AS total_frais_port
FROM {{ ref('fact_orders') }}
GROUP BY ship_via;