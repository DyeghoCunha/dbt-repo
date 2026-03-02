WITH mart_fullmoon_review AS ( 
  SELECT * FROM {{ ref('mart_fullmoon_review') }}
)

SELECT 
  is_full_moon,
  review_sentiment,
  COUNT(*) AS reviews
FROM mart_fullmoon_review
GROUP BY 1,2
ORDER BY 1,2