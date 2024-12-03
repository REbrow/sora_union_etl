WITH staffs as (
    select * from {{ ref('int_dim_staff')}}
)

select * from staffs