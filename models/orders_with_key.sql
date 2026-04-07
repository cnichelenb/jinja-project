{{ config(materialized='table') }}

select
    *,
    {{ dbt_utils.generate_surrogate_key(['order_id', 'customer_id']) }} as order_sk
from {{ ref('stg_orders') }};
