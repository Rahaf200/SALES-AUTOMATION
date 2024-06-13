SELECT c.First_name + ' ' + c.Last_name AS Customer_Name,
	   COUNT(c.ID) AS Customers_number, 
	   ct.Name AS City, 
	   AVG(c.Defined_risk_limit) AS Avg_risk_limit
FROM tbl_Customer c 
JOIN tbl_Address a ON c.ID = a.Customer_ID 
JOIN tbl_City ct ON a.City_ID = ct.ID
WHERE c.ID NOT IN ( 
	SELECT DISTINCT  o.Customer_id 
	FROM tbl_Order o 
	JOIN tbl_Warehouse w ON o.Warehouse_id = w.ID
	WHERE MONTH(o.Order_date) = MONTH(GETDATE()) - 1  
	  AND YEAR(o.Order_date) = YEAR(GETDATE()) - 1 
)
GROUP BY ct.Name, c.First_name, c.Last_name;

