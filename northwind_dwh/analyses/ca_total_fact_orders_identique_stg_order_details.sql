SELECT
(SELECT SUM(montant_total) FROM {{ ref('fact_orders') }}) AS ca_fact_orders,
(SELECT SUM(unit_price * quantity * (1-discount)) FROM {{ ref('stg_order_details') }}) AS ca_order_details;