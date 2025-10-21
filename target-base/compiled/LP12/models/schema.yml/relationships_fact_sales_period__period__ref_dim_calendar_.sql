
    
    

with child as (
    select period as from_field
    from SEMANTICMIND.DBT_LGONZALEZ.fact_sales
    where period is not null
),

parent as (
    select period as to_field
    from SEMANTICMIND.DBT_LGONZALEZ.dim_calendar
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


