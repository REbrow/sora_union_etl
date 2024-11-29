WITH project_utilization as (
    select * from {{ ref("int_task_performance") }}
),
clients as (
    select * from {{ ref('clients') }}
),
projects as (
    select * from {{ ref('projects') }}
),
employees as (
    select * from {{ ref('employees') }}
),
tasks as (
    select * from {{ ref('tasks') }}
)

select 
    c.client_id,
    p.project_id,
    e.employee_id,
    pu.estimated_hours,
    pu.total_logged_hours,
    pu.billable_hours,
    pu.non_billable_hours,
    pu.days_worked,
    pu.utilization_status
from project_utilization pu
left join clients c on lower(c.client) = lower(pu.client)
left join projects p on lower(p.project) = lower(pu.project)
left join employees e on lower(e.employee_name) = lower(pu.employee_name)