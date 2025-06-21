WITH summarized_operations AS (
    SELECT 
        stock_name, 
        operation, 
        SUM(price) AS total_price
    FROM Stocks
    GROUP BY stock_name, operation
),

buy_sell_totals AS (
    SELECT 
        stock_name,
        MAX(CASE WHEN operation = 'Buy' THEN total_price END) AS total_buy_price,
        MAX(CASE WHEN operation = 'Sell' THEN total_price END) AS total_sell_price
    FROM summarized_operations
    GROUP BY stock_name
)

SELECT 
    stock_name,
    total_sell_price - total_buy_price AS capital_gain_loss
FROM buy_sell_totals;
