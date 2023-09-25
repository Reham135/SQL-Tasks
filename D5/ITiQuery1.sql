--1
select count(st_Id) from Student where student.St_Age is not null;

--2
select DISTINCT Ins_Name from Instructor 

--3

select St_Id, CONCAT(St_Fname, ' ', St_Lname) as FullName ,Dept_Name from Student S,Department D
where S.Dept_Id=D.Dept_Id 

--4
select Ins_Name,Dept_Name from Instructor I left join Department D
on I.Dept_Id=D.Dept_Id;

--5
SELECT CONCAT(St_Fname, ' ', St_Lname) AS FullName, Crs_Name  
FROM Student S, Stud_Course SC,Course C
where S.St_Id = SC.St_Id  and SC.Crs_Id=C.Crs_Id and SC.grade IS NOT NULL;
 
 --6
 SELECT Top_Name, COUNT(Crs_Id) AS course_count
FROM Course C,Topic T where C.Top_Id=T.Top_Id
GROUP BY T.Top_Name;


 --7
 SELECT MAX(salary) AS max_salary, MIN(salary) AS min_salary FROM instructor;

 --8
 SELECT Ins_Name FROM instructor
WHERE salary < (SELECT AVG(salary) FROM instructor);

--9
Select Ins_Name ,Dept_Name  from Instructor I ,Department D
where I.Dept_Id=D.Dept_Id and I.Salary = (SELECT Min(salary) FROM instructor)

--10
SELECT TOP 2 Salary FROM instructor
ORDER BY salary DESC;

--11

SELECT Ins_Name,COALESCE(CAST(Salary AS VARCHAR), 'Instructor_Bonus') AS Salary
FROM Instructor;

--12
SELECT avg(salary) FROM instructor;

--13
SELECT s.St_Fname+ ' '+ s.St_Lname AS StuFullName,super.*
from Student s join Student super
on s.St_super=super.St_Id

--14
Select *
From (select *,Row_number() over(partition by dept_Id order by salary desc) as RN
	  from Instructor) as Newtable
where RN<=2 and Salary is not null

--15
SELECT St_Fname+ ' '+ St_Lname AS StuFullName ,Dept_Name 
from (SELECT St_Fname, St_Lname ,Dept_Name ,ROW_NUMBER()over(Partition by d.dept_id order by newId()) as Ra
from Student S join Department D
on S.Dept_Id=D.Dept_Id )as newtable


