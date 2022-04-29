-- Transaction Acid Tests - Part 58

SELECT * FROM Product;
SELECT * FROM ProductSales;

DELETE FROM ProductSales
WHERE ProductSalesId = 3;

Create Procedure spUpdateInventory_and_Sell
as
Begin
  Begin Try
    Begin Transaction
      Update Product set QtyAvailable = (QtyAvailable - 10)
      where ProductId = 1

      Insert into ProductSales values(3, 1, 10)
    Commit Transaction
  End Try
  Begin Catch 
    Rollback Transaction
  End Catch 
End;