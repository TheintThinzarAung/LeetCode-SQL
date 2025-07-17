WITH BoxWithChestContents AS (
    SELECT 
        b.box_id,
        b.chest_id,
        b.apple_count AS box_apple,
        b.orange_count AS box_orange,
        c.apple_count AS chest_apple,
        c.orange_count AS chest_orange
    FROM Boxes b 
    LEFT JOIN Chests c ON b.chest_id = c.chest_id
)

SELECT 
    SUM(COALESCE(box_apple, 0)) + SUM(COALESCE(chest_apple, 0)) AS apple_count,
    SUM(COALESCE(box_orange, 0)) + SUM(COALESCE(chest_orange, 0)) AS orange_count
FROM BoxWithChestContents;









CREATE TABLE Boxes (
    box_id INT PRIMARY KEY,
    chest_id INT,
    apple_count INT,
    orange_count INT
);

CREATE TABLE Chests (
    chest_id INT PRIMARY KEY,
    apple_count INT,
    orange_count INT
);
INSERT INTO Boxes (box_id, chest_id, apple_count, orange_count) VALUES
(2, NULL, 6, 15),
(18, 14, 4, 15),
(19, 3, 8, 4),
(12, 2, 19, 20),
(20, 6, 12, 9),
(8, 6, 9, 9),
(3, 14, 16, 7);

INSERT INTO Chests (chest_id, apple_count, orange_count) VALUES
(6, 5, 6),
(14, 20, 10),
(2, 8, 8),
(3, 19, 4),
(16, 19, 19);

