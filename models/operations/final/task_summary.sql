WITH task_summary as (
    select * from {{ ref('int_task_summary') }}
)

select 
    row_number() over () as id,
    client_id,
    project_id,
    employee_id,
    task_id,
    task_date,
    hours,
    note,
    billable
from task_summary 