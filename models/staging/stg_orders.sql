select *
from {{ source('stripe', 'orders') }}
