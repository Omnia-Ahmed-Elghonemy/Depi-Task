
CREATE DATABASE company2;
GO

USE company2;
GO


CREATE TABLE Department (
    DeptID INT PRIMARY KEY,
    DeptName NVARCHAR(50) NOT NULL UNIQUE,
    ManagerID INT UNIQUE  
);

CREATE TABLE Employee (
    EmpID INT PRIMARY KEY,
    Fname NVARCHAR(30) NOT NULL,
    Lname NVARCHAR(30) NOT NULL,
    Gender CHAR(1) CHECK (Gender IN ('M', 'F')),
    DOB DATE NOT NULL,
    Salary DECIMAL(10,2) DEFAULT 5000,
    DeptID INT NOT NULL
);

CREATE TABLE Project (
    ProjID INT PRIMARY KEY,
    ProjName NVARCHAR(100) NOT NULL UNIQUE,
    DeptID INT NOT NULL
);

CREATE TABLE EmployeeProject (
    EmpID INT,
    ProjID INT,
    PRIMARY KEY (EmpID, ProjID)
);

CREATE TABLE Dependent (
    DepID INT PRIMARY KEY,
    DepName NVARCHAR(50) NOT NULL,
    Gender CHAR(1) CHECK (Gender IN ('M', 'F')),
    EmpID INT NOT NULL
);


ALTER TABLE Employee
ADD CONSTRAINT FK_Emp_Dept FOREIGN KEY (DeptID)
REFERENCES Department(DeptID)
ON DELETE CASCADE;

ALTER TABLE Department
ADD CONSTRAINT FK_Dept_Manager FOREIGN KEY (ManagerID)
REFERENCES Employee(EmpID)
ON DELETE NO ACTION ;

ALTER TABLE Project
ADD CONSTRAINT FK_Proj_Dept FOREIGN KEY (DeptID)
REFERENCES Department(DeptID)
ON DELETE CASCADE;

ALTER TABLE EmployeeProject
ADD CONSTRAINT FK_EP_Emp FOREIGN KEY (EmpID)
REFERENCES Employee(EmpID)
ON DELETE CASCADE;

ALTER TABLE EmployeeProject
ADD CONSTRAINT FK_EP_Proj FOREIGN KEY (ProjID)
REFERENCES Project(ProjID)
ON DELETE NO ACTION;

ALTER TABLE Dependent
ADD CONSTRAINT FK_Dependent_Emp FOREIGN KEY (EmpID)
REFERENCES Employee(EmpID)
ON DELETE CASCADE;


INSERT INTO Department (DeptID, DeptName)
VALUES
(1, 'Software'),
(2, 'HR'),
(3, 'Marketing');

INSERT INTO Employee (EmpID, Fname, Lname, Gender, DOB, Salary, DeptID)
VALUES
(101, 'Mona', 'Kamal', 'F', '1995-06-20', 7200, 1),
(102, 'Youssef', 'Tarek', 'M', '1990-03-12', 6800, 1),
(103, 'Alaa', 'Hassan', 'F', '1988-09-05', 5500, 2),
(104, 'Nour', 'Adel', 'F', '1997-11-10', 4900, 3),
(105, 'Ahmed', 'Zaki', 'M', '1993-01-17', 6000, 3);

UPDATE Department SET ManagerID = 101 WHERE DeptID = 1;
UPDATE Department SET ManagerID = 103 WHERE DeptID = 2;
UPDATE Department SET ManagerID = 104 WHERE DeptID = 3;

INSERT INTO Project (ProjID, ProjName, DeptID)
VALUES
(201, 'Payroll System', 2),
(202, 'E-Commerce Website', 1),
(203, 'Ad Campaign 2025', 3),
(204, 'Recruitment Portal', 2);

INSERT INTO EmployeeProject (EmpID, ProjID)
VALUES
(101, 202),
(102, 202),
(103, 201),
(104, 203),
(105, 203),
(103, 204);

INSERT INTO Dependent (DepID, DepName, Gender, EmpID)
VALUES
(1, 'Lina', 'F', 101),
(2, 'Kareem', 'M', 101),
(3, 'Malak', 'F', 102),
(4, 'Tamer', 'M', 104);
