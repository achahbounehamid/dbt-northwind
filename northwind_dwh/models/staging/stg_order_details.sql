SELECT
    order_id,
    product_id,

    unit_price,
    quantity,
    discount,

    ROUND(CAST(unit_price * quantity * (1 - discount) AS NUMERIC), 2) AS sous_total



from {{ source('northwind', 'order_details') }}