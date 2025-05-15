-- SQL Script implementing indexes for optimization

EXPLAIN ANALYZE
SELECT *
FROM Booking
WHERE total_price > 8;

CREATE INDEX idx_email
ON User (email);

CREATE INDEX idx_property_id
ON Property (property_id);

CREATE INDEX idx_property_id
ON Booking (property_id);

CREATE INDEX idx_booking_id
ON Booking (booking_id);

CREATE INDEX idx_booking_id
ON Payment (booking_id);

EXPLAIN ANALYZE
SELECT *
FROM Booking
WHERE total_price > 8;
