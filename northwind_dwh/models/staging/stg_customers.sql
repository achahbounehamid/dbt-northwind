  SELECT
        customer_id,
        UPPER(TRIM(company_name)) AS company_name,
        UPPER(TRIM(contact_name)) AS contact_name,
        UPPER(TRIM(contact_title)) AS contact_title,
        UPPER(TRIM(city)) AS city,
        UPPER(TRIM(country)) AS country,
        TRIM(phone) AS phone
    FROM  {{ source('northwind', 'customers') }}

