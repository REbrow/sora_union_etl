WITH clients as (
    select * from {{ ref("clients") }}
),
projects as (
    select * from {{ ref('projects') }}
),
employees as (
    select * from {{ ref('employees') }}
),
tasks as (
    select * from {{ ref('tasks') }}
),
task_summary as (
    select * from {{ ref('int_task_summary') }}
)

select 
    c.client,
    p.project,
    e.employee_name,
    e.employee_role,
    t.task,
    ts.task_date,
    t.start_date,
    t.end_date,
    t.estimated_hours,
    ts.hours,
    ts.note,
    ts.billable
from task_summary ts
left join clients c on c.client_id = ts.client_id
left join projects p on p.project_id = ts.project_id and p.client_id = ts.client_id
left join employees e on e.employee_id = ts.employee_id
left join tasks t on t.task_id = ts.task_id and t.client_id = ts.client_id
                     and t.employee_id = ts.employee_id
                     and t.project_id = ts.project_id