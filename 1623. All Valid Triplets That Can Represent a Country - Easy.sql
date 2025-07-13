SELECT a.student_name AS 'member_A',
b.student_name AS 'member_B',
c.student_name AS 'member_C'
FROM SchoolA AS a
JOIN SchoolB AS b
ON a.student_id <> b.student_id
AND a.student_name <> b.student_name
JOIN SchoolC AS c
ON a.student_id <> c.student_id
AND b.student_id <> c.student_id
AND a.student_name <> c.student_name
AND b.student_name <> c.student_name;

-- Create SchoolA table
CREATE TABLE SchoolA (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100)
);

-- Create SchoolB table
CREATE TABLE SchoolB (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100)
);

-- Create SchoolC table
CREATE TABLE SchoolC (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100)
);

-- Insert sample data for SchoolA
INSERT INTO SchoolA (student_id, student_name) VALUES
(1, 'Alice'),
(2, 'Bob');

-- Insert sample data for SchoolB
INSERT INTO SchoolB (student_id, student_name) VALUES
(3, 'Tom');

-- Insert sample data for SchoolC
INSERT INTO SchoolC (student_id, student_name) VALUES
(3, 'Tom'),
(2, 'Jerry'),
(10, 'Alice');

