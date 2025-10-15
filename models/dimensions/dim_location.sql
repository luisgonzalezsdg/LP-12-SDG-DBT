{{ config(
  post_hook = ["GRANT INSERT, UPDATE, DELETE ON TABLE {{ this }} TO ROLE DT_ADMIN;",
        "GRANT SELECT ON TABLE {{ this }} TO ROLE DT_ADMIN;",
        "GRANT INSERT, UPDATE, DELETE ON TABLE {{ this }} TO ROLE DT_SL_ADMIN;",
        "GRANT SELECT ON TABLE {{ this }} TO ROLE DT_SL_ADMIN;",
        "GRANT SELECT ON TABLE {{ this }} TO ROLE DT_SL_READER;"]
) }}



select distinct
    REGION,
    COUNTRY
from {{ ref('dataset') }}
where COUNTRY is not null