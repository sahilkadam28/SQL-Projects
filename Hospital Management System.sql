CREATE TABLE Patients (
    patient_id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    gender VARCHAR(10),
    city VARCHAR(50)
);

INSERT INTO Patients VALUES
(1,'Rahul Nair',25,'Male','Kochi'),
(2,'Anita Sharma',30,'Female','Delhi'),
(3,'Vivek Kumar',45,'Male','Chennai'),
(4,'Sneha Menon',28,'Female','Trivandrum'),
(5,'Arjun Singh',50,'Male','Mumbai'),
(6,'Divya Reddy',35,'Female','Hyderabad'),
(7,'Kiran Patel',40,'Male','Ahmedabad'),
(8,'Meera Das',22,'Female','Kolkata'),
(9,'Suresh Babu',60,'Male','Madurai'),
(10,'Neha Kapoor',27,'Female','Chandigarh'),
(11,'Manoj Pillai',33,'Male','Thrissur'),
(12,'Lakshmi Iyer',48,'Female','Coimbatore'),
(13,'Amit Verma',38,'Male','Bangalore'),
(14,'Priya Joshi',29,'Female','Pune'),
(15,'Rohit Mehta',55,'Male','Jaipur');

CREATE TABLE Doctors (
    doctor_id INT PRIMARY KEY,
    name VARCHAR(100),
    specialization VARCHAR(100),
    phone VARCHAR(15)
);

INSERT INTO Doctors VALUES
(101, 'Dr. Anil Kumar', 'Cardiologist', '9000011111'),
(102, 'Dr. Priya Menon', 'Dermatologist', '9000011112'),
(103, 'Dr. Rajesh Sharma', 'Orthopedic', '9000011113'),
(104, 'Dr. Meena Reddy', 'Pediatrician', '9000011114'),
(105, 'Dr. Sunil Das', 'Neurologist', '9000011115');

CREATE TABLE Appointments (
    appointment_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE,
    diagnosis VARCHAR(200),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

INSERT INTO Appointments VALUES
(1001, 1, 101, '2025-02-01', 'Chest Pain'),
(1002, 2, 102, '2025-02-02', 'Skin Allergy'),
(1003, 3, 103, '2025-02-03', 'Fracture'),
(1004, 4, 104, '2025-02-04', 'Fever'),
(1005, 5, 101, '2025-02-05', 'Heart Checkup'),
(1006, 6, 105, '2025-02-06', 'Migraine'),
(1007, 7, 103, '2025-02-07', 'Back Pain'),
(1008, 8, 104, '2025-02-08', 'Cold & Cough');

Select * from Patients;
Select * from Doctors;
Select * from Appointments;

SELECT name, specialization FROM Doctors;

-- Patients older than 40
SELECT * FROM Patients
WHERE age > 40;

-- Female patients
SELECT * FROM Patients
WHERE gender = 'Female' AND age > 30;

-- Doctors who are Cardiologists OR Neurologist
SELECT * FROM Doctors
WHERE specialization = 'Cardiologist' OR specialization = 'Neurologist';

-- Appointments after Feb 5
SELECT * FROM Appointments
WHERE appointment_date > '2025-02-05';

-- Patients between age 30 and 50
SELECT * FROM Patients
WHERE age BETWEEN 30 AND 50;

-- Patients name start with 'A'
SELECT * FROM Patients
WHERE name LIKE 'A%';

-- Total patients
SELECT COUNT(*) AS Total_Patients FROM Patients;

-- Average patient age
SELECT AVG(age) AS Avg_Age FROM Patients;

-- Oldest patient
SELECT MAX(age) AS Max_Age FROM Patients;

-- Youngest patient
SELECT MIN(age) AS Min_Age FROM Patients;

-- Count patients by gender
SELECT gender, COUNT(*) AS Total
FROM Patients
GROUP BY gender;

-- Number of appointments per doctor
SELECT doctor_id, COUNT(*) AS Total_Appointments
FROM Appointments
GROUP BY doctor_id; 

-- Patients sorted by age
SELECT * FROM Patients
ORDER BY age ASC;

-- Doctors with more than 1 appointment
SELECT doctor_id, COUNT(*) AS Total_Appointments
FROM Appointments
GROUP BY doctor_id
HAVING COUNT(*) > 1;

-- Show patient name, doctor name, diagnosis
SELECT 
    P.name AS Patient_Name,
    D.name AS Doctor_Name,
    A.diagnosis
FROM Appointments A
JOIN Patients P ON A.patient_id = P.patient_id
JOIN Doctors D ON A.doctor_id = D.doctor_id;

-- Show all doctors (even without appointments)
SELECT D.name, A.appointment_date
FROM Appointments A
RIGHT JOIN Doctors D
ON A.doctor_id = D.doctor_id;

-- Rank doctors by number of appointments
SELECT 
    D.name,
    COUNT(A.appointment_id) AS Total_Appointments,
    RANK() OVER (ORDER BY COUNT(A.appointment_id) DESC) AS Rank_Position
FROM Doctors D
LEFT JOIN Appointments A
ON D.doctor_id = A.doctor_id
GROUP BY D.name;

SELECT 
    name,
    age,
    DENSE_RANK() OVER (ORDER BY age DESC) AS Dense_Rank_Position
FROM Patients;

-- Patients older than average age
SELECT * FROM Patients
WHERE age > (SELECT AVG(age) FROM Patients);

-- Patients who have appointments
SELECT * FROM Patients
WHERE patient_id IN (
    SELECT patient_id FROM Appointments
);

-- Doctors who handled appointments in Feb 2025
SELECT *
FROM Doctors
WHERE doctor_id IN (
    SELECT doctor_id
    FROM Appointments
    WHERE appointment_date BETWEEN '2025-02-01' AND '2025-02-28'
);

-- Patients whose name starts with 'A'
SELECT * FROM Patients
WHERE REGEXP_like (name, '^A');

-- Patients whose name ends with 'a'
SELECT * FROM Patients
WHERE REGEXP_like (name, 'a$');

-- Phone numbers containing only digits
SELECT * FROM Doctors
WHERE REGEXP_LIKE (phone, '^[0-9]+$');

-- Names containing 'ee'
SELECT * FROM Patients
WHERE name LIKE '%ee%';

UPDATE Patients
SET city = 'Ernakulam'
WHERE patient_id = 1;

SELECT * FROM Patients;

DELETE FROM Appointments
WHERE appointment_id = 1008;

SELECT * FROM Appointments;