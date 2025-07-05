WITH CombinedCalls AS (
    SELECT
        caller_id AS person_id,
        duration
    FROM
        Calls

    UNION ALL

    SELECT
        callee_id AS person_id,
        duration
    FROM
        Calls
),

GlobalAverage AS (
    SELECT
        AVG(duration) AS global_duration
    FROM
        Calls
),

PersonAverage AS (
    SELECT
        cc.person_id,
        AVG(cc.duration) AS avg_duration
    FROM
        CombinedCalls AS cc
    GROUP BY
        cc.person_id
),

AboveGlobal AS (
    SELECT
        pa.person_id
    FROM
        PersonAverage AS pa,
        GlobalAverage AS ga
    WHERE
        pa.avg_duration > ga.global_duration
),

PersonCountry AS (
    SELECT
        DISTINCT LEFT(p.phone_number, 3) AS country_code
    FROM
        Person AS p
    WHERE
        p.id IN (SELECT person_id FROM AboveGlobal)
)

SELECT
    DISTINCT c.name AS country
FROM
    Country AS c
    JOIN PersonCountry AS pc
      ON c.country_code = pc.country_code;


CREATE TABLE Person (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    phone_number VARCHAR(20)
);

CREATE TABLE Country (
    name VARCHAR(100),
    country_code VARCHAR(3) PRIMARY KEY
);

CREATE TABLE Calls (
    caller_id INT,
    callee_id INT,
    duration INT
);

INSERT INTO Person (id, name, phone_number) VALUES
(3, 'Jonathan', '051-1234567'),
(12, 'Elvis', '051-7654321'),
(1, 'Moncef', '212-1234567'),
(2, 'Maroua', '212-6523651'),
(7, 'Meir', '972-1234567'),
(9, 'Rachel', '972-0011100');
INSERT INTO Country (name, country_code) VALUES
('Peru', '051'),
('Israel', '972'),
('Morocco', '212'),
('Germany', '049'),
('Ethiopia', '251');

INSERT INTO Calls (caller_id, callee_id, duration) VALUES
(1, 9, 33),
(2, 9, 4),
(1, 2, 59),
(3, 12, 102),
(3, 12, 330),
(12, 3, 5),
(7, 9, 13),
(7, 1, 3),
(9, 7, 1),
(1, 7, 7);

