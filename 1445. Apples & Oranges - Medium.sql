WITH apple_sales AS (
    SELECT 
        sale_date,
        SUM(sold_num) AS total_apples
    FROM sales_tbl
    WHERE fruit = 'apples'
    GROUP BY sale_date
),
orange_sales AS (
    SELECT 
        sale_date,
        SUM(sold_num) AS total_oranges
    FROM sales_tbl
    WHERE fruit = 'oranges'
    GROUP BY sale_date
)

SELECT 
    a.sale_date,
    a.total_apples - o.total_oranges AS diff
FROM apple_sales a
JOIN orange_sales o ON a.sale_date = o.sale_date
ORDER BY a.sale_date;


--------------------------------------------------------------------------
CREATE TABLE Sales_tbl (
    sale_date DATE,
    fruit ENUM('apples', 'oranges'),
    sold_num INT,
    PRIMARY KEY (sale_date, fruit)
);
INSERT INTO Sales_tbl (sale_date, fruit, sold_num) VALUES
('2020-05-01', 'apples', 10),
('2020-05-01', 'oranges', 8),
('2020-05-02', 'apples', 15),
('2020-05-02', 'oranges', 15),
('2020-05-03', 'apples', 20),
('2020-05-03', 'oranges', 0),
('2020-05-04', 'apples', 15),
('2020-05-04', 'oranges', 16);

