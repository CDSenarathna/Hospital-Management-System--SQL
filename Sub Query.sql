-- Query 01:Patient details
select P_Id as "Patient ID", P_Name as "Patient Name", Disease_details
from  patient
where  P_ID IN(select P_ID
from patient
where P_Name="Rohan Sharma");


-- Query 02:Doctor details

SELECT P_Id,Address
from patient
where P_Id IN(
SELECT  P_ID
from patient
WHERE P_ID="P050");

select *from nurse;
-- Query 03:nurse work in each room details
select N_id ,Nurse_type
from Nurse
where N_id IN(
select N_id
from Nurse_works_in
where N_id="NS 002");