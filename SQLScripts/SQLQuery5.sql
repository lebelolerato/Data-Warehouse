SELECT 
    MAX([Store Sales.StoreKey]) as SalesID,
    [Daily Sales.TimeKey], 
    [Store Sales.StoreKey], 
    [Staff Sales.StaffKey], 
    [Bike brands.BrandKey], 
    SUM(total_sales) as SalesAmount,
    SUM(EXPR1) as QuantitySold
FROM 
    FactSales
GROUP BY 
    [Daily Sales.TimeKey], [Store Sales.StoreKey], [Staff Sales.StaffKey], [Bike brands.BrandKey];




SELECT DISTINCT *
FROM FactSalesFinal;


SELECT *, COUNT(*)
FROM FactSalesFinal
GROUP BY [Store Sales.StoreKey];
