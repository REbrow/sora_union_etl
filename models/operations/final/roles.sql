WITH roles as (
    select * from {{ ref("int_role") }}
)

select * from roles