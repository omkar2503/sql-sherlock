# 🕵️ SQL Sherlock

**SQL Sherlock** is a PostgreSQL-powered SQL query analyzer that detects bad patterns, flags risky logic, and recommends optimization rewrites — like Sherlock Holmes, but for SQL.

---

## 🚀 Project Objective

To build a meta-level SQL linter and validator that can:
- Automatically flag bad SQL practices (e.g., `SELECT *`, unsafe `DELETE`, non-SARGable filters)
- Store and manage rule violations
- Track user query quality over time
- Suggest optimized query rewrites

---

## 📂 Project Structure

```
sql-sherlock/
├── schema/
│   ├── 01_create_tables.sql         # Core schema: users, queries, issues
│   └── 02_insert_sample_data.sql    # Sample users and raw SQL queries
├── analysis/
│   └── (will contain rule engine SQL)
├── reports/
│   └── (will contain dashboards and user summaries)
├── README.md
├── .gitignore
```

---

## 🛠 Tech Stack

- PostgreSQL (SQL standard, recursive CTEs, window functions, regex)
- GitHub (version control)
- (Optional later) Flask or Streamlit for UI
- (Optional later) Power BI/Tableau for visual reports

---

## ✅ Step 1 Complete

- ✅ Database schema created
- ✅ Sample users and queries inserted
- ✅ Project structure initialized and versioned

---

## 🔜 Upcoming Steps

- Step 2: SQL Rule Engine (detect bad query patterns)
- Step 3: Store violations and rank users
- Step 4: Auto-suggest rewritten queries
- Step 5: Add optional frontend/reporting layer


---

"# sql-sherlock" 
"# sql-sherlock" 
"# sql_sherlock" 
"# sql-sherlockX" 
"# sql-sherlock" 
