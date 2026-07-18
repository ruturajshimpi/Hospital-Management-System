-- ============================================================
-- SUBQUERY QUERIES
-- ============================================================

-- Patients who have never been admitted
SELECT patient_name FROM Patients
WHERE patient_id NOT IN (SELECT patient_id FROM Admissions);

-- Doctors earning more than the average doctor salary
SELECT doctor_name, salary FROM Doctors
WHERE salary > (SELECT AVG(salary) FROM Doctors);

-- Departments with more than the average number of doctors
SELECT department_name FROM Departments
WHERE department_id IN (
    SELECT department_id FROM Doctors
    GROUP BY department_id
    HAVING COUNT(*) > (SELECT AVG(dept_count) FROM (
        SELECT COUNT(*) AS dept_count FROM Doctors GROUP BY department_id) AS sub)
);

-- Most expensive room currently occupied
SELECT room_type, charge_per_day FROM Rooms
WHERE room_id = (SELECT room_id FROM Admissions WHERE discharge_date IS NULL LIMIT 1);

-- Correlated subquery: patients whose bill is above their own department's average bill
SELECT p.patient_name, b.total_amount
FROM Billing b
JOIN Patients p ON b.patient_id = p.patient_id
WHERE b.total_amount > (
    SELECT AVG(b2.total_amount) FROM Billing b2 WHERE b2.patient_id = b.patient_id
);
