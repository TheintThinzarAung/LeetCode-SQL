WITH VisitGaps AS (
    SELECT 
        user_id, 
        visit_date,
        DATEDIFF(
            COALESCE(
                LEAD(visit_date) OVER (PARTITION BY user_id ORDER BY visit_date ASC), 
                '2021-01-01'
            ), 
            visit_date
        ) AS gap_days
    FROM UserVisits
)

SELECT 
    user_id, 
    MAX(gap_days) AS biggest_window
FROM VisitGaps
GROUP BY user_id;









CREATE TABLE UserVisits (
    user_id INT,
    visit_date DATE
);

INSERT INTO UserVisits (user_id, visit_date) VALUES
(1, '2020-11-28'),
(1, '2020-10-20'),
(1, '2020-12-03'),
(2, '2020-10-05'),
(2, '2020-12-09'),
(3, '2020-11-11');
