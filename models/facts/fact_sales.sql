{{ config(
  post_hook = ["GRANT INSERT, UPDATE, DELETE ON TABLE {{ this }} TO ROLE ACCOUNTADMIN;",
        "GRANT SELECT ON TABLE {{ this }} TO ROLE ACCOUNTADMIN;",
        "GRANT INSERT, UPDATE, DELETE ON TABLE {{ this }} TO ROLE ACCOUNTADMIN;",
        "GRANT SELECT ON TABLE {{ this }} TO ROLE ACCOUNTADMIN;",
        "GRANT SELECT ON TABLE {{ this }} TO ROLE ACCOUNTADMIN;"]
) }}


-- models/marts/fact_sales.sql
SELECT COALESCE(
    TRY_TO_DATE(TRIM(PERIOD)::STRING, 'YYYY-MM'),
    TRY_TO_DATE(TRIM(PERIOD)::STRING || '-01', 'YYYY-MM-DD')
  ) AS period,
    COUNTRY,
    CATEGORY,
    CORPORATION,
    STOCK_ANALYSIS,
    PRICING_ANALYSIS,
    (TY_SALES_LM * 1.1) AS TY_SALES_LM, -- Incrementamos las ventas un 10% para la prueba
    --TY_SALES_LM,
    LY_SALES_LM,
    TY_VOLUME_LM,
    LY_VOLUME_LM,
    TY_SALES_L3M,
    LY_SALES_L3M,
    TY_VOLUME_L3M,
    LY_VOLUME_L3M,
    TY_SALES_YTD,
    LY_SALES_YTD,
    TY_VOLUME_YTD,
    LY_VOLUME_YTD,
    TY_SALES_MAT,
    LY_SALES_MAT,
    TY_VOLUME_MAT,
    LY_VOLUME_MAT
from {{ ref('dataset') }}

where CATEGORY = 'Pain Relief'