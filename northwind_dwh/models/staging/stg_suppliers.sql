SELECT
    supplier_id,
    company_name,
    contact_name,
    contact_title,
    city,
    country,
    phone

FROM {{ source('northwind', 'suppliers') }}