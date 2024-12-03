WITH task_detail as (
    select * from {{ ref("int_project_information") }}
),
roles as (
    select 
        distinct role
    from task_detail
)

select 
    row_number() over () as role_id,
    role
from roles