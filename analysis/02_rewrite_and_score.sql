ALTER TABLE flagged_issues
ADD COLUMN score INT DEFAULT 0;

ALTER TABLE flagged_issues
ADD COLUMN rewrite_sql TEXT;

UPDATE flagged_issues
SET score = 3,
    rewrite_sql = 'SELECT column1, column2 FROM ...'
WHERE rule_violated = 'SELECT * usage';

UPDATE flagged_issues
SET score = 5,
    rewrite_sql = 'SELECT ... FROM ... WHERE join_date BETWEEN ''2022-01-01'' AND ''2022-12-31'''
WHERE rule_violated = 'Non-SARGable filter';

UPDATE flagged_issues
SET score = 5,
    rewrite_sql = 'DELETE FROM table_name WHERE condition'
WHERE rule_violated = 'Unsafe DELETE/UPDATE';

UPDATE flagged_issues
SET score = 4,
    rewrite_sql = 'Remove the OR 1=1 condition; add proper access control filters'
WHERE rule_violated = 'Always-true condition (OR 1=1)';

UPDATE flagged_issues
SET score = 2,
    rewrite_sql = 'Split into multiple views or temp tables if possible'
WHERE rule_violated = 'Too many JOINs';






