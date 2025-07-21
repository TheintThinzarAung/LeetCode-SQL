WITH employee_department_counts AS (
    SELECT 
        employee_id, 
        COUNT(department_id) AS department_count
    FROM 
        tb_employee
    GROUP BY 
        employee_id
)

SELECT 
    employee_id,
    department_id
FROM 
    tb_employee
WHERE 
    primary_flag = 'Y'
    OR employee_id IN (
        SELECT employee_id 
        FROM employee_department_counts 
        WHERE department_count = 1
    );








Create table If Not Exists tb_Employee (employee_id int, department_id int, primary_flag ENUM('Y','N'));
insert into tb_Employee (employee_id, department_id, primary_flag) values ('1', '1', 'N')
,('2', '1', 'Y')
, ('2', '2', 'N')
,('3', '3', 'N')
,('4', '2', 'N')
,('4', '3', 'Y')
,('4', '4', 'N')