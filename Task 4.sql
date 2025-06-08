CREATE DATABASE CUSTOMERS;

USE CUSTOMERS;


SELECT * FROM customers.cust_data;

SELECT * FROM cust_data
WHERE Country = 'United Kingdom';

SELECT * 
FROM cust_data
WHERE CustomerID = 17850;

SELECT * 
FROM cust_data
WHERE Quantity > 5;

SELECT Description, SUM(Quantity) AS Total_Quantity
FROM cust_data
GROUP BY Description;


SELECT 
  A.InvoiceNo,
  A.CustomerID,
  A.Description AS Product_A,
  B.Description AS Product_B
FROM cust_data A
INNER JOIN cust_data B
  ON A.InvoiceNo = B.InvoiceNo
  AND A.StockCode < B.StockCode
WHERE A.CustomerID IS NOT NULL;


SELECT 
  A.InvoiceNo,
  A.Description AS Product_A,
  B.Description AS Product_B
FROM cust_data A
LEFT JOIN cust_data B
  ON A.InvoiceNo = B.InvoiceNo
  AND A.StockCode < B.StockCode;


SELECT 
  A.Description AS Product_A,
  B.Description AS Product_B,
  B.InvoiceNo
FROM cust_data A
RIGHT JOIN cust_data B
  ON A.InvoiceNo = B.InvoiceNo
  AND A.StockCode < B.StockCode;


SELECT InvoiceNo, CustomerID, Quantity, UnitPrice
FROM cust_data
WHERE CustomerID IN (
  SELECT CustomerID
  FROM cust_data
  GROUP BY CustomerID
  HAVING SUM(Quantity * UnitPrice) > 20
);


SELECT SUM(Quantity) AS Total_Quantity_Sold
FROM cust_data;


SELECT AVG(UnitPrice) AS Average_Price
FROM cust_data;


CREATE VIEW view_product_sales AS
SELECT 
  StockCode,
  Description,
  SUM(Quantity) AS TotalQuantitySold,
  SUM(Quantity * UnitPrice) AS TotalRevenue
FROM cust_data
GROUP BY StockCode, Description;

