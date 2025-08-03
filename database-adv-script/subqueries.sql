-- Subqueries in Sql to retrieve data from the Airbnb database

SELECT
    p.property_id,
    p.name AS property_name,
    p.description,
    p.location,
    p.price_per_night,
    p.created_at AS property_created_at,
    (SELECT COUNT(*) FROM reviews r WHERE r.property_id = p.property_id) AS review_count,
    (SELECT AVG(r.rating) FROM reviews r WHERE r.property_id = p.property_id) AS average_rating
FROM properties p
WHERE average_rating > 4.0;


-- This query retrieves properties with their details, the count of reviews, and the average rating for each property.

SELECT
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    (SELECT COUNT(*) FROM bookings b WHERE b.user_id = u.user_id) AS booking_count,
    (SELECT SUM(b.total_price) FROM bookings b WHERE b.user_id = u.user_id) AS total_spent
FROM users u
WHERE booking_count > 3;

