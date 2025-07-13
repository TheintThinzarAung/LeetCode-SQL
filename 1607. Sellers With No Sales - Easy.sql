SELECT 
    s.seller_name
FROM 
    Seller s
WHERE 
    s.seller_id NOT IN (
        SELECT DISTINCT o.seller_id
        FROM t_Orders o
        WHERE YEAR(o.sale_date) = 2020
    )
ORDER BY 
    s.seller_name;
----------------------------------------------------------
CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100)
);

CREATE TABLE t_Orders (
    order_id INT PRIMARY KEY,
    sale_date DATE,
    order_cost INT,
    customer_id INT,
    seller_id INT
);

CREATE TABLE Seller (
    seller_id INT PRIMARY KEY,
    seller_name VARCHAR(100)
);
INSERT INTO Customer (customer_id, customer_name) VALUES
(101, 'Alice'),
(102, 'Bob'),
(103, 'Charlie');

INSERT INTO t_Orders (order_id, sale_date, order_cost, customer_id, seller_id) VALUES
(1, '2020-03-01', 1500, 101, 1),
(2, '2020-05-25', 2400, 102, 2),
(3, '2019-05-25', 800, 101, 3),
(4, '2020-09-13', 1000, 103, 2),
(5, '2019-02-11', 700, 101, 2);

INSERT INTO Seller (seller_id, seller_name) VALUES
(1, 'Daniel'),
(2, 'Elizabeth'),
(3, 'Frank');
