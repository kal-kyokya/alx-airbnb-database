-- SQL Script writing complex queries with joins

SELECT *
FROM Booking b
INNER JOIN Users u
ON b.user_id = u.user_id;

SELECT *
FROM Property p
LEFT JOIN Review r
ON p.property_id = r.property_id
ORDER BY r.rating DESC;

SELECT *
FROM Users u
FULL OUTER JOIN Booking b
ON u.user_id = b.user_id;
