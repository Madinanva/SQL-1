--Task--
Create Database TourismCompany
Use TourismCompany
Create Table Employees
(
	Id int identity constraint PK_Emp_ID primary key,
	Name nvarchar (100) Not Null,
	Surname nvarchar (100) Not Null,
	Position nvarchar (100) Not Null,
	Salary money Not Null
)
Insert Into Employees(Name, Surname, Position, Salary)
Values
('Madina','Novruzova','Manager', 3500),
('Leyla','Qadimaliyeva','Assistant', 1800),
('Murad','Zeynalov','Coordinator', 2200)

Select Avg(Salary) From Employees
Select * From Employees Where Salary >(Select Avg(Salary) from Employees)
Select Min(Salary) From Employees
Select Max(Salary) From Employees

--Task2--
Create Database Market
Use Market
Create Table Products
(
	Id int identity constraint PK_Prd_ID primary key,
	Name nvarchar (100) Not Null,
	Price money Not Null
)
Alter Table Products Add Brand nvarchar(100) 
Insert Into Products(Name, Price, Brand)
Values
  ('Su',0.50,'Sirab'),
  ('Ayran',0.90,'Atena'),
  ('Yag',5.65,'President'),
  ('Yogurt',1.50,'Rastishka'),
  ('Sokolad',1.90,'Milka'),
  ('Cay',11.70,'Beta'),
  ('Seker',1.80,'Azerseker'),
  ('Kofe',11.20,'Nescafe'),
  ('Baliq',9.39,'Dardanel'),
  ('Duyu',8.50,'Tamasa')
  Select * From Products Where Price < (Select Avg(Price) from Products)
  Select * From Products Where Price > 10
  Select Name + Brand as ProductInfo  From Products Where Len(Brand) > 5

  --Task3--
  Create Database OneDepartmentsManyEmployees
  Use OneDepartmentsManyEmployees
  Create Table Departments
  (
	Id int identity constraint PK_Dpr_ID primary key,
	Name nvarchar (100) Not Null Constraint CK_Dpr_Name Check(Len(Name)>2)
  )
 Create Table Employees
  (
	Id int identity constraint PK_Emp_ID primary key,
	FullName nvarchar(100) Not Null Constraint CK_Emp_Name Check(Len(FullName)>3),
	Salary money Check(Salary>0),
	Email nvarchar(100) Not Null Unique,
	DepartmentId int Not Null Constraint FK_Emp_DprID Foreign Key References Departments(Id)
  )