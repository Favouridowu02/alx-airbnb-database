# Optimization Report

This document outlines issues identified in the codebase, describes the optimizations applied, and explains how performance was improved.

---

## Issues Identified

1. **Index Creation Error**
    - **Problem:** Attempting to create an index (`CREATE INDEX idx_payment_booking_id ON payments(booking_id);`) on a foreign key column may cause a duplicate key error, as MySQL automatically creates an index for foreign keys.
    - **Solution:** Remove or comment out this line unless you are certain the index does not already exist and is not managed by a foreign key.

2. **WHERE Clause on LEFT JOIN**
    - **Problem:** Using `LEFT JOIN payments pay ON b.id = pay.booking_id` and then filtering with `WHERE pay.method = "paypal"` effectively turns the `LEFT JOIN` into an `INNER JOIN`, returning only rows with a matching payment.
    - **Solution:** 
      - If you want all bookings (even those without payments), move the condition into the `JOIN` clause.
      - If you only want bookings with a PayPal payment, use `INNER JOIN`.

3. **Repeated Index Creation**
    - **Problem:** Running the script multiple times causes errors because MySQL does not support `CREATE INDEX IF NOT EXISTS`.
    - **Solution:** Only create indexes once, or use a migration tool or script to check for existence before creating indexes.

4. **Dropping Indexes Required by Foreign Keys**
    - **Problem:** Dropping an index required by a foreign key constraint will result in an error.
    - **Solution:** Do not drop indexes that are required for foreign keys.

5. **Query Logic**
    - **Problem:** The query is limited to bookings with PayPal payments in the last 30 days, which may not be the intended behavior if all bookings are expected.
    - **Solution:** Adjust the query logic based on the desired result set.

6. **Security Warning**
    - **Note:** The warning about using a password on the command line is a security best practice reminder, not a code error.

---

## Summary of Fixes

- Remove or comment out the creation of `idx_payment_booking_id` if it’s a foreign key index.
- Move the `pay.method` condition into the `LEFT JOIN` if you want all bookings, or use `INNER JOIN` if you only want bookings with payments.
- Avoid running index creation scripts multiple times without checking for existence.
- Do not drop indexes required by foreign keys.

---

## Example JOIN Fix

- To include all bookings (even those without payments), move the payment method condition into the `JOIN` clause.
- To include only bookings with PayPal payments, use `INNER JOIN`.

---

## Documentation: `performance.sql`

### What This File Does

- **Creates Indexes:**  
  Adds indexes on high-usage columns in the `bookings` table (`user_id`, `property_id`, `created_at`) to speed up queries that filter, join, or sort by these columns.

- **(Optionally) Drops Indexes:**  
  Provides commented-out lines to drop these indexes if needed for testing or cleanup.

- **Performs a Performance-Optimized Query:**  
  Retrieves all bookings from the last 30 days, along with associated user, property, and payment details, specifically for bookings paid via PayPal. Joins the `bookings`, `users`, `properties`, and `payments` tables, limiting the result to 100 rows, ordered by the most recent bookings.

- **Uses EXPLAIN:**  
  Utilizes the `EXPLAIN` keyword to analyze the query execution plan, helping to identify whether indexes are being used and where performance can be improved.

---

### How Performance Was Optimized

- **Indexing High-Usage Columns:**  
  Indexes were created on `bookings.user_id`, `bookings.property_id`, and `bookings.created_at` to speed up joins and filtering, reducing full table scans.

- **Targeted Filtering:**  
  The `WHERE` clause restricts results to bookings with PayPal payments and those created in the last 30 days, reducing the number of rows processed.

- **Limiting Results:**  
  The `LIMIT 100` clause ensures only the first 100 results are returned, improving response time for large datasets.

- **Query Analysis:**  
  `EXPLAIN` is used to review the query plan before and after adding indexes, confirming that the optimizer uses the new indexes and that the number of scanned rows is reduced.

---

## Summary
