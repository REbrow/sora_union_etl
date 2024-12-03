WITH clients as (
    select * from {{ ref("int_client") }}
),
projects as (
    select * from {{ ref("int_project")}}
)

select 
    p.project_id,
    c.client,
    p.project,
    p.start_date,
    p.end_date
from 
projects p  
left join clients c on p.client_id = c.client_id