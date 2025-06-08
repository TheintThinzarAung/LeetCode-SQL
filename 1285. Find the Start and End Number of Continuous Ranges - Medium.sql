SELECT 
    MIN(log_id) AS start_id,
    MAX(log_id) AS end_id
FROM (
    SELECT 
        log_id,
        log_id - ROW_NUMBER() OVER (ORDER BY log_id) AS ranks
    FROM logs
) AS sq
GROUP BY ranks;

--------------------------------------------------------------------------------

create table logs(
log_id int primary key
);
INSERT INTO Logs (log_id) VALUES
(1),
(2),
(3),
(7),
(8),
(10);