create database sem_5_project;
use sem_5_project;

CREATE TABLE criminal_records (
    criminal_id INT PRIMARY KEY AUTO_INCREMENT,
    photo varchar(255) DEFAULT NULL,
    name VARCHAR(100) NOT NULL,
    aadhar_card BIGINT DEFAULT null ,
    address TEXT DEFAULT NULL,
    city VARCHAR(50),
    state VARCHAR(50),
    date_of_birth DATE,
    jail_address TEXT DEFAULT NULL,
    jail_city varchar(50),
    jail_state VARCHAR(50),
    phone_no bigint DEFAULT NULL,
    crime VARCHAR(255) NOT NULL,
    date_of_arrest DATE NOT NULL,
    sentence_duration INT, -- in months
    status VARCHAR(50), -- e.g., 'Incarcerated', 'Released', 'Probation'
    description TEXT DEFAULT NULL
);

CREATE TABLE police (
    police_id VARCHAR(50) primary key,
    photo VARCHAR(255) DEFAULT NULL,
    aadhar_card BIGINT,
    password varchar(255),
    full_name VARCHAR(255),
    phone_no bigint DEFAULT NULL,
    email VARCHAR(255) DEFAULT NULL,
    address TEXT DEFAULT NULL,
    city varchar(255),
    state VARCHAR(255),
    blood_group varchar(10) DEFAULT NULL,
    post VARCHAR(255),
    speciality VARCHAR(255) DEFAULT NULL,
    description TEXT DEFAULT NULL
);

CREATE TABLE public (
    id INT AUTO_INCREMENT PRIMARY KEY,
    photo varchar(255),
    aadharcardno BIGINT,
    password varchar(255),
    email varchar(255) default NULL,
    phoneno BIGINT,
    fullName VARCHAR(255),
    address VARCHAR(255),
    city VARCHAR(50),
    state VARCHAR(50)
);

CREATE TABLE ticket (
    complaint_id INT AUTO_INCREMENT PRIMARY KEY,
    complainant_name VARCHAR(100) NOT NULL,
    public_id int,
    FOREIGN KEY (public_id) REFERENCES public(id) ,
    crime_type VARCHAR(50) NOT NULL,
    crime_description TEXT NOT NULL,
    crime_location VARCHAR(255),
    city VARCHAR(50),
    state VARCHAR(50),
    crime_date DATE NOT NULL,
    status VARCHAR(50) DEFAULT 'Pending',
    date_filed TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


INSERT INTO criminal_records (photo, name, aadhar_card, address, city, state, date_of_birth, jail_address, jail_city, jail_state, phone_no, crime, date_of_arrest, sentence_duration, status, description) 
VALUES 
('criminal1.jpg', 'Mark Wilson', 123456789012, '789 Pine St', 'New York', 'NY', '1985-06-15', 'Jail Block A', 'New York', 'NY', 9876543210, 'Armed Robbery', '2022-05-10', 36, 'Incarcerated', 'Convicted for a bank robbery in downtown Manhattan'),
('criminal2.jpg', 'Lucy Brown', 987654321098, '123 Oak St', 'Los Angeles', 'CA', '1990-02-20', 'Jail Block C', 'Los Angeles', 'CA', 8765432109, 'Fraud', '2021-11-05', 24, 'Released', 'Served time for financial fraud involving embezzlement'),
('criminal3.jpg', 'Kevin Smith', 456789012345, '456 Birch St', 'Chicago', 'IL', '1978-09-30', 'Jail Block B', 'Chicago', 'IL', 7654321098, 'Drug Trafficking', '2023-01-20', 60, 'Incarcerated', 'Caught during a drug smuggling operation');


INSERT INTO police (police_id, photo, aadhar_card, password, full_name, phone_no, email, address, city, state, blood_group, post, speciality, description) 
VALUES 
('P001', NULL, 123456789012, 'pass1234', 'Raj Kumar Singh', 9876543210, 'raj.kumar@singh.com', '123, Main Street', 'Mumbai', 'Maharashtra', 'O+', 'Inspector', 'Cyber Crime', 'Expert in cyber crime investigations'),
('P002', NULL, 987654321098, 'securePass@02', 'Neha Sharma', 9123456789, 'neha.sharma@example.com', '456, Park Avenue', 'Delhi', 'Delhi', 'A-', 'Sub-Inspector', 'Forensic Expert', 'Specialized in forensic evidence handling'),
('P003', NULL, 654321987654, 'Pa$$word321', 'Amit Patel', 9988776655, 'amit.patel@example.com', '789, Lotus Apartments', 'Ahmedabad', 'Gujarat', 'B+', 'Head Constable', 'Traffic Management', 'Experienced in traffic and crowd control operations');


INSERT INTO public (photo, aadharcardno, password, email, phoneno, fullName, address, city, state) 
VALUES 
('photo1.jpg', 123456789012, 'password123', 'johndoe@example.com', 9876543210, 'John Doe', '123 Park Ave', 'New York', 'NY'),
('photo2.jpg', 987654321098, 'securepass456', 'janesmith@example.com', 8765432109, 'Jane Smith', '456 Main St', 'Los Angeles', 'CA'),
('photo3.jpg', 456789012345, 'mypassword789', 'alexjohnson@example.com', 7654321098, 'Alex Johnson', '789 Elm St', 'Chicago', 'IL');


    INSERT INTO ticket (complainant_name, public_id, crime_type, crime_description, crime_location, city, state, crime_date, status) 
VALUES 
('John Doe', 1, 'Theft', 'Stolen wallet from the park', 'Central Park', 'New York', 'NY', '2024-09-01', 'Pending'),
('Jane Smith', 2, 'Vandalism', 'Graffiti on public property', 'Main Street', 'Los Angeles', 'CA', '2024-09-10', 'In Progress'),
('Alex Johnson', 3, 'Assault', 'Physical altercation in a bar', '5th Avenue', 'Chicago', 'IL', '2024-09-15', 'Resolved');


