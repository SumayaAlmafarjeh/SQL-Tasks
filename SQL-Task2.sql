USE companyDB;
GO 


CREATE TABLE departments(
	departmentID INT PRIMARY KEY IDENTITY(1,1),
	departmentName VARCHAR(50) NOT NULL UNIQUE
);
CREATE TABLE employees (
	employeeID INT PRIMARY KEY IDENTITY(1,1),
	name VARCHAR(70)  NOT NULL,
	birthdate DATETIME NOT NULL,
	phone VARCHAR(10) NOT NULL,
	nationalID VARCHAR(10) NOT NULL UNIQUE,
	nationality VARCHAR(50) NOT NULL,
	maritalStatus VARCHAR(10) NOT NULL,
	personalPic VARCHAR(500) NOT NULL,
	entryDate DATETIME NOT NULL,
	password VARCHAR(100) NOT NULL,
	isManager BIT DEFAULT 0,
	departmentNum INT,
	FOREIGN KEY (departmentNum) REFERENCES departments(departmentID)
);


CREATE TABLE tasks(
	taskID INT PRIMARY KEY IDENTITY(1,1),
	taskTitle VARCHAR(100) NOT NULL,
	startDate DATETIME NOT NULL,
	dueDate DATETIME NOT NULL,
	taskDesc VARCHAR(1500) NOT NULL,
	importanceLevel VARCHAR(2) NOT NULL,
	empID INT,
	FOREIGN KEY (empID) REFERENCES employees(employeeID)

);

CREATE TABLE feedback(
	feedbackID INT PRIMARY KEY IDENTITY(1,1),
	feedbackTitle VARCHAR(100),
	feedbackDesc VARCHAR(1500)
);