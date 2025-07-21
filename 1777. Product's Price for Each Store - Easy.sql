SELECT 
    product_id,
    SUM(CASE WHEN store = 'store1' THEN price END) AS store1,
    SUM(CASE WHEN store = 'store2' THEN price END) AS store2,
    SUM(CASE WHEN store = 'store3' THEN price END) AS store3
FROM 
    Products
GROUP BY 
    product_id;

CREATE TABLE tb_Product (
    product_id INT,
    store ENUM('store1', 'store2', 'store3'),
    price INT,
    PRIMARY KEY (product_id, store)
);

INSERT INTO tb_Product (product_id, store, price) VALUES
(0, 'store1', 95),
(0, 'store3', 105),
(0, 'store2', 100),
(1, 'store1', 70),
(1, 'store3', 80);
