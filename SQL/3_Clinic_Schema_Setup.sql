CREATE TABLE clinics (
    cid VARCHAR(50) PRIMARY KEY,
    clinic_name VARCHAR(100),
    city VARCHAR(100),
    state VARCHAR(100),
    country VARCHAR(100)
);

CREATE TABLE customer (
    uid VARCHAR(50) PRIMARY KEY,
    name VARCHAR(100),
    mobile VARCHAR(15)
);

CREATE TABLE clinic_sales (
    oid VARCHAR(50) PRIMARY KEY,
    uid VARCHAR(50),
    cid VARCHAR(50),
    amount DECIMAL(10,2),
    datetime DATETIME,
    sales_channel VARCHAR(50),
    FOREIGN KEY (uid) REFERENCES customer(uid),
    FOREIGN KEY (cid) REFERENCES clinics(cid)
);

CREATE TABLE expenses (
    eid VARCHAR(50) PRIMARY KEY,
    cid VARCHAR(50),
    description VARCHAR(200),
    amount DECIMAL(10,2),
    datetime DATETIME,
    FOREIGN KEY (cid) REFERENCES clinics(cid)
);

INSERT INTO clinics VALUES
('cnc-001', 'HealthFirst Clinic', 'Hyderabad', 'Telangana', 'India'),
('cnc-002', 'CarePlus Clinic', 'Hyderabad', 'Telangana', 'India'),
('cnc-003', 'MediCare Centre', 'Bangalore', 'Karnataka', 'India'),
('cnc-004', 'WellLife Clinic', 'Bangalore', 'Karnataka', 'India'),
('cnc-005', 'CityHealth Clinic', 'Chennai', 'Tamil Nadu', 'India');

INSERT INTO customer VALUES
('cust-001', 'Ananya Reddy', '9800000001'),
('cust-002', 'Vikram Singh', '9800000002'),
('cust-003', 'Meera Nair', '9800000003'),
('cust-004', 'Rohit Gupta', '9800000004'),
('cust-005', 'Divya Krishnan', '9800000005'),
('cust-006', 'Suresh Babu', '9800000006'),
('cust-007', 'Pooja Iyer', '9800000007'),
('cust-008', 'Kiran Rao', '9800000008'),
('cust-009', 'Neha Joshi', '9800000009'),
('cust-010', 'Arun Menon', '9800000010');

INSERT INTO clinic_sales VALUES
('ord-001', 'cust-001', 'cnc-001', 4500, '2021-01-10 10:00:00', 'online'),
('ord-002', 'cust-002', 'cnc-001', 8200, '2021-01-15 11:00:00', 'walkin'),
('ord-003', 'cust-003', 'cnc-002', 3100, '2021-02-05 09:30:00', 'online'),
('ord-004', 'cust-004', 'cnc-002', 12000, '2021-02-20 14:00:00', 'referral'),
('ord-005', 'cust-005', 'cnc-003', 6700, '2021-03-08 10:30:00', 'walkin'),
('ord-006', 'cust-006', 'cnc-003', 9800, '2021-04-12 15:00:00', 'online'),
('ord-007', 'cust-007', 'cnc-004', 5500, '2021-05-18 12:00:00', 'referral'),
('ord-008', 'cust-008', 'cnc-004', 14000, '2021-06-22 16:00:00', 'walkin'),
('ord-009', 'cust-009', 'cnc-005', 7300, '2021-07-30 09:00:00', 'online'),
('ord-010', 'cust-010', 'cnc-005', 11500, '2021-08-14 13:00:00', 'walkin'),
('ord-011', 'cust-001', 'cnc-001', 3200, '2021-09-05 10:00:00', 'online'),
('ord-012', 'cust-002', 'cnc-002', 8900, '2021-10-10 11:30:00', 'referral'),
('ord-013', 'cust-003', 'cnc-003', 4400, '2021-11-18 14:00:00', 'walkin'),
('ord-014', 'cust-004', 'cnc-004', 16000, '2021-12-25 10:00:00', 'online'),
('ord-015', 'cust-005', 'cnc-005', 5100, '2021-12-30 15:00:00', 'walkin');

INSERT INTO expenses VALUES
('exp-001', 'cnc-001', 'medical supplies', 1200, '2021-01-12 08:00:00'),
('exp-002', 'cnc-001', 'staff salary', 5000, '2021-01-31 08:00:00'),
('exp-003', 'cnc-002', 'equipment maintenance', 800, '2021-02-10 08:00:00'),
('exp-004', 'cnc-002', 'staff salary', 4500, '2021-02-28 08:00:00'),
('exp-005', 'cnc-003', 'rent', 3000, '2021-03-01 08:00:00'),
('exp-006', 'cnc-003', 'medical supplies', 1500, '2021-04-15 08:00:00'),
('exp-007', 'cnc-004', 'staff salary', 6000, '2021-05-31 08:00:00'),
('exp-008', 'cnc-004', 'utilities', 900, '2021-06-10 08:00:00'),
('exp-009', 'cnc-005', 'rent', 2500, '2021-07-01 08:00:00'),
('exp-010', 'cnc-005', 'medical supplies', 1100, '2021-08-20 08:00:00'),
('exp-011', 'cnc-001', 'utilities', 700, '2021-09-10 08:00:00'),
('exp-012', 'cnc-002', 'staff salary', 4800, '2021-10-31 08:00:00'),
('exp-013', 'cnc-003', 'equipment maintenance', 2000, '2021-11-20 08:00:00'),
('exp-014', 'cnc-004', 'medical supplies', 1300, '2021-12-15 08:00:00'),
('exp-015', 'cnc-005', 'staff salary', 5500, '2021-12-31 08:00:00');
