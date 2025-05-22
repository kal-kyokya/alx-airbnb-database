-- SQL Script refactoring complex queries to improve performance

EXPLAIN
SELECT *
FROM Booking b
INNER JOIN Users u
ON b.user_id = u.user_id
INNER JOIN Property pt
ON b.property_id = pt.property_id
INNER JOIN Payment p
ON b.booking_id = p.booking_id
WHERE b.start_date >= CURRENT_DATE - INTERVAL '6 months'
AND b.status = 'confirmed';

CREATE INDEX idx_property_id
ON Property (property_id);

CREATE INDEX idx_property_id
ON Booking (property_id);

CREATE INDEX idx_booking_id
ON Booking (booking_id);

CREATE INDEX idx_booking_id
ON Payment (booking_id);

EXPLAIN
SELECT *
FROM Booking b
INNER JOIN Users u
ON b.user_id = u.user_id
INNER JOIN Property pt
ON b.property_id = pt.property_id
INNER JOIN Payment p
ON b.booking_id = p.booking_id;
