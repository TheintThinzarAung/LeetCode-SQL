SELECT
    p.name,
    sq.rest,
    sq.paid,
    sq.canceled,
    sq.refunded
FROM
    ta_Product p
JOIN (
    SELECT
        product_id,
        SUM(rest) AS rest,
        SUM(paid) AS paid,
        SUM(canceled) AS canceled,
        SUM(refunded) AS refunded
    FROM
        Invoice
    GROUP BY
        product_id
) sq ON sq.product_id = p.product_id
ORDER BY
    p.name;























-- Drop tables if they exist
DROP TABLE IF EXISTS Invoice;
DROP TABLE IF EXISTS ta_Product;

-- Create Product table
CREATE TABLE ta_Product (
    product_id INT PRIMARY KEY,
    name VARCHAR(255)
);

-- Create Invoice table with correct FK
CREATE TABLE Invoice (
    invoice_id INT PRIMARY KEY,
    product_id INT,
    rest INT,
    paid INT,
    canceled INT,
    refunded INT,
    FOREIGN KEY (product_id) REFERENCES ta_Product(product_id)
);

-- Insert products
INSERT INTO ta_Product (product_id, name) VALUES
(0, 'ham'),
(1, 'bacon');

-- Insert invoices
INSERT INTO Invoice (invoice_id, product_id, rest, paid, canceled, refunded) VALUES
(23, 0, 2, 0, 5, 0),
(12, 0, 0, 4, 0, 3),
(1, 1, 1, 1, 0, 1),
(2, 1, 1, 0, 1, 1),
(3, 1, 0, 1, 1, 1),
(4, 1, 1, 1, 1, 0);
