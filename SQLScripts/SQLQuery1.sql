CREATE TABLE Dim_BikeBrands (
    BrandKey INT IDENTITY(1,1) PRIMARY KEY,
	brand_id INT,
    brand_name VARCHAR(255),
    TimeOfYear VARCHAR(50),
    total_sales decimal(10,2)
);

CREATE TABLE Dim_DailySales (
	TimeKey INT IDENTITY(1,1) PRIMARY KEY,
    sales_date DATE,
    total_sales decimal(10,2)
);

CREATE TABLE Dim_StoreSales (
    StoreKey INT IDENTITY(1,1) PRIMARY KEY,
	store_id INT,
    store_name VARCHAR(255),
    total_sales decimal(10,2)
);

CREATE TABLE Dim_StaffSales (
	StaffKey INT IDENTITY(1,1) PRIMARY KEY,
    staff_id INT,
    staff_name VARCHAR(255),
    total_sales decimal(10,2)
);




CREATE TABLE Fact_Sales (
    SalesKey INT IDENTITY(1,1) PRIMARY KEY, -- Surrogate Key
    TimeKey INT NOT NULL,
    BrandKey INT NOT NULL,
    StoreKey INT NOT NULL,
    StaffKey INT NOT NULL,
    TotalSalesAmount MONEY,
    TotalQuantitySold INT,
    FOREIGN KEY (TimeKey) REFERENCES Dim_DailySales(TimeKey),
    FOREIGN KEY (BrandKey) REFERENCES Dim_BikeBrands(BrandKey),
    FOREIGN KEY (StoreKey) REFERENCES Dim_StoreSales(StoreKey),
    FOREIGN KEY (StaffKey) REFERENCES Dim_StaffSales(StaffKey)
);
