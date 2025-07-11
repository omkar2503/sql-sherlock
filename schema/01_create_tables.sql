CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username TEXT NOT NULL,
    role TEXT
);
CREATE TABLE queries_raw (
    query_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id),
    submitted_at TIMESTAMP DEFAULT NOW(),
    raw_sql TEXT NOT NULL
);
CREATE TABLE flagged_issues (
    issue_id SERIAL PRIMARY KEY,
    query_id INT REFERENCES queries_raw(query_id),
    rule_violated TEXT NOT NULL,
    severity_level TEXT CHECK (severity_level IN ('low', 'medium', 'high')),
    suggestion TEXT,
    detected_at TIMESTAMP DEFAULT NOW()
);
