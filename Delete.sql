-- Delete Statement 01 (dfbdbd)
DELETE FROM Patient WHERE P_Id = 'P051';


-- Delete Statement 02 (dfbdbd)
DELETE FROM Staff
where (St_id = 'SFT 002');



-- Delete Statement 03 (dfbdbd)
DELETE FROM Bill
WHERE (Medicine_charges > 2300.00);


-- Delete Statement 04 (dfbdbd)
DELETE FROM PATIENT
WHERE (Blood_group = 'A+');


-- Delete Statement 05 (dfbdbd)
DELETE
FROM Medicine
WHERE (Stock_details > 4800);


-- Delete Statement 06 (dfbdbd)
DELETE FROM Department
ORDER BY D_name DESC LIMIT 2;


-- Delete Statement 07 (dfbdbd)
DELETE FROM Bill
WHERE  (Medicine_Charges = (SELECT MIN(Medicine_Charges) AS Expr1 FROM Bill AS bill_1));