-- Create Customers Table
CREATE TABLE Customers (
CustomerID INT PRIMARY KEY,
FullName VARCHAR(100),
Email VARCHAR(100),
PhoneNumber VARCHAR(20),
City VARCHAR(50),
PurchaseAmount DECIMAL(10,2)
);

-- Insert Messy Data
INSERT INTO Customers VALUES
(1, 'John Doe', 'john.doe@gmail.com', '9876543210', 'Chennai', 5000),
(2, 'Jane Smith', 'jane.smith@gmail.com', '9784512369', 'Chennai', 7500),
(3, 'John Doe', 'john.doe@gmail.com', '9876543210', 'Chennai', 5000), -- Duplicate
(4, 'Anand Raj', 'anand@gmail.com', NULL, 'Bangalore', 3000),
(5, 'Priya Varma', 'priya@gmail.com', '9988776655', NULL, 4000),
(6, 'Vinoth', 'vinoth@gmail.com', '', 'Hyderabad', 4500),
(7, 'Sara', NULL, '9785452155', 'Delhi', 6000),
(8, 'Ramesh', 'ramesh@gmail.com', '9854632145', 'Chennai', NULL);

-- Remove Duplicate Customers
DELETE FROM Customers
WHERE CustomerID NOT IN (
SELECT MIN(CustomerID)
FROM Customers
GROUP BY FullName, Email, PhoneNumber, City, PurchaseAmount
);

-- Clean Blank Phone Numbers
UPDATE Customers
SET PhoneNumber = 'Not Available'
WHERE PhoneNumber IS NULL OR PhoneNumber = '';

-- Clean Null Cities
UPDATE Customers
SET City = 'Unknown'
WHERE City IS NULL;

-- Clean Null Purchase Amounts
UPDATE Customers
SET PurchaseAmount = 0
WHERE PurchaseAmount IS NULL;

-- View Cleaned Data
SELECT * FROM Customers;

-- Total Purchase Amount
SELECT SUM(PurchaseAmount) AS TotalSales FROM Customers;

-- Average Purchase Amount
SELECT AVG(PurchaseAmount) AS AverageSales FROM Customers;

-- Customers from Chennai
SELECT * FROM Customers WHERE City = 'Chennai';

-- Top Purchaser
SELECT FullName, MAX(PurchaseAmount) AS MaxPurchase FROM Customers;
