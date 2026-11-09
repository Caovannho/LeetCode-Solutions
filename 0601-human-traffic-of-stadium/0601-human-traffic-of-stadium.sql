# Write your MySQL query statement below
WITH FilteredStadium AS (
    SELECT id, visit_date, people
    FROM Stadium
    WHERE people >= 100
),
NumberedStadium AS (
    SELECT 
        id, 
        visit_date, 
        people,
        id - ROW_NUMBER() OVER (ORDER BY id) AS grp
    FROM FilteredStadium
),
CountedStadium AS (
    SELECT 
        id, 
        visit_date, 
        people,
        COUNT(*) OVER (PARTITION BY grp) AS cnt
    FROM NumberedStadium
)
SELECT 
    id, 
    visit_date, 
    people
FROM CountedStadium
WHERE cnt >= 3
ORDER BY visit_date ASC;