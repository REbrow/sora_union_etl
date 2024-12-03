WITH staffs as (
    select * from {{ ref("int_staff") }}
)

select * from staffs