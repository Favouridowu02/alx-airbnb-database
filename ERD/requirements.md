# Requirements

This document outlines the detailed database requirements for the **ALX Airbnb Database project**.

---

![ERD Diagram](./AirbnbClone.svg)

## 🗄️ Entities & Attributes

### User

* `user_id`: UUID, Primary Key, Indexed
* `first_name`: VARCHAR, NOT NULL
* `last_name`: VARCHAR, NOT NULL
* `email`: VARCHAR, UNIQUE, NOT NULL
* `password_hash`: VARCHAR, NOT NULL
* `phone_number`: VARCHAR, NULL
* `role`: ENUM (guest, host, admin), NOT NULL
* `created_at`: TIMESTAMP, DEFAULT CURRENT\_TIMESTAMP

### Property

* `property_id`: UUID, Primary Key, Indexed
* `host_id`: Foreign Key -> User(user\_id)
* `name`: VARCHAR, NOT NULL
* `description`: TEXT, NOT NULL
* `location`: VARCHAR, NOT NULL
* `pricepernight`: DECIMAL, NOT NULL
* `created_at`: TIMESTAMP, DEFAULT CURRENT\_TIMESTAMP
* `updated_at`: TIMESTAMP, ON UPDATE CURRENT\_TIMESTAMP

### Booking

* `booking_id`: UUID, Primary Key, Indexed
* `property_id`: Foreign Key -> Property(property\_id)
* `user_id`: Foreign Key -> User(user\_id)
* `start_date`: DATE, NOT NULL
* `end_date`: DATE, NOT NULL
* `total_price`: DECIMAL, NOT NULL
* `status`: ENUM (pending, confirmed, canceled), NOT NULL
* `created_at`: TIMESTAMP, DEFAULT CURRENT\_TIMESTAMP

### Payment

* `payment_id`: UUID, Primary Key, Indexed
* `booking_id`: Foreign Key -> Booking(booking\_id)
* `amount`: DECIMAL, NOT NULL
* `payment_date`: TIMESTAMP, DEFAULT CURRENT\_TIMESTAMP
* `payment_method`: ENUM (credit\_card, paypal, stripe), NOT NULL

### Review

* `review_id`: UUID, Primary Key, Indexed
* `property_id`: Foreign Key -> Property(property\_id)
* `user_id`: Foreign Key -> User(user\_id)
* `rating`: INTEGER, CHECK (1 <= rating <= 5), NOT NULL
* `comment`: TEXT, NOT NULL
* `created_at`: TIMESTAMP, DEFAULT CURRENT\_TIMESTAMP

### Message

* `message_id`: UUID, Primary Key, Indexed
* `sender_id`: Foreign Key -> User(user\_id)
* `recipient_id`: Foreign Key -> User(user\_id)
* `message_body`: TEXT, NOT NULL
* `sent_at`: TIMESTAMP, DEFAULT CURRENT\_TIMESTAMP

---

## ⚙️ Constraints & Indexing

### User Table

* Unique constraint on `email`
* Non-null constraints on required fields

### Property Table

* Foreign key constraint on `host_id`
* Non-null constraints on essential attributes

### Booking Table

* Foreign key constraints on `property_id` and `user_id`
* `status` ENUM constraint: must be one of `pending`, `confirmed`, or `canceled`

### Payment Table

* Foreign key constraint on `booking_id`

### Review Table

* `rating` value must be between 1 and 5
* Foreign key constraints on `property_id` and `user_id`

### Message Table

* Foreign key constraints on `sender_id` and `recipient_id`

### Indexing

* Primary keys indexed automatically
* Additional indexes:

  * `email` in `User`
  * `property_id` in `Property` and `Booking`
  * `booking_id` in `Booking` and `Payment`

---

✅ This specification ensures a normalized, relational, and efficient schema to support Airbnb-like operations.
