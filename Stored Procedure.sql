use ninewells_hospital;
-- Query 01: View Doctor Details
DELIMITER //
CREATE PROCEDURE Doctor_details()
BEGIN
	SELECT S.st_id,D.Dr_id,S.St_name,S.DOB,S.Address,S.Contact_no,S.Work_shift,S.Salary,DP.D_name
	FROM staff AS S, doctor AS D, department AS DP
	WHERE S.st_id=D.st_id;
END//
DELIMITER ;

CALL Doctor_details();

-- Query 02: View Nurse Details
DELIMITER //
CREATE PROCEDURE Nurse_details()
BEGIN
	SELECT S.st_id,N.N_id,S.St_name,S.DOB,S.Address,S.Contact_no,S.Work_shift,S.Salary,DP.D_name
	FROM staff AS S, Nurse AS N, department AS DP
	WHERE S.st_id=N.st_id;
END//
DELIMITER ;

CALL Nurse_details();

-- Query 03: Ward boy details
DELIMITER //
CREATE PROCEDURE ward_boy_details()
BEGIN
	SELECT S.st_id,W.W_id,S.St_name,S.DOB,S.Address,S.Contact_no,S.Work_shift,S.Salary,DP.D_name
	FROM staff AS S, ward_boy AS W, department AS DP
	WHERE S.st_id=W.st_id;
END//
DELIMITER ;

CALL ward_boy_details();
-- Query 04: View Patient Details
DELIMITER //
CREATE PROCEDURE patient_details()
BEGIN
	SELECT P.P_id,P.P_name,P.Gender,P.Address,P.DOB,P.Blood_group,P.Contact_no,P.Disease_details,S.st_name AS "Doctor Name"
	FROM patient AS P,doctor AS D,staff AS S
	WHERE P.Dr_id=D.Dr_id AND S.St_id=D.St_id;
END//
DELIMITER ;

CALL patient_details();