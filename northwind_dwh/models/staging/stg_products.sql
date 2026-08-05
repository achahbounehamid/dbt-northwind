SELECT
    product_id,
    product_name,
    supplier_id,
    category_id,
    quantity_per_unit,
    unit_price,
    units_in_stock,
    units_on_order,
    reorder_level,
    discontinued,

    CASE
    WHEN units_in_stock > 0 THEN TRUE
    ELSE FALSE
    END AS en_stock

FROM {{ source('northwind', 'products')}}