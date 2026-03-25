{{ config(materialized='view') }}

select
    id as payment_id,
    orderid as order_id,
    paymentmethod as payment_method,
    status,
    amount,
    createdat as created_at
from {{ source('stripe', 'payments') }}
