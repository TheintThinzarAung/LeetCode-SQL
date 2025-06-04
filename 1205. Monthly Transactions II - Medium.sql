WITH appr_tb AS (
    SELECT 
        DATE_FORMAT(trans_date, '%Y-%m') AS month,
        country,
        COUNT(*) AS approved_count,
        SUM(amount) AS approved_amount
    FROM transactions
    WHERE state = 'approved'
    GROUP BY month, country
),

chargeback_tb AS (
    SELECT 
        DATE_FORMAT(cb.charge_date, '%Y-%m') AS month,
        t.country,
        COUNT(*) AS chargeback_count,
        SUM(t.amount) AS chargeback_amount
    FROM chargebacks cb
    LEFT JOIN transactions t ON cb.trans_id = t.id
    GROUP BY month, t.country
)

SELECT 
    c.month,
    c.country,
    COALESCE(a.approved_count, 0) AS approved_count,
    COALESCE(a.approved_amount, 0) AS approved_amount,
    c.chargeback_count,
    c.chargeback_amount
FROM chargeback_tb c
LEFT JOIN appr_tb a 
    ON c.month = a.month AND c.country = a.country
ORDER BY c.month, c.country;






CREATE TABLE Transactions (
    id INT PRIMARY KEY,
    country VARCHAR(50),
    state ENUM('approved', 'declined'),
    amount INT,
    trans_date DATE
);

-- Create Chargebacks table
CREATE TABLE Chargebacks (
    trans_id INT,
    charge_date DATE,
    PRIMARY KEY (trans_id, charge_date),
    FOREIGN KEY (trans_id) REFERENCES Transactions(id)
);

-- Insert data into Transactions
INSERT INTO Transactions (id, country, state, amount, trans_date) VALUES
(101, 'US', 'approved', 1000, '2019-05-18'),
(102, 'US', 'declined', 2000, '2019-05-19'),
(103, 'US', 'approved', 3000, '2019-06-10'),
(104, 'US', 'approved', 4000, '2019-06-13'),
(105, 'US', 'approved', 5000, '2019-06-15');

-- Insert data into Chargebacks
INSERT INTO Chargebacks (trans_id, charge_date) VALUES
(102, '2019-05-29'),
(101, '2019-06-30'),
(105, '2019-09-18');