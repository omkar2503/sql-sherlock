CREATE OR REPLACE VIEW rule_violations_summary AS
SELECT
  rule_violated,
  COUNT(*) AS total_hits,
  ROUND(AVG(score), 2) AS avg_severity
FROM flagged_issues
GROUP BY rule_violated
ORDER BY total_hits DESC;
