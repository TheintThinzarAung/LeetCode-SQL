WITH movie_count AS (
    SELECT 
        u.user_id,
        u.name,
        COUNT(m.movie_id) AS movie_count
    FROM MovieRating m
    JOIN Users u ON u.user_id = m.user_id
    GROUP BY u.user_id, u.name
    ORDER BY movie_count DESC, u.name
    LIMIT 1
),
avg_rating AS (
    SELECT 
        mv.movie_id,
        mv.title,
        AVG(m.rating) AS average_rating
    FROM MovieRating m
    JOIN Movies mv ON mv.movie_id = m.movie_id
    WHERE DATE_FORMAT(m.created_at, '%Y-%m') = '2020-02'
    GROUP BY mv.movie_id, mv.title
    ORDER BY average_rating DESC, mv.title
    LIMIT 1
)
SELECT name AS results FROM movie_count
UNION ALL
SELECT title AS results FROM avg_rating;
