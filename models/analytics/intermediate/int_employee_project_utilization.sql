WITH employee as (
    select * from {{ ref("int_employee") }}
),

project_detail as (
    select * from {{ ref("int_project_detail") }}
),
summary as (
select 
  client,
  project,
  employee_name,
  employee_role,
  start_date,
  end_date, 
  estimated_hours,
  sum(hours) as logged_hours,
  count(task_date) as days_worked
from project_detail 
group by 1,2,3,4,5,6,7
order by 1
)

select 
    *,
    case 
        when logged_hours > estimated_hours then 'Over Estimate'
        when logged_hours = estimated_hours then 'Completed'
        else 'Under Estimate'
    end as utilization_status
from summary