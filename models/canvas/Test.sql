WITH dim_location AS (
  /* Geographic locations dimension. */
  SELECT
    *
  FROM {{ ref('LP12', 'dim_location') }}
), filter AS (
  SELECT
    *
  FROM dim_location
  WHERE
    REGION = 'America'
), test_sql AS (
  SELECT
    *
  FROM filter
)
SELECT
  *
FROM test_sql