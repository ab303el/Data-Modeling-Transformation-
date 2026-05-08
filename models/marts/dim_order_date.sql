with 
sales as (
    SELECT * FROM {{ ref('stg_sales') }}
),

renamed as (
    SELECT
        to_char(date_of_order , 'YYYYMMDD') as order_date_id ,
        date_of_order as dates
    FROM sales
)

SELECT * FROM renamed
