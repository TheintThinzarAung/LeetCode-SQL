WITH 
Paid AS (
  SELECT 
    u.user_id, 
    t.amount 
  FROM 
    Users u 
    RIGHT JOIN Transaction t ON t.paid_by = u.user_id
), 

Received AS (
  SELECT 
    u.user_id, 
    t.amount 
  FROM 
    Users u 
    RIGHT JOIN Transaction t ON t.paid_to = u.user_id
),

Credits AS (
  SELECT 
    u.user_id, 
    u.credit, 
    COALESCE(SUM(p.amount), 0) AS total_paid,
    COALESCE(SUM(r.amount), 0) AS total_received
  FROM 
    Users u
    LEFT JOIN Paid p ON u.user_id = p.user_id
    LEFT JOIN Received r ON u.user_id = r.user_id
  GROUP BY 
    u.user_id, u.credit
),

Settled AS (
  SELECT
    user_id,
    credit,
    total_paid,
    total_received,
    (credit + total_received - total_paid) AS final_balance
  FROM
    Credits
)

SELECT
  u.user_id,
  u.user_name,
  COALESCE(s.final_balance, u.credit) AS credit,
  CASE 
    WHEN COALESCE(s.final_balance, u.credit) < 0 THEN 'Yes'
    ELSE 'No'
  END AS credit_limit_breached
FROM
  Users u
  LEFT JOIN Settled s ON u.user_id = s.user_id;














-------------------------------------------------------------------
CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    user_name VARCHAR(100),
    credit INT
);

CREATE TABLE Transaction (
    trans_id INT PRIMARY KEY,
    paid_by INT,
    paid_to INT,
    amount INT,
    transacted_on DATE
);
INSERT INTO Users (user_id, user_name, credit) VALUES
(1, 'Moustafa', 100),
(2, 'Jonathan', 200),
(3, 'Winston', 10000),
(4, 'Luis', 800);

INSERT INTO Transaction (trans_id, paid_by, paid_to, amount, transacted_on) VALUES
(1, 1, 3, 400, '2020-08-01'),
(2, 3, 2, 500, '2020-08-02'),
(3, 2, 1, 200, '2020-08-03');
