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
project_details as (
    select * from {{ ref("int_project_detail") }}
)

select 
    t.client_id,
    t.project_id,
    t.employee_id,
    t.task_id,
    r.task_date,
    r.hours,
    r.note,
    r.billable
from project_details r
left join clients c on lower(c.client) = lower(r.client)
left join employees e on lower(e.employee_name) = lower(r.employee_name)
left join projects p on lower(p.project) = lower(r.project)
left join tasks t on lower(t.task) = lower(r.task) 
    and t.client_id = c.client_id 
    and t.project_id = p.project_id 
    and t.employee_id = e.employee_id
group by 1,2,3,4,5,6,7,8

