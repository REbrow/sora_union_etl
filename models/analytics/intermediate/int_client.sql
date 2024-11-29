WITH task_summary as (
    select * from {{ ref("int_task_summary") }}
),
clients as (
    select distinct client from task_summary
)
select 
    row_number() over () as client_id,
    client
from clients