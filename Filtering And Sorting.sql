-- ============================================================
-- FILTERING AND SORTING QUERIES
-- ============================================================

-- Patients registered after a certain date, sorted by most recent
SELECT patient_name, registration_date
FROM Patients
WHERE registration_date >= '2023-05-01'
ORDER BY registration_date DESC;

-- Doctors earning above a threshold, sorted by salary descending
SELECT doctor_name, salary FROM Doctors
WHERE salary > 100000
ORDER BY salary DESC;

-- Appointments in January 2024, sorted chronologically
SELECT appointment_id, patient_id, appointment_date
FROM Appointments
WHERE appointment_date BETWEEN '2024-01-01' AND '2024-01-31'
ORDER BY appointment_date ASC;

-- Combine multiple filter conditions (AND / OR) with sorting
SELECT patient_name, gender, blood_group
FROM Patients
WHERE gender = 'Female' AND blood_group IN ('A+', 'A-')
ORDER BY patient_name;

-- Top 3 highest hospital bills
SELECT bill_id, patient_id, total_amount
FROM Billing
ORDER BY total_amount DESC
LIMIT 3;

-- Rooms sorted by charge, cheapest first, only available ones
SELECT room_id, room_type, charge_per_day
FROM Rooms
WHERE status = 'Available'
ORDER BY charge_per_day ASC;