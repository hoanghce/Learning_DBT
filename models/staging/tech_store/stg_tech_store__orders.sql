with

orders as (

    select * from {{ source('tech_store', 'orders') }}

),

final as (

    select
        id as order_id,
        productid as product_id,
        quantity,
        userid as employee_id,
        customerid as customer_id,
        datetime as created_at,
        convert_timezone('UTC','America/New_York',datetime) as create_at_est,
        {{ utc_to_est('datetime') }} as create_at_est_h,
        date(datetime) AS create_at_dt

    from orders

)

select * from final