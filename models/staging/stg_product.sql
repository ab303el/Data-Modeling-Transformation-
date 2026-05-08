with source_data as(
    SELECT * FROM {{ ref('raw_product') }}
),

renamed as (
    SELECT prod_id,
           prod_category as category,
           prod_name as product_name,
           stock

    FROM source_data
)
SELECT * FROM renamed