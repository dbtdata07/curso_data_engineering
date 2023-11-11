WITH stg_google_sheets__budget AS (
    SELECT * 
    FROM {{ ref('stg_google_sheets__budget') }}
    ),
stg_google_sheets__budget_filtrada AS (
    SELECT * 
    FROM {{ ref('stg_google_sheets__budget_filtrada') }}
    ),
renamed_casted AS (
    SELECT
        product_id
        , month
        , quantity
        , date_load
    FROM stg_google_sheets__budget
    )

SELECT * FROM renamed_casted