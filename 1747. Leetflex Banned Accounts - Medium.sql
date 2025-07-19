SELECT DISTINCT l1.account_id
FROM loginfo l1
JOIN loginfo l2
  ON l1.account_id = l2.account_id
  AND l1.ip_address != l2.ip_address
WHERE NOT (l1.login > l2.logout OR l1.logout < l2.login);























CREATE TABLE LogInfo (
    account_id INT,
    ip_address INT,
    login DATETIME,
    logout DATETIME
);
INSERT INTO LogInfo (account_id, ip_address, login, logout) VALUES
(1, 1, '2021-02-01 09:00:00', '2021-02-01 09:30:00'),
(1, 2, '2021-02-01 08:00:00', '2021-02-01 11:30:00'),
(2, 6, '2021-02-01 20:30:00', '2021-02-01 22:00:00'),
(2, 7, '2021-02-02 20:30:00', '2021-02-02 22:00:00'),
(3, 9, '2021-02-01 16:00:00', '2021-02-01 16:59:59'),
(3, 13, '2021-02-01 17:00:00', '2021-02-01 17:59:59'),
(4, 10, '2021-02-01 16:00:00', '2021-02-01 17:00:00'),
(4, 11, '2021-02-01 17:00:00', '2021-02-01 17:59:59');

