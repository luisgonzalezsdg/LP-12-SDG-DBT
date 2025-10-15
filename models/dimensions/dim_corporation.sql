{{ config(
  post_hook = ["GRANT INSERT, UPDATE, DELETE ON TABLE {{ this }} TO ROLE DT_ADMIN;",
        "GRANT SELECT ON TABLE {{ this }} TO ROLE DT_ADMIN;",
        "GRANT INSERT, UPDATE, DELETE ON TABLE {{ this }} TO ROLE DT_SL_ADMIN;",
        "GRANT SELECT ON TABLE {{ this }} TO ROLE DT_SL_READER;"]
) }}



select distinct
    CORPORATION
from {{ ref('dataset') }}
where CORPORATION is not null