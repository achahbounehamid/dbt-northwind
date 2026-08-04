SELECT
    shipper_id,
    company_name,
    phone

FROM {{ source('northwind', 'shippers') }}