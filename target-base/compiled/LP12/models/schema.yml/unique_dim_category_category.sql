
    
    

select
    category as unique_field,
    count(*) as n_records

from SEMANTICMIND.DBT_LGONZALEZ.dim_category
where category is not null
group by category
having count(*) > 1


