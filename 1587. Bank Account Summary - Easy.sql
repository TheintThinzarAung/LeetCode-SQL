WITH account_balances AS (
  SELECT 
    account,
    SUM(amount) AS balance
  FROM 
    Transactions
  GROUP BY 
    account
)

SELECT 
  u.name, 
  ab.balance
FROM 
  users AS u
JOIN 
  account_balances AS ab
  ON ab.account = u.account
WHERE 
  ab.balance > 10000;
