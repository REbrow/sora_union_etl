WITH employees as (
    select * from {{ ref("int_employee") }}
),
clients as (
    select * from {{ ref("int_client") }}
),
projects as (
    select * from {{ ref("int_project") }}
),
tasks as (
    select * from {{ ref("int_task") }}
),
task_details as (
    select * from {{ ref("int_task_detail") }}
)

select 
    t.client_id,
    c.client,
    t.project_id,
    p.project,
    t.employee_id,
    e.employee_name,
    e.employee_role,
    t.task_id,
    t.estimated_hours,
    t.start_date,
    t.end_date,
    td.task_date,
    td.hours,
    td.note,
    td.billable
from task_details td
left join clients c on lower(c.client) = lower(td.client)
left join employees e on lower(e.employee_name) = lower(td.employee_name)
left join projects p on lower(p.project) = lower(td.project)
left join tasks t on lower(t.task) = lower(td.task) 
    and t.client_id = c.client_id 
    and t.project_id = p.project_id 
    and t.employee_id = e.employee_id
group by 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15

