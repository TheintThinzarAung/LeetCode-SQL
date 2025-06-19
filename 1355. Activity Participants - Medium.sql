
WITH ActivityCount AS (
    SELECT activity, COUNT(id) AS participant_count
    FROM Friends
    GROUP BY activity
),

MinMax AS (
    SELECT 
        MAX(participant_count) AS max_count,
        MIN(participant_count) AS min_count
    FROM ActivityCount
)

SELECT activity AS results
FROM ActivityCount, MinMax
WHERE participant_count NOT IN (max_count, min_count);

----------------------------------------------------------------------------------

CREATE TABLE Activities (
    id INT PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE Friends (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    activity VARCHAR(50)
);

-- Insert into Activities table
INSERT INTO Activities (id, name) VALUES
(1, 'Eating'),
(2, 'Singing'),
(3, 'Horse Riding');

-- Insert into Friends table
INSERT INTO Friends (id, name, activity) VALUES
(1, 'Jonathan D.', 'Eating'),
(2, 'Jade W.', 'Singing'),
(3, 'Victor J.', 'Singing'),
(4, 'Elvis Q.', 'Eating'),
(5, 'Daniel A.', 'Eating'),
(6, 'Bob B.', 'Horse Riding');
