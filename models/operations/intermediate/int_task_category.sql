WITH task_detail as (
    select * from {{ ref("int_project_information") }}
),
task_categories as (
    select distinct task from task_detail
)
select 
    row_number() over () as category_id,
    task as category
from task_categories