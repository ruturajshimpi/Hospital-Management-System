-- ============================================================
-- AGGREGATE FUNCTION QUERIES
-- ============================================================
show databases;
use hospital_database_management;
-- Total revenue collected
SELECT SUM(total_amount) AS total_revenue FROM Billing WHERE payment_status = 'Paid';

-- Highest and lowest room charges
SELECT MAX(charge_per_day) AS highest_charge, MIN(charge_per_day) AS lowest_charge FROM Rooms;

-- Department-wise doctor count and total salary expense
SELECT dep.department_name, COUNT(doc.doctor_id) AS doctor_count, SUM(doc.salary) AS total_salary
FROM Departments dep
JOIN Doctors doc ON dep.department_id = doc.department_id
GROUP BY dep.department_name;
