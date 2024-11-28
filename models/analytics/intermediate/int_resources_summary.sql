{{
    config(
        schema='staging',
        materialized = 'view'
    )
}}

WITH float_allocation as (
    select * from {{ ref("stg_float_allocation") }}
),
clickup as (
    select * from {{ ref("stg_clickup") }}
)

select 
    f.client,
    f.project,
    f.employee_name,
    f.task,
    f.start_date,
    f.end_date,
    f.estimated_hours,
    c.task_date,
    c.hours,
    c.note,
    c.billable
from float_allocation f 
left join clickup c 
    on lower(c.employee_name) = lower(f.employee_name) 
    and lower(c.client) = lower(f.client)
    and lower(c.project) = lower(f.project)
    and lower(c.task) = lower(f.task)