{{
    config(
        schema='prod',
        materialized = 'table'
    )
}}

WITH clickup as (
    select * from {{ ref('stg_clickup') }}
)

select 
*
from clickup