{{ dbt_utils.date_spine(
    datepart="week",
    start_date="cast('2019-01-01' as date)",
    end_date="cast(current_date as date)"
   )
}}