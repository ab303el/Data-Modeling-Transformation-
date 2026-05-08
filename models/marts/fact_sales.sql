with 
sales as (
    SELECT * FROM {{ ref('stg_sales') }}
),
employees as (
    SELECT * FROM {{ ref('dim_employees') }}
),
product as (
    SELECT * FROM {{ ref('dim_product') }}
),
dates as (
    SELECT * FROM {{ ref('dim_order_date') }}
),

renamed as(
    SELECT 
        s.sale_id ,
        e.employee_id ,
        cast(d.order_date_id as date) as order_date_id ,
        s.price ,
        pr.product_id
    FROM sales s 
        LEFT JOIN employees e on s.employee_id = e.employee_id
        LEFT JOIN dates d on s.date_of_order = d.dates
        LEFT JOIN product pr on s.product_id = pr.product_id
)

SELECT * FROM renamed