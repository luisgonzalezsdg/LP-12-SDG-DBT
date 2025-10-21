{{ config(
  post_hook = ["GRANT INSERT, UPDATE, DELETE ON TABLE {{ this }} TO ROLE ACCOUNTADMIN;",
        "GRANT SELECT ON TABLE {{ this }} TO ROLE ACCOUNTADMIN;",
        "GRANT INSERT, UPDATE, DELETE ON TABLE {{ this }} TO ROLE ACCOUNTADMIN;",
        "GRANT SELECT ON TABLE {{ this }} TO ROLE ACCOUNTADMIN;",
        "GRANT SELECT ON TABLE {{ this }} TO ROLE ACCOUNTADMIN;"]
) }}

select distinct
    coalesce(
        try_to_date(trim(PERIOD)::string, 'YYYY-MM'),
        try_to_date(trim(PERIOD)::string || '-01', 'YYYY-MM-DD')
    ) as period
from {{ ref('dataset') }}
where PERIOD is not null