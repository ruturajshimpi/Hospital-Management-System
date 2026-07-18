-- ============================================================
-- (AGGREGATE-BASED BUSINESS REPORTS)
-- ============================================================

-- Report 1: Daily revenue summary
SELECT bill_date,
       COUNT(*) AS total_bills,
       SUM(total_amount) AS total_revenue,
       ROUND(AVG(total_amount), 2) AS avg_bill_value
FROM Billing
GROUP BY bill_date
ORDER BY bill_date;

-- Report 2: Department-wise summary (doctors, appointments, revenue)
SELECT dep.department_name,
       COUNT(DISTINCT doc.doctor_id) AS total_doctors,
       COUNT(DISTINCT a.appointment_id) AS total_appointments,
       COALESCE(SUM(b.total_amount), 0) AS total_revenue
FROM Departments dep
LEFT JOIN Doctors doc ON dep.department_id = doc.department_id
LEFT JOIN Appointments a ON doc.doctor_id = a.doctor_id
LEFT JOIN Billing b ON a.appointment_id = b.appointment_id
GROUP BY dep.department_name
ORDER BY total_revenue DESC;

-- Report 3: Monthly patient admission summary
SELECT DATE_FORMAT(admission_date, '%Y-%m') AS admission_month,
       COUNT(*) AS total_admissions,
       ROUND(AVG(DATEDIFF(COALESCE(discharge_date, CURDATE()), admission_date)), 1) AS avg_stay_days
FROM Admissions
GROUP BY DATE_FORMAT(admission_date, '%Y-%m')
ORDER BY admission_month;

-- Report 4: Payment status summary (collections report)
SELECT payment_status,
       COUNT(*) AS bill_count,
       SUM(total_amount) AS amount
FROM Billing
GROUP BY payment_status;

-- Report 5: Gender and blood-group-wise patient distribution
SELECT gender, blood_group, COUNT(*) AS patient_count
FROM Patients
GROUP BY gender, blood_group
ORDER BY gender, patient_count DESC;

-- Report 6: Room occupancy summary
SELECT room_type,
       COUNT(*) AS total_rooms,
       SUM(CASE WHEN status = 'Occupied' THEN 1 ELSE 0 END) AS occupied,
       SUM(CASE WHEN status = 'Available' THEN 1 ELSE 0 END) AS available
FROM Rooms
GROUP BY room_type;