-- Indexes for high-usage columns in User, Booking, and Property tables

-- User table: commonly filtered/joined by id and email
CREATE INDEX idx_user_id ON users(id);
CREATE INDEX idx_user_email ON users(email);

-- Booking table: commonly filtered/joined by user_id, property_id, booking_date
CREATE INDEX idx_booking_user_id ON bookings(user_id);
CREATE INDEX idx_booking_property_id ON bookings(property_id);
CREATE INDEX idx_booking_booking_date ON bookings(booking_date);

-- Property table: commonly filtered/joined by id, location, owner_id
CREATE INDEX idx_property_id ON properties(id);
CREATE INDEX idx_property_location ON properties(location);
CREATE INDEX idx_property_owner_id ON properties(owner_id);
