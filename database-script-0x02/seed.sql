-- SQL script to populate the database with sample data

INSERT INTO User (first_name, last_name, email, password_hash, phone_number, user_role)
VALUES ('Jean-paul', 'KYOKYA', 'kalkyokya4@gmail.com', 'password_hash', '+254798129095', 'admin_user');

INSERT INTO User (first_name, last_name, email, password_hash, phone_number, user_role)
VALUES ('Ndoto', 'Jr', 'ndoto@gmail.com', 'password_hash', '+254798129095', 'guest_user');

INSERT INTO Property (host_id, property_name, description, location, pricepernight)
VALUES (1, 'Futtech Stadium', 'Spacious, well-watered football pitch', 'Nairobi, Kenya', '50');

INSERT INTO Property (host_id, property_name, description, location, pricepernight)
VALUES (1, 'Eviot Lab', 'High-tech equipped R&D lab', 'Nairobi, Kenya', '50');

INSERT INTO Booking (property_id, user_id, start_date, end_date, total_price, status)
VALUES (1, 2, '2025-05-14', '2025-05-15', 50, 'confirmed');

INSERT INTO Booking (property_id, user_id, start_date, end_date, total_price, status)
VALUES (2, 2, '2025-05-15', '2025-05-16', 50, 'confirmed');

INSERT INTO Payment (booking_id, amount, payment_method)
VALUES (1, 50, 'credit_card');

INSERT INTO Payment (booking_id, amount, payment_method)
VALUES (2, 50, 'credit_card');

INSERT INTO Review (property_id, user_id, rating, comment)
VALUES (1, 2, 3, 'It is up and running, cannot wait for video streaming, drone recording sessions and AI feedback.');

INSERT INTO Review (property_id, user_id, rating, comment)
VALUES (2, 2, 2, 'The vision is yet to be implemented, we are patiently waiting.');

INSERT INTO Message (sender_id, recipient_id, message_body)
VALUES (1, 2, 'Ndoto, where are you going? Angalia line, look at the line, lol.');

INSERT INTO Message (sender_id, recipient_id, message_body)
VALUES (2, 1, 'DD, GG, EEE, 2.4, QLF, DLHI, ITB, Slower and More controlled movements, Minimum amount of interaction, Look good, Do good, Be good, Show up and get the job done.');
