-- ============================================================
-- PROJECT: Hospital_Database_Management
-- Author  : Ruturaj
-- Purpose : Data Science / Data Analytics projet
-- ============================================================
-- DATABASE CREATION
-- ===========================================================
CREATE DATABASE Hospital_Database_Management;
USE Hospital_Database_Management;

-- ============================================================
-- TABLE CREATION (DDL)
-- Entities: Departments, Doctors, Patients, Rooms, Appointments,
--           Admissions, Medicines, Prescriptions, Billing
-- ============================================================

CREATE TABLE Departments (
    department_id   INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(50) NOT NULL UNIQUE,
    floor_no        INT NOT NULL
);

CREATE TABLE Doctors (
    doctor_id       INT AUTO_INCREMENT PRIMARY KEY,
    doctor_name     VARCHAR(50) NOT NULL,
    specialization  VARCHAR(50) NOT NULL,
    department_id   INT,
    phone           VARCHAR(15),
    salary          DECIMAL(10,2) NOT NULL,
    joining_date    DATE NOT NULL,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

CREATE TABLE Patients (
    patient_id       INT AUTO_INCREMENT PRIMARY KEY,
    patient_name     VARCHAR(50) NOT NULL,
    gender           ENUM('Male','Female','Other') NOT NULL,
    dob              DATE NOT NULL,
    phone            VARCHAR(15),
    address          VARCHAR(100),
    blood_group      VARCHAR(5),
    registration_date DATE NOT NULL
);

CREATE TABLE Rooms (
    room_id         INT AUTO_INCREMENT PRIMARY KEY,
    room_type       ENUM('General','Semi-Private','Private','ICU') NOT NULL,
    floor_no        INT NOT NULL,
    charge_per_day  DECIMAL(8,2) NOT NULL,
    status          ENUM('Available','Occupied') DEFAULT 'Available'
);

CREATE TABLE Appointments (
    appointment_id   INT AUTO_INCREMENT PRIMARY KEY,
    patient_id       INT NOT NULL,
    doctor_id        INT NOT NULL,
    appointment_date DATETIME NOT NULL,
    reason           VARCHAR(100),
    status           ENUM('Scheduled','Completed','Cancelled') DEFAULT 'Scheduled',
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

CREATE TABLE Admissions (
    admission_id    INT AUTO_INCREMENT PRIMARY KEY,
    patient_id      INT NOT NULL,
    room_id         INT NOT NULL,
    doctor_id       INT NOT NULL,
    admission_date  DATE NOT NULL,
    discharge_date  DATE NULL,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (room_id) REFERENCES Rooms(room_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

CREATE TABLE Medicines (
    medicine_id     INT AUTO_INCREMENT PRIMARY KEY,
    medicine_name   VARCHAR(50) NOT NULL,
    price           DECIMAL(8,2) NOT NULL,
    stock_quantity  INT NOT NULL
);

CREATE TABLE Prescriptions (
    prescription_id INT AUTO_INCREMENT PRIMARY KEY,
    appointment_id  INT NOT NULL,
    medicine_id     INT NOT NULL,
    dosage          VARCHAR(30),
    duration_days   INT,
    FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id),
    FOREIGN KEY (medicine_id) REFERENCES Medicines(medicine_id)
);

CREATE TABLE Billing (
    bill_id         INT AUTO_INCREMENT PRIMARY KEY,
    patient_id      INT NOT NULL,
    admission_id    INT NULL,
    appointment_id  INT NULL,
    total_amount    DECIMAL(10,2) NOT NULL,
    payment_status  ENUM('Paid','Pending') DEFAULT 'Pending',
    bill_date       DATE NOT NULL,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (admission_id) REFERENCES Admissions(admission_id),
    FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id)
);

show databases;

