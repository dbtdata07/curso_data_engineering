with 

source as (

    select * from {{ source('sql_server_dbo', 'orders') }}

),

renamed as (

    select
        order_id
        ,shipping_service
        , shipping_cost AS shipping_cost_usd
        ,address_id
        , created_at AS created_at_utc
        ,promo_id
       , estimated_delivery_at AS estimated_delivery_at_utc
       , order_cost AS item_order_cost_usd
        ,user_id
        , order_total AS total_order_cost_usd
         , delivered_at AS delivered_at_utc
        ,tracking_id
        , status AS status_order
        ,_fivetran_deleted
        _fivetran_synced
    from source

)

select * from renamed
