SELECT
employee_id,

CONCAT(first_name, ' ' , last_name) AS full_name,

title,
hire_date,
city,
country

from {{ source('northwind', 'employees')}}