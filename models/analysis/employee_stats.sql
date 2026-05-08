with employees as (
    SELECT * from {{ref('dim_employees')}}
)

SELECT
    department ,
    COUNT(*) as total_employees ,
    COUNT(age) as employees_with_age ,
    -- calculating the % of missing data 
    round(100.0 * (COUNT(*) - COUNT(age)) / COUNT(*) , 2) as percent_missing_age ,
    AVG(age) as average_age ,
    MIN(age) as youngest ,
    MAX(age) as oldest
FROM employees
GROUP BY 1 