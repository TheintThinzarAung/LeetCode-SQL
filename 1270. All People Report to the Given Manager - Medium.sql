

WITH e1 AS (
    SELECT employee_id
    FROM Employees
    WHERE manager_id = 1 AND employee_id != 1
),
e2 AS (
    SELECT e.employee_id
    FROM Employees e
    JOIN e1 ON e.manager_id = e1.employee_id
),
e3 AS (
    SELECT e.employee_id
    FROM Employees e
    JOIN e2 ON e.manager_id = e2.employee_id
)

SELECT employee_id FROM e1
UNION
SELECT employee_id FROM e2
UNION
SELECT employee_id FROM e3;


-- Create the Employees table
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    manager_id INT
);

-- Insert values into the Employees table
INSERT INTO Employees (employee_id, employee_name, manager_id) VALUES
(1, 'Boss', 1),
(3, 'Alice', 3),
(2, 'Bob', 1),
(4, 'Daniel', 2),
(7, 'Luis', 4),
(8, 'Jhon', 3),
(9, 'Angela', 8),
(77, 'Robert', 1);

