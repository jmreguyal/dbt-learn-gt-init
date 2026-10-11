    select
        ID as id,
        ORDERID as order_id,
        PAYMENTMETHOD as payment_method,
        STATUS as status,
        AMOUNT as amount,
        CREATED as created
    from raw.stripe.payments