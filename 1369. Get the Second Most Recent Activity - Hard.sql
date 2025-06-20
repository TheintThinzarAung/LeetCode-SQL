WITH RankedActivities AS (
    SELECT 
        username,
        activity,
        startDate,
        endDate,
        ROW_NUMBER() OVER (PARTITION BY username ORDER BY endDate DESC) AS activity_rank
    FROM UserActivity
),

SecondRecentActivities AS (
    SELECT 
        username, 
        activity, 
        startDate, 
        endDate
    FROM RankedActivities
    WHERE activity_rank = 2
),

SingleActivityUsers AS (
    SELECT 
        username, 
        activity, 
        startDate, 
        endDate
    FROM UserActivity
    WHERE username NOT IN (SELECT username FROM SecondRecentActivities)
)

SELECT * FROM SecondRecentActivities
UNION
SELECT * FROM SingleActivityUsers;

























------------------------------------------------------------------------------
-- Create the .UserActivity table
CREATE TABLE UserActivity (
    username   VARCHAR(50),
    activity   VARCHAR(50),
    startDate  DATE,
    endDate    DATE
);

-- Insert the data into the table
INSERT INTO UserActivity (username, activity, startDate, endDate) VALUES
('Alice', 'Travel',  '2020-02-12', '2020-02-20'),
('Alice', 'Dancing', '2020-02-21', '2020-02-23'),
('Alice', 'Travel',  '2020-02-24', '2020-02-28'),
('Bob',   'Travel',  '2020-02-11', '2020-02-18');
