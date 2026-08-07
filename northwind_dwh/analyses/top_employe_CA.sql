SELECT 
    e.employee_id,
    e.full_name,
    SUM(f.montant_total) AS total_ca
FROM {{ ref('fact_orders') }} f
JOIN {{ ref('dim_employees') }} e 
    ON f.employee_id = e.employee_id
GROUP BY 
    e.employee_id,
    e.full_name
ORDER BY 
    total_ca DESC
LIMIT 5;