--1
create view Vstu
with encryption
as
	SELECT CONCAT(S.St_Fname, ' ', S.St_Lname) AS FullName, C.Crs_Name
FROM Student S
JOIN Stud_Course SC ON SC.St_Id = s.St_Id
JOIN Course C ON C.Crs_Id = SC.Crs_Id
where Sc.Grade >50
	
------------------------------------------------------------------
--2
create view VMgr
with encryption
as
select I.Ins_Name ,T.Top_Name
from Instructor I join Department D
on I.Ins_Id=D.Dept_Manager
join Ins_Course IC
on Ic.Ins_Id=I.Ins_Id
join Course C
on C.Crs_Id=IC.Crs_Id
join Topic T
on T.Top_Id =C.Top_Id

select * from VMgr
--------------------------------------------------------------------
--3
create view VInsDept
with encryption 
as 
select I.Ins_Name ,D.Dept_Name from Instructor I join Department D
on I.Dept_Id=D.Dept_Id
where D.Dept_Name ='SD' or D.Dept_Name ='Java'

select * from VInsDept

---------------------------------------------------------------------
--4
create view V1
with encryption 
as 
select * from Student S
where S.St_Address='Alex' or S.St_Address='Cairo'
with check option
--------------------------------------------------------------------------
--5
use Company_SD
create view Vproj
with encryption 
as 
select P.Pname ,count(essn) as EmpCount
from Project P join Works_for W
on p.Pnumber=w.Pno
join Employee E
on E.SSN=w.ESSn
group by rollup(p.Pname)

select * from Vproj


------------------------------------------
--6
create schema Company
create table Company.Department( id int primary key ,name varchar(20))

create schema [Human Resource] 
create table [Human Resource].Employee ( id int primary key ,name varchar(20))
------------------------------------------
--7
create unique index myindex1
on department(manager_hiredate)
------------------------------------------

--8
create nonclustered index myindex
on student(st_age)

-------------------------------------------
--9
declare c1 Cursor
for select salary
	from Employee
for update
declare @sal int
open c1
fetch c1 into @sal
while @@fetch_status=0
	begin
		if @sal<3000
			update Employee
				set salary=@sal*1.1
			where current of c1
		else if @sal>=3000
			update Employee
				set salary=@sal*1.2
			where current of c1
		fetch c1 into @sal
	end
close c1
deallocate c1

-----------------------------------------
--10

Declare C1 Cursor
for select D.Dept_Name,I.Ins_Name from iti.dbo.Department D , iti.dbo.Instructor I
Where D.Dept_Manager=I.Ins_Id
for read only     
declare @Dname varchar(20),@MGRname varchar(20)
open C1
Fetch C1 into @Dname,@MGRname
while @@FETCH_STATUS=0
	begin
		select @Dname,@MGRname
		Fetch C1 into @Dname,@MGRname
	end
close C1
Deallocate C1


-----------------------------------------
--11

declare c1 cursor
for select distinct ins_name
	from iti.dbo.Instructor
	where ins_name is  not null
for read only

declare @name varchar(20),@all_names varchar(300)=''
open c1
fetch c1 into @name
while @@FETCH_STATUS=0
	begin
		set @all_names=concat(@all_names,',',@name)
		fetch c1 into @name   
	end
select @all_names
close c1
deallocate C1
