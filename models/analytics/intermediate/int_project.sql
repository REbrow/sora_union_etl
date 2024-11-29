WITH task_summary as (
    select * from {{ ref("int_task_summary") }}
),
clients as (
    select * from {{ ref('int_client') }}
),
projects as (
select 
    distinct client,
    project,
    min(start_date) as start_date,
    max(end_date) as end_date
from task_summary 
group by client, project
)

select 
    row_number() over () as project_id,
    client_id, 
    project, 
    start_date, 
    end_date 
from projects p join clients using(client)