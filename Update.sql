-- Update Statement 01 (dfbdbd)
UPDATE Department
SET Location = 'Kandy'
WHERE D_Id = 'DPT 004 ';


-- Update Statement 02 (dfbdbd)
UPDATE Room
SET Room_type ="ICU rooms"
WHERE Room_id = 'R 0005' AND Room_cost = '200';


-- Update Statement 03 (dfbdbd)
UPDATE Patient_guardian
SET  
    G_name = 'Chathumina menaka',
    Relationship = 'Mother',
    Contact_no = '077-2345321'
WHERE Out_Pid = 'P053';


-- Update Statement 04 (dfbdbd)
UPDATE Equipment
SET Quantity = 100
WHERE Equip_name = 'Blood Bag';


-- Update Statement 05 (dfbdbd)
UPDATE Bill
SET Treatment_charges = Treatment_charges + 1850
WHERE Medicine_charges > 1700 ;