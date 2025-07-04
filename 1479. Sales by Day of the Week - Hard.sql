WITH sales_by_day AS (
    SELECT 
        i.item_category AS category,
        o.item_id AS item_id,
        DAYNAME(o.order_date) AS day_name,
        SUM(o.quantity) AS total_quantity
    FROM 
        Items AS i
    LEFT JOIN 
        Orders_tbl AS o 
    ON 
        i.item_id = o.item_id
    GROUP BY 
        i.item_category,
        o.item_id,
        DAYNAME(o.order_date)
)

SELECT 
    sb.category AS item_category,
    COALESCE(SUM(CASE WHEN sb.day_name = 'Monday' THEN sb.total_quantity END), 0) AS Monday,
    COALESCE(SUM(CASE WHEN sb.day_name = 'Tuesday' THEN sb.total_quantity END), 0) AS Tuesday,
    COALESCE(SUM(CASE WHEN sb.day_name = 'Wednesday' THEN sb.total_quantity END), 0) AS Wednesday,
    COALESCE(SUM(CASE WHEN sb.day_name = 'Thursday' THEN sb.total_quantity END), 0) AS Thursday,
    COALESCE(SUM(CASE WHEN sb.day_name = 'Friday' THEN sb.total_quantity END), 0) AS Friday,
    COALESCE(SUM(CASE WHEN sb.day_name = 'Saturday' THEN sb.total_quantity END), 0) AS Saturday,
    COALESCE(SUM(CASE WHEN sb.day_name = 'Sunday' THEN sb.total_quantity END), 0) AS Sunday
FROM 
    sales_by_day AS sb
GROUP BY 
    sb.category
ORDER BY 
    sb.category;


---------------------------------------------------------------------------------------------------------
CREATE TABLE Orders_tbl (
    order_id INT,
    customer_id INT,
    order_date DATE,
    item_id VARCHAR(10),
    quantity INT,
    PRIMARY KEY (order_id, item_id)
);

CREATE TABLE Items (
    item_id VARCHAR(10) PRIMARY KEY,
    item_name VARCHAR(100),
    item_category VARCHAR(50)
);
-- Orders table
INSERT INTO Orders_tbl (order_id, customer_id, order_date, item_id, quantity) VALUES
(1, 1, '2020-06-01', '1', 10),
(2, 1, '2020-06-08', '2', 10),
(3, 2, '2020-06-02', '1', 5),
(4, 3, '2020-06-03', '3', 5),
(5, 4, '2020-06-04', '4', 1),
(6, 4, '2020-06-05', '5', 5),
(7, 5, '2020-06-05', '1', 10),
(8, 5, '2020-06-14', '4', 5),
(9, 5, '2020-06-21', '3', 5);

-- Items table
INSERT INTO Items (item_id, item_name, item_category) VALUES
('1', 'LC Alg. Book', 'Book'),
('2', 'LC DB. Book', 'Book'),
('3', 'LC SmarthPhone', 'Phone'),
('4', 'LC Phone 2020', 'Phone'),
('5', 'LC SmartGlass', 'Glasses'),
('6', 'LC T-Shirt XL', 'T-Shirt');





