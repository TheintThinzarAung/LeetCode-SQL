-- Generate numbers from 1 to 20 using recursive CTE
WITH RECURSIVE Numbers AS (
    SELECT 1 AS subtask_id
    UNION ALL
    SELECT subtask_id + 1 FROM Numbers WHERE subtask_id < 10
),
-- Cross join Tasks with numbers to simulate all expected subtasks
Expected AS (
    SELECT t.task_id, n.subtask_id
    FROM ta_Tasks t
    JOIN Numbers n ON n.subtask_id <= t.subtasks_count
)
SELECT e.task_id, e.subtask_id
FROM Expected e
LEFT JOIN Executed ex
ON e.task_id = ex.task_id AND e.subtask_id = ex.subtask_id
WHERE ex.subtask_id IS NULL
order by e.task_id;




CREATE TABLE ta_Tasks (
    task_id INT PRIMARY KEY,
    subtasks_count INT NOT NULL
);

CREATE TABLE Executed (
    task_id INT,
    subtask_id INT,
    PRIMARY KEY (task_id, subtask_id)
);
-- Insert into Tasks table
INSERT INTO ta_Tasks (task_id, subtasks_count) VALUES
(1, 3),
(2, 2),
(3, 4);

-- Insert into Executed table
INSERT INTO Executed (task_id, subtask_id) VALUES
(1, 2),
(3, 1),
(3, 2),
(3, 3),
(3, 4);

