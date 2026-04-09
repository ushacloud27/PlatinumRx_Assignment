CREATE TABLE users (
    user_id VARCHAR(50) PRIMARY KEY,
    name VARCHAR(100),
    phone_number VARCHAR(15),
    mail_id VARCHAR(100),
    billing_address TEXT
);

CREATE TABLE bookings (
    booking_id VARCHAR(50) PRIMARY KEY,
    booking_date DATETIME,
    room_no VARCHAR(50),
    user_id VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE items (
    item_id VARCHAR(50) PRIMARY KEY,
    item_name VARCHAR(100),
    item_rate DECIMAL(10,2)
);

CREATE TABLE booking_commercials (
    id VARCHAR(50) PRIMARY KEY,
    booking_id VARCHAR(50),
    bill_id VARCHAR(50),
    bill_date DATETIME,
    item_id VARCHAR(50),
    item_quantity DECIMAL(10,2),
    FOREIGN KEY (booking_id) REFERENCES bookings(booking_id),
    FOREIGN KEY (item_id) REFERENCES items(item_id)
);

INSERT INTO users VALUES
('u-001', 'John Doe', '9700000001', 'john@example.com', '12, MG Road, Hyderabad'),
('u-002', 'Priya Sharma', '9700000002', 'priya@example.com', '45, Banjara Hills, Hyderabad'),
('u-003', 'Ravi Kumar', '9700000003', 'ravi@example.com', '7, Jubilee Hills, Hyderabad'),
('u-004', 'Sneha Patel', '9700000004', 'sneha@example.com', '3, Koramangala, Bangalore'),
('u-005', 'Arjun Nair', '9700000005', 'arjun@example.com', '9, Anna Nagar, Chennai');

INSERT INTO items VALUES
('itm-001', 'Tawa Paratha', 18),
('itm-002', 'Mix Veg', 89),
('itm-003', 'Paneer Butter Masala', 160),
('itm-004', 'Dal Tadka', 110),
('itm-005', 'Masala Chai', 25),
('itm-006', 'Cold Coffee', 85),
('itm-007', 'Veg Biryani', 180),
('itm-008', 'Gulab Jamun', 60);

INSERT INTO bookings VALUES
('bk-001', '2021-09-10 14:00:00', 'rm-101', 'u-001'),
('bk-002', '2021-10-05 11:30:00', 'rm-102', 'u-002'),
('bk-003', '2021-10-18 09:00:00', 'rm-103', 'u-003'),
('bk-004', '2021-11-02 15:00:00', 'rm-104', 'u-004'),
('bk-005', '2021-11-15 10:00:00', 'rm-101', 'u-005'),
('bk-006', '2021-11-22 13:00:00', 'rm-105', 'u-001'),
('bk-007', '2021-12-01 08:00:00', 'rm-102', 'u-002'),
('bk-008', '2021-08-20 16:00:00', 'rm-106', 'u-003');

INSERT INTO booking_commercials VALUES
('bc-001', 'bk-001', 'bl-001', '2021-09-10 18:00:00', 'itm-001', 3),
('bc-002', 'bk-001', 'bl-001', '2021-09-10 18:00:00', 'itm-002', 1),
('bc-003', 'bk-002', 'bl-002', '2021-10-05 20:00:00', 'itm-003', 2),
('bc-004', 'bk-002', 'bl-002', '2021-10-05 20:00:00', 'itm-004', 1),
('bc-005', 'bk-002', 'bl-002', '2021-10-05 20:00:00', 'itm-007', 3),
('bc-006', 'bk-003', 'bl-003', '2021-10-18 12:00:00', 'itm-003', 4),
('bc-007', 'bk-003', 'bl-003', '2021-10-18 12:00:00', 'itm-006', 2),
('bc-008', 'bk-004', 'bl-004', '2021-11-02 19:00:00', 'itm-007', 2),
('bc-009', 'bk-004', 'bl-004', '2021-11-02 19:00:00', 'itm-005', 4),
('bc-010', 'bk-005', 'bl-005', '2021-11-15 21:00:00', 'itm-002', 2),
('bc-011', 'bk-005', 'bl-005', '2021-11-15 21:00:00', 'itm-008', 3),
('bc-012', 'bk-006', 'bl-006', '2021-11-22 20:00:00', 'itm-003', 3),
('bc-013', 'bk-006', 'bl-006', '2021-11-22 20:00:00', 'itm-007', 2),
('bc-014', 'bk-007', 'bl-007', '2021-12-01 18:00:00', 'itm-001', 5),
('bc-015', 'bk-008', 'bl-008', '2021-08-20 19:00:00', 'itm-004', 2);
