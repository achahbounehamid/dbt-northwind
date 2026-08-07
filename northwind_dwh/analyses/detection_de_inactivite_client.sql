SELECT
customer_id,
MAX(order_date) AS date_derniere_commande
FROM {{ ref('fact_orders')}}
GROUP BY
customer_id
ORDER BY
date_derniere_commande ASC;