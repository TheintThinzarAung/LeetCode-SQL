SELECT 
  v.customer_id, 
  COUNT(*) AS count_no_trans
FROM 
  Visits v
WHERE 
  v.visit_id NOT IN (
    SELECT 
      t.visit_id 
    FROM 
      Transactions t
  )
GROUP BY 
  v.customer_id;