WITH OrderAmounts AS (
    SELECT
        o.customer_id,
        p.product_id,
        o.quantity * p.price AS amount,
        DATE_FORMAT(o.order_date, '%Y-%m') AS order_month
    FROM
        Order_tbl AS o
        INNER JOIN Product_tbl AS p
            ON o.product_id = p.product_id
    WHERE
        DATE_FORMAT(o.order_date, '%Y-%m') IN ('2020-06', '2020-07')
),

MonthlyTotals AS (
    SELECT
        oa.customer_id,
        oa.order_month,
        SUM(oa.amount) AS total_amount
    FROM
        OrderAmounts AS oa
    GROUP BY
        oa.customer_id,
        oa.order_month
),

QualifiedCustomers AS (
    SELECT
        mt.customer_id
    FROM
        MonthlyTotals AS mt
    WHERE
        mt.total_amount >= 100
    GROUP BY
        mt.customer_id
    HAVING
        COUNT(DISTINCT mt.order_month) = 2
)

SELECT
    qc.customer_id,
    c.name
FROM
    QualifiedCustomers AS qc
    JOIN Customers_tbl AS c
        ON qc.customer_id = c.customer_id;
---------------------------------------------------------------------------------------


CREATE TABLE Customers_tbl (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    country VARCHAR(100)
);

CREATE TABLE Product_tbl (
    product_id INT PRIMARY KEY,
    description VARCHAR(100),
    price INT
);

CREATE TABLE Order_tbl (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    order_date DATE,
    quantity INT
);
INSERT INTO Customers_tbl (customer_id, name, country) VALUES
(1, 'Winston', 'USA'),
(2, 'Jonathan', 'Peru'),
(3, 'Moustafa', 'Egypt');

INSERT INTO Product_tbl (product_id, description, price) VALUES
(10, 'LC Phone', 300),
(20, 'LC T-Shirt', 10),
(30, 'LC Book', 45),
(40, 'LC Keychain', 2);

INSERT INTO Order_tbl (order_id, customer_id, product_id, order_date, quantity) VALUES
(1, 1, 10, '2020-06-10', 1),
(2, 1, 20, '2020-07-01', 1),
(3, 1, 30, '2020-07-08', 2),
(4, 2, 10, '2020-06-15', 2),
(5, 2, 40, '2020-07-01', 10),
(6, 3, 20, '2020-06-24', 2),
(7, 3, 30, '2020-06-25', 2),
(9, 3, 30, '2020-05-08', 3);
