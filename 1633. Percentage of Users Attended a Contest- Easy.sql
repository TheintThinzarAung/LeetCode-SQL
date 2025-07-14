WITH contest_attendance AS (
    SELECT 
        contest_id, 
        COUNT(DISTINCT user_id) AS attended_count
    FROM 
        Register
    GROUP BY 
        contest_id
),
total_users AS (
    SELECT 
        COUNT(DISTINCT user_id) AS total_count
    FROM 
        Users
)
SELECT 
    ca.contest_id, 
    ROUND(ca.attended_count * 100.0 / tu.total_count, 2) AS percentage
FROM 
    contest_attendance ca,
    total_users tu
ORDER BY 
    percentage DESC, 
    contest_id ASC;
