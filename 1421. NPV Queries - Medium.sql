SELECT 
    q.id, 
    q.year, 
    COALESCE(n.npv, 0) AS npv
FROM Queries q
LEFT JOIN NPV n 
    ON q.id = n.id 
    AND q.year = n.year;

-----------------------------------------------------
CREATE TABLE NPV (
    id INT,
    year INT,
    npv INT,
    PRIMARY KEY (id, year)
);

CREATE TABLE Queries (
    id INT,
    year INT,
    PRIMARY KEY (id, year)
);
INSERT INTO NPV (id, year, npv) VALUES
(1, 2018, 100),
(7, 2020, 30),
(13, 2019, 40),
(1, 2019, 113),
(2, 2008, 121),
(3, 2009, 12),
(11, 2020, 99),
(7, 2019, 0);
INSERT INTO Queries (id, year) VALUES
(1, 2019),
(2, 2008),
(3, 2009),
(7, 2018),
(7, 2019),
(7, 2020),
(13, 2019);

