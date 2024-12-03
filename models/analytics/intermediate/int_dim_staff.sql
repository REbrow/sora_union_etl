WITH staff_roles as (
    select 
        s.staff_id,
        s.staff_name,
        r.role
    from {{ ref('int_staff') }} s
    left join {{ ref('int_role') }} r on r.role_id = s.role_id
)

select * from staff_roles