-- SQL Script handling both correlated and non-correlated subqueries

SELECT *
FROM Property
WHERE property_id IN (
      SELECT property_id, AVG(rating) AS avg_rating
      FROM Review
      GROUP BY property_id
      HAVING AVG(rating) > 4.0
);

SELECT *
FROM User
WHERE user_id IN (
      SELECT user_id, COUNT(booking_id) AS bookings
      FROM Booking
      GROUP BY user_id
      HAVING COUNT(booking_id) > 3
);
