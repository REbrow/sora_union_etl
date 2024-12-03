with projects as (
    select * from {{ ref('int_dim_project')}}
)
select * from projects