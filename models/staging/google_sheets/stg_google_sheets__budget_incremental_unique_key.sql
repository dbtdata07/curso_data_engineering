{{ config(
    materialized='incremental',
    unique_key = '_row'
    ) 
    }}
with 

source as (

    select * from {{ source('google_sheets', 'budget') }}
    {% if is_incremental() %}

	  where _fivetran_synced > (select max(date_load) from {{ this }})

{% endif %}
    

),

renamed as (

    select
        _row,
        quantity,
        month,
        product_id,
        _fivetran_synced as date_load

    from source

)

select * from renamed
