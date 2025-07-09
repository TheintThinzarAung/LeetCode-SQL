WITH RankedOrders AS (
  SELECT 
    customer_id,
    order_id,
    order_date,
    ROW_NUMBER() OVER (
      PARTITION BY customer_id 
      ORDER BY order_date DESC
    ) AS order_rank
  FROM ta_orders
),

MostRecentThree AS (
  SELECT 
    customer_id,
    order_id,
    order_date
  FROM RankedOrders
  WHERE order_rank <= 3
)

SELECT 
  c.name AS customer_name,
  c.customer_id,
  o.order_id,
  o.order_date
FROM ta_customers AS c
JOIN MostRecentThree AS o 
  ON c.customer_id = o.customer_id
ORDER BY 
  customer_name ASC,
  c.customer_id ASC,
  o.order_date DESC;



















CREATE TABLE ta_Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE ta_Orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    customer_id INT,
    cost INT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
-- Insert data into Customers
INSERT INTO ta_Customers (customer_id, name) VALUES
(1, 'Winston'),
(2, 'Jonathan'),
(3, 'Annabelle'),
(4, 'Marwan'),
(5, 'Khaled');

-- Insert data into Orders
INSERT INTO ta_Orders (order_id, order_date, customer_id, cost) VALUES
(1, '2020-07-31', 1, 30),
(2, '2020-07-30', 2, 40),
(3, '2020-07-31', 3, 70),
(4, '2020-07-29', 4, 100),
(5, '2020-06-10', 1, 1010),
(6, '2020-08-01', 2, 102),
(7, '2020-08-01', 3, 111),
(8, '2020-08-03', 1, 99),
(9, '2020-08-07', 2, 32),
(10, '2020-07-15', 1, 2);
