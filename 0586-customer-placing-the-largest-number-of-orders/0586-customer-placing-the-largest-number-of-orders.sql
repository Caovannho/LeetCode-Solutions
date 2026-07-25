# Write your MySQL query statement below
SELECT customer_number 
FROM Orders 
GROUP BY customer_number 
HAVING COUNT(customer_number ) >= ALL (
    SELECT COUNT(order_number)
    FROM Orders
    GROUP BY customer_number
)