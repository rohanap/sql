-- Replacing cursors using joins in sql server - Part 64

Update ProductSales
set UnitPrice = 
 Case 
  When Name = 'Product - 55' Then 155
  When Name = 'Product - 65' Then 165
  When Name like 'Product - 100%' Then 10001
 End     
from ProductSales
join Products
on Products.Id = ProductSales.ProductId
Where Name = 'Product - 55' or Name = 'Product - 65' or 
Name like 'Product - 100%';

Select  Name, UnitPrice from 
Products join
ProductSales 
on Products.Id = ProductSales.ProductId
where (Name='Product - 55' or Name='Product - 65' or 
Name like 'Product - 100%');