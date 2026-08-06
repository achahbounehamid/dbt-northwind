SELECT
p.product_id,
p.units_in_stock AS stock_restant,

--calcule quantité-total vendu
SUM(od.quantity) AS quantite_totale_vendue,

--CA généré par produit
SUM(od.quantity * od.unit_price * (1-od.discount)) AS ca_genere,

--Nombre de commande distinctes
COUNT(DISTINCT od.order_id) AS nb_commandes_distinctes

FROM {{ ref('stg_products')}} P
LEFT JOIN {{ ref('stg_order_details')}} od
ON p.product_id = od.product_id

GROUP BY
p.product_id,
p.units_in_stock
