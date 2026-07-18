-- ============================================================
-- WINDOW FUNCTION QUERIES
-- ============================================================

-- Rank doctors within each department by salary
SELECT doctor_name, department_id, salary,
       RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS salary_rank
FROM Doctors;

-- Running total of daily revenue
SELECT bill_date, SUM(total_amount) AS daily_revenue,
       SUM(SUM(total_amount)) OVER (ORDER BY bill_date) AS running_total
FROM Billing
GROUP BY bill_date
ORDER BY bill_date;

-- Each patient's appointments numbered chronologically (visit sequence)
SELECT patient_id, appointment_id, appointment_date,
       ROW_NUMBER() OVER (PARTITION BY patient_id ORDER BY appointment_date) AS visit_number
FROM Appointments;

-- Compare each doctor's salary with department average using window function
SELECT doctor_name, department_id, salary,
       ROUND(AVG(salary) OVER (PARTITION BY department_id), 2) AS dept_avg_salary,
       salary - AVG(salary) OVER (PARTITION BY department_id) AS diff_from_avg
FROM Doctors;

-- Days between consecutive appointments per patient (LAG)
SELECT patient_id, appointment_date,
       LAG(appointment_date) OVER (PARTITION BY patient_id ORDER BY appointment_date) AS previous_visit,
       DATEDIFF(appointment_date, LAG(appointment_date) OVER (PARTITION BY patient_id ORDER BY appointment_date)) AS gap_days
FROM Appointments;