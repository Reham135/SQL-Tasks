--1
select dependent_name from Dependent D 
where sex='f' and D.ESSN in (select ssn from Employee E where E.sex='f')
union all
select dependent_name from Dependent D 
where sex='m' and D.ESSN in (select ssn from Employee E where E.sex='m')

--2
select SUM(Hours) as Total_hours,P.pname
from Works_for W inner join Project P
on W.Pno=p.Pnumber
group by p.Pname


--3
SELECT * FROM departments D
WHERE D.Dnum = (SELECT E.Dno FROM employee E WHERE E.ssn = (SELECT MIN(ssn)FROM employee ))

--4
select MIN(salary)as min_sal,MAX(salary)as mas_sal,AVG(salary) as Avg_sal,D.dname
from Employee E inner join Departments D
on E.Dno=D.Dnum
group by Dname

--5
SELECT CONCAT(e.fname, ' ', e.Lname) AS fullname
FROM employee e
where SSN in(select  mgrssn from departments
except
select essn from dependent)

--6
SELECT D.Dnum , D.Dname ,COUNT(*) AS num_employee
FROM employee E inner JOIN departments D 
ON E.dno = D.Dnum
GROUP BY D.Dnum, D.Dname
HAVING AVG(e.salary) < ( SELECT AVG(salary) FROM employee)

--7
select fname+' '+lname as fullname ,pname
from Employee E, Project P,Works_for W
where E.ssn=W.essn and w.pno=P.pnumber 
order by Dno ,lname,fname
--8
SELECT salary FROM Employee
where salary>=(SELECT MAX(salary) FROM Employee WHERE salary < (SELECT MAX(salary) FROM Employee))
ORDER BY salary DESC

--9
SELECT fname+' '+lname as fullname
from Employee e
intersect
select D.Dependent_name
from Dependent D 


--10
SELECT e.ssn, fname+' '+lname as fullname
FROM employee e
WHERE EXISTS (SELECT d.essn FROM dependent d WHERE d.essn = e.ssn);


--11
INSERT INTO departments  VALUES ( 'DEPT IT',100, 112233, '2006-11-01');


--12
update Departments
set MGRSSN=968574
where Dnum=100

update Departments
set MGRSSN=102672
where Dnum=20

update Employee
set Superssn=102672
where ssn=102660


--13
begin try
begin transaction

update Employee
set Superssn=102672
where Superssn=223344

update Departments
set MGRSSN=102672
where MGRSSN=223344

delete from Works_for
where ESSN=223344

delete from Employee
where SSN=223344

commit
end try
begin catch 
rollback
end catch


--14
update Employee 
Set salary = salary * 1.3
from Employee E,Works_for W,Project P
where	P.Pnumber=W.Pno and P.Pname='Al Rabwah'

