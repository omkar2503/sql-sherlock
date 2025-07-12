# 🕵️ SQL Sherlock

**SQL Sherlock** is a PostgreSQL-powered SQL query analysis engine that detects bad patterns, flags risky logic, suggests optimized rewrites, and ranks queries by quality — like Sherlock Holmes, but for SQL.

---

## 🚀 Project Objective

To create a meta-SQL engine that:
- Flags bad SQL practices (e.g. `SELECT *`, unsafe `DELETE`, `YEAR()` filters)
- Suggests cleaner SQL rewrites
- Scores query violations and ranks users
- Generates views and reports for SQL quality auditing

---

## 📂 Project Structure

sql-sherlock/
├── schema/
│ ├── 01_create_tables.sql
│ └── 02_insert_sample_data.sql
├── analysis/
│ ├── 01_detect_violations.sql
│ └── 02_rewrite_and_score.sql
├── reports/
│ └── user_violation_summary.sql
├── .gitignore
├── README.md

yaml
Copy
Edit

---

## ✅ Step-by-Step Progress

### ✅ Step 1: Schema & Setup
- Tables for `users`, `queries_raw`, and `flagged_issues`
- Inserted sample SQL queries with common violations

### ✅ Step 2: Violation Rule Engine
- Detects:
  - `SELECT *` usage
  - Non-SARGable filters (e.g., `YEAR(date)`)
  - Unsafe `DELETE/UPDATE` without `WHERE`
  - Always-true logic (e.g., `OR 1=1`)
  - Excessive JOINs (4+)
- Populates `flagged_issues`

### ✅ Step 3: Rewrites & Severity Scoring
- Added `score` and `rewrite_sql` to each issue
- Suggests optimized versions of bad queries
- Adds numeric scoring for each rule
- View: `user_violation_summary` ranks user query quality

---

## 🛠 Tech Stack

- PostgreSQL
- Advanced SQL (regex, scoring, joins, CTEs)
- GitHub for version control