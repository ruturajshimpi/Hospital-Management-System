-- ============================================================
-- STEP 7: JOIN QUERIES
-- ============================================================

-- Inner Join: Appointment details with patient and doctor names
SELECT a.appointment_id, p.patient_name, doc.doctor_name, a.appointment_date, a.reason
FROM Appointments a
JOIN Patients p ON a.patient_id = p.patient_id
JOIN Doctors doc ON a.doctor_id = doc.doctor_id;

-- Left Join: All doctors with their appointment count (including doctors with zero appointments)
SELECT doc.doctor_name, COUNT(a.appointment_id) AS total_appointments
FROM Doctors doc
LEFT JOIN Appointments a ON doc.doctor_id = a.doctor_id
GROUP BY doc.doctor_name;

-- Multi-table Join: Full admission summary (patient + room + doctor + bill)
SELECT p.patient_name, r.room_type, doc.doctor_name,
       ad.admission_date, ad.discharge_date, b.total_amount, b.payment_status
FROM Admissions ad
JOIN Patients p ON ad.patient_id = p.patient_id
JOIN Rooms r ON ad.room_id = r.room_id
JOIN Doctors doc ON ad.doctor_id = doc.doctor_id
LEFT JOIN Billing b ON ad.admission_id = b.admission_id;

-- Self-relational style Join: Patients treated by more than one doctor
SELECT p.patient_name, COUNT(DISTINCT a.doctor_id) AS doctors_seen
FROM Appointments a
JOIN Patients p ON a.patient_id = p.patient_id
GROUP BY p.patient_name
HAVING COUNT(DISTINCT a.doctor_id) > 1;