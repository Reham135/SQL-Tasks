use Company_SD
--1
select * from Employee
--2
select Fname,Lname,SALARY,Dno from Employee
--3
select pname ,plocation,Dnum from PROJECT
--4
select Fname,Lname as fullname , salary*0.1*12 as annualSalary from Employee
--5
select ssn,fname,lname from employee where salary>1000
--6
select ssn,fname,lname from employee where salary*12>10000
--7
select Fname,salary from Employee where SEX='F'
--8
select Dnum,Dname from DEPARTMENTS where MGRSSN=968574
--9
select pnumber,pname,plocation from PROJECT where Dnum=10

--D3
--1
SELECT Dnum , Dname, MGRSSN ,CONCAT(fname, ' ', lname) AS fullname 
from Departments , Employee where Departments.MGRSSN =Employee.ssn

-2
select Dname,pname from Departments D inner join Project p
on D.Dnum=p.Dnum

-3
select D.*,CONCAT(fname, ' ', lname) AS fullname 
from dependent D left outer join employee E
on D.ESSN= E.ssn  

-4
select pname,pnumber,plocation from Project where city = 'alex' or city='cairo'

-5
select * from project where pname LIKE 'a%'

-6
select CONCAT(fname, ' ', lname) AS fullname from Employee
where Dno=30 and Salary between 1000 and 2000

-7
select CONCAT(fname, ' ', lname) AS fullname
from Employee E inner join Works_for W
on E.ssn=W.Essn and  hours>=10
inner join Project P
on p.pnumber=W.pno and pname='Al Rabwah' and Dnum=10

-8
select E.fname,S.Fname from Employee E ,Employee S 
where S.ssn=E.Superssn and S.Fname='kamel'


-9
select CONCAT(fname, ' ', lname) AS fullname ,pname 
from Employee E inner join Works_for W
on w.ESSn=e.ssn
inner join project p
on p.Pnumber=W.pno
order by p.pname 

-10
select P.Pnumber,D.Dname,E.lname,E.Bdate,E.Address 
from Employee E inner join Departments D
on E.SSN=D.MGRSSN
inner join Project P
on p.Dnum=D.Dnum
where P.city='cairo'

--11
select CONCAT(fname, ' ', lname) AS MGR_Name from Employee E inner join Departments D
on E.ssn=D.MGRSSN

--12
select * from Employee E LEFT outer join Dependent D
on E.ssn=D.ESSN

--13
insert into Employee 
VALUES ('Reham', 'Ahmed', 102672, 1997-03-14, 'suez', 'f', 3000, 112233, 30);

--14
insert into Employee(fname, lname,ssn, dno)
VALUES ('NOGA', 'Selim', 102660, 30)


--15
update Employee
set Salary+=0.2*Salary 
where Fname='reham'