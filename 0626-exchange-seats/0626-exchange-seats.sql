# Write your MySQL query statement below
SELECT
    CASE
    WHEN id % 2 = 1 AND id + 1 <=  (SELECT COUNT(*) FROM Seat) then id +1
    WHEN id % 2 = 1 then id
    else id-1
    END AS id,
    student
FROM Seat
ORDER BY id

