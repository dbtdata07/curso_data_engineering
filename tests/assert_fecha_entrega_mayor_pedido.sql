SELECT *
FROM {{ ref('stg_sql_server_dbo__orders') }}
WHERE DELIVERED_AT_UTC < CREATED_AT_UTC