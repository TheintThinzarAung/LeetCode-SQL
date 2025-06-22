SELECT 
    u.name, 
    COALESCE(r.total_distance, 0) AS travelled_distance
FROM Users u
LEFT JOIN (
    SELECT 
        user_id, 
        SUM(distance) AS total_distance
    FROM Rides
    GROUP BY user_id
) r ON u.id = r.user_id
ORDER BY 
    travelled_distance DESC,
    u.name ASC;
