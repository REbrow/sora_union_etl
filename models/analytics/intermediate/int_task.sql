WITH project_detail as (
    select * from {{ ref('int_project_detail') }}
),
projects as (
    select * from {{ ref('int_project') }}
), 
employees as (
    select * from {{ ref("int_employee") }}
),
tasks as (
    select 
        distinct client,
        project,
        employee_name,
        task,
        start_date,
        end_date,
        estimated_hours
    from project_detail
)

select 
    row_number() over () as task_id,
    client_id,
    project_id,
    employee_id,
    task,
    t.start_date,
    t.end_date,
    estimated_hours
from tasks t 
join projects using (project)
join employees using (employee_name)