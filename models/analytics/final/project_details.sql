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
project_details as (
    select * from {{ ref('int_project_detail') }}
)

select 
    c.client,
    p.project,
    e.employee_name,
    e.employee_role,
    t.task,
    ps.task_date,
    t.start_date,
    t.end_date,
    t.estimated_hours,
    ps.hours,
    ps.note,
    ps.billable
from project_details ps
left join clients c on c.client_id = ps.client_id
left join projects p on p.project_id = ps.project_id and p.client_id = ps.client_id
left join employees e on e.employee_id = ps.employee_id
left join tasks t on t.task_id = ps.task_id and t.client_id = ps.client_id
                     and t.employee_id = ps.employee_id
                     and t.project_id = ps.project_id