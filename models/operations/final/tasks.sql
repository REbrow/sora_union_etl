WITH tasks as (
    select * from {{ ref("int_task") }}
)
select * from tasks