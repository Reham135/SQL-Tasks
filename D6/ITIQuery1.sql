
--1 Scaler Function
CREATE FUNCTION GetMonthName(@date DATE)
RETURNS VARCHAR(20)
AS
BEGIN
    DECLARE @monthName VARCHAR(20)
    SET @monthName = DATENAME(month, @date)
    RETURN @monthName
END
--calling
select dbo.GetMonthName('2023-6-4')

---------------------------------------------------------------
--2 multi-statements table-valued function 

create function getbetween(@num1 int,@num2 int)
returns @t table(numbetween int)
as
	begin
	
		while( @num2>@num1)
		begin
		set @num1=@num1+1
			insert into @t (numbetween)values(@num1)
		end
		return 
	 end

--calling
select * from getbetween(10,15)

-----------------------------------------------------------------------
--3 inline Function**
create function getDept(@St_Id int)
returns table
as
	return
		(
		 select (St_Fname+' '+St_Lname) as stuName,Dept_Name
		 from Department D join Stucourse.Student S
		 on D.Dept_Id=S.Dept_Id
		 where St_Id=@St_Id
		)

--calling
select * from getDept(5)
--------------------------------------------------------------------
--4
create function getNmsg(@stud_id int)
returns varchar(30)
  begin
	declare @fname varchar(30)
	declare @lname varchar(30)
	declare @Message varchar(30)
	select @fname=St_Fname ,@lname=St_Lname
	from Stucourse.Student
	where St_Id=@stud_id
	if @fname is null and @lname is null
	set @Message= 'First name & last name are null' 
	else if @fname is null
	set  @Message='first name is null'
	else if @lname is null
	set @Message ='last name is null'
	else 
	set @Message = 'First name & last name not null'
return @Message
 end

 --calling
select dbo.getNmsg(1)
--------------------------------------------------------------------
--5 inline Function**
create function MGRsData(@id int)
returns table
as
	return
		(
		 select Dept_Name, Ins_Name,Manager_hiredate
		 from Department D join Instructor I
		 on I.Ins_Id =D.Dept_Manager
		 where I.Ins_Id=@id
		)

--calling
select * from MGRsData(9)

--------------------------------------------------------------------
--6 multi-statements table-valued function 
	 CREATE FUNCTION getName(@name varchar(20))
RETURNS @t TABLE (StyName varchar(20))
AS
BEGIN
    DECLARE @first varchar(20)
    DECLARE @last varchar(20)
    DECLARE @fullname varchar(40) 
    
    IF @name = 'first name'
        INSERT INTO @t 
        SELECT ISNULL(St_Fname, '') FROM Stucourse.Student
    ELSE IF @name = 'last name'
        INSERT INTO @t 
        SELECT ISNULL(St_Lname, '') FROM Stucourse.Student
    ELSE IF @name = 'full name'
    BEGIN
        INSERT INTO @t 
        SELECT CONCAT(ISNULL(St_Fname, ''), ' ', ISNULL(St_Lname, '')) AS fullName FROM Stucourse.Student
    END
    RETURN
END

--calling
select * from dbo.getName('first name')
--------------------------------------------------------------------
--7
select St_Id, SUBSTRING (St_Fname,1,LEN (St_Fname)-1) from Student

--------------------------------------------------------------------
--8

DELETE SC FROM Stud_Course SC
JOIN Student S ON SC.St_Id = S.St_Id
JOIN Department D ON D.Dept_Id = S.Dept_Id
WHERE D.Dept_Name = 'SD'

--------------------------------------------------------------------
--9
create table DailyTransactions
(userId int,TransactionAmount varchar(20))

create table LastTransactions
(userId int,TransactionAmount varchar(20))

--merge
merge into LastTransactions as L
using DailyTransactions as D
on L.userId=D.userId
when matched and D.TransactionAmount>L.TransactionAmount then
update
set L.TransactionAmount=D.TransactionAmount
when not matched then
insert values (D.userId,D.TransactionAmount);



------------------------------------------------------------------
--10

create schema Stucourse

alter schema Stucourse transfer Student
alter schema Stucourse transfer Course