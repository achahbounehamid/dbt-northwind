SELECT
    category_id,
    category_name,
    description

FROM {{ source('northwind', 'categories') }}