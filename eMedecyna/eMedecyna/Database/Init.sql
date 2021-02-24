CREATE TABLE Addresses(address_id int,
street varchar(50) NOT NULL, 
number int NOT NULL,
city varchar(50) NOT NULL,
postcode varchar(50), 
PRIMARY KEY(address_id));

CREATE TABLE Doctors(doctor_id int,
doctor_name varchar(50) NOT NULL,
doctor_surname varchar(50) NOT NULL,
employment_date date,
specialization varchar(50),
salary real NOT NULL,
phone varchar(9) NOT NULL,
address_id int, 
PRIMARY KEY(doctor_id),
CONSTRAINT fk_address
	FOREIGN KEY(address_id)
		REFERENCES Addresses(address_id));

CREATE TABLE Patients(patient_id int, 
patient_name varchar(50) NOT NULL,
patient_surname varchar(50) NOT NULL, 
phone varchar(9) NOT NULL, 
address_id int
PRIMARY KEY(patient_id)
CONSTRAINT fk_address
	FOREIGN KEY(address_id)
		REFERENCES Addresses(address_id));

CREATE TABLE Drugs(drug_id int,
drug_name varchar(50) NOT NULL, 
price real NOT NULL, 
prescripted char(1),
PRIMARY KEY(drug_id) 
);

CREATE TABLE Prescriptions(prescription_id int,
patient_id int NOT NULL, 
doctor_id int NOT NULL, 
drug_id int NOT NULL, 
quantity int NOT NULL,
PRIMARY KEY(prescription_id),
CONSTRAINT fk_patient
	FOREIGN KEY(patient_id)
		REFERENCES Patients(patient_id),
CONSTRAINT fk_doctor
	FOREIGN KEY(doctor_id)
		REFERENCES Doctors(doctors_id),
CONSTRAINT fk_drug
	FOREIGN KEY(drug_id)
		REFERENCES Drugs(drugs_id));