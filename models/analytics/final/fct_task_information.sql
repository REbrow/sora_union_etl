WITH task_summary as (
    select * from {{ ref('int_dim_task_information') }}
)
select * from task_summary