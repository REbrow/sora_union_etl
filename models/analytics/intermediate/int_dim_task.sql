WITH tasks as (
    select 
        t.task_id,
        t.project_id,
        t.staff_id,
        category as task,
        start_date,
        end_date,
        estimated_hours
    from {{ ref("int_task") }} t 
    left join {{ ref("int_task_category") }} c on c.category_id = t.task_category_id
)
select * from tasks