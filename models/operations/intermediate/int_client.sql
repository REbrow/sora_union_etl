WITH task_detail as (
    select * from {{ ref("int_task_detail") }}
),
clients as (
    select distinct client from task_detail
)
select 
    row_number() over () as client_id,
    client
from clients