-- SQL queries to define the database schema

CREATE TABLE User (
       user_id INTEGER,
       PRIMARY KEY (user_id),
       first_name VARCHAR(50) NOT NULL,
       last_name VARCHAR(50) NOT NULL,
       email VARCHAR(50) NOT NULL,
       UNIQUE (email),
       password_hash VARCHAR(50) NOT NULL,
       phone_number VARCHAR(50),
       user_role ENUM(guest_user, host_user, admin_user) NOT NULL,
       created_at TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Property (
       property_id INTEGER,
       PRIMARY KEY (property_id),
       FOREIGN KEY (host_id) REFERENCES user(user_id),
       property_name VARCHAR(50) NOT NULL,
       description VARCHAR(260) NOT NULL,
       location VARCHAR(50) NOT NULL,
       pricepernight DECIMAL(10, 3) NOT NULL,
       created_at TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
       updated_at TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE Booking (
       booking_id INTEGER,
       PRIMARY KEY (booking_id),
       FOREIGN KEY (property_id) REFERENCES Property(property_id),
       FOREIGN KEY (user_id) REFERENCES User(user_id),
       start_date DATE NOT NULL,
       end_date DATE NOT NULL,
       total_price DECIMAL(10, 3) NOT NULL,
       status ENUM(pending, confirmed, canceled) NOT NULL,
       created_at TIMESTAMP(3) DEFAULT CURRENT_STAMP
);

CREATE TABLE Payment (
       payment_id INTEGER,
       PRIMARY KEY (payment_id),
       FOREIGN KEY (booking_id) REFERENCES Booking(booking_id),
       amount DECIMAL(10, 3) NOT NULL,
       payment_date TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
       payment_method ENUM(credit_card, paypal, stripe) NOT NULL
);

CREATE TABLE Review (
       review_id INTEGER,
       PRIMARY KEY (review_id),
       FOREIGN KEY (property_id) REFERENCES Property(property_id),
       FOREIGN KEY (user_id) REFERENCES User(user_id),
       rating INTEGER NOT NULL,
       CHECK (rating >= 1 AND rating <= 5),
       comment VARCHAR(260),
       created_at TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Message (
       message_id INTEGER,
       PRIMARY KEY (message_id),
       FOREIGN KEY (sender_id) REFERENCES User(user_id),
       FOREIGN KEY (recipient_id) REFERENCES User(user_id),
       message_body VARCHAR(260) NOT NULL,
       sent_at TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP
);

-- Creating an index on the Usern Property, Booking and Payment tables

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
