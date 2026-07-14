# Write your MySQL query statement below


WITH RANKSALARIES  AS (
    SELECT d.name as Department ,
    e.name as Employee ,
    e.salary as Salary ,
    DENSE_RANK() OVER (PARTITION BY  d.id ORDER BY e.salary DESC) AS RANK_NUM
    FROM Employee e
    JOIN Department d
    ON e.departmentId = d.id
)
SELECT
Department,
Employee,
Salary
FROM RANKSALARIES 
WHERE RANK_NUM<=3
