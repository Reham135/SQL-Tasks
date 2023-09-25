--1
select SalesOrderID, ShipDate  from sales.SalesOrderHeader 
where OrderDate between '7/28/2002' and '7/29/2014';
--2
select ProductID,Name from Production.Product 
where StandardCost<110;
--3
select ProductID,Name from Production.Product 
where Weight is null;
--4
SELECT Name
FROM Production.Product P
WHERE P.Color IN ('Silver', 'Black', 'Red');

--5
SELECT ProductID, Name
FROM Production.Product
WHERE Name LIKE 'B%';

--6
UPDATE Production.ProductDescription
SET Description = 'Chromoly steel_High of defects'
WHERE ProductDescriptionID = 3;

SELECT  Description
FROM Production.ProductDescription
WHERE Description LIKE '%[_]%';
--7
 select sum(TotalDue) from Sales.SalesOrderHeader
where OrderDate between '7/1/2002' and '7/31/2014'
group by OrderDate;
 
--8
select  distinct HireDate from HumanResources.Employee

--9
select avg (distinct ListPrice) from Production.Product
--or
SELECT avg(ListPrice) FROM (SELECT DISTINCT ListPrice FROM Production.Product) AS UniquePrices;

--10
SELECT CONCAT('The ',Name , ' is only! ', ListPrice) AS ProductInfo
FROM Production.Product
WHERE ListPrice between 100 AND  120
ORDER BY ListPrice;
--11A
select rowguid,Name,SalesPersonID,Demographics into store_Archive2 from Sales.Store ;


--11B
select rowguid,Name,SalesPersonID,Demographics into store_Archive3 from Sales.Store 
where 1=0;

--12
SELECT CONVERT(varchar(10), GETDATE(), 101)as DateForma 
union
SELECT FORMAT(GETDATE(), 'MM/dd/yyyy') 
union
SELECT CONVERT(varchar(10), GETDATE(), 103) 
union
SELECT CONVERT(varchar(10), GETDATE(), 104) 
