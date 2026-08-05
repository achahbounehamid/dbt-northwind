SELECT
    o.order_id,
    o.customer_id,
    o.employee_id,
    o.order_date,
    o.required_date,
    o.shipped_date,
    
  -- Calculs de la ponctualité
    o.shipped_date - o.order_date AS delai_livraison_jours,
    
    CASE 
        WHEN o.shipped_date IS NULL THEN FALSE
        WHEN o.shipped_date <= o.required_date THEN TRUE
        ELSE FALSE 
    END AS is_on_time,

    -- Agrégations par commande
    COUNT(od.product_id) AS nb_articles,
    SUM(od.quantity) AS quantite_totale,
    SUM(od.sous_total) AS montant_total

FROM {{ ref('stg_orders') }} o
LEFT JOIN {{ ref('stg_order_details') }} od 
    ON o.order_id = od.order_id

GROUP BY 
    o.order_id,
    o.customer_id,
    o.employee_id,
    o.order_date,
    o.required_date,
    o.shipped_date