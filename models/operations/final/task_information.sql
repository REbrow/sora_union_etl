WITH task_summary as (
    select * from {{ ref('int_task_information') }}
)

select 
    row_number() over () as task_information_id,
    task_id,
    task_date,
    hours,
    note,
    billable
from task_summary 