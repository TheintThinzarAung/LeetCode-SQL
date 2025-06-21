with buy_sell_totals AS (
    SELECT 
        stock_name,
        sum(CASE WHEN operation = 'Buy' THEN price END) AS total_buy_price,
        sum(CASE WHEN operation = 'Sell' THEN price END) AS total_sell_price
    FROM stocks
    GROUP BY stock_name
)

SELECT 
    stock_name,
    total_sell_price - total_buy_price AS capital_gain_loss
FROM buy_sell_totals;
