WITH clients as (
    select * from {{ ref("int_client") }}
)

select * from clients