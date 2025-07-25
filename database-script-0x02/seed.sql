-- ============================================================
-- Sample Data for ALX Airbnb Clone Database
-- ============================================================
-- This file contains realistic sample data for testing and development
-- Generated: July 2025

-- ============================================================
-- 1. USERS TABLE
-- ============================================================
-- Insert sample users with different roles (hosts, guests, admins)

INSERT INTO users (user_id, first_name, last_name, email, password_hash, phone_number, role) VALUES
-- Admin users
('550e8400-e29b-41d4-a716-446655440000', 'John', 'Administrator', 'admin@airbnbclone.com', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/lewf.yJxN5bLGjNRC', '+1234567890', 'admin'),

-- Host users
('550e8400-e29b-41d4-a716-446655440001', 'Sarah', 'Johnson', 'sarah.johnson@email.com', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/lewf.yJxN5bLGjNRC', '+1555123001', 'user'),
('550e8400-e29b-41d4-a716-446655440002', 'Michael', 'Chen', 'michael.chen@email.com', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/lewf.yJxN5bLGjNRC', '+1555123002', 'user'),
('550e8400-e29b-41d4-a716-446655440003', 'Emily', 'Rodriguez', 'emily.rodriguez@email.com', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/lewf.yJxN5bLGjNRC', '+1555123003', 'user'),
('550e8400-e29b-41d4-a716-446655440004', 'David', 'Thompson', 'david.thompson@email.com', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/lewf.yJxN5bLGjNRC', '+1555123004', 'user'),
('550e8400-e29b-41d4-a716-446655440005', 'Lisa', 'Wilson', 'lisa.wilson@email.com', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/lewf.yJxN5bLGjNRC', '+1555123005', 'user'),

-- Guest users
('550e8400-e29b-41d4-a716-446655440006', 'James', 'Anderson', 'james.anderson@email.com', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/lewf.yJxN5bLGjNRC', '+1555123006', 'user'),
('550e8400-e29b-41d4-a716-446655440007', 'Maria', 'Garcia', 'maria.garcia@email.com', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/lewf.yJxN5bLGjNRC', '+1555123007', 'user'),
('550e8400-e29b-41d4-a716-446655440008', 'Robert', 'Brown', 'robert.brown@email.com', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/lewf.yJxN5bLGjNRC', '+1555123008', 'user'),
('550e8400-e29b-41d4-a716-446655440009', 'Jennifer', 'Davis', 'jennifer.davis@email.com', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/lewf.yJxN5bLGjNRC', '+1555123009', 'user'),
('550e8400-e29b-41d4-a716-446655440010', 'Christopher', 'Miller', 'chris.miller@email.com', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/lewf.yJxN5bLGjNRC', '+1555123010', 'user'),
('550e8400-e29b-41d4-a716-446655440011', 'Ashley', 'Taylor', 'ashley.taylor@email.com', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/lewf.yJxN5bLGjNRC', '+1555123011', 'user'),
('550e8400-e29b-41d4-a716-446655440012', 'Daniel', 'Moore', 'daniel.moore@email.com', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/lewf.yJxN5bLGjNRC', '+1555123012', 'user');

-- ============================================================
-- 2. PROPERTIES TABLE
-- ============================================================
-- Insert sample properties hosted by users

INSERT INTO properties (property_id, host_id, name, description, location, price_per_night) VALUES
-- Sarah Johnson's properties
('660e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440001', 'Cozy Downtown Apartment', 'Beautiful 2-bedroom apartment in the heart of downtown with modern amenities and city views. Perfect for business travelers and couples.', 'New York, NY', 150.00),
('660e8400-e29b-41d4-a716-446655440002', '550e8400-e29b-41d4-a716-446655440001', 'Riverside Studio Loft', 'Charming studio loft overlooking the river with exposed brick walls and industrial design. Great for solo travelers.', 'New York, NY', 120.00),

-- Michael Chen's properties
('660e8400-e29b-41d4-a716-446655440003', '550e8400-e29b-41d4-a716-446655440002', 'Modern Beach House', 'Stunning 4-bedroom beach house with private deck and ocean views. Ideal for families and group getaways.', 'San Diego, CA', 300.00),
('660e8400-e29b-41d4-a716-446655440004', '550e8400-e29b-41d4-a716-446655440002', 'Mountain Cabin Retreat', 'Rustic yet comfortable 3-bedroom cabin nestled in the mountains with fireplace and hiking trails nearby.', 'Aspen, CO', 250.00),

-- Emily Rodriguez's properties
('660e8400-e29b-41d4-a716-446655440005', '550e8400-e29b-41d4-a716-446655440003', 'Historic Brownstone', 'Elegant 3-bedroom brownstone in historic district with original architectural details and modern updates.', 'Boston, MA', 200.00),
('660e8400-e29b-41d4-a716-446655440006', '550e8400-e29b-41d4-a716-446655440003', 'Garden View Apartment', 'Peaceful 1-bedroom apartment with private garden access and natural light throughout.', 'Boston, MA', 110.00),

-- David Thompson's properties
('660e8400-e29b-41d4-a716-446655440007', '550e8400-e29b-41d4-a716-446655440004', 'Luxury Penthouse Suite', 'Spectacular penthouse with panoramic city views, premium finishes, and rooftop terrace access.', 'Chicago, IL', 450.00),
('660e8400-e29b-41d4-a716-446655440008', '550e8400-e29b-41d4-a716-446655440004', 'Artists Loft Downtown', 'Creative space in arts district with high ceilings, natural light, and vibrant neighborhood atmosphere.', 'Chicago, IL', 180.00),

-- Lisa Wilson's properties
('660e8400-e29b-41d4-a716-446655440009', '550e8400-e29b-41d4-a716-446655440005', 'Suburban Family Home', 'Spacious 4-bedroom family home with backyard, garage, and quiet neighborhood setting.', 'Austin, TX', 220.00),
('660e8400-e29b-41d4-a716-446655440010', '550e8400-e29b-41d4-a716-446655440005', 'Music City Condo', 'Modern 2-bedroom condo near music venues with soundproofing and entertainment setup.', 'Austin, TX', 160.00);

-- ============================================================
-- 3. BOOKINGS TABLE
-- ============================================================
-- Insert sample bookings with various statuses and dates

INSERT INTO bookings (booking_id, user_id, property_id, start_date, end_date, total_price, status) VALUES
-- Recent confirmed bookings
('770e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440006', '660e8400-e29b-41d4-a716-446655440001', '2025-08-15', '2025-08-18', 450.00, 'confirmed'),
('770e8400-e29b-41d4-a716-446655440002', '550e8400-e29b-41d4-a716-446655440007', '660e8400-e29b-41d4-a716-446655440003', '2025-08-20', '2025-08-25', 1500.00, 'confirmed'),
('770e8400-e29b-41d4-a716-446655440003', '550e8400-e29b-41d4-a716-446655440008', '660e8400-e29b-41d4-a716-446655440005', '2025-09-01', '2025-09-04', 600.00, 'confirmed'),
('770e8400-e29b-41d4-a716-446655440004', '550e8400-e29b-41d4-a716-446655440009', '660e8400-e29b-41d4-a716-446655440007', '2025-09-10', '2025-09-12', 900.00, 'confirmed'),
('770e8400-e29b-41d4-a716-446655440005', '550e8400-e29b-41d4-a716-446655440010', '660e8400-e29b-41d4-a716-446655440009', '2025-09-15', '2025-09-18', 660.00, 'confirmed'),

-- Pending bookings
('770e8400-e29b-41d4-a716-446655440006', '550e8400-e29b-41d4-a716-446655440011', '660e8400-e29b-41d4-a716-446655440002', '2025-10-01', '2025-10-03', 240.00, 'pending'),
('770e8400-e29b-41d4-a716-446655440007', '550e8400-e29b-41d4-a716-446655440012', '660e8400-e29b-41d4-a716-446655440004', '2025-10-15', '2025-10-20', 1250.00, 'pending'),
('770e8400-e29b-41d4-a716-446655440008', '550e8400-e29b-41d4-a716-446655440006', '660e8400-e29b-41d4-a716-446655440006', '2025-11-01', '2025-11-05', 440.00, 'pending'),

-- Cancelled bookings
('770e8400-e29b-41d4-a716-446655440009', '550e8400-e29b-41d4-a716-446655440007', '660e8400-e29b-41d4-a716-446655440008', '2025-08-10', '2025-08-12', 360.00, 'cancelled'),
('770e8400-e29b-41d4-a716-446655440010', '550e8400-e29b-41d4-a716-446655440008', '660e8400-e29b-41d4-a716-446655440010', '2025-08-25', '2025-08-28', 480.00, 'cancelled'),

-- Future confirmed bookings
('770e8400-e29b-41d4-a716-446655440011', '550e8400-e29b-41d4-a716-446655440009', '660e8400-e29b-41d4-a716-446655440001', '2025-12-20', '2025-12-25', 750.00, 'confirmed'),
('770e8400-e29b-41d4-a716-446655440012', '550e8400-e29b-41d4-a716-446655440010', '660e8400-e29b-41d4-a716-446655440003', '2026-01-10', '2026-01-17', 2100.00, 'confirmed'),
('770e8400-e29b-41d4-a716-446655440013', '550e8400-e29b-41d4-a716-446655440011', '660e8400-e29b-41d4-a716-446655440007', '2026-02-14', '2026-02-16', 900.00, 'confirmed'),

-- More bookings for data variety
('770e8400-e29b-41d4-a716-446655440014', '550e8400-e29b-41d4-a716-446655440012', '660e8400-e29b-41d4-a716-446655440005', '2025-11-20', '2025-11-23', 600.00, 'confirmed'),
('770e8400-e29b-41d4-a716-446655440015', '550e8400-e29b-41d4-a716-446655440006', '660e8400-e29b-41d4-a716-446655440009', '2025-12-01', '2025-12-05', 880.00, 'confirmed');

-- ============================================================
-- 4. PAYMENTS TABLE
-- ============================================================
-- Insert payments for confirmed bookings

INSERT INTO payments (payment_id, booking_id, amount, payment_method) VALUES
-- Payments for confirmed bookings
('880e8400-e29b-41d4-a716-446655440001', '770e8400-e29b-41d4-a716-446655440001', 450.00, 'credit_card'),
('880e8400-e29b-41d4-a716-446655440002', '770e8400-e29b-41d4-a716-446655440002', 1500.00, 'stripe'),
('880e8400-e29b-41d4-a716-446655440003', '770e8400-e29b-41d4-a716-446655440003', 600.00, 'paypal'),
('880e8400-e29b-41d4-a716-446655440004', '770e8400-e29b-41d4-a716-446655440004', 900.00, 'credit_card'),
('880e8400-e29b-41d4-a716-446655440005', '770e8400-e29b-41d4-a716-446655440005', 660.00, 'stripe'),

-- Future booking payments
('880e8400-e29b-41d4-a716-446655440006', '770e8400-e29b-41d4-a716-446655440011', 750.00, 'credit_card'),
('880e8400-e29b-41d4-a716-446655440007', '770e8400-e29b-41d4-a716-446655440012', 2100.00, 'paypal'),
('880e8400-e29b-41d4-a716-446655440008', '770e8400-e29b-41d4-a716-446655440013', 900.00, 'stripe'),
('880e8400-e29b-41d4-a716-446655440009', '770e8400-e29b-41d4-a716-446655440014', 600.00, 'credit_card'),
('880e8400-e29b-41d4-a716-446655440010', '770e8400-e29b-41d4-a716-446655440015', 880.00, 'paypal'),

-- Partial payments for larger bookings
('880e8400-e29b-41d4-a716-446655440011', '770e8400-e29b-41d4-a716-446655440002', 500.00, 'credit_card'),
('880e8400-e29b-41d4-a716-446655440012', '770e8400-e29b-41d4-a716-446655440012', 1000.00, 'stripe');

-- ============================================================
-- 5. MESSAGES TABLE
-- ============================================================
-- Insert sample messages between users (guests and hosts)

INSERT INTO messages (message_id, sender_id, receiver_id, message_body) VALUES
-- Pre-booking inquiries
('990e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440006', '550e8400-e29b-41d4-a716-446655440001', 'Hi Sarah! I am interested in booking your downtown apartment for August 15-18. Is it available?'),
('990e8400-e29b-41d4-a716-446655440002', '550e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440006', 'Hello James! Yes, the apartment is available for those dates. It is perfect for couples and the location is very convenient.'),
('990e8400-e29b-41d4-a716-446655440003', '550e8400-e29b-41d4-a716-446655440006', '550e8400-e29b-41d4-a716-446655440001', 'Great! Does the apartment have WiFi and a workspace? I will be working remotely during my stay.'),
('990e8400-e29b-41d4-a716-446655440004', '550e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440006', 'Yes, there is high-speed WiFi and a dedicated workspace in the living room. I will send you the booking confirmation shortly.'),

-- Check-in instructions
('990e8400-e29b-41d4-a716-446655440005', '550e8400-e29b-41d4-a716-446655440002', '550e8400-e29b-41d4-a716-446655440007', 'Hi Maria! Your beach house booking is confirmed. Check-in is after 3 PM. The key is in a lockbox - code is 1234. Address: 123 Ocean Drive.'),
('990e8400-e29b-41d4-a716-446655440006', '550e8400-e29b-41d4-a716-446655440007', '550e8400-e29b-41d4-a716-446655440002', 'Thank you Michael! We are so excited for our beach vacation. What time is checkout?'),
('990e8400-e29b-41d4-a716-446655440007', '550e8400-e29b-41d4-a716-446655440002', '550e8400-e29b-41d4-a716-446655440007', 'Checkout is by 11 AM. I have left a welcome basket with local treats and beach towels are in the closet. Enjoy your stay!'),

-- During stay communication
('990e8400-e29b-41d4-a716-446655440008', '550e8400-e29b-41d4-a716-446655440008', '550e8400-e29b-41d4-a716-446655440003', 'Hi Emily! We are loving the brownstone. Quick question - where can we find extra blankets?'),
('990e8400-e29b-41d4-a716-446655440009', '550e8400-e29b-41d4-a716-446655440003', '550e8400-e29b-41d4-a716-446655440008', 'So glad you are enjoying it! Extra blankets are in the hall closet on the second floor. Let me know if you need anything else!'),

-- Property inquiries
('990e8400-e29b-41d4-a716-446655440010', '550e8400-e29b-41d4-a716-446655440009', '550e8400-e29b-41d4-a716-446655440004', 'David, I am interested in your penthouse for a special anniversary celebration. Are there any special amenities?'),
('990e8400-e29b-41d4-a716-446655440011', '550e8400-e29b-41d4-a716-446655440004', '550e8400-e29b-41d4-a716-446655440009', 'Congratulations on your anniversary! The penthouse has a champagne service, rooftop access, and I can arrange rose petals for an extra fee.'),

-- Post-stay follow-up
('990e8400-e29b-41d4-a716-446655440012', '550e8400-e29b-41d4-a716-446655440005', '550e8400-e29b-41d4-a716-446655440010', 'Hi Christopher! Thank you for staying at my Music City Condo. I hope you enjoyed the local music scene! Please consider leaving a review.'),
('990e8400-e29b-41d4-a716-446655440013', '550e8400-e29b-41d4-a716-446655440010', '550e8400-e29b-41d4-a716-446655440005', 'Lisa, we had an amazing time! The location was perfect and the soundproofing was great. Will definitely book again!'),

-- Issue resolution
('990e8400-e29b-41d4-a716-446655440014', '550e8400-e29b-41d4-a716-446655440011', '550e8400-e29b-41d4-a716-446655440001', 'Sarah, I am having trouble with the WiFi in the studio loft. Could you help?'),
('990e8400-e29b-41d4-a716-446655440015', '550e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440011', 'I apologize for the inconvenience! The router might need to be reset. It is in the closet near the entrance. I can also send a technician if needed.');

-- ============================================================
-- 6. REVIEWS TABLE
-- ============================================================
-- Insert reviews for completed stays

INSERT INTO reviews (review_id, user_id, property_id, rating, comment) VALUES
-- 5-star reviews
('aa0e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440006', '660e8400-e29b-41d4-a716-446655440001', 5, 'Absolutely perfect stay! Sarah was an incredible host and the apartment exceeded all expectations. The location is unbeatable and the amenities were top-notch. Would definitely stay here again!'),
('aa0e8400-e29b-41d4-a716-446655440002', '550e8400-e29b-41d4-a716-446655440007', '660e8400-e29b-41d4-a716-446655440003', 5, 'The beach house was a dream come true! Michael was very responsive and helpful. The ocean views were breathtaking and the house had everything we needed for a perfect family vacation.'),
('aa0e8400-e29b-41d4-a716-446655440003', '550e8400-e29b-41d4-a716-446655440008', '660e8400-e29b-41d4-a716-446655440005', 5, "Emily\'s brownstone is a gem in Boston! The historic charm combined with modern conveniences made our stay memorable. Great location for exploring the city."),

-- 4-star reviews
('aa0e8400-e29b-41d4-a716-446655440004', '550e8400-e29b-41d4-a716-446655440009', '660e8400-e29b-41d4-a716-446655440007', 4, 'The penthouse was luxurious and the views were amazing! David was a great host. Only minor issue was the elevator was a bit slow, but otherwise fantastic experience.'),
('aa0e8400-e29b-41d4-a716-446655440005', '550e8400-e29b-41d4-a716-446655440010', '660e8400-e29b-41d4-a716-446655440009', 4, "Lisa\'s family home was very comfortable and clean. Great for our group stay. The neighborhood was quiet and safe. WiFi could be a bit faster but overall great value."),
('aa0e8400-e29b-41d4-a716-446655440006', '550e8400-e29b-41d4-a716-446655440012', '660e8400-e29b-41d4-a716-446655440005', 4, 'Beautiful historic property with lots of character. Emily was very accommodating. The only downside was limited parking, but public transport was convenient.'),

-- 3-star reviews
('aa0e8400-e29b-41d4-a716-446655440007', '550e8400-e29b-41d4-a716-446655440011', '660e8400-e29b-41d4-a716-446655440002', 3, 'The studio loft was decent for the price. Good location but the space was smaller than expected from photos. Sarah was responsive to our questions though.'),
('aa0e8400-e29b-41d4-a716-446655440008', '550e8400-e29b-41d4-a716-446655440006', '660e8400-e29b-41d4-a716-446655440006', 3, 'Nice garden apartment with good natural light. However, there were some maintenance issues that Emily addressed promptly. Good value for money overall.'),

-- Recent positive reviews
('aa0e8400-e29b-41d4-a716-446655440009', '550e8400-e29b-41d4-a716-446655440008', '660e8400-e29b-41d4-a716-446655440004', 5, "The mountain cabin was exactly what we needed for a peaceful getaway! Michael thought of everything - firewood, hiking maps, even s\'mores supplies. Highly recommend!"),
('aa0e8400-e29b-41d4-a716-446655440010', '550e8400-e29b-41d4-a716-446655440009', '660e8400-e29b-41d4-a716-446655440008', 4, "David\'s artists loft was inspiring and unique. Great location in the arts district with easy access to galleries and restaurants. Perfect for a creative weekend."),
('aa0e8400-e29b-41d4-a716-446655440011', '550e8400-e29b-41d4-a716-446655440010', '660e8400-e29b-41d4-a716-446655440010', 5, "Lisa\'s Music City Condo was perfect for our Nashville trip! The soundproofing was excellent and the location near music venues couldn\'t be better. Great host communication!"),
('aa0e8400-e29b-41d4-a716-446655440012', '550e8400-e29b-41d4-a716-446655440007', '660e8400-e29b-41d4-a716-446655440001', 4, "Second time staying at Sarah\'s downtown apartment and it was just as great as the first time. Consistent quality and excellent location for business travel.");

-- ============================================================
-- DATA SUMMARY
-- ============================================================
-- Users: 13 total (1 admin, 5 hosts, 7 guests - some users serve dual roles)
-- Properties: 10 properties across 5 different cities
-- Bookings: 15 bookings (9 confirmed, 2 pending, 2 cancelled, 2 future)
-- Payments: 12 payments covering confirmed bookings
-- Messages: 15 messages showing various communication scenarios
-- Reviews: 12 reviews with ratings from 3-5 stars
--
-- This sample data provides realistic scenarios for testing:
-- - Multiple booking statuses
-- - Various payment methods
-- - Host-guest communication patterns
-- - Property reviews with different ratings
-- - Users in different roles (some are both hosts and guests)
-- - Geographic diversity in property locations
-- - Realistic pricing ranges
-- ============================================================
