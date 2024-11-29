WITH project_detail as (
    select * from {{ ref("int_project_detail") }}
),
clients as (
    select distinct client from project_detail
)
select 
    row_number() over () as client_id,
    client
from clients