{{
    config(
        schema='staging',
        materialized = 'table'
    )
}}

WITH float_allocation as (
    select 
        "Client"::text as client,
        "Project"::text as project,
        "Role"::text as employee_role,
        "Name"::text as employee_name,
        "Task"::text as task,
        cast("Start Date" as date) as start_date,
        cast("End Date" as date) as end_date,
        cast("Estimated Hours" as int) as estimated_hours 
    from {{ ref('seed_float_allocation') }}
)

select 
    *
from float_allocation
