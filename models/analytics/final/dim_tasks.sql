with tasks as (
    select 
        task_id,
        staff_id,
        task,
        start_date,
        end_date,
        estimated_hours
    from {{ ref('int_dim_task')}}
)
select * from tasks