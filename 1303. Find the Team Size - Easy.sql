WITH TeamSizes AS (
    SELECT 
        team_id, 
        COUNT(*) AS team_size
    FROM Employee
    GROUP BY team_id
)

SELECT 
    e.employee_id, 
    t.team_size
FROM Employee AS e
JOIN TeamSizes AS t 
    ON e.team_id = t.team_id;


------------------------------------------
-- Create the Employee table
CREATE TABLE Employee (
    employee_id INT,
    team_id INT
);

-- Insert data into the Employee table
INSERT INTO Employee (employee_id, team_id) VALUES
(1, 8),
(2, 8),
(3, 8),
(4, 7),
(5, 9),
(6, 9);
