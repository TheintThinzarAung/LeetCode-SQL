WITH nov_weather AS (
    SELECT 
        w.country_id, 
        CAST(w.weather_state AS SIGNED) AS weather_state
    FROM Weather w
    WHERE DATE_FORMAT(w.day, '%Y-%m') = '2019-11'
),

country_avg_weather AS (
    SELECT 
        nw.country_id,
        AVG(nw.weather_state) AS avg_weather
    FROM nov_weather nw
    GROUP BY nw.country_id
)

SELECT 
    c.country_name,
    CASE 
        WHEN aw.avg_weather <= 15 THEN 'Cold'
        WHEN aw.avg_weather >= 25 THEN 'Hot'
        ELSE 'Warm'
    END AS weather_type
FROM country_avg_weather aw
JOIN Countries c 
    ON aw.country_id = c.country_id;








--------------------------------------------------------------------------------------------------

CREATE TABLE Countries (
    country_id INT PRIMARY KEY,
    country_name VARCHAR(100)
);

CREATE TABLE Weather (
    country_id INT,
    weather_state VARCHAR(50),
    day DATE,
    PRIMARY KEY (country_id, day),
    FOREIGN KEY (country_id) REFERENCES Countries(country_id)
);

INSERT INTO Countries (country_id, country_name) VALUES
(2, 'USA'),
(3, 'Australia'),
(7, 'Peru'),
(5, 'China'),
(8, 'Morocco'),
(9, 'Spain');
INSERT INTO Weather (country_id, weather_state, day) VALUES
(2, 15, '2019-11-01'),
(2, 12, '2019-10-28'),
(2, 12, '2019-10-27'),
(3, -2, '2019-11-10'),
(3, 0, '2019-11-11'),
(3, 3, '2019-11-12'),
(5, 16, '2019-11-07'),
(5, 18, '2019-11-09'),
(5, 21, '2019-11-23'),
(7, 25, '2019-11-28'),
(7, 22, '2019-12-01'),
(7, 20, '2019-12-02'),
(8, 25, '2019-11-05'),
(8, 27, '2019-11-15'),
(8, 31, '2019-11-25'),
(9, 7, '2019-10-23'),
(9, 3, '2019-12-23');
