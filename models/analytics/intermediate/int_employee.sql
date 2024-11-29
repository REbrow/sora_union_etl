WITH project_detail as (
    select * from {{ ref("int_project_detail") }}
),
employees as (
    select 
        distinct employee_name,
        employee_role
    from project_detail
)

select 
    row_number() over () as employee_id,
    employee_name,
    employee_role
from employees