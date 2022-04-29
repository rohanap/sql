-- Correlated subquery in sql - Part 60

Select [Id], [Name], [Description]
from Products
where Id not in (Select Distinct ProductId from ProductSales);

Select [Name],
  (Select SUM(QuantitySold) from ProductSales 
   where ProductId = Products.Id) as TotalQuantity
from Products
order by Name;