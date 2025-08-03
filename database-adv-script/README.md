# Database Advanced Scripts

This directory contains advanced SQL scripts and queries for the **ALX Airbnb Database project**. These scripts demonstrate complex database operations, joins, and analytical queries used for data retrieval and analysis.

---

## 📁 Directory Contents

| File | Description |
|------|-------------|
| `joins_queries.sql` | Comprehensive JOIN operations (INNER, LEFT, FULL OUTER) |
| `README.md` | This documentation file |

---

## 🔗 Available Queries

### 1. **INNER JOIN Queries**
- Retrieve all bookings with their respective users
- Returns only records with matching relationships
- Includes detailed booking and user information

### 2. **LEFT JOIN Queries** 
- Retrieve all properties and their reviews
- Includes properties that have no reviews
- Comprehensive property-review analysis

### 3. **FULL OUTER JOIN Queries**
- Retrieve all users and all bookings
- Includes unmatched records from both tables
- Uses UNION approach for MySQL compatibility

---

## 🚀 Usage

### Prerequisites
- MySQL server (≥ 5.7)
- Access to the Airbnb database with populated tables
- Valid database connection

### Running the Queries

1. **Connect to your database:**
```bash
mysql -h localhost -u your_username -p your_database
```

2. **Execute all queries:**
```bash
mysql -h localhost -u your_username -p your_database < joins_queries.sql
```

3. **Execute specific sections:**
```sql
-- Copy and paste individual queries from joins_queries.sql
-- into your MySQL client or workbench
```

---

## 📊 Query Examples

### Booking Analysis
```sql
-- Get all bookings with user details
SELECT b.booking_id, u.first_name, u.last_name, b.total_price
FROM Booking b
INNER JOIN User u ON b.user_id = u.user_id;
```

### Property Reviews
```sql
-- Get all properties including those without reviews
SELECT p.name, r.rating, r.comment
FROM Property p
LEFT JOIN Review r ON p.property_id = r.property_id;
```

---

## 🎯 Learning Objectives

- ✅ Master different types of SQL JOIN operations
- ✅ Understand relationship handling in relational databases
- ✅ Practice complex query construction
- ✅ Learn MySQL-specific syntax and limitations
- ✅ Analyze data relationships in Airbnb-like systems

---

## 📝 Notes

- **MySQL Compatibility**: FULL OUTER JOIN is simulated using UNION of LEFT and RIGHT JOINs
- **Performance**: Queries include appropriate ORDER BY clauses for optimal result presentation
- **Scalability**: Designed to work with large datasets efficiently
- **Best Practices**: Uses table aliases and descriptive column names

---

## 🔧 Customization

Feel free to modify the queries to:
- Add WHERE clauses for filtered results
- Include additional tables for more complex analysis
- Adjust ORDER BY clauses for different sorting preferences
- Add LIMIT clauses for paginated results

---

## 🐛 Troubleshooting

### Common Issues:
1. **Table not found**: Ensure database schema is properly created
2. **Access denied**: Check user permissions for the database
3. **Syntax errors**: Verify MySQL version compatibility

### Solutions:
- Run the main database setup scripts first
- Check table names match your schema exactly
- Ensure foreign key relationships are properly established

---

## 📚 Related Files

- `../database-script-0x01/schema.sql` - Database schema creation
- `../database-script-0x02/seed.sql` - Sample data insertion
- `../ERD/requirements.md` - Database requirements specification

---

## 🤝 Contributing

When adding new queries:
1. Follow the existing commenting style
2. Include descriptive headers for each query
3. Test queries with sample data
4. Document any MySQL-specific syntax used

---

*Part of the ALX Airbnb Database project - Advanced SQL operations and analysis*