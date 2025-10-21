{{ config(
  post_hook = ["GRANT INSERT, UPDATE, DELETE ON TABLE {{ this }} TO ROLE ACCOUNTADMIN;",
        "GRANT SELECT ON TABLE {{ this }} TO ROLE ACCOUNTADMIN;",
        "GRANT INSERT, UPDATE, DELETE ON TABLE {{ this }} TO ROLE ACCOUNTADMIN;",
        "GRANT SELECT ON TABLE {{ this }} TO ROLE ACCOUNTADMIN;"]
) }}



select distinct
    CORPORATION
from {{ ref('dataset') }}
where CORPORATION is not null