WITH totalwt_tb AS (
    SELECT 
        person_id,
        turn,
        person_name,
        weight,
        SUM(weight) OVER (ORDER BY turn) AS total_weight
    FROM Queue
)

SELECT person_name
FROM totalwt_tb
WHERE total_weight <= 1000
ORDER BY turn DESC
LIMIT 1;
