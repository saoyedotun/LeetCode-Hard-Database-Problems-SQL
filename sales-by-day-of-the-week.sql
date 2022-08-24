-- MySQL, Oracle PL/SQL, MSSQL
SELECT
    item_category AS CATEGORY,
    SUM(IF(WEEKDAY(order_date) = 0, quantity, 0)) AS MONDAY,
    SUM(IF(WEEKDAY(order_date) = 1, quantity, 0)) AS TUESDAY,
    SUM(IF(WEEKDAY(order_date) = 2, quantity, 0)) AS WEDNESDAY,
    SUM(IF(WEEKDAY(order_date) = 3, quantity, 0)) AS THURSDAY,
    SUM(IF(WEEKDAY(order_date) = 4, quantity, 0)) AS FRIDAY,
    SUM(IF(WEEKDAY(order_date) = 5, quantity, 0)) AS SATURDAY,
    SUM(IF(WEEKDAY(order_date) = 6, quantity, 0)) AS SUNDAY
FROM Items
LEFT JOIN Orders
    ON Items.items_id = Orders.items_id
GROUP BY item_category
ORDER BY item_category