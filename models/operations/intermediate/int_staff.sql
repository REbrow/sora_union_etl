WITH task_detail as (
    select * from {{ ref("int_project_information") }}
),
staffs as (
    select 
        distinct staff_name, 
            role
    from task_detail
),
roles as (
    select 
        * 
    from {{ ref('int_role') }}
)

select 
    row_number() over () as staff_id,
    staff_name,
    role_id
from staffs 
left join roles using (role)