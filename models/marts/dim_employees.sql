with
empl as (
    SELECT * FROM {{ ref('stg_employees') }}
),

renamed as (
    SELECT
        employee_id,
        full_name ,
        department ,
        age
    FROM empl
)

SELECT * FROM renamed