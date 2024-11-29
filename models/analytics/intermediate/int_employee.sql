WITH task_summary as (
    select * from {{ ref("int_task_summary") }}
),
employees as (
    select 
        distinct employee_name,
        employee_role
    from task_summary
)

select 
    row_number() over () as employee_id,
    employee_name,
    employee_role
from employees