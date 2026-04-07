{{ config(materialized='table') }}

{{ dbt_utils.date_spine(
    datepart="day",
    start_date="'2020-01-01'",
    end_date="'2020-12-31'"
) }}
