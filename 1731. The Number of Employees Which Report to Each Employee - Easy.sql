WITH report_summary AS (
    SELECT 
        emp.reports_to AS manager_id, 
        COUNT(emp.employee_id) AS reports_count, 
        ROUND(AVG(emp.age), 0) AS average_age
    FROM 
        ta_employees AS emp
        JOIN ta_employees AS mgr ON emp.reports_to = mgr.employee_id
    GROUP BY 
        emp.reports_to
)

SELECT 
    mgr.employee_id, 
    mgr.name, 
    rs.reports_count, 
    rs.average_age
FROM 
    ta_employees AS mgr
    JOIN report_summary AS rs ON rs.manager_id = mgr.employee_id;



























Create table If Not Exists ta_Employees(employee_id int, name varchar(20), reports_to int, age int);

insert into ta_Employees (employee_id, name, reports_to, age) values ('9', 'Hercy', NULL, '43')
,('6', 'Alice', '9', '41')
,('4', 'Bob', '9', '36')
,('2', 'Winston', NULL, '37')