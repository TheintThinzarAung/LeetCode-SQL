SELECT 
    p.product_id, 
    p.product_name, 
    sq.report_year, 
    sq.total_amount
FROM (
    SELECT 
        product_id, 
        '2018' AS report_year,
        average_daily_sales * 
        (DATEDIFF(
            LEAST(period_end, '2018-12-31'), 
            GREATEST(period_start, '2018-01-01')
        ) + 1) AS total_amount
    FROM Sales
    WHERE 
        period_start <= '2018-12-31' 
        AND period_end >= '2018-01-01'
    
    UNION
    SELECT 
        product_id, 
        '2019' AS report_year,
        average_daily_sales * 
        (DATEDIFF(
            LEAST(period_end, '2019-12-31'), 
            GREATEST(period_start, '2019-01-01')
        ) + 1) AS total_amount
    FROM Sales
    WHERE 
        period_start <= '2019-12-31' 
        AND period_end >= '2019-01-01'
    
    UNION
    SELECT 
        product_id, 
        '2020' AS report_year,
        average_daily_sales * 
        (DATEDIFF(
            LEAST(period_end, '2020-12-31'), 
            GREATEST(period_start, '2020-01-01')
        ) + 1) AS total_amount
    FROM Sales
    WHERE 
        period_start <= '2020-12-31' 
        AND period_end >= '2020-01-01'
) AS sq
JOIN Product p 
    ON p.product_id = sq.product_id
ORDER BY 
    p.product_id, 
    sq.report_year;













----------------------------------------------------------------------
CREATE TABLE Product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100)
);

CREATE TABLE Sales (
    product_id INT,
    period_start VARCHAR(10),
    period_end DATE,
    average_daily_sales INT,
    PRIMARY KEY (product_id, period_start, period_end)
);
INSERT INTO Product (product_id, product_name) VALUES
(1, 'LC Phone'),
(2, 'LC T-Shirt'),
(3, 'LC Keychain');

INSERT INTO Sales (product_id, period_start, period_end, average_daily_sales) VALUES
(1, '2019-01-25', '2019-02-28', 100),
(2, '2018-12-01', '2020-01-01', 10),
(3, '2019-12-01', '2020-01-31', 1);
