
    
    

with child as (
    select category as from_field
    from SEMANTICMIND.DBT_LGONZALEZ.fact_sales
    where category is not null
),

parent as (
    select category as to_field
    from SEMANTICMIND.DBT_LGONZALEZ.dim_category
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


