-- Detect unusually high daily transaction volume per client/category.
-- A minimum count threshold is included to avoid flagging tiny random spikes.

WITH daily_counts AS (
  SELECT
    transaction_date,
    client_id,
    category,
    COUNT(*) AS daily_transaction_count
  FROM `rafael-phase3-etl-2026.phase3_etl.transactions`
  GROUP BY transaction_date, client_id, category
),
baseline AS (
  SELECT
    client_id,
    category,
    AVG(daily_transaction_count) AS avg_daily_count,
    STDDEV(daily_transaction_count) AS std_daily_count
  FROM daily_counts
  GROUP BY client_id, category
)
SELECT
  d.transaction_date,
  d.client_id,
  d.category,
  d.daily_transaction_count,
  ROUND(b.avg_daily_count, 2) AS avg_daily_count,
  ROUND(b.std_daily_count, 2) AS std_daily_count
FROM daily_counts d
JOIN baseline b
  ON d.client_id = b.client_id
 AND d.category = b.category
WHERE d.daily_transaction_count >= 20
  AND d.daily_transaction_count > b.avg_daily_count + 3 * b.std_daily_count
ORDER BY d.daily_transaction_count DESC;