SELECT
    product_id,
    product_name,
    unit_price,
    units_on_order,
    discontinued,
    en_stock,
    category_name,
    category_description,
    supplier_name,
    supplier_country,

CASE
WHEN unit_price < 20 THEN 'Entree de gamme'
WHEN unit_price BETWEEN 20 AND 50 THEN 'Milieu de gamme'
ELSE 'Premium'
END AS gamme
FROM {{ ref('int_products_enriched')}}