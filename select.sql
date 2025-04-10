-- Query 01:Patient details
select P_Id as "Patient ID", P_Name as "Patient Name", Disease_details
from  patient;


-- Query 02:Doctor details
select staff.St_name as "Doctor Name", doctor.Dr_type as "Doctor Type"
from staff, doctor
where staff.St_id=doctor.St_id;


-- Query 03:nurse work in each room details
select N_id AS "Nurse ID", room_id AS "Nurse working room"
from nurse_works_in;


-- Query 04:Bill information of each patient
select patient.P_Id AS "Patient ID", patient.P_Name AS "Patient Name", patient.Address, bill.Bill_id, bill.Medicine_charges, bill.Treatment_charges, bill.Doctor_charges
from patient, bill
where patient.Bill_id=bill.Bill_id;


-- Query 05:Test results of each patient
select patient.P_Name as "Patient Name", test.Test_name, patient_check_test.Result
from patient, test, patient_check_test
where patient.P_Id=patient_check_test.P_id AND test.Test_Id=patient_check_test.Test_id;


-- Query 06:Medicine details of each supplier
select supplier.S_name, medicine.Medicine_name, medicine.Stock_details
from supplier, medicine, medicine_supply
where supplier.S_id=medicine_supply.S_id AND medicine.Medicine_id=medicine_supply.Medicine_id;


-- Query 07:Guardian details of each patient
select patient.P_Name as "Patient Name", patient_guardian.G_name as "Patient Guardian Name", patient_guardian.Relationship
from patient, patient_guardian
where patient.P_Id=patient_guardian.P_Id;


-- Query 08:Family details of each staff member
select staff.St_name as "Staff member Name", staff_family.R_name as "Family member Name", staff_family.Relationship
from staff, staff_family
where staff.St_id=staff_family.St_id;


-- Query 09:Inpatient details
SELECT IP.P_id,P.P_name AS "Patient Name",P.Gender,P.Address,P.DOB,P.Blood_group,P.Contact_no,P.Room_id,P.Disease_details,IP.Arrival_date,IP.Discharge_date,S.St_name AS "Doctor Name"
FROM In_patient AS IP, Patient AS P, Doctor AS D,Staff AS S
WHERE IP.P_id=P.P_id AND P.Dr_id=D.Dr_id AND S.St_id=D.St_id;


-- Query 10:Outpatient details
SELECT OP.P_id,P.P_name AS "Patient Name",P.Gender,P.Address,P.DOB,P.Blood_group,P.Contact_no,P.Disease_details,S.St_name AS "Doctor Name"
FROM Out_patient AS OP, Patient AS P, Doctor AS D,Staff AS S
WHERE OP.P_id=P.P_id AND P.Dr_id=D.Dr_id AND S.St_id=D.St_id;


-- Query 10:Bill details
SELECT B.Bill_id,P.P_id,P.P_name,B.Medicine_charges,B.Treatment_charges,B.Doctor_charges,(B.Medicine_charges + B.Treatment_charges + B.Doctor_charges) AS "Total Amount",B.Method,B.B_date AS "Bill Date",B.Bill_Status
FROM Bill AS B,Patient AS P
WHERE B.Bill_id=P.Bill_id;





