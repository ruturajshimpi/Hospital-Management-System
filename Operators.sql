-- ============================================================
-- EXPLORATION QUERIES
-- ============================================================

-- Structure of a table
DESCRIBE Patients;

-- Row count in each major table
SELECT 'Patients' AS table_name, COUNT(*) AS row_count FROM Patients;

SELECT 'Doctors', COUNT(*) FROM Doctors;

SELECT 'Appointments', COUNT(*) FROM Appointments;

SELECT 'Admissions', COUNT(*) FROM Admissions;

SELECT 'Billing', COUNT(*) FROM Billing;

-- Check for missing / NULL values (data quality check)
SELECT COUNT(*) AS missing_phone FROM Patients WHERE phone IS NULL;
SELECT COUNT(*) AS ongoing_admissions FROM Admissions WHERE discharge_date IS NULL;

-- Distinct values in a column (useful to understand category spread)
SELECT DISTINCT blood_group FROM Patients;
SELECT DISTINCT specialization FROM Doctors;
SELECT DISTINCT room_type FROM Rooms;

-- ============================================================
-- LIKE OPERATOR QUERIES (pattern matching)
-- ============================================================

-- Patients whose name starts with 'R'
SELECT patient_name FROM Patients WHERE patient_name LIKE 'R%';

-- Patients whose name ends with 'a'
SELECT patient_name FROM Patients WHERE patient_name LIKE '%a';

-- Doctors with 'Cardio' anywhere in their specialization
SELECT doctor_name, specialization FROM Doctors WHERE specialization LIKE '%Cardio%';

-- Patients living in Thane (partial address match)
SELECT patient_name, address FROM Patients WHERE address LIKE '%Thane%';

-- Appointment reasons mentioning 'pain' (case-insensitive by default in MySQL)
SELECT appointment_id, reason FROM Appointments WHERE reason LIKE '%pain%';

-- Medicines with exactly 5 letters in the name (using underscore wildcard)
SELECT medicine_name FROM Medicines WHERE medicine_name LIKE '_____';

-- ============================================================
-- IN OPERATOR QUERIES
-- ============================================================

-- Patients with a specific set of blood groups
SELECT patient_name, blood_group FROM Patients WHERE blood_group IN ('O+', 'O-');

-- Appointments handled by a specific list of doctors
SELECT appointment_id, doctor_id, appointment_date FROM Appointments WHERE doctor_id IN (1, 3, 5);

-- Rooms of type Private or ICU
SELECT room_id, room_type, charge_per_day FROM Rooms WHERE room_type IN ('Private', 'ICU');

-- Bills that are still pending or belong to a specific patient set
SELECT bill_id, patient_id, total_amount, payment_status
FROM Billing
WHERE payment_status IN ('Pending') OR patient_id IN (1, 3, 7);

-- Doctors NOT in Cardiology or Neurology departments
SELECT doctor_name, department_id FROM Doctors WHERE department_id NOT IN (1, 2);