WITH staffs as (
    select * from {{ ref("int_dim_staff") }}
),
projects as (
    select * from {{ ref("int_dim_project") }}
),
tasks as (
    select * from {{ ref("int_dim_task") }}
),
task_details as (
    select * from {{ ref("int_project_information") }}
)

select 
    p.project_id,
    s.staff_id,
    t.task_id,
    td.task_date,
    td.hours,
    td.note,
    td.billable
from task_details td
left join staffs s on lower(s.staff_name) = lower(td.staff_name)
left join projects p on lower(p.project) = lower(td.project)
left join tasks t on lower(t.task) = lower(td.task) 
    and t.project_id = p.project_id 
    and t.staff_id = s.staff_id

