CREATE OR REPLACE VIEW query_score_summary AS
SELECT
  q.query_id,
  u.username,
  q.raw_sql,
  COUNT(f.issue_id) AS total_violations,
  SUM(f.score) AS total_score,
  ROUND(AVG(f.score), 2) AS avg_score
FROM queries_raw q
JOIN users u ON q.user_id = u.user_id
LEFT JOIN flagged_issues f ON q.query_id = f.query_id
GROUP BY q.query_id, u.username, q.raw_sql
ORDER BY total_score DESC NULLS LAST;

CREATE OR REPLACE VIEW query_risk_tagged AS
SELECT *,
  CASE
    WHEN total_score IS NULL THEN 'safe'
    WHEN total_score <= 3 THEN 'moderate'
    ELSE 'critical'
  END AS severity_tag
FROM query_score_summary;
