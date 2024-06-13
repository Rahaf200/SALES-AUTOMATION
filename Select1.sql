SELECT CONVERT(VARCHAR(7), o.Order_date, 120) AS Month,
       o.ID AS Order_number,
       SUM(oi.Total_Price) AS Order_amount
FROM tbl_Order o
JOIN tbl_OrderItem oi ON o.ID = oi.Order_id
JOIN tbl_Product p ON oi.Product_ID = p.ID
JOIN tbl_Customer c ON o.Customer_id = c.ID
WHERE p.Name = 'Product A'
  AND EXISTS (
    SELECT 1
    FROM tbl_OrderItem oi2
    JOIN tbl_Product p2 ON oi2.Product_ID = p2.ID
    WHERE oi2.Order_id = o.ID
      AND p2.Name = 'Product B'
  )
  AND YEAR(o.Order_date) = YEAR(DATEADD(YEAR, -1, GETDATE()))
  AND MONTH(o.Order_date) = MONTH(GETDATE())
GROUP BY CONVERT(VARCHAR(7), o.Order_date, 120), o.ID;