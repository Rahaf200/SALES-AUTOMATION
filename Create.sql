CREATE DATABASE SALES_AUTOMATION
GO

USE SALES_AUTOMATION;

CREATE TABLE tbl_Country(
	ID CHAR(2) PRIMARY KEY ,
	Name VARCHAR(30) NOT NULL
);

CREATE TABLE tbl_City(
	ID CHAR(2) PRIMARY KEY ,
	Name VARCHAR(30) NOT NULL,
	Country_id CHAR(2) NOT NULL FOREIGN KEY (Country_id) REFERENCES tbl_Country(ID)
);

CREATE TABLE tbl_District(
	ID INT PRIMARY KEY ,
	Name VARCHAR(30) NOT NULL,
	City_id CHAR(2) NOT NULL FOREIGN KEY (City_id) REFERENCES tbl_City(ID)

);

CREATE TABLE tbl_Neighborhood(
	ID INT PRIMARY KEY ,
	Name VARCHAR(30) NOT NULL,
	District_id INT NOT NULL FOREIGN KEY (District_id) REFERENCES tbl_District(ID)

);

CREATE TABLE tbl_Street(
	ID INT PRIMARY KEY Not Null,
	Name VARCHAR(30) NOT NULL,
	Neighborhood_id INT NOT NULL FOREIGN KEY (Neighborhood_id) REFERENCES tbl_Neighborhood(ID)

);


CREATE TABLE tbl_UnitSet(
	ID INT PRIMARY KEY  Not Null, 
	Name VARCHAR(100) NOT NULL,
	Price DECIMAL(10, 2),
	Conversion_coefficient DECIMAL(10, 2),
	Is_main_unit BIT NOT NULL,

);

CREATE TABLE tbl_Employee (
	ID INT PRIMARY KEY  NOT NULL, 
	First_name VARCHAR(100) NOT NULL,
	Last_name VARCHAR(100) NOT NULL,
	Date_of_birth DATE,
	Age INT,
	Gender VARCHAR(10),
	Phone VARCHAR(20) NOT NULL,
	Email VARCHAR(100),
	TR_identification_number VARCHAR(50),
	Salary DECIMAL(10, 2),
	Tax_administration VARCHAR(100),
	Date_of_initial_employment DATE,
	Date_of_departure DATE NOT NULL,
	UnitSet_id INT FOREIGN KEY (UnitSet_id) REFERENCES tbl_UnitSet(ID) 
);

CREATE TABLE tbl_Customer (
	ID INT PRIMARY KEY  Not Null, 
	First_name VARCHAR(100) Not Null,
	Last_name VARCHAR(100) Not Null,
	Age INT,
	Phone VARCHAR(20) Not Null,
	Email VARCHAR(100),
	Fax VARCHAR(20),
	status VARCHAR(20) Not Null,
	Account_code VARCHAR(20) Not Null,
	Account_type VARCHAR(50) Not Null,
	Account_title VARCHAR(100),
	Tax_number VARCHAR(20),
	Bank_account_numbers VARCHAR(100),
	Defined_risk_limit DECIMAL(10, 2),
	Available_risk_limit DECIMAL(10, 2),
	Total_active_risk DECIMAL(10, 2),
	Saller_visit_day VARCHAR(20),
	Employee_id INT FOREIGN KEY REFERENCES tbl_Employee(ID)

);

CREATE TABLE tbl_Address(
	ID INT PRIMARY KEY NOT NULL,
	Description TEXT,
	Phone VARCHAR(20),
	External_door_number INT NOT NULL, 
	Internal_door_number INT NOT NULL, 
	IS_main_address BIT,
    Employee_ID INT FOREIGN KEY (Employee_ID) REFERENCES tbl_Employee(ID),
    Customer_ID INT FOREIGN KEY (Customer_ID) REFERENCES tbl_Customer(ID),
    Street_ID INT FOREIGN KEY (Street_ID) REFERENCES tbl_Street(ID),
    Neighbourhood_ID INT FOREIGN KEY (Neighbourhood_ID) REFERENCES tbl_Neighborhood(ID),
    District_ID INT FOREIGN KEY (District_ID) REFERENCES tbl_District(ID),
    City_ID CHAR(2) FOREIGN KEY (City_ID) REFERENCES tbl_City(ID),
    Country_ID CHAR(2) FOREIGN KEY (Country_ID) REFERENCES tbl_Country(ID)

);

CREATE TABLE tbl_Collections(
	ID INT PRIMARY KEY Not Null, 
	Date DATE NOT NULL,
	Amount DECIMAL(10, 2) NOT NULL,
	Payment_type VARCHAR(100) NOT NULL,
	Employee_id INT FOREIGN KEY (employee_id) REFERENCES tbl_Employee(ID) NOT NULL,
	Customer_id INT FOREIGN KEY (customer_id) REFERENCES tbl_Customer(ID) NOT NULL

);

CREATE TABLE tbl_Warehouse(
	ID INT PRIMARY KEY Not Null, 
	Name VARCHAR(100) NOT NULL,
	Code VARCHAR(50),
	Phone VARCHAR(20),
	Description TEXT, 
	Capacity INT,
	Occupancy INT,
	Occupancy_rate DECIMAL(5, 2), 
	Employee_id INT FOREIGN KEY (employee_id) REFERENCES tbl_Employee(ID) NOT NULL
	
);
CREATE TABLE tbl_Order(
	ID INT PRIMARY KEY Not Null, 
	Order_number VARCHAR(50) UNIQUE NOT NULL,
	Type VARCHAR(50),
	Order_date DATE NOT NULL , 
	Order_status VARCHAR(50),
	Description TEXT , 
	Confirmation_information TEXT,
	Discount_total DECIMAL(10, 2),
	Total_VAT DECIMAL(10, 2),
	Grand_total DECIMAL(10, 2),
	Gross_total DECIMAL(10, 2),
	Net_total DECIMAL(10, 2),
	Paid_total DECIMAL(10, 2),
	Remaining_amount DECIMAL(10, 2),
	Is_invoiced BIT NOT NULL, 
	Customer_id INT FOREIGN KEY (customer_id) REFERENCES tbl_Customer(ID) NOT NULL,
	Employee_id INT FOREIGN KEY (employee_id) REFERENCES tbl_Employee(ID) NOT NULL,
	Address_id INT FOREIGN KEY (address_id) REFERENCES tbl_Address(ID) NOT NULL,
	Warehouse_id INT FOREIGN KEY (warehouse_id) REFERENCES tbl_Warehouse(ID) NOT NULL,
	Collection_id INT FOREIGN KEY (collection_id) REFERENCES tbl_Collections(ID) NOT NULL

);

CREATE TABLE tbl_Product (
	ID INT PRIMARY KEY Not Null, 
	Name VARCHAR(100) NOT NULL,
	VAT_rate DECIMAL(5, 2),
	Quantity INT,
	Code VARCHAR(50),
	Status VARCHAR(50),
	Customer_id INT FOREIGN KEY (customer_id) REFERENCES tbl_Customer(ID) Not NUll ,
	UnitSet_id INT FOREIGN KEY (unitset_id) REFERENCES tbl_UnitSet(ID) Not NUll ,
	Order_id INT FOREIGN KEY (order_id) REFERENCES tbl_Order(ID) NOT NULL
	
);


CREATE TABLE tbl_OrderItem(
	ID INT PRIMARY KEY Not Null,
	Quantity INT NOT NULL, 
	Unit_Price DECIMAL(10, 2) NOT NULL,
	Discount_amount DECIMAL(10, 2),
	VAT_amount DECIMAL(10, 2),
	Net_amount DECIMAL(10, 2),
	Total_Price DECIMAL(10, 2),
	Total_quantity_shipped INT,
	Confirmation_information TEXT,
	Order_id INT FOREIGN KEY (order_id) REFERENCES tbl_Order(ID) NOT NULL,
	UnitSet_id INT FOREIGN KEY (unitset_id) REFERENCES tbl_UnitSet(ID) Not NUll ,
	Product_ID INT FOREIGN KEY REFERENCES tbl_Product(ID) NOT NULL,
	Customer_id INT FOREIGN KEY (customer_id) REFERENCES tbl_Customer(ID) NOT NULL

);


CREATE TABLE tbl_WarehouseProductInventory(
	ID INT PRIMARY KEY NOT NULL , 
	Quantity INT NOT NULL,
	Product_id INT FOREIGN KEY (product_id) REFERENCES tbl_Product(ID) NOT NULL,
	Warehouse_id INT FOREIGN KEY (warehouse_id) REFERENCES tbl_Warehouse(ID) NOT NULL

);




CREATE TABLE tbl_Payment(
	ID INT PRIMARY KEY Not Null, 
	Date DATE NOT NULL,
	Method VARCHAR(50) NOT NULL,
	Amount DECIMAL(10, 2) NOT NULL,
	Number VARCHAR(50),
	Related_order INT,
	Customer_id INT FOREIGN KEY (customer_id) REFERENCES tbl_Customer(ID) NOT NULL,
	Employee_id INT FOREIGN KEY (employee_id) REFERENCES tbl_Employee(ID) NOT NULL,
	Collections_id INT FOREIGN KEY(collections_id) REFERENCES tbl_Collections(ID) NOT NULL,
	Order_id INT FOREIGN KEY (order_id) REFERENCES tbl_Order(ID) NOT NULL

);

CREATE TABLE tbl_Barcode(
	ID INT PRIMARY KEY Not Null, 
	Barcode VARCHAR(50) NOT NULL,
	UnitSet_id INT FOREIGN KEY (unitset_id) REFERENCES tbl_UnitSet(ID) NOT NULL,
	Product_id INT FOREIGN KEY (product_id) REFERENCES tbl_Product(ID) NOT NULL

);

CREATE TABLE tbl_Shipping(
	ID INT PRIMARY KEY Not Null, 
	Quantity INT NOT NULL,
	Shipping_Date DATE NOT NULL,
	Shipping_time TIME NOT NULL , 
	Explanation TEXT,
	Recipient_name VARCHAR(100) NOT NULL,
	Recipient_surname VARCHAR(100) NOT NULL,
	Expected_delivery_time TIME,
	Delivery_date DATE,
	Delivery_time TIME,
	Invoice_number VARCHAR(50),
	Tracking_Number VARCHAR(50),
	Shipping_Method VARCHAR(50),
	Cargo_company VARCHAR(100),
	Product_id INT FOREIGN KEY (product_id) REFERENCES tbl_Product(ID) NOT NULL,
	Order_id INT FOREIGN KEY (order_id) REFERENCES tbl_Order(ID) NOT NULL,
	Employee_id INT FOREIGN KEY (employee_id) REFERENCES tbl_Employee(ID) NOT NULL

);


