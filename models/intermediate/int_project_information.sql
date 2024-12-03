WITH float_allocation as (
    select * from {{ ref("stg_float_allocation") }}
),
clickup as (
    select * from {{ ref("stg_clickup") }}
)

select 
    f.client,
    f.project,
    f.staff_name,
    f.staff_role as role,
    f.task,
    f.start_date,
    f.end_date,
    f.estimated_hours,
    c.task_date,
    c.hours,
    c.note,
    c.billable
from clickup c 
left join float_allocation f 
    on lower(c.staff_name) = lower(f.staff_name) 
    and lower(c.client) = lower(f.client)
    and lower(c.project) = lower(f.project)
    --and lower(c.task) = lower(f.task) #2 records having different task in both dataset