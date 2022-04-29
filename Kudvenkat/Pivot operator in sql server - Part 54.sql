-- Pivot operator in sql server - Part 54

Create Table ProductSales
(
 SalesAgent nvarchar(50),
 SalesCountry nvarchar(50),
 SalesAmount int
)

SELECT * FROM tblProductSales

Insert into ProductSales values('Tom', 'UK', 200);
Insert into ProductSales values('John', 'US', 180);
Insert into ProductSales values('John', 'UK', 260);
Insert into ProductSales values('David', 'India', 450);
Insert into ProductSales values('Tom', 'India', 350);
Insert into ProductSales values('David', 'US', 200);
Insert into ProductSales values('Tom', 'US', 130);
Insert into ProductSales values('John', 'India', 540);
Insert into ProductSales values('John', 'UK', 120);
Insert into ProductSales values('David', 'UK', 220);
Insert into ProductSales values('John', 'UK', 420);
Insert into ProductSales values('David', 'US', 320);
Insert into ProductSales values('Tom', 'US', 340);
Insert into ProductSales values('Tom', 'UK', 660);
Insert into ProductSales values('John', 'India', 430);
Insert into ProductSales values('David', 'India', 230);
Insert into ProductSales values('David', 'India', 280);
Insert into ProductSales values('Tom', 'UK', 480);
Insert into ProductSales values('John', 'US', 360);
Insert into ProductSales values('David', 'UK', 140);

Select * from ProductSales;

SELECT SalesCountry,SalesAgent,SUM(SalesAmount) AS Total
FROM ProductSales
GROUP BY SalesCountry,SalesAgent;

SELECT SalesAgent, India,UK,US
FROM ProductSales
PIVOT
 (
   SUM(SalesAmount) FOR SalesCountry IN ([India],[US],[UK])
 )AS PivotTable


 Create Table ProductsSale
(
   Id int primary key,
   SalesAgent nvarchar(50),
   SalesCountry nvarchar(50),
   SalesAmount int
)

Insert into ProductsSale values(1, 'Tom', 'UK', 200);
Insert into ProductsSale values(2, 'John', 'US', 180);
Insert into ProductsSale values(3, 'John', 'UK', 260);
Insert into ProductsSale values(4, 'David', 'India', 450);
Insert into ProductsSale values(5, 'Tom', 'India', 350);
Insert into ProductsSale values(6, 'David', 'US', 200);
Insert into ProductsSale values(7, 'Tom', 'US', 130);
Insert into ProductsSale values(8, 'John', 'India', 540);
Insert into ProductsSale values(9, 'John', 'UK', 120);
Insert into ProductsSale values(10, 'David', 'UK', 220);
Insert into ProductsSale values(11, 'John', 'UK', 420);
Insert into ProductsSale values(12, 'David', 'US', 320);
Insert into ProductsSale values(13, 'Tom', 'US', 340);
Insert into ProductsSale values(14, 'Tom', 'UK', 660);
Insert into ProductsSale values(15, 'John', 'India', 430);
Insert into ProductsSale values(16, 'David', 'India', 230);
Insert into ProductsSale values(17, 'David', 'India', 280);
Insert into ProductsSale values(18, 'Tom', 'UK', 480);
Insert into ProductsSale values(19, 'John', 'US', 360);
Insert into ProductsSale values(20, 'David', 'UK', 140);

SELECT SalesAgent, India,US,UK
FROM
(
SELECT SalesAgent, SalesCountry, SalesAmount
FROM ProductsSale
) AS SourceTable
PIVOT
 (
   SUM(SalesAmount) FOR SalesCountry IN ([India],[US],[UK])
 )AS PivotTable
 