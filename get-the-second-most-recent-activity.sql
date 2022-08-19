-- MySQL, Oracle PL/SQL, MSSQL
SELECT username, activity, start_date, end_date
FROM
(SELECT
    username, activity, start_date, end_date,
    RANK() OVER(PARTITION BY username ORDER BY end_date DESC) r,
    COUNT(activity) OVER(PARTITION BY username) c
FROM UserActivity) lookup
WHERE r = 2 OR c = 1