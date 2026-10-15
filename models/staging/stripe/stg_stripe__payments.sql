    select
        ID as payment_id,
        ORDERID as order_id,
        PAYMENTMETHOD as payment_method,
        STATUS as status,
        AMOUNT / 100 as amount, -- amount is stored in cents, convert to dollars
        CREATED as created

    from {{ source('stripe', 'payments')}}