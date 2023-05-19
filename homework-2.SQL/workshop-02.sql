
ALTER TABLE dbo.Products
ADD CONSTRAINT DF_Product_Price
DEFAULT 1 FOR Price

ALTER TABLE dbo.Products 
WITH CHECK
ADD CONSTRAINT CH_Product_Price
CHECK(Price <= Cost*2)

ALTER TABLE dbo.Products
WITH CHECK
ADD CONSTRAINT UNQ_Product_Name
UNIQUE ([Name])
 
SELECT *
FROM dbo.Products

UPDATE dbo.Products SET Name = 'Gluten Free Update' 
WHERE ID = 13

SELECT *
FROM dbo.Products

UPDATE dbo.Products SET Name = 'Multigrain Update' 
WHERE ID = 5

