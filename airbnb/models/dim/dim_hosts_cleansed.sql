{{ config(
  materialized = 'view',
  on_schema_change = 'fail'
) }}

WITH src_hosts AS (

  SELECT
    *
  FROM
    {{ ref('src_hosts') }}
)
SELECT
  host_id,
  COALESCE(
    host_name,
    'Anonymous'
  ) AS host_name,
  -- CASE
  --   WHEN is_superhost = 't' THEN true
  --   ELSE false
  -- END AS is_superhost,
  is_superhost,
  created_at,
  updated_at
FROM
  src_hosts
