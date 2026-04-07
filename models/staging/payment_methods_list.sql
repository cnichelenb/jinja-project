{{ config(materialized='table') }}

select distinct
    paymentmethod
from {{ ref('stg_payments') }}

