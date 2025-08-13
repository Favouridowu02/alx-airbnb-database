
# Database Performance Monitoring and Optimization

## Objective
Continuously monitor and refine database performance by analyzing query execution plans and making schema adjustments.

---

## 1. Monitoring Query Performance

Use SQL commands such as `SHOW PROFILE` and `EXPLAIN ANALYZE` to monitor the performance of frequently used queries.

### Example: Analyzing a SELECT Query

```sql
EXPLAIN ANALYZE SELECT * FROM bookings WHERE user_id = 123 ORDER BY created_at DESC LIMIT 10;
```

**Interpretation:**
- Look for full table scans, high cost, or missing indexes in the output.

### Example: Profiling a Query

```sql
SHOW PROFILE FOR QUERY <query_id>;
```

---

## 2. Identifying Bottlenecks

Common bottlenecks include:
- Full table scans (no index used)
- Slow joins due to missing foreign key indexes
- Large result sets without LIMIT
- Unoptimized ORDER BY or GROUP BY clauses

**Example Bottleneck:**
If `EXPLAIN` shows `type: ALL` for a query on the `bookings` table, it means a full table scan is occurring.

---

## 3. Suggested Improvements

### a. Adding Indexes

If queries frequently filter by `user_id` and sort by `created_at`, add a composite index:

```sql
CREATE INDEX idx_bookings_user_created ON bookings(user_id, created_at DESC);
```

### b. Schema Adjustments

- Normalize tables to reduce redundancy.
- Use appropriate data types (e.g., INT for IDs, DATETIME for timestamps).
- Partition large tables if necessary.

---

## 4. Implementing and Reporting Improvements

After adding indexes or making schema changes, rerun `EXPLAIN ANALYZE` to compare query performance before and after.

**Example Report:**

| Query | Before (ms) | After (ms) | Improvement |
|-------|-------------|------------|-------------|
| SELECT * FROM bookings WHERE user_id = 123 ORDER BY created_at DESC LIMIT 10 | 120 | 15 | 8x faster |

---

## 5. Ongoing Monitoring

- Regularly review slow query logs.
- Use tools like MySQL Workbench, Percona Toolkit, or built-in performance_schema for deeper analysis.
- Continuously refine indexes and schema as query patterns evolve.
