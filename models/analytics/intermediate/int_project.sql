WITH project_detail as (
    select * from {{ ref("int_project_detail") }}
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
from project_detail 
group by client, project
)

select 
    row_number() over () as project_id,
    client_id, 
    project, 
    start_date, 
    end_date 
from projects p join clients using(client)