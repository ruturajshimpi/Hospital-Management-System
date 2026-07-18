-- ============================================================
-- STEP 9: VIEWS
-- ============================================================

-- View 1: Patient full medical summary
CREATE OR REPLACE VIEW vw_patient_summary AS
SELECT p.patient_id, p.patient_name, p.gender, p.blood_group,
       COUNT(DISTINCT a.appointment_id) AS total_appointments,
       COUNT(DISTINCT ad.admission_id) AS total_admissions
FROM Patients p
LEFT JOIN Appointments a ON p.patient_id = a.patient_id
LEFT JOIN Admissions ad ON p.patient_id = ad.patient_id
GROUP BY p.patient_id, p.patient_name, p.gender, p.blood_group;

SELECT * FROM vw_patient_summary;

-- View 2: Doctor performance dashboard
CREATE OR REPLACE VIEW vw_doctor_performance AS
SELECT doc.doctor_id, doc.doctor_name, dep.department_name,
       COUNT(a.appointment_id) AS total_appointments,
       COALESCE(SUM(b.total_amount), 0) AS revenue_generated
FROM Doctors doc
JOIN Departments dep ON doc.department_id = dep.department_id
LEFT JOIN Appointments a ON doc.doctor_id = a.doctor_id
LEFT JOIN Billing b ON a.appointment_id = b.appointment_id
GROUP BY doc.doctor_id, doc.doctor_name, dep.department_name;

SELECT * FROM vw_doctor_performance;

-- View 3: Pending bills report (used by billing staff)
CREATE OR REPLACE VIEW vw_pending_bills AS
SELECT b.bill_id, p.patient_name, b.total_amount, b.bill_date
FROM Billing b
JOIN Patients p ON b.patient_id = p.patient_id
WHERE b.payment_status = 'Pending';

SELECT * FROM vw_pending_bills;
-- ============================================================
