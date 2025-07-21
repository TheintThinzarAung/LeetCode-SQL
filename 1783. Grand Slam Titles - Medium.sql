WITH grand_slams AS (
    SELECT winner_id, SUM(title_count) AS grand_slams_count
    FROM (
        SELECT Wimbledon AS winner_id, COUNT(*) AS title_count
        FROM Championships
        GROUP BY Wimbledon

        UNION ALL

        SELECT Fr_open AS winner_id, COUNT(*) AS title_count
        FROM Championships
        GROUP BY Fr_open

        UNION ALL

        SELECT US_open AS winner_id, COUNT(*) AS title_count
        FROM Championships
        GROUP BY US_open

        UNION ALL

        SELECT Au_open AS winner_id, COUNT(*) AS title_count
        FROM Championships
        GROUP BY Au_open
    ) AS combined
    GROUP BY winner_id
)

SELECT 
    p.player_id, 
    p.player_name, 
    g.grand_slams_count
FROM 
    ta_Players p
JOIN 
    grand_slams g 
    ON p.player_id = g.winner_id;






CREATE TABLE ta_Players (
    player_id INT PRIMARY KEY,
    player_name VARCHAR(100)
);

CREATE TABLE Championships (
    year INT PRIMARY KEY,
    Wimbledon INT,
    Fr_open INT,
    US_open INT,
    Au_open INT
);
-- Insert into Players
INSERT INTO ta_Players (player_id, player_name) VALUES
(1, 'Nadal'),
(2, 'Federer'),
(3, 'Novak');

-- Insert into Championships
INSERT INTO Championships (year, Wimbledon, Fr_open, US_open, Au_open) VALUES
(2018, 1, 1, 1, 1),
(2019, 1, 1, 2, 2),
(2020, 2, 1, 2, 2);

