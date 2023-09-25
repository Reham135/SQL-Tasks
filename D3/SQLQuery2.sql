create database Task
use Task


create table instructor
(
id int primary key identity,
Fname varchar(20),
Lname varchar(20),
BD date,
age as year(getdate())-year(BD),
hiredate date default getdate(),
address varchar(20),
salary int default 3000,
Overtime int unique,
netSalary as (isnull(salary,0)+isnull(Overtime,0)),
constraint c1 check(address='cairo' or address='Alex'),
constraint c2 check (salary between 1000 and 5000)
)



Create table course
(
CID int primary key identity,
cname varchar(20),
Duration int unique
)


create table lab(
LID int identity,
location varchar(50),
capacity int,
CID int,
constraint c3 primary key(LID,CID),
constraint c4 foreign key(CID)references course(CID) on delete cascade on update cascade,
constraint c5 check (capacity<20)
)


create table Course_instructor
(
ID int,
CID int,
constraint c6 primary key(ID,CID),
constraint c7 foreign key(ID)references instructor(ID) on delete cascade on update cascade,
constraint c8 foreign key(CID)references course(CID) on delete cascade on update cascade,
)

