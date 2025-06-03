-- Create Teams table
CREATE TABLE Teams (
    team_id INT PRIMARY KEY,
    team_name VARCHAR(50) NOT NULL
);
-- Insert data into Teams table
INSERT INTO Teams (team_id, team_name) VALUES
(10, 'Leetcode FC'),
(20, 'NewYork FC'),
(30, 'Atlanta FC'),
(40, 'Chicago FC'),
(50, 'Toronto FC');
select * from `match`;
-- Create Matches table
CREATE TABLE IF NOT EXISTS `Match` (
    match_id INT PRIMARY KEY,
    host_team INT NOT NULL,
    guest_team INT NOT NULL,
    host_goals INT NOT NULL,
    guest_goals INT NOT NULL,
    FOREIGN KEY (host_team) REFERENCES Teams(team_id),
    FOREIGN KEY (guest_team) REFERENCES Teams(team_id)
);

-- Insert data into Matches table
INSERT INTO `Match` (match_id, host_team, guest_team, host_goals, guest_goals) VALUES
(1, 10, 20, 3, 0),
(2, 30, 10, 2, 2),
(3, 10, 50, 5, 1),
(4, 20, 30, 1, 0),
(5, 50, 30, 1, 0);

WITH combined_points AS (
    -- Calculate points when team is host
    SELECT 
        host_team AS team_id,
        SUM(CASE 
            WHEN host_goals > guest_goals THEN 3 
            WHEN host_goals = guest_goals THEN 1 
            ELSE 0 
        END) AS points
    FROM `Match`
    GROUP BY host_team
    
    UNION ALL
    
    -- Calculate points when team is guest
    SELECT 
        guest_team AS team_id,
        SUM(CASE 
            WHEN host_goals < guest_goals THEN 3 
            WHEN host_goals = guest_goals THEN 1 
            ELSE 0 
        END) AS points
    FROM `Match`
    GROUP BY guest_team
)

SELECT 
    t.team_id,
    t.team_name,
    COALESCE(SUM(cp.points), 0) AS num_points
FROM 
    Teams t
LEFT JOIN 
    combined_points cp ON t.team_id = cp.team_id
GROUP BY 
    t.team_id, 
    t.team_name
ORDER BY 
    num_points DESC,
    t.team_id ASC;