with 
product as(
    SELECT * FROM {{ ref('stg_product') }}

),

renamed as (
    SELECT
        prod_id as product_id ,
        category as product_category ,
        product_name ,
        stock::bool as in_stock
    FROM product
) 
SELECT * FROM renamed
