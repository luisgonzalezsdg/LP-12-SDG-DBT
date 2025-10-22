
    
    

select
    period as unique_field,
    count(*) as n_records

from SEMANTICMIND.DBT_LGONZALEZ.dim_calendar
where period is not null
group by period
having count(*) > 1


