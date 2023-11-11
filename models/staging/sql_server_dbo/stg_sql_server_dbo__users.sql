with 

source as (

    select * from {{ source('sql_server_dbo', 'users') }}

),

renamed as (

    select
        user_id,
        updated_at  AS updated_at_utc,
        address_id,
        last_name,
        created_at  AS created_at_utc,
        phone_number,
        total_orders,
        first_name,
        email,
        _fivetran_deleted,
        _fivetran_synced

    from source

)

select * from renamed
