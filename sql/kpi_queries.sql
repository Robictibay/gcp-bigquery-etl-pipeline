-- Total revenue from successful transactions
SELECT
  ROUND(SUM(amount), 2) AS total_success_revenue
FROM `rafael-phase3-etl-2026.phase3_etl.transactions`
WHERE status = 'success';

-- Failed and refunded transaction rates
SELECT
  COUNT(*) AS total_transactions,
  ROUND(100 * COUNTIF(status = 'failed') / COUNT(*), 2) AS failed_rate_percent,
  ROUND(100 * COUNTIF(status = 'refunded') / COUNT(*), 2) AS refund_rate_percent
FROM `rafael-phase3-etl-2026.phase3_etl.transactions`;

-- Revenue by category
SELECT
  category,
  ROUND(SUM(CASE WHEN status = 'success' THEN amount ELSE 0 END), 2) AS successful_revenue
FROM `rafael-phase3-etl-2026.phase3_etl.transactions`
GROUP BY category
ORDER BY successful_revenue DESC;

-- Top clients by transaction volume
SELECT
  client_id,
  COUNT(*) AS transaction_count,
  ROUND(SUM(CASE WHEN status = 'success' THEN amount ELSE 0 END), 2) AS successful_revenue
FROM `rafael-phase3-etl-2026.phase3_etl.transactions`
GROUP BY client_id
ORDER BY transaction_count DESC;