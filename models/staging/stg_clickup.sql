{{
    config(
        schema='staging',
        materialized = 'table'
    )
}}

WITH clickup as (
    select 
        "Client"::text as client,
        "Project"::text as project,
        "Name"::text as employee_name,
        "Task"::text as task,
        cast("Date" as date) as task_date,
        cast("Hours" as float) as hours,
        "Note"::text as note, 
        case 
            when "Billable" = 'Yes' then true
            when "Billable" = 'No' then false
            else null end 
        as billable
    from {{ ref('clickup') }}
)

select 
    *
from clickup