WITH employees as (
    select * from {{ ref("int_employee") }}
)

select * from employees