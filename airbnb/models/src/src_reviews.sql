WITH raw_reviews AS (
SELECT * FROM {{ source ('airbnb','reviews')}}
)

SELECT
listing_id,
date AS review_date,
reviewer_name,
sentiment AS review_sentiment,
comments AS review_text
FROM raw_reviews