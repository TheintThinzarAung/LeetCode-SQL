SELECT 
    user_id, 
    COUNT(follower_id) AS followers_count
FROM 
    followers
GROUP BY 
    user_id;
-------------------------------------------------------------------------------



Create table If Not Exists Followers(user_id int, follower_id int);

insert into Followers (user_id, follower_id) 
values 
('0', '1')
,('1', '0')
,('2', '0')
,('2', '1')