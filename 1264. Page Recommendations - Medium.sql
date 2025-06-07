SELECT DISTINCT l.page_id AS recommended_page
FROM Likes l
WHERE l.user_id IN (
    SELECT user2_id FROM Friendship WHERE user1_id = 1
    UNION
    SELECT user1_id FROM Friendship WHERE user2_id = 1
)
AND l.page_id NOT IN (
    SELECT page_id FROM Likes WHERE user_id = 1
);
------------------------------------------------------

-- Create Friendship table
CREATE TABLE Friendship (
    user1_id INT NOT NULL,
    user2_id INT NOT NULL,
    PRIMARY KEY (user1_id, user2_id)
);

-- Create Likes table
CREATE TABLE Likes (
    user_id INT NOT NULL,
    page_id INT NOT NULL,
    PRIMARY KEY (user_id, page_id)
);

INSERT INTO Friendship (user1_id, user2_id) VALUES
(1, 2),
(1, 3),
(1, 4),
(2, 3),
(2, 4),
(2, 5),
(6, 1);
INSERT INTO Likes (user_id, page_id) VALUES
(1, 88),
(2, 23),
(3, 24),
(4, 56),
(5, 11),
(6, 33),
(2, 77),
(3, 77),
(6, 88);



