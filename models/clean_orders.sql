{{ config(materialized='table') }}

{{ dbt_utils.deduplicate(
    relation=ref('stg_orders'),
    partition_by='order_id',
    order_by='updated_at desc'
) }}
