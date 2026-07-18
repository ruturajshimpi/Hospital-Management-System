-- ============================================================
-- STEP 3: SAMPLE DATA INSERTION (DML)
-- ============================================================

INSERT INTO Departments (department_name, floor_no) VALUES
('Cardiology', 3), ('Neurology', 4), ('Orthopedics', 2),
('Pediatrics', 1), ('General Medicine', 1);

INSERT INTO Doctors (doctor_name, specialization, department_id, phone, salary, joining_date) VALUES
('Dr. Ashok Rao', 'Cardiologist', 1, '9876500001', 120000, '2018-03-01'),
('Dr. Priya Nair', 'Neurologist', 2, '9876500002', 135000, '2019-06-15'),
('Dr. Sameer Khan', 'Orthopedic Surgeon', 3, '9876500003', 110000, '2020-01-10'),
('Dr. Anita Desai', 'Pediatrician', 4, '9876500004', 95000, '2021-04-20'),
('Dr. Vikram Joshi', 'General Physician', 5, '9876500005', 85000, '2017-11-05'),
('Dr. Kavita Iyer', 'Cardiologist', 1, '9876500006', 118000, '2022-02-14');

INSERT INTO Patients (patient_name, gender, dob, phone, address, blood_group, registration_date) VALUES
('Rahul Sharma', 'Male', '1990-05-12', '9998887771', 'Thane, MH', 'O+', '2023-01-10'),
('Sneha Patil', 'Female', '1985-11-23', '9998887772', 'Pune, MH', 'A+', '2023-02-15'),
('Amit Verma', 'Male', '1978-07-30', '9998887773', 'Mumbai, MH', 'B+', '2023-03-05'),
('Pooja Singh', 'Female', '2000-02-18', '9998887774', 'Nashik, MH', 'AB+', '2023-04-22'),
('Rohit Mehta', 'Male', '1995-09-09', '9998887775', 'Thane, MH', 'O-', '2023-05-11'),
('Neha Kulkarni', 'Female', '1988-12-01', '9998887776', 'Pune, MH', 'A-', '2023-06-30'),
('Suresh Iyer', 'Male', '1965-03-14', '9998887777', 'Mumbai, MH', 'B-', '2023-07-19'),
('Kiran Rao', 'Female', '1999-08-25', '9998887778', 'Thane, MH', 'O+', '2023-08-02');

INSERT INTO Rooms (room_type, floor_no, charge_per_day, status) VALUES
('General', 1, 800, 'Available'), ('Semi-Private', 2, 1500, 'Available'),
('Private', 3, 3000, 'Available'), ('ICU', 4, 6000, 'Available'),
('General', 1, 800, 'Available'), ('Private', 3, 3000, 'Available');

INSERT INTO Appointments (patient_id, doctor_id, appointment_date, reason, status) VALUES
(1, 1, '2024-01-05 10:00:00', 'Chest pain', 'Completed'),
(2, 2, '2024-01-06 11:30:00', 'Migraine', 'Completed'),
(3, 3, '2024-01-07 09:15:00', 'Knee pain', 'Completed'),
(4, 4, '2024-01-08 14:00:00', 'Fever', 'Completed'),
(5, 1, '2024-01-10 10:45:00', 'Routine checkup', 'Completed'),
(6, 5, '2024-01-12 16:00:00', 'Cold and cough', 'Completed'),
(7, 1, '2024-01-15 09:00:00', 'Heart palpitations', 'Completed'),
(8, 4, '2024-01-18 12:30:00', 'Vaccination', 'Completed'),
(1, 1, '2024-02-01 10:00:00', 'Follow-up', 'Scheduled'),
(3, 3, '2024-02-03 09:00:00', 'Physiotherapy review', 'Scheduled');

INSERT INTO Admissions (patient_id, room_id, doctor_id, admission_date, discharge_date) VALUES
(1, 4, 1, '2024-01-05', '2024-01-09'),
(3, 3, 3, '2024-01-07', '2024-01-12'),
(7, 4, 1, '2024-01-15', NULL),
(6, 1, 5, '2024-01-12', '2024-01-14');

INSERT INTO Medicines (medicine_name, price, stock_quantity) VALUES
('Paracetamol', 20, 500), ('Atorvastatin', 85, 200),
('Amoxicillin', 60, 300), ('Ibuprofen', 30, 400),
('Cetirizine', 15, 600), ('Metformin', 45, 250);

INSERT INTO Prescriptions (appointment_id, medicine_id, dosage, duration_days) VALUES
(1, 2, '1 tablet daily', 30), (2, 1, '2 tablets/day', 5),
(3, 4, '1 tablet twice/day', 7), (4, 1, '1 tablet thrice/day', 3),
(6, 5, '1 tablet at night', 5), (7, 2, '1 tablet daily', 60);

INSERT INTO Billing (patient_id, admission_id, appointment_id, total_amount, payment_status, bill_date) VALUES
(1, 1, NULL, 26000, 'Paid', '2024-01-09'),
(3, 2, NULL, 16500, 'Paid', '2024-01-12'),
(7, 3, NULL, 12000, 'Pending', '2024-01-20'),
(6, 4, NULL, 2600, 'Paid', '2024-01-14'),
(2, NULL, 2, 500, 'Paid', '2024-01-06'),
(4, NULL, 4, 400, 'Paid', '2024-01-08'),
(5, NULL, 5, 600, 'Pending', '2024-01-10'),
(8, NULL, 8, 300, 'Paid', '2024-01-18');