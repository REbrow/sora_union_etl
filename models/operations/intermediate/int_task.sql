WITH task_detail as (
    select * from {{ ref('int_project_information') }}
),
projects as (
    select * from {{ ref('int_project') }}
), 
staffs as (
    select * from {{ ref('int_staff') }}
),
task_categories as (
    select * from {{ ref('int_task_category') }}
),
tasks as (
    select 
        distinct client,
        project,
        staff_name,
        task as category,
        start_date,
        end_date,
        estimated_hours
    from task_detail
)

select 
    row_number() over () as task_id,
    project_id,
    staff_id,
    category_id as task_category_id,
    t.start_date,
    t.end_date,
    estimated_hours
from tasks t 
join projects using (project)
join staffs using (staff_name)
join task_categories using (category)