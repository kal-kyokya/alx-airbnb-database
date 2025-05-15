-- SQL Script using aggregation and window functions to analyze data

SELECT user_id, COUNT(booking_id) AS bookings
FROM Booking
GROUP BY user_id;

SELECT *,
ROW_NUMBER() OVER (PARTITION BY property_id ORDER BY booking_id DESC) AS ranking
FROM Booking;
