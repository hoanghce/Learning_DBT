with

customers as (

    select * from {{ source('tech_store', 'customer') }}

),

final as (

    select
        id as customer_id,
        name as customer_name,
        cityid as city_id,
        mainsalesrepid as main_employee_id,
        createdatetime as created_at,
        convert_timezone('UTC','America/New_York',createdatetime) as created_at_est,
        {{ utc_to_est('createdatetime') }} as created_at_est_h,
        updatedatetime as updated_at,
        convert_timezone('UTC','America/New_York',updatedatetime) as update_at_est,
        {{ utc_to_est('update_at_est') }} as update_at_est_h,
        active as is_active
    
    from customers

)

select * from final