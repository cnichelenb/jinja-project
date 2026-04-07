{{ config(materialized='table') }}

with spine as (
    {{ dbt_utils.date_spine(
        datepart="day",
        start_date="'2020-01-01'",
        end_date="'2020-04-10'"
    ) }}
)

select
    row_number() over (order by date_day) as number
from spine
qualify number <= 100
