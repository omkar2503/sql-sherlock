CREATE OR REPLACE VIEW user_violation_summary AS
SELECT
  u.username,
  COUNT(f.issue_id) AS total_violations,
  SUM(f.score) AS total_penalty,
  ROUND(AVG(f.score), 2) AS avg_severity
FROM flagged_issues f
JOIN queries_raw q ON f.query_id = q.query_id
JOIN users u ON q.user_id = u.user_id
GROUP BY u.username
ORDER BY total_penalty DESC;

SELECT * FROM user_violation_summary;