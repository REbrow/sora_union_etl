WITH task_detail as (
    select * from {{ ref("int_project_information") }}
),
summary as (
    select 
        client,
        project,
        staff_name,
        role,
        estimated_hours,
        min(task_date) as start_date,
        max(task_date) as end_date,
        sum(hours) as total_logged_hours,
        sum(hours) filter (where billable) as billable_hours,
        sum(hours) filter (where not billable) as non_billable_hours,
        count(task_date) as days_worked
    from task_detail 
    group by 1,2,3,4,5
    order by 1
)

select 
    *,
    case 
        when total_logged_hours > estimated_hours then 'Over Estimate'
        when total_logged_hours = estimated_hours then 'Completed'
        else 'Under Estimate'
    end as utilization_status
from summary