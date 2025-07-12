INSERT INTO flagged_issues (query_id, rule_violated, severity_level, suggestion)
SELECT
  query_id,
  'SELECT * usage' AS rule_violated,
  'medium' AS severity_level,
  'Use explicit column names instead of SELECT *' AS suggestion
FROM queries_raw
WHERE raw_sql ILIKE '%SELECT *%';

INSERT INTO flagged_issues (query_id, rule_violated, severity_level, suggestion)
SELECT
  query_id,
  'Non-SARGable filter' AS rule_violated,
  'high' AS severity_level,
  'Avoid using YEAR() or EXTRACT() in WHERE clause; use date ranges with BETWEEN' AS suggestion
FROM queries_raw
WHERE raw_sql ~* 'WHERE.*(YEAR\(|EXTRACT\(YEAR.*FROM)';

INSERT INTO flagged_issues (query_id, rule_violated, severity_level, suggestion)
SELECT
  query_id,
  'Unsafe DELETE/UPDATE' AS rule_violated,
  'high' AS severity_level,
  'Add a WHERE clause to avoid affecting all rows' AS suggestion
FROM queries_raw
WHERE raw_sql ~* '^(DELETE FROM|UPDATE)' AND raw_sql NOT ILIKE '%WHERE%';

INSERT INTO flagged_issues (query_id, rule_violated, severity_level, suggestion)
SELECT
  query_id,
  'Always-true condition (OR 1=1)' AS rule_violated,
  'high' AS severity_level,
  'Avoid unsafe logical ORs that always return true (e.g., OR 1=1)' AS suggestion
FROM queries_raw
WHERE raw_sql ~* 'OR\s+1\s*=\s*1|OR\s+TRUE';

INSERT INTO flagged_issues (query_id, rule_violated, severity_level, suggestion)
SELECT
  query_id,
  'Too many JOINs' AS rule_violated,
  'low' AS severity_level,
  'Consider refactoring or splitting the query if more than 3 joins' AS suggestion
FROM queries_raw
WHERE (length(raw_sql) - length(replace(raw_sql, 'JOIN', ''))) / 4 >= 3;

CREATE TABLE rules (
  rule_id SERIAL PRIMARY KEY,
  rule_name TEXT,
  severity TEXT,
  regex_pattern TEXT,
  suggestion TEXT
);

