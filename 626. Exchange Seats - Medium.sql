SELECT 
    CASE 
        WHEN id % 2 = 0 THEN id - 1
        WHEN id = (SELECT MAX(id) FROM seat) THEN id
        ELSE id + 1
    END AS id,
    student
FROM 
    seat
ORDER BY 
    id;












Create table If Not Exists Seat (id int, student varchar(255));
insert into Seat (id, student) values ('1', 'Abbot')
,('2', 'Doris')
,('3', 'Emerson')
,('4', 'Green')
,('5', 'Jeames')