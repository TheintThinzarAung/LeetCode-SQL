WITH cte AS (
    SELECT 
        p.product_id, 
        (p.price * s.units) AS total, 
        s.units
    FROM 
        Prices p
    LEFT JOIN 
        UnitsSold s 
        ON p.product_id = s.product_id
        AND s.purchase_date BETWEEN p.start_date AND p.end_date
)

SELECT 
    product_id, 
    ROUND(COALESCE(SUM(total) / SUM(units), 0), 2) AS average_price
FROM 
    cte
GROUP BY 
    product_id;
