
    
    

select
    corporation as unique_field,
    count(*) as n_records

from SEMANTICMIND.DBT_LGONZALEZ.dim_corporation
where corporation is not null
group by corporation
having count(*) > 1


