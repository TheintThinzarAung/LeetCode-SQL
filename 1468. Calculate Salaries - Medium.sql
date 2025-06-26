WITH MaxSalaryPerCompany AS (
    SELECT 
        company_id, 
        MAX(salary) AS max_salary
    FROM Salaries
    GROUP BY company_id
),

TaxRateByCompany AS (
    SELECT 
        company_id,
        CASE  
            WHEN max_salary < 1000 THEN 0 
            WHEN max_salary BETWEEN 1000 AND 10000 THEN 24
            ELSE 49
        END AS tax_rate
    FROM MaxSalaryPerCompany
)

SELECT 
    s.company_id, 
    s.employee_id, 
    s.employee_name, 
    t.tax_rate,
    ROUND(s.salary - s.salary * (t.tax_rate / 100.0), 0) AS after_tax
FROM Salaries s
JOIN TaxRateByCompany t 
    ON s.company_id = t.company_id
ORDER BY s.company_id;

-----------------------------------------------------------------------------
CREATE TABLE Salaries (
    company_id INT,
    employee_id INT,
    employee_name VARCHAR(100),
    salary INT,
    PRIMARY KEY (company_id, employee_id)
);

INSERT INTO Salaries (company_id, employee_id, employee_name, salary) VALUES
(1, 1, 'Tony', 2000),
(1, 2, 'Pronub', 21300),
(1, 3, 'Tyrrox', 10800),
(2, 1, 'Pam', 300),
(2, 7, 'Bassem', 450),
(2, 9, 'Hermione', 700),
(3, 7, 'Bocaben', 100),
(3, 2, 'Ognjen', 2200),
(3, 13, 'Nyancat', 3300),
(3, 15, 'Morninngcat', 7777);

