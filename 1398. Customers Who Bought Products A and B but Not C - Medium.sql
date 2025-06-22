WITH filtered_orders AS (
    SELECT o.customer_id, o.product_name
    FROM Orders o
    WHERE o.customer_id NOT IN (
        SELECT o2.customer_id
        FROM Orders o2
        WHERE o2.product_name = 'C'
    )
    AND o.product_name IN ('A', 'B')
),

qualified_customers AS (
    SELECT fo.customer_id
    FROM filtered_orders fo
    GROUP BY fo.customer_id
    HAVING COUNT(DISTINCT fo.product_name) = 2
)

SELECT c.customer_id, c.customer_name
FROM Customers c
JOIN qualified_customers qc ON c.customer_id = qc.customer_id
ORDER BY c.customer_id;








---------------------------------------------------------------------------------------------
CREATE TABLE tbl_Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_name VARCHAR(100),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
INSERT INTO Customers (customer_id, customer_name) VALUES
(1, 'Daniel'),
(2, 'Diana'),
(3, 'Elizabeth'),
(4, 'Jhon');

INSERT INTO Orders (order_id, customer_id, product_name) VALUES
(10, 1, 'A'),
(20, 1, 'B'),
(30, 1, 'D'),
(40, 1, 'C'),
(50, 2, 'A'),
(60, 3, 'A'),
(70, 3, 'B'),
(80, 3, 'D'),
(90, 4, 'C');
