WITH recent_orders AS (
    SELECT 
        order_date, 
        product_id,
        order_id,
        DENSE_RANK() OVER (PARTITION BY product_id ORDER BY order_date DESC) AS r
    FROM taOrders
)

SELECT 
    p.product_name,
    p.product_id,
    ro.order_id,
    ro.order_date
FROM 
    recent_orders ro
JOIN 
    taProducts p ON p.product_id = ro.product_id
WHERE 
    ro.r = 1
ORDER BY 
    p.product_name ASC,
    p.product_id ASC,
    ro.order_id ASC;
------------------------------------------------------------------------------
CREATE TABLE taCustomers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE taOrders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    customer_id INT,
    product_id INT,
    FOREIGN KEY (customer_id) REFERENCES taCustomers(customer_id),
    FOREIGN KEY (product_id) REFERENCES taProducts(product_id)
);

CREATE TABLE taProducts (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price INT
);
INSERT INTO taCustomers (customer_id, name) VALUES
(1, 'Winston'),
(2, 'Jonathan'),
(3, 'Annabelle'),
(4, 'Marwan'),
(5, 'Khaled');

INSERT INTO taProducts (product_id, product_name, price) VALUES
(1, 'keyboard', 120),
(2, 'mouse', 80),
(3, 'screen', 600),
(4, 'hard disk', 450);

INSERT INTO taOrders (order_id, order_date, customer_id, product_id) VALUES
(1, '2020-07-31', 1, 1),
(2, '2020-07-30', 2, 2),
(3, '2020-08-29', 3, 3),
(4, '2020-07-29', 4, 1),
(5, '2020-06-10', 1, 2),
(6, '2020-08-01', 2, 1),
(7, '2020-08-01', 3, 1),
(8, '2020-08-03', 1, 2),
(9, '2020-08-07', 2, 3),
(10, '2020-07-15', 1, 2);
