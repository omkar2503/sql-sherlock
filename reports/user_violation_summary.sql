CREATE OR REPLACE VIEW user_violation_summary AS
SELECT
  u.username,
  COUNT(f.issue_id) AS total_violations,
  SUM(f.score) AS total_penalty,
  ROUND(AVG(f.score), 2) AS avg_severity,
  COUNT(CASE WHEN qr.severity_tag = 'critical' THEN 1 END) AS critical_queries,
  COUNT(CASE WHEN qr.severity_tag = 'moderate' THEN 1 END) AS moderate_queries,
  COUNT(CASE WHEN qr.severity_tag = 'safe' THEN 1 END) AS safe_queries
FROM users u
LEFT JOIN queries_raw q ON u.user_id = q.user_id
LEFT JOIN query_risk_tagged qr ON q.query_id = qr.query_id
LEFT JOIN flagged_issues f ON q.query_id = f.query_id
GROUP BY u.username
ORDER BY total_penalty DESC NULLS LAST;
