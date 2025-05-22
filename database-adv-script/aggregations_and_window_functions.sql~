-- SQL Script using aggregation and window functions to analyze data

SELECT user_id, COUNT(booking_id) AS bookings
FROM Booking
GROUP BY user_id;

SELECT *,
RANK() OVER (PARTITION BY property_id ORDER BY booking_id DESC) AS rank,
ROW_NUMBER() OVER (PARTITION BY property_id ORDER BY booking_id DESC) AS row_rank,
DENSE_NUMBER() OVER (PARTITION BY property_id ORDER BY booking_id DESC) AS dense_rank
FROM Booking;
