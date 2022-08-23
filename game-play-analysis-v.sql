-- MySQL, Oracle PL/SQL, MSSQL
SELECT
    a.event_date AS install_dt,
    COUNT(a.player_id) AS installs,
    ROUND(COUNT(b.player_id) / COUNT(a.player_id), 2) AS Day1_retention
FROM
(SELECT player_id, MIN(event_date) AS event_date
FROM Activity
GROUP BY player_id) a
LEFT JOIN b
    ON a.player_id = b.player_id
    AND a.event_date + 1 = b.event_date
GROUP BY a.event_date