# Database Schema - ALX Airbnb Clone

This directory contains the initial database schema setup for the ALX Airbnb clone project. The schema defines the core tables and relationships needed to support an Airbnb-like platform with user management, property listings, bookings, payments, messaging, and reviews.

## 📋 Overview

The `schema.sql` file creates a normalized relational database structure that supports:
- User registration and authentication
- Property listings and management
- Booking system with status tracking
- Payment processing
- User-to-user messaging
- Property reviews and ratings

## 🗂️ Database Schema

### Tables Structure

#### 1. **Users** (`users`)
Stores user account information for guests, hosts, and administrators.

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| `user_id` | UUID | PRIMARY KEY, INDEX | Unique identifier for each user |
| `first_name` | VARCHAR(50) | NOT NULL, UNIQUE | User's first name |
| `last_name` | VARCHAR(50) | NOT NULL, UNIQUE | User's last name |
| `email` | VARCHAR(100) | NOT NULL, UNIQUE | User's email address |
| `password_hash` | VARCHAR(255) | NOT NULL | Hashed password for security |
| `phone_number` | VARCHAR(15) | NULL | Optional phone number |
| `role` | VARCHAR(20) | NOT NULL, CHECK | User role: 'admin' or 'user' |
| `created_at` | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP | Account creation timestamp |

#### 2. **Properties** (`properties`)
Stores property listings that can be booked by users.

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| `property_id` | UUID | PRIMARY KEY, INDEX | Unique identifier for each property |
| `host_id` | UUID | NOT NULL, FOREIGN KEY | Reference to the property owner |
| `name` | VARCHAR(100) | NOT NULL | Property name/title |
| `description` | TEXT | NOT NULL | Detailed property description |
| `location` | VARCHAR(100) | NOT NULL | Property location |
| `price_per_night` | DECIMAL | NOT NULL | Nightly rental price |
| `created_at` | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP | Property listing creation date |
| `updated_at` | TIMESTAMP | ON UPDATE CURRENT_TIMESTAMP | Last modification date |

#### 3. **Bookings** (`bookings`)
Manages reservation requests and confirmations.

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| `booking_id` | UUID | PRIMARY KEY, INDEX | Unique identifier for each booking |
| `user_id` | UUID | NOT NULL, FOREIGN KEY | Reference to the booking user |
| `property_id` | UUID | NOT NULL, FOREIGN KEY | Reference to the booked property |
| `start_date` | DATE | NOT NULL | Check-in date |
| `end_date` | DATE | NOT NULL | Check-out date |
| `total_price` | DECIMAL | NOT NULL | Total booking cost |
| `status` | VARCHAR(20) | NOT NULL, CHECK | Status: 'pending', 'confirmed', or 'cancelled' |
| `created_at` | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP | Booking creation timestamp |

#### 4. **Payments** (`payments`)
Tracks payment transactions for bookings.

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| `payment_id` | UUID | PRIMARY KEY, INDEX | Unique identifier for each payment |
| `booking_id` | UUID | NOT NULL, FOREIGN KEY | Reference to the related booking |
| `amount` | DECIMAL | NOT NULL | Payment amount |
| `payment_date` | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP | When payment was processed |
| `payment_method` | VARCHAR(50) | NOT NULL, CHECK | Method: 'credit_card', 'paypal', or 'stripe' |

#### 5. **Messages** (`messages`)
Enables communication between users.

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| `message_id` | UUID | PRIMARY KEY, INDEX | Unique identifier for each message |
| `sender_id` | UUID | NOT NULL, FOREIGN KEY | Reference to the message sender |
| `receiver_id` | UUID | NOT NULL, FOREIGN KEY | Reference to the message recipient |
| `message_body` | TEXT | NOT NULL | Message content |
| `sent_at` | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP | Message timestamp |

#### 6. **Reviews** (`reviews`)
Stores property reviews and ratings from users.

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| `review_id` | UUID | PRIMARY KEY, INDEX | Unique identifier for each review |
| `user_id` | UUID | NOT NULL, FOREIGN KEY | Reference to the reviewing user |
| `property_id` | UUID | NOT NULL, FOREIGN KEY | Reference to the reviewed property |
| `rating` | INT | NOT NULL, CHECK (1-5) | Rating score from 1 to 5 |
| `comment` | TEXT | NOT NULL | Review text |
| `created_at` | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP | Review creation timestamp |

## 🔗 Relationships

- **Users → Properties**: One-to-many (a user can host multiple properties)
- **Users → Bookings**: One-to-many (a user can make multiple bookings)
- **Properties → Bookings**: One-to-many (a property can have multiple bookings)
- **Bookings → Payments**: One-to-many (a booking can have multiple payments)
- **Users → Messages**: Many-to-many (users can send/receive multiple messages)
- **Users → Reviews**: One-to-many (a user can write multiple reviews)
- **Properties → Reviews**: One-to-many (a property can have multiple reviews)

## 🚀 Usage

### Prerequisites
- MySQL Server (version 5.7 or higher)
- MySQL client or database management tool

### Installation

1. **Connect to your MySQL server:**
   ```bash
   mysql -u your_username -p
   ```

2. **Create a database:**
   ```sql
   CREATE DATABASE airbnb_clone;
   USE airbnb_clone;
   ```

3. **Execute the schema script:**
   ```bash
   mysql -u your_username -p airbnb_clone < schema.sql
   ```

   Or from within MySQL:
   ```sql
   SOURCE /path/to/schema.sql;
   ```

### Verification

After running the schema, you can verify the tables were created successfully:

```sql
SHOW TABLES;
DESCRIBE users;
DESCRIBE properties;
DESCRIBE bookings;
DESCRIBE payments;
DESCRIBE messages;
DESCRIBE reviews;
```

## ⚠️ Important Notes

1. **UUID Support**: Ensure your MySQL version supports UUID data type or consider using CHAR(36) for UUID storage.

2. **Indexing**: Primary keys are automatically indexed. Consider adding additional indexes on frequently queried columns like `email`, `host_id`, `property_id`, etc.

3. **Data Integrity**: The schema includes foreign key constraints with CASCADE DELETE to maintain referential integrity.

4. **Security**: Password hashes should be generated using strong hashing algorithms (bcrypt, Argon2, etc.) before storing.

## 🔧 Customization

You may need to modify the schema based on your specific requirements:

- Adjust VARCHAR lengths based on your data requirements
- Add additional columns for features like property amenities, user preferences, etc.
- Modify the role enum to include more user types (e.g., 'host', 'guest', 'admin')
- Add indexes for performance optimization

## 📝 License

This database schema is part of the ALX Airbnb clone project and follows the same licensing terms as the main project.

---

**Note**: This is the initial schema setup. Additional migrations and updates may be added in future versions of the project.
