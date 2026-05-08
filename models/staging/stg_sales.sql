with source_data as(

    SELECT * FROM {{ ref('raw_sales') }}
),

renamed as (

    SELECT
        sale_id,
        employee_id,
        sale_date as date_of_order,
        amount  as price,
        nullif(prod_id::text , '')::int as product_id

    FROM source_data
)

SELECT * FROM renamed