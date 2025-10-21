
    
    

with child as (
    select country as from_field
    from SEMANTICMIND.DBT_LGONZALEZ.fact_sales
    where country is not null
),

parent as (
    select country as to_field
    from SEMANTICMIND.DBT_LGONZALEZ.dim_location
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


