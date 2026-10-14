with orders as (

    select * from {{ ref('stg_jaffle_shop__orders')}}

),

payments as (

    select * from {{ ref('stg_stripe__payments')}}

),


final as (

    select
        orders.order_id,
        orders.customer_id,
        orders.order_date,
        SUM(case when payments.status = 'success' then payments.amount end) AS amount

    from orders
    left join payments using (order_id)
    
    GROUP BY 1,2,3

)

select * from final
