WITH task_detail as (
    select * from {{ ref("int_task_detail") }}
),
employees as (
    select 
        distinct employee_name,
        employee_role
    from task_detail
)

select 
    row_number() over () as employee_id,
    employee_name,
    employee_role
from employees