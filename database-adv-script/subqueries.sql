-- SQL Script handling both correlated and non-correlated subqueries

SELECT *
FROM Property
WHERE property_id IN (
      SELECT property_id
      FROM Review
      GROUP BY property_id
      HAVING AVG(rating) > 2.5
);

SELECT *
FROM Users
WHERE user_id IN (
      SELECT user_id
      FROM Booking
      GROUP BY user_id
      HAVING COUNT(booking_id) >= 1
);
