# Write your MySQL query statement below
WITH RankedEmployees AS(
    SELECT 
        name as Employee,
        salary,
        departmentId,
        DENSE_RANK() OVER (PARTITION BY departmentId ORDER BY salary DESC) as rk
        FROM Employee 
)
SELECT 
    d.name AS Department,
    e.Employee,
    e.salary

FROM RankedEmployees e
JOIN Department d ON e.departmentId = d.id
WHERE e.rk = 1;