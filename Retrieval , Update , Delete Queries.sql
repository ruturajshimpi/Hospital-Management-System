-- ============================================================
-- BASIC RETRIEVAL / UPDATE / DELETE QUERIES
-- ============================================================

-- View all patients
SELECT * FROM Patients;

-- Update a patient's phone number
UPDATE Patients SET phone = '9998889999' WHERE patient_id = 1;

-- Delete a cancelled appointment (example)
DELETE FROM Appointments WHERE status = 'Cancelled';

-- Discharge a patient (update discharge_date)
UPDATE Admissions SET discharge_date = '2024-01-20' WHERE admission_id = 3;

-- Mark a bill as paid
UPDATE Billing SET payment_status = 'Paid' WHERE bill_id = 3;