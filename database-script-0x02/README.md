# Database Seed Data - ALX Airbnb Clone

This directory contains sample data for populating the ALX Airbnb clone database with realistic test data. The seed data provides a comprehensive set of users, properties, bookings, payments, messages, and reviews that reflect real-world usage patterns.

## 📋 Overview

The `seed.sql` file contains carefully crafted INSERT statements that create a realistic dataset for testing and development purposes. This data simulates an active Airbnb-like platform with multiple user types, property listings, booking transactions, and user interactions.

## 🗂️ Data Structure

### 📊 **Complete Dataset Summary**

| Table | Records | Description |
|-------|---------|-------------|
| **Users** | 13 | Mix of admins, hosts, and guests with realistic profiles |
| **Properties** | 10 | Diverse property types across 5 major US cities |
| **Bookings** | 15 | Various booking statuses and realistic date ranges |
| **Payments** | 12 | Complete payment records with multiple methods |
| **Messages** | 15 | Real-world communication scenarios |
| **Reviews** | 12 | Authentic reviews with ratings 3-5 stars |

## 🏠 **Sample Properties**

Our seed data includes diverse property types across major cities:

### **New York, NY**
- Cozy Downtown Apartment ($150/night) - 2BR city apartment
- Riverside Studio Loft ($120/night) - Industrial-style studio

### **San Diego, CA**
- Modern Beach House ($300/night) - 4BR oceanfront property
- Mountain Cabin Retreat ($250/night) - 3BR mountain getaway (Aspen, CO)

### **Boston, MA**
- Historic Brownstone ($200/night) - 3BR historic property
- Garden View Apartment ($110/night) - 1BR with garden access

### **Chicago, IL**
- Luxury Penthouse Suite ($450/night) - Premium rooftop access
- Artists Loft Downtown ($180/night) - Creative space in arts district

### **Austin, TX**
- Suburban Family Home ($220/night) - 4BR family-friendly
- Music City Condo ($160/night) - 2BR near music venues

## 👥 **User Profiles**

### **Administrators (1)**
- System admin with full platform access

### **Active Hosts (5)**
- **Sarah Johnson** - NYC properties specialist
- **Michael Chen** - Beach & mountain properties
- **Emily Rodriguez** - Historic Boston properties  
- **David Thompson** - Luxury Chicago accommodations
- **Lisa Wilson** - Austin family & music venues

### **Guests (7)**
- Diverse users from different backgrounds
- Multiple booking histories and preferences
- Some also serve as hosts (realistic dual roles)

## 💰 **Booking & Payment Scenarios**

### **Booking Status Distribution**
- **9 Confirmed** bookings with completed payments
- **2 Pending** bookings awaiting host confirmation
- **2 Cancelled** bookings (refund scenarios)
- **2 Future** bookings for testing upcoming stays

### **Payment Methods**
- **Credit Card** - Traditional payment processing
- **PayPal** - Digital wallet transactions
- **Stripe** - Modern payment gateway

### **Realistic Pricing**
- Price range: $110 - $450 per night
- Total booking values: $240 - $2,100
- Calculated based on: (nights × rate) = total_price

## 💬 **Communication Patterns**

The seed data includes realistic message exchanges:

1. **Pre-booking inquiries** - Availability and amenity questions
2. **Booking confirmations** - Check-in details and instructions
3. **During-stay support** - Guest questions and host assistance
4. **Post-stay follow-up** - Review requests and feedback
5. **Issue resolution** - Problem-solving communications

## ⭐ **Review Distribution**

### **Rating Breakdown**
- **5 Stars**: 50% (6 reviews) - Exceptional experiences
- **4 Stars**: 33% (4 reviews) - Great with minor issues  
- **3 Stars**: 17% (2 reviews) - Good but room for improvement

### **Review Themes**
- Location and accessibility
- Host responsiveness and communication
- Property cleanliness and amenities
- Value for money
- Unique features and experiences

## 🚀 **Getting Started**

### **Prerequisites**
- MySQL server running
- Database created (from schema setup)
- Proper user permissions

### **Installation Steps**

1. **Ensure schema is created first:**
   ```bash
   # Run schema creation first
   mysql -u your_username -p airbnb_clone < ../database-script-0x01/schema.sql
   ```

2. **Load the seed data:**
   ```bash
   mysql -u your_username -p airbnb_clone < seed.sql
   ```

3. **Verify data insertion:**
   ```sql
   USE airbnb_clone;
   
   -- Check record counts
   SELECT 'users' as table_name, COUNT(*) as count FROM users
   UNION ALL
   SELECT 'properties', COUNT(*) FROM properties
   UNION ALL  
   SELECT 'bookings', COUNT(*) FROM bookings
   UNION ALL
   SELECT 'payments', COUNT(*) FROM payments
   UNION ALL
   SELECT 'messages', COUNT(*) FROM messages
   UNION ALL
   SELECT 'reviews', COUNT(*) FROM reviews;
   ```

### **Expected Results**
```
+------------+-------+
| table_name | count |
+------------+-------+
| users      |    13 |
| properties |    10 |
| bookings   |    15 |
| payments   |    12 |
| messages   |    15 |
| reviews    |    12 |
+------------+-------+
```

## 🔍 **Sample Queries**

### **Find all properties with their hosts:**
```sql
SELECT p.name, p.location, p.price_per_night, 
       CONCAT(u.first_name, ' ', u.last_name) as host_name
FROM properties p
JOIN users u ON p.host_id = u.user_id
ORDER BY p.price_per_night DESC;
```

### **Get booking statistics by status:**
```sql
SELECT status, COUNT(*) as booking_count, 
       SUM(total_price) as total_revenue
FROM bookings 
GROUP BY status;
```

### **Find properties with average ratings:**
```sql
SELECT p.name, p.location, 
       ROUND(AVG(r.rating), 2) as avg_rating,
       COUNT(r.review_id) as review_count
FROM properties p
LEFT JOIN reviews r ON p.property_id = r.property_id
GROUP BY p.property_id, p.name, p.location
ORDER BY avg_rating DESC;
```

### **Most active users (hosts and guests):**
```sql
SELECT u.first_name, u.last_name, u.email,
       COUNT(DISTINCT p.property_id) as properties_owned,
       COUNT(DISTINCT b.booking_id) as bookings_made
FROM users u
LEFT JOIN properties p ON u.user_id = p.host_id
LEFT JOIN bookings b ON u.user_id = b.user_id
GROUP BY u.user_id
HAVING properties_owned > 0 OR bookings_made > 0
ORDER BY properties_owned DESC, bookings_made DESC;
```

## ⚠️ **Important Notes**

1. **Data Dependencies**: This seed data assumes the schema from `database-script-0x01` is already loaded.

2. **UUID Format**: All UUIDs follow the standard format and maintain referential integrity.

3. **Realistic Constraints**: All data respects the database constraints (CHECK constraints, foreign keys, etc.).

4. **Time Consistency**: Booking dates, payment dates, and message timestamps follow logical sequences.

5. **Testing Scenarios**: The data covers various edge cases useful for application testing:
   - Multiple bookings for same property (different dates)
   - Users with dual roles (host and guest)
   - Different payment methods and amounts
   - Various booking statuses and outcomes

## 🧪 **Use Cases for Testing**

This seed data enables testing of:

- **User authentication** and role-based access
- **Property search and filtering** by location, price, ratings
- **Booking workflows** for different scenarios
- **Payment processing** with multiple methods
- **Messaging systems** between users
- **Review and rating** functionality
- **Analytics and reporting** features
- **Data validation** and integrity checks

## 🔧 **Customization**

### **Adding More Data**
To extend the dataset:

1. **More Users**: Add additional INSERT statements following the UUID pattern
2. **More Properties**: Ensure valid `host_id` references
3. **More Bookings**: Use existing `user_id` and `property_id` values
4. **More Reviews**: Only for users who have completed bookings

### **Modifying Existing Data**
- Update email addresses, names, or locations as needed
- Adjust pricing to match your target market
- Modify dates to fit your testing timeline
- Change property descriptions for variety

### **Data Reset**
To clear and reload data:
```sql
-- Clear all data (respects foreign key constraints)
DELETE FROM payments;
DELETE FROM reviews;
DELETE FROM messages;
DELETE FROM bookings;
DELETE FROM properties;
DELETE FROM users;

-- Reload seed data
SOURCE seed.sql;
```

## 📈 **Analytics Ready**

This dataset provides rich analytics possibilities:

- **Revenue analysis** by property, host, and time period
- **Booking patterns** and seasonal trends
- **User behavior** analysis
- **Property performance** metrics
- **Review sentiment** and rating correlations
- **Communication frequency** patterns

## 📝 **License**

This seed data is part of the ALX Airbnb clone project and follows the same licensing terms as the main project.

---

**Note**: This seed data is designed for development and testing purposes. In production, ensure proper data privacy and security measures are implemented.
