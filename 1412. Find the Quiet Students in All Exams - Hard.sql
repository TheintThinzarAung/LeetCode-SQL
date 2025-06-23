WITH max_min AS (
    SELECT 
        exam_id, 
        MAX(score) AS max_score, 
        MIN(score) AS min_score
    FROM Exam
    GROUP BY exam_id
),

quiet_students AS (
    SELECT DISTINCT e1.student_id
    FROM Exam e1
    WHERE e1.student_id NOT IN (
        SELECT e2.student_id
        FROM Exam e2
        JOIN max_min mm ON e2.exam_id = mm.exam_id
        WHERE e2.score IN (mm.max_score, mm.min_score)
    )
)

SELECT DISTINCT s.student_id, s.student_name
FROM Student s
JOIN quiet_students qs ON s.student_id = qs.student_id
ORDER BY s.student_id;





















-----------------------------------------------------------------------------------
CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100)
);

CREATE TABLE Exam (
    exam_id INT,
    student_id INT,
    score INT,
    PRIMARY KEY (exam_id, student_id),
    FOREIGN KEY (student_id) REFERENCES Student(student_id)
);
INSERT INTO Student (student_id, student_name) VALUES
(1, 'Daniel'),
(2, 'Jade'),
(3, 'Stella'),
(4, 'Jonathan'),
(5, 'Will');
INSERT INTO Exam (exam_id, student_id, score) VALUES
(10, 1, 70),
(10, 2, 80),
(10, 3, 90),
(20, 1, 80),
(30, 1, 70),
(30, 3, 80),
(30, 4, 90),
(40, 1, 60),
(40, 2, 70),
(40, 4, 80);

