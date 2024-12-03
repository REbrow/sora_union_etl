WITH task_performance as (
    select * from {{ ref('int_task_performance') }}
)
select * from task_performance