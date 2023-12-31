USE [master]
GO
/****** Object:  Database [DDT]    Script Date: 12/4/2023 10:15:29 PM ******/
CREATE DATABASE [DDT]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DDT', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\DDT.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DDT_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\DDT_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [DDT] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DDT].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DDT] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DDT] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DDT] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DDT] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DDT] SET ARITHABORT OFF 
GO
ALTER DATABASE [DDT] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DDT] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DDT] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DDT] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DDT] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DDT] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DDT] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DDT] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DDT] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DDT] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DDT] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DDT] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DDT] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DDT] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DDT] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DDT] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DDT] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DDT] SET RECOVERY FULL 
GO
ALTER DATABASE [DDT] SET  MULTI_USER 
GO
ALTER DATABASE [DDT] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DDT] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DDT] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DDT] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DDT] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DDT] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DDT', N'ON'
GO
ALTER DATABASE [DDT] SET QUERY_STORE = OFF
GO
USE [DDT]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 12/4/2023 10:15:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Fullname] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Photo] [nvarchar](50) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Authorities]    Script Date: 12/4/2023 10:15:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authorities](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[RoleId] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 12/4/2023 10:15:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [char](4) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 12/4/2023 10:15:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Contents] [nvarchar](50) NULL,
	[Date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manufactures]    Script Date: 12/4/2023 10:15:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufactures](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[logo] [nvarchar](50) NOT NULL,
	[Banner] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 12/4/2023 10:15:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[OrderId] [bigint] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Price] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 12/4/2023 10:15:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](10) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Distribute]    Script Date: 12/4/2023 10:15:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Distribute](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Manu_id] [int] NOT NULL,
	[Product_id] [int] NOT NULL,
	[Product_image] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 12/4/2023 10:15:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Image] [nvarchar](50) NOT NULL,
	[Price] [int] NOT NULL,
	[CreateDate] [date] NOT NULL,
	[Available] [bit] NOT NULL,
	[CategoryId] [char](4) NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 12/4/2023 10:15:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [nvarchar](10) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo]) VALUES (N'Acc1', N'123', N'Nguyễn Văn Tèo', N'teonv@gmail.com', N'Photo.gif')
GO
SET IDENTITY_INSERT [dbo].[Authorities] ON 

INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (7113, N'Acc1', N'DIRE')
SET IDENTITY_INSERT [dbo].[Authorities] OFF
GO
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1000', N'Điện thoại SamSung')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1001', N'Điện thoại Apple')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1002', N'Laptop Apple')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1003', N'Điện thoại Xiaomi')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1004', N'Ipap Apple')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1005', N'Laptop HP')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1006', N'Laptop Asus')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1007', N'TV Toshiba')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1008', N'TV Panasonic')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1009', N'Tủ lạnh Toshiba')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1010', N'Nồi cơm điện Toshiba')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1011', N'TV LG')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1012', N'Máy lạnh LG')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1013', N'Máy giặt LG')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1014', N'Tủ lạnh LG')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1015', N'Nồi cơm điện Sharp')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1016', N'Tủ lạnh Sharp')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1017', N'TV Sharp')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1018', N'Máy giặt Sharp')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1019', N'Nồi cơm điện LockLock')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1020', N'Tủ lạnh Sony')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1021', N'Máy lạnh Sony')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1022', N'TV Sony')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1023', N'Máy giặt Sony')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1024', N'Máy lạnh Panasonic')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1025', N'Máy lạnh Toshiba')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1026', N'Máy lạnh Darkin')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1027', N'Nồi cơm điện Sunhouse')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1028', N'Điện thoại OppoReno')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1029', N'Nồi cơm điện Cuckoo')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1030', N'Máy nước uống nóng lạnh Kangaroo')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1031', N'Máy nước uống nóng lạnh Toshiba')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1032', N'Máy nước uống nóng lạnh Alaska')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1033', N'Máy nước uống nóng lạnh Sunhouse')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1034', N'Lò vi sóng Sunhouse')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1035', N'Lò vi sóng Sharp')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1036', N'Lò vi sóng Toshiba')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1037', N'Lò vi sóng Panasonic')
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1001, N'Điện Thoại SamSung Galaxy A20S', N'ss-20.jpg', 190000, CAST(N'1980-03-29' AS Date), 0, N'1000')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1002, N'Điện Thoại SamSung Note', N'ss-a20s.jpg', 190000, CAST(N'1982-12-18' AS Date), 0, N'1000')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1003, N'Điện Thoại Iphone 6', N'ip-6.jpg', 60000, CAST(N'1973-06-14' AS Date), 1, N'1001')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1004, N'Điện Thoại Iphone 7', N'ip-7.jpg', 80000, CAST(N'1976-03-10' AS Date), 0, N'1001')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1005, N'TV Toshiba', N'tv-tsb.jpeg', 210000, CAST(N'1978-12-06' AS Date), 1, N'1007')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1006, N'TV Panasonic', N'tv-pnsc.jpg', 250000, CAST(N'1981-09-03' AS Date), 0, N'1008')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1007, N'Laptop Apple', N'laptop-apple.webp', 300000, CAST(N'1983-03-13' AS Date), 0, N'1004')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1008, N'Laptop HP', N'laptop-hp.jpg', 400000, CAST(N'1972-02-26' AS Date), 0, N'1005')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1009, N'Laptop Asus', N'laptop-as.webp', 500000, CAST(N'1985-12-10' AS Date), 0, N'1006')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1010, N'Điện thoại Xiaomi', N'dt-xaomi.jpg', 310000, CAST(N'1994-03-23' AS Date), 0, N'1003')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1011, N'Điện Thoại SamSung Galaxy 20', N'ss-20.jpg', 210000, CAST(N'1985-11-28' AS Date), 0, N'1000')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1012, N'Điện Thoại Iphone 8', N'ip-7.jpg', 380000, CAST(N'1988-08-27' AS Date), 1, N'1001')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1013, N'Tủ lạnh Sony', N'tl.jpg', 260000, CAST(N'2002-07-01' AS Date), 0, N'1020')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1014, N'Tủ lạnh Panasonic', N'tl-2.jpg', 350000, CAST(N'2002-06-24' AS Date), 1, N'1020')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1015, N'Tủ lạnh Toshiba', N'tl.jpg', 450000, CAST(N'1991-05-04' AS Date), 0, N'1009')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1016, N'Máy giặt SamSung', N'ss-a20s.jpg', 400000, CAST(N'1996-11-09' AS Date), 0, N'1000')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1017, N'Máy giặt Panasonic', N'mg.webp', 360000, CAST(N'2007-12-15' AS Date), 1, N'1008')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1018, N'Nồi cơm điện Toshiba', N'ncd.jpeg', 650000, CAST(N'2011-04-13' AS Date), 1, N'1010')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1019, N'TV LG', N'tv-ss.jpg', 780000, CAST(N'2005-02-02' AS Date), 0, N'1011')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1020, N'Máy lạnh LG', N'ml.jpg', 810000, CAST(N'2007-11-01' AS Date), 0, N'1012')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1021, N'Máy giặt LG', N'mg.webp', 100000, CAST(N'2010-07-29' AS Date), 0, N'1013')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1022, N'Tủ lạnh LG', N'tl-2.jpg', 210000, CAST(N'2008-12-01' AS Date), 1, N'1014')
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (N'CUST', N'Customers')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (N'DIRE', N'Directors')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (N'STAF', N'Staffs')
GO
ALTER TABLE [dbo].[Accounts] ADD  CONSTRAINT [DF_Customers_Photo]  DEFAULT (N'Photo.gif') FOR [Photo]
GO
ALTER TABLE [dbo].[OrderDetails] ADD  CONSTRAINT [DF_Order_Details_UnitPrice]  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[OrderDetails] ADD  CONSTRAINT [DF_Order_Details_Quantity]  DEFAULT ((1)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_OrderDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_Image]  DEFAULT (N'Product.gif') FOR [Image]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_UnitPrice]  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_ProductDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_Available]  DEFAULT ((1)) FOR [Available]
GO
ALTER TABLE [dbo].[Authorities]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Authorities] CHECK CONSTRAINT [FK_UserRoles_Roles]
GO
ALTER TABLE [dbo].[Authorities]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Users] FOREIGN KEY([Username])
REFERENCES [dbo].[Accounts] ([Username])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Authorities] CHECK CONSTRAINT [FK_UserRoles_Users]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [fk_Accounts_Comments] FOREIGN KEY([Username])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [fk_Accounts_Comments]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([Username])
REFERENCES [dbo].[Accounts] ([Username])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customers]
GO
ALTER TABLE [dbo].[Product_Distribute]  WITH CHECK ADD  CONSTRAINT [fk_Product_Distribute_Manu] FOREIGN KEY([Manu_id])
REFERENCES [dbo].[Manufactures] ([id])
GO
ALTER TABLE [dbo].[Product_Distribute] CHECK CONSTRAINT [fk_Product_Distribute_Manu]
GO
ALTER TABLE [dbo].[Product_Distribute]  WITH CHECK ADD  CONSTRAINT [fk_Product_Distribute_Product] FOREIGN KEY([Product_id])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[Product_Distribute] CHECK CONSTRAINT [fk_Product_Distribute_Product]
GO
/****** Object:  StoredProcedure [dbo].[GetRevenueByMonth]    Script Date: 12/4/2023 10:15:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetRevenueByMonth]
    @Year INT
AS
BEGIN
    SELECT 
        MonthNumber AS Thang,
        ISNULL(SUM(COALESCE(od.[Price] * od.[Quantity], 0)), 0) AS DoanhThu
    FROM 
        (
            SELECT 
                MonthNumber
            FROM 
                (VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10), (11), (12)) AS MonthsReference(MonthNumber)
        ) m
    LEFT JOIN 
        Orders o ON m.MonthNumber = MONTH(o.CreateDate) AND YEAR(o.CreateDate) = @Year
    LEFT JOIN 
        OrderDetails od ON o.Id = od.OrderId
    GROUP BY 
        m.MonthNumber
    ORDER BY 
        m.MonthNumber;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetTop10BestSellingProducts]    Script Date: 12/4/2023 10:15:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetTop10BestSellingProducts]
AS
BEGIN
    SELECT TOP 10
        p.Id AS ProductId,
        p.Name AS ProductName,
        p.Image AS ProductImage,
		p.CreateDate AS CreateDate,
        p.Price AS ProductPrice,
        SUM(od.Quantity) AS TotalQuantitySold
    FROM
        OrderDetails od
    INNER JOIN
        Products p ON od.ProductId = p.Id
    GROUP BY
        p.Id, p.Name, p.Image, p.Price, p.CreateDate
    ORDER BY
        TotalQuantitySold DESC;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetTop10LeastSellingProducts]    Script Date: 12/4/2023 10:15:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetTop10LeastSellingProducts]
AS
BEGIN
    SELECT TOP 10
        p.Id AS ProductId,
        p.Name AS ProductName,
        p.Image AS ProductImage,
		p.CreateDate AS CreateDate,
        p.Price AS ProductPrice,
        ISNULL(SUM(od.Quantity), 0) AS TotalQuantitySold
    FROM
        Products p
    LEFT JOIN
        OrderDetails od ON p.Id = od.ProductId
    GROUP BY
        p.Id, p.Name, p.Image, p.Price, p.CreateDate
    ORDER BY
        TotalQuantitySold ASC; -- Sắp xếp tăng dần để lấy top 10 ít bán chạy nhất
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_thongKeDoanhThu]    Script Date: 12/4/2023 10:15:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_thongKeDoanhThu]
    @Nam INT
AS
BEGIN
    DECLARE @Month INT = 1;

    -- Tạo bảng tạm để lưu kết quả
    CREATE TABLE #TempResult (Thang INT, DoanhThu VARCHAR(20));

    WHILE @Month <= 12
    BEGIN
        INSERT INTO #TempResult (Thang, DoanhThu)
        SELECT 
            @Month AS Thang,
            CASE 
                WHEN COALESCE(SUM(od.[Price] * od.[Quantity]), 0) = 0 THEN '0'
                ELSE CAST(COALESCE(SUM(od.[Price] * od.[Quantity]), 0) AS VARCHAR(20))
            END AS DoanhThu
        FROM 
            [OrderDetails] od
        INNER JOIN 
            [Orders] o ON od.[OrderId] = o.[Id]
        WHERE 
             MONTH(o.[CreateDate]) = @Month;

        SET @Month = @Month + 1;
    END

    -- Trả về kết quả từ bảng tạm
    SELECT * FROM #TempResult;

    -- Xóa bảng tạm
    DROP TABLE #TempResult;
END;
GO
/****** Object:  StoredProcedure [dbo].[usp_ThongKeDoanhThuTheoThangNam]    Script Date: 12/4/2023 10:15:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_ThongKeDoanhThuTheoThangNam]
    @Nam INT
AS
BEGIN
    DECLARE @Month INT = 1;

    -- Tạo bảng tạm để lưu kết quả
    CREATE TABLE #TempResult (Thang INT, Nam INT, DoanhThu DECIMAL(18, 2));

    WHILE @Month <= 12
    BEGIN
        INSERT INTO #TempResult (Thang, Nam, DoanhThu)
        SELECT 
            @Month AS Thang,
            @Nam AS Nam,
            SUM(od.[Price] * od.[Quantity]) AS DoanhThu
        FROM 
            [OrderDetails] od
        INNER JOIN 
            [Orders] o ON od.[OrderId] = o.[Id]
        WHERE 
            YEAR(o.[CreateDate]) = @Nam
            AND MONTH(o.[CreateDate]) = @Month;

        SET @Month = @Month + 1;
    END

    -- Trả về kết quả từ bảng tạm
    SELECT * FROM #TempResult;

    -- Xóa bảng tạm
    DROP TABLE #TempResult;
END;
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã khách hàng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts', @level2type=N'COLUMN',@level2name=N'Username'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mật khẩu đăng nhập' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts', @level2type=N'COLUMN',@level2name=N'Password'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Họ và tên' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts', @level2type=N'COLUMN',@level2name=N'Fullname'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Email' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts', @level2type=N'COLUMN',@level2name=N'Email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Hình ảnh' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts', @level2type=N'COLUMN',@level2name=N'Photo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã loại' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Categories', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tên tiếng Việt' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Categories', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã chi tiết' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderDetails', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã hóa đơn' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderDetails', @level2type=N'COLUMN',@level2name=N'OrderId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã hàng hóa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderDetails', @level2type=N'COLUMN',@level2name=N'ProductId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Đơn giá bán' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderDetails', @level2type=N'COLUMN',@level2name=N'Price'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Số lượng mua' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderDetails', @level2type=N'COLUMN',@level2name=N'Quantity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã hóa đơn' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã khách hàng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'Username'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ngày đặt hàng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Địa chỉ nhận' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'Address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã hàng hóa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tên hàng hóa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Hình ảnh' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Image'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Đơn giá' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Price'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ngày sản xuất' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Đang kinh doanh ?' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Available'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã loại, FK' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'CategoryId'
GO
USE [master]
GO
ALTER DATABASE [DDT] SET  READ_WRITE 
GO
