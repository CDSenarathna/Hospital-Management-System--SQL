-- Query 01:Patient details
select count(P_Id) as "Patient ID"
from  patient where Blood_group ='A+';
;



-- Query 02:max salary Doctor details
select max(Salary),Staff.St_name as "Doctor Name", doctor.Dr_type as "Doctor Type"
from staff, doctor
where staff.St_id=doctor.St_id;


-- Query 03:count of nurse work in "1.00 p.m - 6.00 p.m"
select count(N_id)
from nurse_works_in where working_time='1.00 p.m - 6.00 p.m';

select * from nurse_works_in;

-- Query 04:  minimum cost room
select min(Room_cost)
from Room;




-- Query 05:Sum of treatment charges in bill table;

select sum(Treatment_charges)
 from bill;

-- Query 06:Sum of doctor charges

select sum(Doctor_charges)
 from bill;

-- Query 07:minimum medicine charge
select Bill_id ,min(Medicine_charges) from bill;


-- Query 08:Average salary
select AVG(salary)
from staff; 


-- Query 09:to check whether address is null or not
select isnull(address)
from patient
where P_Id="P050";

-- Query 10:check whether salary isnull or not for a specific staff member

select isnull(salary)
from Staff
where St_Id="STF 001";
