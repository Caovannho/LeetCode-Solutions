# Write your MySQL query statement below
WITH valid_trips AS (
    SELECT 
        t.request_at,
        t.status,
        t.client_id,
        t.driver_id
    FROM Trips t
    INNER JOIN Users u1 ON t.client_id = u1.users_id AND u1.banned = 'No'
    INNER JOIN Users u2 ON t.driver_id = u2.users_id AND u2.banned = 'No'
    WHERE t.request_at BETWEEN '2013-10-01' AND '2013-10-03'
)
SELECT 
    request_at AS Day,
    ROUND(
        SUM(CASE WHEN status IN ('cancelled_by_driver', 'cancelled_by_client') THEN 1 ELSE 0 END) * 1.0 
        / COUNT(*), 
        2
    ) AS `Cancellation Rate`
FROM valid_trips
GROUP BY request_at
ORDER BY request_at;