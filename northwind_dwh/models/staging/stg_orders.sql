SELECT
--Identifiants
        order_id,
        customer_id,
        employee_id,
-- Date typée
        CAST(order_date AS DATE) AS order_date,
        CAST(required_date AS DATE) AS required_date,
        CAST(shipped_date AS DATE) AS shipped_date,

 -- Colonne calculée is_shipped (TRUE si shipped_date n'est pas NULL)
        CASE 
            WHEN shipped_date IS NOT NULL THEN TRUE 
            ELSE FALSE 
        END AS is_shipped

    FROM  {{ source('northwind', 'orders') }}
