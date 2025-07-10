WITH cte AS (
    SELECT 
        DATE_FORMAT(order_date, '%Y-%m') AS month, 
        customer_id, 
        order_id
    FROM 
        taorder
    WHERE 
        invoice > 20
)
SELECT 
    month, 
    COUNT(DISTINCT order_id) AS order_count, 
    COUNT(DISTINCT customer_id) AS customer_count
FROM 
    cte
GROUP BY 
    month;



















CREATE TABLE taOrder (
    order_id INT PRIMARY KEY,
    order_date DATE,
    customer_id INT,
    invoice INT
);





INSERT INTO taOrder (order_id, order_date, customer_id, invoice) VALUES
(1, '2020-09-15', 1, 30),
(2, '2020-09-17', 2, 90),
(3, '2020-10-06', 3, 20),
(4, '2020-10-20', 3, 21),
(5, '2020-11-10', 1, 10),
(6, '2020-11-21', 2, 15),
(7, '2020-12-01', 4, 55),
(8, '2020-12-03', 4, 77),
(9, '2021-01-07', 3, 31),
(10, '2021-01-15', 2, 20);
