
    
    

select
    country as unique_field,
    count(*) as n_records

from SEMANTICMIND.DBT_LGONZALEZ.dim_location
where country is not null
group by country
having count(*) > 1


