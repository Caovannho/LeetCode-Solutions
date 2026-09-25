# Write your MySQL query statement below
SELECT P.product_name,     
SUM(o.unit) AS unit
FROM Products P
JOIN Orders O ON  p.product_id = o.product_id
WHERE O.order_date   BETWEEN '2020-02-01' AND '2020-02-29' 


GROUP BY p.product_id, p.product_name
HAVING unit >= 100;





