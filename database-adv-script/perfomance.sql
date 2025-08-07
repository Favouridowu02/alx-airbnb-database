-- Initial query: Get all bookings with user, property, and payment details

CREATE INDEX idx_booking_user_id ON bookings(user_id);
CREATE INDEX idx_booking_property_id ON bookings(property_id);
CREATE INDEX idx_booking_created_at ON bookings(created_at);
-- CREATE INDEX idx_payment_booking_id ON payments(booking_id);

-- Drop indexes related to bookings and payments tables

-- DROP INDEX idx_booking_user_id ON bookings;
-- DROP INDEX idx_booking_property_id ON bookings;
-- DROP INDEX idx_booking_created_at ON bookings;
DROP INDEX idx_payment_booking_id ON payments;

SELECT
    b.id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    b.created_at AS booking_created_at,
    u.id,
    u.first_name,
    u.last_name,
    u.email,
    p.id,
    p.name AS property_name,
    p.location,
    p.price_per_night,
    pay.id,
    pay.amount,
    pay.payment_date,
    pay.payment_method
FROM
    bookings b
INNER JOIN
    users u ON b.user_id = u.id
INNER JOIN
    properties p ON b.property_id = p.id
LEFT JOIN
    payments pay ON b.id = pay.booking_id
WHERE
    pay.status = 'completed'
    AND b.created_at >= DATE_SUB(NOW(), INTERVAL 30 DAY)
ORDER BY
    b.created_at DESC
LIMIT 100;