{{
  config(
    materialized='view'
  )
}}
with 

source as (

    select * from {{ source('google_sheets', 'budget') }}

),

renamed as (

    select
        _row,
        quantity,
        month,
        product_id,
        _fivetran_synced AS date_load
    from source
    where month >= '{{ var('budget_date')}}'

)

select * from renamed
