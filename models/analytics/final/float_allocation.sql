{{
    config(
        schema='prod',
        materialized = 'table'
    )
}}

WITH float_allocation as (
    select * from {{ ref("stg_float_allocation") }}
)

select 
* 
from float_allocation