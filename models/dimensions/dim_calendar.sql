{{ config(
  post_hook = ["GRANT INSERT, UPDATE, DELETE ON TABLE {{ this }} TO ROLE DT_ADMIN;",
        "GRANT SELECT ON TABLE {{ this }} TO ROLE DT_ADMIN;",
        "GRANT INSERT, UPDATE, DELETE ON TABLE {{ this }} TO ROLE DT_SL_ADMIN;",
        "GRANT SELECT ON TABLE {{ this }} TO ROLE DT_SL_ADMIN;",
        "GRANT SELECT ON TABLE {{ this }} TO ROLE DT_SL_READER;"]
) }}

select distinct
    coalesce(
        try_to_date(trim(PERIOD)::string, 'YYYY-MM'),
        try_to_date(trim(PERIOD)::string || '-01', 'YYYY-MM-DD')
    ) as period
from {{ ref('dataset') }}
where PERIOD is not null