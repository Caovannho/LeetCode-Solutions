# Write your MySQL query statement below
SELECT DISTINCT p.product_id, p.product_name
FROM Product p
JOIN Sales s ON p.product_id = s.product_id
WHERE s.sale_date BETWEEN '2019-01-01' AND '2019-03-31'
  AND p.product_id NOT IN (
      -- Danh sách đen: Những sản phẩm có xuất hiện giao dịch ngoài quý 1/2019
      SELECT product_id 
      FROM Sales 
      WHERE sale_date NOT BETWEEN '2019-01-01' AND '2019-03-31'
  );