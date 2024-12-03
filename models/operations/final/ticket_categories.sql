WITH task_categories as (
    select * from {{ ref("int_task_category") }}
)
select * from task_categories