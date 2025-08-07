# Database Index Performance Explanation

## Why Indexes Matter

Indexes are special data structures that allow the database to quickly locate and retrieve rows from a table, especially when filtering, joining, or sorting on specific columns. Without indexes, the database must scan the entire table, which is slow for large datasets.

## What Was Indexed

We created indexes on high-usage columns in the `users`, `bookings`, and `properties` tables:
- `users(id)`, `users(email)`
- `bookings(user_id)`, `bookings(property_id)`, `bookings(booking_date)`
- `properties(id)`, `properties(location)`, `properties(owner_id)`

These columns are frequently used in `WHERE`, `JOIN`, and `ORDER BY` clauses.

## Measuring Performance

To measure the impact of these indexes:
1. Use `EXPLAIN` or `EXPLAIN ANALYZE` on your queries before adding indexes to see the query plan and execution time.
2. Add the indexes with `CREATE INDEX`.
3. Run `EXPLAIN` or `EXPLAIN ANALYZE` again on the same queries.
4. Compare the results:
   - **Before indexing:** The query plan will likely show a sequential scan (full table scan) and higher execution time.
   - **After indexing:** The plan should show an index scan or index seek, with fewer rows scanned and lower execution time.

## Example

```sql
-- Before indexes:
EXPLAIN ANALYZE SELECT * FROM bookings WHERE user_id = 123 AND booking_date > '2024-01-01';

-- After indexes:
EXPLAIN ANALYZE SELECT * FROM bookings WHERE user_id = 123 AND booking_date > '2024-01-01';
```

**Result:**  
After adding indexes, queries that filter or join on these columns will execute much faster, especially as your data grows.

## Summary

Proper indexing is one of the most effective ways to optimize database performance for read-heavy workloads. Always monitor query plans and execution times to ensure your indexes are being used as intended.
