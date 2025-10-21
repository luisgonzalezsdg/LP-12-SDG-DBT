{{ config(
  post_hook = ["GRANT INSERT, UPDATE, DELETE ON TABLE {{ this }} TO ROLE ACCOUNTADMIN;",
        "GRANT SELECT ON TABLE {{ this }} TO ROLE ACCOUNTADMIN;",
        "GRANT INSERT, UPDATE, DELETE ON TABLE {{ this }} TO ROLE ACCOUNTADMIN;",
        "GRANT SELECT ON TABLE {{ this }} TO ROLE ACCOUNTADMIN;",
        "GRANT SELECT ON TABLE {{ this }} TO ROLE ACCOUNTADMIN;"]
) }}



select distinct
    CATEGORY
from {{ ref('dataset') }}
where CATEGORY is not null