WITH FirstYearSales AS (
    SELECT
        product_id  ,
        year   ,
        quantity    ,
        price       ,
        MIN(year) OVER(PARTITION BY product_id) AS first_year
    From Sales
)
SELECT 
    product_id ,
    first_year ,
    quantity ,
    price 
FROM FirstYearSales
WHERE year = first_year


















