-- Count and Group Functions Query 01 (Can view number of patient group by blood group)
SELECT Blood_group, COUNT(P_Id) AS "Number of patient"
FROM Patient
GROUP BY Blood_group;


-- Count and Group Functions Query 02 (Can view number of bills group by Payment Method)
SELECT Bill.Method AS "Payment Method", COUNT(Bill.Bill_id) AS "Number of Bills"
FROM Bill
GROUP BY Method;