-- Subqueries in sql - Part 59

Create Table Products
(
 [Id] int identity primary key,
 [Name] nvarchar(50),
 [Description] nvarchar(250)
);

Create Table ProductSales
(
 Id int primary key identity,
 ProductId int foreign key references Products(Id),
 UnitPrice int,
 QuantitySold int
);

Insert into Products 
values ('TV', '52 inch black color LCD TV');

Insert into Products 
values ('Laptop', 'Very thin black color acer laptop');

Insert into Products 
values ('Desktop', 'HP high performance desktop');

Insert into ProductSales 
values(3, 450, 5);

Insert into ProductSales 
values(2, 250, 7);

Insert into ProductSales 
values(3, 450, 4);

Insert into ProductSales 
values(3, 450, 9);

SELECT * FROM ProductSales;
SELECT * FROM Products;


Select [Id], [Name], [Description]
from Products
where Id not in (Select Distinct ProductId from ProductSales);

SELECT *
FROM Products P
LEFT JOIN ProductSales PS
ON P.Id = PS.ProductId
WHERE PS.ProductId IS NULL;


Select [Name],
  (Select SUM(QuantitySold) from ProductSales 
   where ProductId = Products.Id) as TotalQuantity
from Products
order by Name;

SELECT P.Name, SUM(PS.QuantitySold)
FROM Products P
LEFT JOIN ProductSales PS
ON P.Id = PS.ProductId
GROUP BY P.Name;

