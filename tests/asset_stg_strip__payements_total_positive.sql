    -- If total amount for an order < 0, that is a refund. Refund orders should be excluded.
    select
        order_id,
        SUM(amount) as total_amount

    from {{ ref('stg_stripe__payments')}}
    GROUP BY 1
    HAVING total_amount < 0