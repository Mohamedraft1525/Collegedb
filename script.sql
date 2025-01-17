USE [CarRent]
GO
/****** Object:  Table [dbo].[Car]    Script Date: 6/8/2020 8:05:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Car](
	[CarType] [nvarchar](50) NOT NULL,
	[CarId] [int] NOT NULL,
	[Model] [nvarchar](50) NOT NULL,
	[Color] [nchar](10) NOT NULL,
	[Productionyear] [nchar](10) NOT NULL,
	[EngineSize] [int] NOT NULL,
	[LastService] [datetime] NULL,
 CONSTRAINT [PK_Car] PRIMARY KEY CLUSTERED 
(
	[CarType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[carcarer]    Script Date: 6/8/2020 8:05:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[carcarer](
	[Employee] [nvarchar](50) NOT NULL,
	[CarId] [nchar](10) NOT NULL,
 CONSTRAINT [PK_carcarer] PRIMARY KEY CLUSTERED 
(
	[Employee] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 6/8/2020 8:05:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerName] [nvarchar](50) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[PhoneNumber] [int] NOT NULL,
	[Address] [nvarchar](max) NULL,
	[created] [datetime] NOT NULL,
	[updated] [datetime] NOT NULL,
	[Email] [varchar](50) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[employee]    Script Date: 6/8/2020 8:05:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employee](
	[EmployeeName] [nvarchar](50) NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[HiringDate] [datetime] NOT NULL,
	[DateOfBirth] [datetime] NOT NULL,
	[Address] [nvarchar](max) NULL,
	[Salary] [int] NOT NULL,
	[Recommendations] [nvarchar](50) NULL,
 CONSTRAINT [PK_employee] PRIMARY KEY CLUSTERED 
(
	[EmployeeName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rental]    Script Date: 6/8/2020 8:05:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rental](
	[Name] [nvarchar](50) NOT NULL,
	[Id] [int] NOT NULL,
	[created] [datetime] NOT NULL,
	[CarId] [int] NOT NULL,
	[RentBegin] [datetime] NOT NULL,
	[RentEnd] [datetime] NOT NULL,
	[cost] [int] NOT NULL,
 CONSTRAINT [PK_rental] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SpecialCustomer]    Script Date: 6/8/2020 8:05:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SpecialCustomer](
	[Name] [nvarchar](50) NOT NULL,
	[Id] [int] NOT NULL,
	[PhoneNumber] [int] NOT NULL,
	[Email] [nvarchar](50) NULL,
	[FavouriteCars] [nvarchar](50) NOT NULL,
	[FiristDeal] [datetime] NOT NULL,
	[LastDeal] [datetime] NOT NULL,
 CONSTRAINT [PK_SpecialCustomer] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Car]  WITH CHECK ADD  CONSTRAINT [FK_Car_carcarer] FOREIGN KEY([CarType])
REFERENCES [dbo].[carcarer] ([Employee])
GO
ALTER TABLE [dbo].[Car] CHECK CONSTRAINT [FK_Car_carcarer]
GO
ALTER TABLE [dbo].[Car]  WITH CHECK ADD  CONSTRAINT [FK_Car_SpecialCustomer] FOREIGN KEY([CarType])
REFERENCES [dbo].[SpecialCustomer] ([Name])
GO
ALTER TABLE [dbo].[Car] CHECK CONSTRAINT [FK_Car_SpecialCustomer]
GO
ALTER TABLE [dbo].[carcarer]  WITH CHECK ADD  CONSTRAINT [FK_carcarer_employee] FOREIGN KEY([Employee])
REFERENCES [dbo].[employee] ([EmployeeName])
GO
ALTER TABLE [dbo].[carcarer] CHECK CONSTRAINT [FK_carcarer_employee]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_SpecialCustomer] FOREIGN KEY([CustomerName])
REFERENCES [dbo].[SpecialCustomer] ([Name])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_SpecialCustomer]
GO
ALTER TABLE [dbo].[employee]  WITH CHECK ADD  CONSTRAINT [FK_employee_rental] FOREIGN KEY([EmployeeName])
REFERENCES [dbo].[rental] ([Name])
GO
ALTER TABLE [dbo].[employee] CHECK CONSTRAINT [FK_employee_rental]
GO
ALTER TABLE [dbo].[rental]  WITH CHECK ADD  CONSTRAINT [FK_rental_Car] FOREIGN KEY([Name])
REFERENCES [dbo].[Car] ([CarType])
GO
ALTER TABLE [dbo].[rental] CHECK CONSTRAINT [FK_rental_Car]
GO
ALTER TABLE [dbo].[rental]  WITH CHECK ADD  CONSTRAINT [FK_rental_Customer] FOREIGN KEY([Name])
REFERENCES [dbo].[Customer] ([CustomerName])
GO
ALTER TABLE [dbo].[rental] CHECK CONSTRAINT [FK_rental_Customer]
GO

Select name 
Carcount = (select count(0.id) from [cars] 0 where 0.customerid = c.id)
From customer c 

Select car name 
From  car
Where id in (select car
From rental 
Where car is 

Select engine size 
From car 
Where id in (select car 
From car 
Where car > 1600cc)

Select count(id)
From customer 

Select sum (totalamount)
From [rental]
Where year(orderdate)=2019

Select name, id, created, phone number
From [rental] join customer
On[rental].customer id = customer.id

Select id 
From [rental] join cars
On [rental].car id = cars.id
Select color
From[rental] join cars 
On [rental].car color = car.color
Insert into customer (name, id, phone number)
Insert into employee table (name, id, phone number, hiring date, salary…)
Insert into car table (model, production year, last service, color,id)
Insert into car carer table (name, id)
Insert into rental table (name, id, created, rent begin, rent end, cost)

1.	Update car
2.	Set is Discontinue=1
1.	Update car
Set is Discontinue=1
Where unit engine size>1500cc
Update employee 
Set is Discontinue=1
Where id =911 
Update customer
Set phone number= ……. 
Where id = 58 
Update car carer 
Set car id 
Where id of employee =12
Delete customer
Where id = 65
Delete car 
Where unit engine size > 1600cc
Delete employees 
Where unit salary > 2000 LE
Delete special customer 
Delete car
Where unit production year < 2010 








