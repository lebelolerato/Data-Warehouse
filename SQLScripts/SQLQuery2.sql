INSERT INTO Dim_BikeBrands (brand_id, brand_name, TimeOfYear, total_sales)
SELECT 
    p.brand_id,
    b.brand_name,
    DATEPART(MONTH, o.order_date) AS TimeOfYear,
    SUM(oi.quantity) AS TotalSales
FROM sales.orders o
JOIN sales.order_items oi ON o.order_id = oi.order_id
JOIN production.products p ON oi.product_id = p.product_id
JOIN production.brands b ON p.brand_id = b.brand_id
GROUP BY p.brand_id, b.brand_name, DATEPART(MONTH, o.order_date);



INSERT INTO Dim_DailySales (sales_date, total_sales)
SELECT 
    o.order_date,
    SUM(oi.quantity * oi.list_price) AS TotalSales
FROM sales.orders o
JOIN sales.order_items oi ON o.order_id = oi.order_id
GROUP BY o.order_date;



INSERT INTO Dim_StoreSales (store_id, store_name, total_sales)
SELECT 
    o.store_id,
    s.store_name,
    SUM(oi.quantity * oi.list_price) AS TotalSales
FROM sales.orders o
JOIN sales.order_items oi ON o.order_id = oi.order_id
JOIN sales.stores s ON o.store_id = s.store_id
GROUP BY o.store_id, s.store_name;



INSERT INTO Dim_StaffSales (staff_id, staff_name, total_sales)
SELECT 
    o.staff_id,
    CONCAT(st.first_name, ' ', st.last_name) AS StaffName,
    SUM(oi.quantity * oi.list_price) AS TotalSales
FROM sales.orders o
JOIN sales.order_items oi ON o.order_id = oi.order_id
JOIN sales.staffs st ON o.staff_id = st.staff_id
GROUP BY o.staff_id, st.first_name, st.last_name;




