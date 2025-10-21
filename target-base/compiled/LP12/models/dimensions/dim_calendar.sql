

select distinct
    coalesce(
        try_to_date(trim(PERIOD)::string, 'YYYY-MM'),
        try_to_date(trim(PERIOD)::string || '-01', 'YYYY-MM-DD')
    ) as period
from SEMANTICMIND.DBT_LGONZALEZ.dataset
where PERIOD is not null