USE [master]
GO
CREATE DATABASE [DDT]

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
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Fullname] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Photo] [nvarchar](50),
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
CREATE TABLE Comments(
id [int] IDENTITY(1,1) NOT NULL  primary key,
[Username] [nvarchar](50) not null,
Contents [nvarchar](50),
Date [datetime],
 constraint fk_Accounts_Comments
	Foreign key ([Username]) references [Accounts](Username)
)
GO
/****** Object:  Table [dbo].[Authorities]    Script Date: 4/12/2021 3:07:02 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Categories]    Script Date: 4/12/2021 3:07:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [char](4) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE TABLE Manufactures(
id [int] IDENTITY(1,1) NOT NULL  primary key,
	[Name] [nvarchar](50) NOT NULL,
	[logo] [nvarchar](50) NOT NULL,
	[Banner] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](50) NOT NULL
)
GO

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 4/12/2021 3:07:02 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 4/12/2021 3:07:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Phone][nvarchar](10)not null,
	[CreateDate] [datetime] NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 4/12/2021 3:07:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 4/12/2021 3:07:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE Product_Distribute(
id [int] IDENTITY(1,1) NOT NULL  primary key,
Manu_id int not null,
Product_id int not null,
    constraint fk_Product_Distribute_Manu
	Foreign key (Manu_id) references Manufactures(id),
	constraint fk_Product_Distribute_Product
	Foreign key(Product_id) references Products(id),
	[Product_image] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](50) NOT NULL
)
GO
CREATE TABLE [dbo].[Roles](
	[Id] [nvarchar](10) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo]) VALUES (N'khanh', N'123', N'Duy Khánh', N'lap@gmail.com', N'user.png')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo]) VALUES (N'duong', N'123', N'Hải Dương', N'duong@gmail.com', N'user.png')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo]) VALUES (N'tu', N'123', N'Đăng Tú', N'tu@gmail.com', N'user.png')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo]) VALUES (N'thien', N'123', N'Thiên', N'thien@gmail.com', N'user.png')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo]) VALUES (N'duy', N'123', N'Văn Duy', N'duy@gmail.com', N'user.png')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo]) VALUES (N'teo', N'132', N'Nguyễn Văn Tèo', N'teo@gmail.com', N'user.png')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo]) VALUES (N'tuong', N'132', N'Thanh Tường', N'tuong@gmail.com', N'user.png')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo]) VALUES (N'quan', N'123', N'Thái Thiên Quân', N'quan@gmail.com', N'-1407968806.jpg')

SET IDENTITY_INSERT [dbo].[Authorities] ON 
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (N'CUST', N'Customers')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (N'DIRE', N'Directors')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (N'STAF', N'Staffs')

INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (2, N'khanh', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (3, N'duong', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (4, N'tu', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (5, N'thien', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (6, N'teo', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (80, N'duy', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (98, N'quan', N'DIRE')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (100, N'tuong', N'STAF')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (2103, N'quan', N'STAF')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (7103, N'tuong', N'CUST')
SET IDENTITY_INSERT [dbo].[Authorities] OFF

INSERT [dbo].[Brands] ([BrandName]) VALUES (N'SamSung')
INSERT [dbo].[Brands] ([BrandName]) VALUES (N'Apple')
INSERT [dbo].[Brands] ([BrandName]) VALUES (N'Xiaomi')
INSERT [dbo].[Brands] ([BrandName]) VALUES (N'Toshiba')
INSERT [dbo].[Brands] ([BrandName]) VALUES (N'HP')
INSERT [dbo].[Brands] ([BrandName]) VALUES (N'Lenovo')
INSERT [dbo].[Brands] ([BrandName]) VALUES (N'Dell')
INSERT [dbo].[Brands] ([BrandName]) VALUES (N'Asus')
INSERT [dbo].[Brands] ([BrandName]) VALUES (N'LG')
INSERT [dbo].[Brands] ([BrandName]) VALUES (N'Sony')
INSERT [dbo].[Brands] ([BrandName]) VALUES (N'Panasonic')
INSERT [dbo].[Brands] ([BrandName]) VALUES (N'Daikin')
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 


GO

SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
SET IDENTITY_INSERT [dbo].[Orders] ON 

SET IDENTITY_INSERT [dbo].[Orders] OFF

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
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1001, N'Điện Thoại SamSung Galaxy A20S', N'1.jpg', 19, CAST(0xD6070B00 AS Date), 0, N'1000')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1002, N'Điện Thoại SamSung Note', N'2.jpg', 19, CAST(0xB80B0B00 AS Date), 0, N'1000')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1003, N'Điện Thoại Iphone 6', N'3.jpg', 6, CAST(0x26FE0A00 AS Date), 1, N'1001')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1004, N'Điện Thoại Iphone 7', N'4.jpg', 8, CAST(0x0E020B00 AS Date), 0, N'1001')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1005, N'TV Toshiba', N'5.jpg', 21, CAST(0xF7050B00 AS Date), 1, N'1007')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1006, N'TV Panasonic', N'6.jpg', 25, CAST(0xE1090B00 AS Date), 0, N'1008')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1007, N'Laptop Apple', N'7.jpg', 30, CAST(0x0D0C0B00 AS Date), 0, N'1004')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1008, N'Laptop HP', N'8.jpg', 40, CAST(0x4CFC0A00 AS Date), 0, N'1005')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1009, N'Laptop Asus', N'9.jpg', 50, CAST(0xF80F0B00 AS Date), 0, N'1006')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1010, N'Điện thoại Xiaomi', N'10.jpg', 31, CAST(0xC91B0B00 AS Date), 0, N'1003')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1011, N'Điện Thoại SamSung Galaxy 20', N'11.jpg', 21, CAST(0xEC0F0B00 AS Date), 0, N'1000')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1012, N'Điện Thoại Iphone 8', N'12.jpg', 38, CAST(0xD7130B00 AS Date), 1, N'1001')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1013, N'Tủ lạnh Sony', N'13.jpg', 26, CAST(0x97270B00 AS Date), 0, N'1020')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1014, N'Tủ lạnh Panasonic', N'14.jpg', 35, CAST(0x90270B00 AS Date), 1, N'1020')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1015, N'Tủ lạnh Toshiba', N'15.jpg', 45, CAST(0xAB170B00 AS Date), 0, N'1009')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1016, N'Máy giặt SamSung', N'16.jpg', 40, CAST(0x8B1F0B00 AS Date), 0, N'1000')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1017, N'Máy giặt Panasonic', N'17.jpg', 36, CAST(0x602F0B00 AS Date), 1, N'1008')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1018, N'Nồi cơm điện Toshiba', N'18.jpg', 65, CAST(0x1F340B00 AS Date), 1, N'1010')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1019, N'TV LG', N'19.jpg', 78, CAST(0x4A2B0B00 AS Date), 0, N'1011')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1020, N'Máy lạnh LG', N'20.jpg', 81, CAST(0x342F0B00 AS Date), 0, N'1012')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1021, N'Máy giặt LG', N'21.jpg', 10, CAST(0x1D330B00 AS Date), 0, N'1013')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1022, N'Tủ lạnh LG', N'22.jpg', 21, CAST(0xC0300B00 AS Date), 1, N'1014')

SET IDENTITY_INSERT [dbo].[Products] OFF

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
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK3ess0s7i9qs6sim1pf9kxhkpq] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK3ess0s7i9qs6sim1pf9kxhkpq]


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
GO
select * from Accounts;
select * from Roles;
select * from Authorities;
select * from Orders;
select * from OrderDetails;
select * from Products;
select * from Categories;
select * from Brands
delete Products
go
