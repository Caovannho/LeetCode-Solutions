# Write your MySQL query statement below
SELECT c.name
FROM Customer c
WHERE c.referee_id  is NULL or c.referee_id !=2