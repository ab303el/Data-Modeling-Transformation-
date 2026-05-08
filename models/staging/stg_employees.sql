with source_data as (
    -- the ref() function tells dbt to look for the seed we just made 
    SELECT * FROM {{ ref('raw_employees')}}
),

renamed as (
    SELECT
        emp_id as employee_id ,
        first_name ,
        last_name ,
        -- if age is empty or 0 change to NULL
        -- nullif(nullif(age::text , '') , '0')::int as age,
        coalesce(age , 0) as age,
        department ,
        -- manual transformation
        first_name || ' ' || last_name as full_name 

    FROM source_data
)

SELECT * FROM renamed