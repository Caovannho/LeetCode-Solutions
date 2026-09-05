# Write your MySQL query statement below
SELECT 
    ROUND(COUNT(DISTINCT a.player_id) / (SELECT COUNT(DISTINCT player_id) FROM Activity), 2) AS fraction
FROM Activity a
JOIN (
    -- Bước 1: Tìm ngày đăng nhập đầu tiên của mỗi người chơi
    SELECT player_id, MIN(event_date) AS first_login
    FROM Activity
    GROUP BY player_id
) first_logins 
    ON a.player_id = first_logins.player_id
    -- Bước 2: Kiểm tra xem có dòng dữ liệu nào vào đúng ngày hôm sau không
    AND a.event_date = DATE_ADD(first_logins.first_login, INTERVAL 1 DAY);