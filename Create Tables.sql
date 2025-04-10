create database  Ninewells_Hospital;

use Ninewells_Hospital;

CREATE TABLE Department(
	D_Id VARCHAR(10) PRIMARY KEY ,
	D_name VARCHAR(50) NOT NULL,
	Location VARCHAR(50) NOT NULL 
);

CREATE TABLE Staff(
	St_id VARCHAR(10) PRIMARY KEY,
	St_name VARCHAR(50) NOT NULL,
	St_type VARCHAR(10) NOT NULL,
	DOB DATE NOT NULL,
	Address VARCHAR(100) NOT NULL,
	Contact_no VARCHAR(12) NOT NULL,
	Work_shift varchar(50),
	Salary decimal(10,2),
	D_Id VARCHAR(10),
	FOREIGN KEY(D_Id) REFERENCES Department(D_Id)
);

CREATE TABLE Staff_family(
	St_id  VARCHAR(10) NOT NULL,
	R_name   VARCHAR(50) NOT NULL,
	Address   VARCHAR(100) NOT NULL,
	Relationship    VARCHAR(30) NOT NULL,
	Contact_no  INTEGER NOT NULL ,
	PRIMARY KEY(St_id,R_name),
	FOREIGN KEY(St_id) REFERENCES Staff(St_id)
);

CREATE TABLE Room(
	Room_id VARCHAR(10) PRIMARY KEY,
	Room_type VARCHAR(30),
	D_id VARCHAR(10),
	Room_cost DECIMAL(8,2),
	FOREIGN KEY(D_id) REFERENCES Department(D_Id)
);

CREATE TABLE Doctor(
	Dr_id VARCHAR(10) PRIMARY KEY,
	Dr_type VARCHAR(60) NOT NULL,
	St_id VARCHAR(10) NOT NULL,
	FOREIGN KEY(St_id) REFERENCES Staff(St_id)
);

CREATE TABLE Nurse  (
	N_id VARCHAR(10) PRIMARY KEY,
	Nurse_type VARCHAR(80) NOT NULL,
	St_id VARCHAR(10) NOT NULL,
	FOREIGN KEY(St_id) REFERENCES Staff(St_id)
);

CREATE TABLE Ward_boy  (
	W_id VARCHAR(10) PRIMARY KEY,
	W_type VARCHAR(80) NOT NULL,
	St_id VARCHAR(10) NOT NULL,
	FOREIGN KEY(St_id) REFERENCES Staff(St_id)
);

CREATE TABLE Nurse_works_in(
	N_id   VARCHAR(10) NOT NULL,
	Room_id  VARCHAR(10) NOT NULL,
	Working_date  DATE NOT NULL  ,
	working_time VARCHAR(50),
	PRIMARY KEY(N_id,Room_id,Working_date),
	FOREIGN KEY(N_id) REFERENCES Nurse(N_id),
	FOREIGN KEY(Room_id) REFERENCES Room(Room_id)
);

CREATE TABLE Wardboy_works_In(
	W_id  VARCHAR(10) NOT NULL ,
	Room_id  VARCHAR(10) NOT NULL ,
	working_date DATE NOT NULL ,
	woking_hour VARCHAR(50)
);

CREATE TABLE Bill(
	Bill_id VARCHAR(10) PRIMARY KEY,
	Medicine_charges INT,
	Treatment_charges INT,
	Doctor_charges INT,
	Method VARCHAR(30),
	B_date DATE,
	Bill_Status VARCHAR(25)		
);

CREATE TABLE Patient(
	P_Id VARCHAR(10) PRIMARY KEY,
	P_Name VARCHAR(15) NOT NULL,
	Gender VARCHAR(20) NOT NULL,
	Address VARCHAR(25) NOT NULL,
	DOB DATE NOT NULL,
	Blood_group VARCHAR(5) NOT NULL,
	Contact_no VARCHAR(15) NOT NULL,
	Disease_details VARCHAR(20) NOT NULL,
	Dr_id VARCHAR(10) NOT NULL,
	Room_id VARCHAR(10) NOT NULL,
	Bill_id VARCHAR(10) NOT NULL,
	FOREIGN KEY(Dr_id) REFERENCES Doctor(Dr_id),
	FOREIGN KEY(Room_id) REFERENCES Room(Room_id),
	FOREIGN KEY(Bill_id) REFERENCES Bill(Bill_id)
);

CREATE TABLE In_patient (
	In_Pid VARCHAR(10),
	P_Id VARCHAR(10) ,
	Arrival_date DATE NOT NULL,
	Discharge_date DATE NOT NULL,
	PRIMARY KEY(In_Pid) ,
	FOREIGN KEY(P_ID)  REFERENCES Patient (P_Id)
);

CREATE TABLE Out_patient (
	Out_Pid VARCHAR(10),
	P_Id  VARCHAR(10) NOT NULL ,
	Out_date DATE NOT NULL,
	PRIMARY KEY(Out_Pid) ,
	FOREIGN KEY(P_ID)  REFERENCES Patient (P_Id)
);

CREATE TABLE Patient_guardian(
	P_Id VARCHAR(10) ,
	G_name VARCHAR(20),
	Relationship VARCHAR(15) NOT NULL,
	Contact_no VARCHAR(12) NOT NULL,
	PRIMARY KEY(P_id,G_name),
	FOREIGN KEY(P_id) REFERENCES Patient(P_id)
);

CREATE TABLE Laboratary(
	Lab_ID VARCHAR(10) PRIMARY KEY,
	Lab_Name VARCHAR(30) NOT NULL,
	D_id  VARCHAR(10) NOT NULL,
	FOREIGN KEY(D_id) REFERENCES Department(D_Id)
);

CREATE TABLE Equipment(
	Equip_id VARCHAR(8) PRIMARY KEY,
	Equip_name VARCHAR(15) NOT NULL,
	Quantity INTEGER
);

CREATE TABLE Lab_equipment(
	Lab_id   VARCHAR(10) NOT NULL,
	Equip_id  VARCHAR(10) NOT NULL,
	Quantity  INTEGER ,
	FOREIGN KEY(Lab_id) REFERENCES Laboratary(Lab_id),
	FOREIGN KEY(Equip_id) REFERENCES Equipment(Equip_Id)
);

CREATE TABLE Supplier(
	S_id VARCHAR(10) PRIMARY KEY,
	S_name VARCHAR(100) NOT NULL,
	Location varchar(60) NOT NULL
);

CREATE TABLE Equip_supply(
	S_id   VARCHAR(10) NOT NULL,
	Equip_id   VARCHAR(8) NOT NULL,
	Equip_cost  DECIMAL(8,2) NOT NULL,
	Quantity INTEGER,
	FOREIGN KEY(Equip_id) REFERENCES Equipment(Equip_id),
	FOREIGN KEY(S_id) REFERENCES Supplier(S_id)
);

CREATE TABLE Medicine(
	Medicine_id VARCHAR(10) PRIMARY KEY,
	Medicine_name VARCHAR(30) NOT NULL,
	Medicine_cost DECIMAL(8,2) NOT NULL,
	Mfd_date DATE NOT NULL,
	Exp_date DATE NOT NULL,
	Stock_details VARCHAR(30) NOT NULL
);

CREATE TABLE Medicine_supply(
	S_id  VARCHAR(10) NOT NULL,
	Medicine_id   VARCHAR(10) NOT NULL,
	S_date  DATE NOT NULL,
	Quantity   INTEGER NOT NULL,
	PRIMARY KEY(S_id,Medicine_id),
	FOREIGN KEY(S_id) REFERENCES Supplier(S_id),
	FOREIGN KEY(Medicine_id) REFERENCES Medicine_id(Medicine_id)
);

CREATE TABLE Supplier_contact_No(
	S_id   VARCHAR(10),
	Contact_No INT NOT NULL,
	PRIMARY KEY(S_id,Contact_No) ,
	FOREIGN KEY(S_id) REFERENCES Supplier(S_id)
);

CREATE TABLE Test(
	Test_Id VARCHAR(10) PRIMARY KEY,
	Test_name VARCHAR(30),
	Test_cost DECIMAL(8,2),
	Lab_id VARCHAR(10),
	foreign key(Lab_id) references Laboratary(Lab_ID)
);

CREATE TABLE Patient_check_test(
	P_id VARCHAR(10) NOT NULL,
	Test_id VARCHAR(10) NOT NULL,
	Test_Date DATE NOT NULL,
	Result VARCHAR(50) ,
	PRIMARY KEY(P_id,Test_id),
	FOREIGN KEY (p_id) REFERENCES Patient (P_id),
	FOREIGN KEY (Test_id) REFERENCES Test (Test_id)
);

CREATE TABLE Patient_medicine(
	P_id  VARCHAR(10) NOT NULL,
	Medicine_id  VARCHAR(10) NOT NULL ,
	dosage VARCHAR(10) ,
	P_Med_date  DATE NOT NULL,
	PRIMARY key(P_id,Medicine_id),
	FOREIGN KEY(P_id) REFERENCES Patient (P_id),
	FOREIGN KEY(Medicine_id) REFERENCES Medicine(Medicine_id)
);

Create table Patient_treatments(
	P_id VARCHAR(10) NOT NULL,
	treatments VARCHAR(30) NOT NULL,
	Dr_id VARCHAR(10) NOT NULL,
	PRIMARY key(P_id,Dr_id),
	FOREIGN KEY(P_id) REFERENCES Patient (P_id),
	FOREIGN KEY(Dr_id) REFERENCES Doctor (Dr_id)
);