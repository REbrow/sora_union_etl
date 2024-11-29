WITH projects as (
    select * from {{ ref('int_project') }}
)

select * from projects