-- What to choose for performance - SubQueries or Joins - Part 62

Select Id, Name, Description
from Products
where ID IN
(
 Select ProductId from ProductSales
);

CHECKPOINT; 
GO 
DBCC DROPCLEANBUFFERS; -- Clears query cache
Go
DBCC FREEPROCCACHE; -- Clears execution plan cache
GO

Select distinct Products.Id, Name, Description
from Products
inner join ProductSales
on Products.Id = ProductSales.ProductId;

Select Id, Name, [Description]
from Products
where Not Exists(Select * from ProductSales where ProductId = Products.Id);

Select Products.Id, Name, [Description]
from Products
left join ProductSales
on Products.Id = ProductSales.ProductId
where ProductSales.ProductId IS NULL;
