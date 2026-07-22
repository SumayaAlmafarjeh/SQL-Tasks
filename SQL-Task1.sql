USE SqlTasksOrange;
GO
CREATE TABLE customers(
	customerID INT PRIMARY KEY IDENTITY(1,1),
	customerNAME VARCHAR(50) NOT NULL,
	email VARCHAR(100) UNIQUE,
	phone VARCHAR(10),
	createdAT DATETIME DEFAULT GETDATE()
);

CREATE TABLE products(
	productID INT PRIMARY KEY IDENTITY(1,1),
	productName VARCHAR(100) NOT NULL,
	price DECIMAL(10,2) NOT NULL
);
CREATE TABLE employees(
	employeeID INT PRIMARY KEY IDENTITY(1,1),
	empName VARCHAR(50) NOT NULL,
	salary DECIMAL(10,2) NOT NULL
);
CREATE TABLE orders(
	orderID INT PRIMARY KEY IDENTITY(1,1),
	orderDate DATETIME DEFAULT GETDATE(),
	totalAmount DECIMAL(10,2),
	customerID INT NOT NULL,
	empID INT NOT NULL,
	FOREIGN KEY (customerID) REFERENCES customers(customerID),
	FOREIGN KEY (empID) REFERENCES employees(employeeID)
);

GO
INSERT INTO customers(customerName, email, phone) VALUES 
('sumaya emad', 'sm@gmail.com' , '0780000000'),
('lina maf', 'll@l.com' , '0790000000');

INSERT INTO products(productName , price) VALUES
('chocholate cake' , 12.50),
('orange cake', 10.20);

INSERT INTO employees(empName, salary) VALUES
('SAEED SAEEDEH' , 1400),
('RAFEED RA', 900);

INSERT INTO orders(totalAmount , customerID,empID) VALUES 
(22.70 , 1,1),
(10.20, 2, 2);
GO 

SELECT * FROM customers;
SELECT * FROM products;
SELECT * FROM employees;
SELECT * FROM orders;

