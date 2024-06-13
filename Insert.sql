INSERT INTO tbl_Country (ID, Name) VALUES 
('US', 'United States'),
('CA', 'Canada'),
('UK', 'United Kingdom'),
('FR', 'France'),
('DE', 'Germany');

INSERT INTO tbl_City (ID, Name, Country_id) VALUES 
('NY', 'New York', 'US'),
('TO', 'Toronto', 'CA'),
('LD', 'London', 'UK'),
('PA', 'Paris', 'FR'),
('BE', 'Berlin', 'DE');

INSERT INTO tbl_District (ID, Name, City_id) VALUES 
(1, 'District 1', 'NY'),
(2, 'District 2', 'TO'),
(3, 'District 3', 'LD'),
(4, 'District 4', 'PA'),
(5, 'District 5', 'BE');

INSERT INTO tbl_Neighborhood (ID, Name, District_id) VALUES 
(1, 'Upper East Side', 1),
(2, 'Financial District', 2),
(3, 'Covent Garden', 3),
(4, 'Montmartre', 4),
(5, 'Prenzlauer Berg', 5);

INSERT INTO tbl_Street (ID, Name, Neighborhood_id) VALUES 
(1, '5th Avenue', 1),
(2, 'Wall Street', 2),
(3, 'Long Acre', 3),
(4, 'Rue Lepic', 4),
(5, 'Kollwitzstraﬂe', 5);

INSERT INTO tbl_UnitSet (ID, Name, Price, Conversion_coefficient, Is_main_unit) VALUES 
(1, 'Kilogram', 10.00, 1.00, 1),
(2, 'Gram', 0.01, 0.001, 0),
(3, 'Liter', 15.00, 1.00, 1),
(4, 'Milliliter', 0.015, 0.001, 0),
(5, 'Package', 50.00, 1.00, 1);

INSERT INTO tbl_Employee (ID, First_name, Last_name, Date_of_birth, Age, Gender, Phone, Email, TR_identification_number, Salary, Tax_administration, Date_of_initial_employment, Date_of_departure, UnitSet_id) VALUES 
(1, 'John', 'Doe', '1980-01-15', 44, 'Male', '123-456-7890', 'john.doe@example.com', 'TR123456', 50000.00, 'NY Tax Office', '2005-06-01', '2025-12-31', 1),
(2, 'Jane', 'Smith', '1985-02-20', 39, 'Female', '987-654-3210', 'jane.smith@example.com', 'TR654321', 55000.00, 'CA Tax Office', '2010-09-15', '2025-12-31', 2),
(3, 'Alice', 'Johnson', '1990-03-25', 34, 'Female', '456-789-0123', 'alice.johnson@example.com', 'TR789012', 60000.00, 'TX Tax Office', '2015-04-20', '2025-12-31', 3),
(4, 'Bob', 'Brown', '1975-04-10', 49, 'Male', '321-654-0987', 'bob.brown@example.com', 'TR098765', 62000.00, 'FL Tax Office', '2000-08-10', '2025-12-31', 4),
(5, 'Eve', 'Davis', '1988-05-30', 36, 'Female', '789-012-3456', 'eve.davis@example.com', 'TR345678', 58000.00, 'IL Tax Office', '2012-11-05', '2025-12-31', 5);

INSERT INTO tbl_Customer (ID, First_name, Last_name, Age, Phone, Email, Fax, status, Account_code, Account_type, Account_title, Tax_number, Bank_account_numbers, Defined_risk_limit, Available_risk_limit, Total_active_risk, Saller_visit_day, Employee_id) VALUES 
(1, 'Emily', 'Adams', 28, '123-456-7890', 'emily.adams@example.com', '123-456-7899', 'Active', 'ACC123', 'Personal', 'Emily Adams Account', 'TAX12345', '123456789012', 10000.00, 5000.00, 5000.00, 'Monday', 1),
(2, 'Michael', 'Brown', 35, '234-567-8901', 'michael.brown@example.com', '234-567-8909', 'Active', 'ACC124', 'Business', 'Michael Brown Corp', 'TAX23456', '234567890123', 15000.00, 7000.00, 8000.00, 'Tuesday', 2),
(3, 'Sarah', 'Clark', 42, '345-678-9012', 'sarah.clark@example.com', '345-678-9019', 'Inactive', 'ACC125', 'Personal', 'Sarah Clark Account', 'TAX34567', '345678901234', 8000.00, 2000.00, 6000.00, 'Wednesday', 3),
(4, 'David', 'Evans', 50, '456-789-0123', 'david.evans@example.com', '456-789-0129', 'Active', 'ACC126', 'Business', 'David Evans LLC', 'TAX45678', '456789012345', 20000.00, 10000.00, 10000.00, 'Thursday', 4),
(5, 'Laura', 'Martinez', 30, '567-890-1234', 'laura.martinez@example.com', '567-890-1239', 'Active', 'ACC127', 'Personal', 'Laura Martinez Account', 'TAX56789', '567890123456', 12000.00, 6000.00, 6000.00, 'Friday', 5);

INSERT INTO tbl_Address (ID, Description, Phone, External_door_number, Internal_door_number, IS_main_address, Employee_ID, Customer_ID, Street_ID, Neighbourhood_ID, District_ID, City_ID, Country_ID) VALUES 
(1, 'Home Address', '123-456-7890', 101, 1, 1, 1, NULL, 1, 1, 1, 'NY', 'US'),
(2, 'Office Address', '234-567-8901', 202, 2, 1, 2, NULL, 2, 2, 2, 'TO', 'CA'),
(3, 'Branch Office', '345-678-9012', 303, 3, 0, NULL, 3, 3, 3, 3, 'LD', 'UK'),
(4, 'Main Warehouse', '456-789-0123', 404, 4, 1, NULL, 4, 4, 4, 4, 'PA', 'FR'),
(5, 'Secondary Warehouse', '567-890-1234', 505, 5, 0, NULL, 5, 5, 5, 5, 'BE', 'DE');

INSERT INTO tbl_Collections (ID, Date, Amount, Payment_type, Employee_id, Customer_id) VALUES 
(1, '2024-05-01', 250.00, 'Credit Card', 1, 1),
(2, '2024-05-02', 300.00, 'Cash', 2, 2),
(3, '2024-05-03', 150.00, 'Bank Transfer', 3, 3),
(4, '2024-05-04', 400.00, 'Credit Card', 4, 4),
(5, '2024-05-05', 500.00, 'Cash', 5, 5);

INSERT INTO tbl_Warehouse (ID, Name, Code, Phone, Description, Capacity, Occupancy, Occupancy_rate, Employee_id) VALUES 
(1, 'Main Warehouse', 'WH001', '123-456-7890', 'Primary storage facility', 10000, 7000, 70.00, 1),
(2, 'Secondary Warehouse', 'WH002', '234-567-8901', 'Backup storage facility', 8000, 4000, 50.00, 2),
(3, 'Distribution Center', 'WH003', '345-678-9012', 'Central distribution hub', 12000, 9000, 75.00, 3),
(4, 'Cold Storage', 'WH004', '456-789-0123', 'Temperature-controlled storage', 5000, 2500, 50.00, 4),
(5, 'Overflow Storage', 'WH005', '567-890-1234', 'Extra storage space', 6000, 3000, 50.00, 5);


INSERT INTO tbl_Order (ID, Order_number, Type, Order_date, Order_status, Description, Confirmation_information, Discount_total, Total_VAT, Grand_total, Gross_total, Net_total, Paid_total, Remaining_amount, Is_invoiced, Customer_id, Employee_id, Address_id, Warehouse_id, Collection_id) VALUES 
(1, 'ORD001', 'Online', '2023-05-01', 'Shipped', 'First order', 'Confirmed by email', 10.00, 15.00, 150.00, 140.00, 130.00, 100.00, 30.00, 1, 1, 1, 1, 1, 1),
(2, 'ORD002', 'In-Store', '2023-05-02', 'Pending', 'Second order', 'Confirmed by phone', 20.00, 30.00, 300.00, 280.00, 260.00, 200.00, 60.00, 1, 2, 2, 2, 2, 2),
(3, 'ORD003', 'Online', '2023-05-03', 'Delivered', 'Third order', 'Confirmed by email', 15.00, 25.00, 250.00, 235.00, 220.00, 150.00, 70.00, 0, 3, 3, 3, 3, 3),
(4, 'ORD004', 'In-Store', '2023-05-04', 'Cancelled', 'Fourth order', 'Cancelled by customer', 5.00, 10.00, 100.00, 95.00, 90.00, 80.00, 10.00, 0, 4, 4, 4, 4, 4),
(5, 'ORD005', 'Online', '2023-05-05', 'Processing', 'Fifth order', 'Pending confirmation', 25.00, 35.00, 350.00, 325.00, 300.00, 250.00, 50.00, 1, 5, 5, 5, 5, 5);

INSERT INTO tbl_Product (ID, Name, VAT_rate, Quantity, Code, Status, Customer_id, UnitSet_id, Order_id) VALUES 
(1, 'Product A', 0.20, 100, 'P001', 'Active', 1, 1, 1),
(2, 'Product B', 0.15, 200, 'P002', 'Active', 1, 2, 1),  
(3, 'Product B', 0.25, 150, 'P003', 'Active', 2, 1, 2),
(4, 'Product A', 0.10, 300, 'P004', 'Active', 2, 2, 2), 
(5, 'Product E', 0.18, 250, 'P005', 'Active', 5, 1, 3); 

INSERT INTO tbl_OrderItem (ID, Quantity, Unit_Price, Discount_amount, VAT_amount, Net_amount, Total_Price, Total_quantity_shipped, Confirmation_information, Order_id, UnitSet_id, Customer_id , Product_ID) VALUES 
(1, 10, 5.00, 0.00, 2.00, 50.00, 50.00, 10, 'Item confirmed', 1, 1, 1, 1),
(2, 20, 3.50, 5.00, 1.50, 65.00, 70.00, 20, 'Item confirmed', 1, 2, 1, 1),
(3, 15, 8.00, 2.50, 3.00, 112.50, 120.00, 15, 'Item confirmed', 1, 1, 1, 2),
(4, 30, 6.50, 3.00, 2.50, 180.00, 195.00, 30, 'Item confirmed', 2, 1, 2, 3),
(5, 25, 4.00, 1.00, 1.00, 96.00, 100.00, 25, 'Item confirmed', 2, 2, 2, 4);


INSERT INTO tbl_WarehouseProductInventory (ID, Quantity, Product_id, Warehouse_id) VALUES 
(1, 100, 1, 1),
(2, 200, 2, 2),
(3, 150, 3, 3),
(4, 300, 4, 4),
(5, 250, 5, 5);

INSERT INTO tbl_Payment (ID, Date, Method, Amount, Number, Related_order, Customer_id, Employee_id, Collections_id, Order_id) VALUES 
(1, '2024-05-01', 'Credit Card', 100.00, 'PAY001', NULL, 1, 1, 1, 1),
(2, '2024-05-02', 'Cash', 150.00, 'PAY002', NULL, 2, 2, 2, 2),
(3, '2024-05-03', 'Bank Transfer', 200.00, 'PAY003', NULL, 3, 3, 3, 3),
(4, '2024-05-04', 'Credit Card', 120.00, 'PAY004', NULL, 4, 4, 4, 4),
(5, '2024-05-05', 'Cash', 180.00, 'PAY005', NULL, 5, 5, 5, 5);

INSERT INTO tbl_Barcode (ID, Barcode, UnitSet_id, Product_id) VALUES 
(1, 'BAR001', 1, 1),
(2, 'BAR002', 2, 2),
(3, 'BAR003', 1, 3),
(4, 'BAR004', 2, 4),
(5, 'BAR005', 1, 5);

INSERT INTO tbl_Shipping (ID, Quantity, Shipping_Date, Shipping_time, Explanation, Recipient_name, Recipient_surname, Expected_delivery_time, Delivery_date, Delivery_time, Invoice_number, Tracking_Number, Shipping_Method, Cargo_company, Product_id, Order_id, Employee_id) VALUES 
(1, 10, '2024-05-01', '10:00:00', 'Shipping item', 'John', 'Doe', '12:00:00', '2024-05-03', '14:00:00', 'INV001', 'TRK001', 'Standard', 'CargoCo', 1, 1, 1),
(2, 20, '2024-05-02', '11:00:00', 'Shipping item', 'Jane', 'Smith', '13:00:00', '2024-05-04', '15:00:00', 'INV002', 'TRK002', 'Express', 'ShipCo', 2, 2, 2),
(3, 15, '2024-05-03', '12:00:00', 'Shipping item', 'Alice', 'Johnson', '14:00:00', '2024-05-05', '16:00:00', 'INV003', 'TRK003', 'Standard', 'CargoCo', 3, 3, 3),
(4, 30, '2024-05-04', '13:00:00', 'Shipping item', 'Bob', 'Brown', '15:00:00', '2024-05-06', '17:00:00', 'INV004', 'TRK004', 'Express', 'ShipCo', 4, 4, 4),
(5, 25, '2024-05-05', '14:00:00', 'Shipping item', 'Eva', 'Davis', '16:00:00', '2024-05-07', '18:00:00', 'INV005', 'TRK005', 'Standard', 'CargoCo', 5, 5, 5);



