select 
        t.*, c.category as task
    from {{ ref("int_task") }} t 
    left join {{ ref("int_task_category") }} c on c.category_id = t.task_category_id