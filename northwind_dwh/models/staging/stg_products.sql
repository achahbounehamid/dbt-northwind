SELECT
    product_id,
    product_name,
    unit_price,
    units_in_stock,

    CASE
    WHEN units_in_stock > 0 THEN TRUE
    ELSE FALSE
    END AS en_stock

FROM {{ source('northwind', 'products')}}