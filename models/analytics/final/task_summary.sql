WITH task_summary as (
    select * from {{ ref('int_task_summary') }}
)

select 
    *
from task_summary 