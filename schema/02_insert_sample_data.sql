INSERT INTO users (username, role) VALUES
('alice', 'data_analyst'),
('bob', 'developer'),
('carol', 'intern');

INSERT INTO queries_raw (user_id, raw_sql) VALUES
-- SELECT * - bad
(1, 'SELECT * FROM sales'),

-- Non-SARGable WHERE clause (bad)
(1, 'SELECT name FROM employees WHERE EXTRACT(YEAR FROM join_date) = 2022'),

-- DELETE without WHERE (very risky)
(2, 'DELETE FROM customers'),

-- Proper GROUP BY (good)
(3, 'SELECT product_id, SUM(quantity) FROM orders GROUP BY product_id'),

-- Injection-like OR clause (bad)
(2, 'SELECT COUNT(*) FROM users WHERE username = ''admin'' OR 1=1');

SELECT * FROM queries_raw ORDER BY query_id;

SELECT qr.query_id, u.username, qr.raw_sql, qr.submitted_at
FROM queries_raw qr
JOIN users u ON qr.user_id = u.user_id;


