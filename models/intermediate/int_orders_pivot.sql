select *
from (

    with payments as (

        {% set cols = [
            "id as payment_id",
            "orderid as order_id",
            "paymentmethod as payment_method",
            "status",
            "amount"
        ] %}

        select
            {{ cols | join(',\n            ') }}
        from {{ source('stripe', 'payments') }}
        where status = 'success'

    ),

    pivoted as (

        select   order_id,
                {% set payment_methods = ['bank_transfer', 'coupon', 'credit_card', 'gift_card', 'bitcoin'] %}
                {% for payment_method in payment_methods %}
                    sum(case when payment_method = '{{ payment_method }}' then amount else 0 end) as {{ payment_method }}_amount
                    {% if not loop.last %}
                    ,
                    {% endif %}
                {% endfor %}
        from payments
        group by 1

    )

    select *
    from pivoted

) as t
