SELECT 
(SELECT COUNT(*) FROM {{ ref('stg_orders') }}) AS nb_staging,
(SELECT COUNT(*) FROM {{ ref('stg_orders') }}) AS nb_marts;