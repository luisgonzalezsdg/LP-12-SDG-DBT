
    
    

with child as (
    select corporation as from_field
    from SEMANTICMIND.DBT_LGONZALEZ.fact_sales
    where corporation is not null
),

parent as (
    select corporation as to_field
    from SEMANTICMIND.DBT_LGONZALEZ.dim_corporation
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


