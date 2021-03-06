CREATE DATABASE [99Coffee]
GO
USE [99Coffee]
GO
/****** Object:  Table [dbo].[users]    Script Date: 10/08/2020 18:57:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NULL,
	[phone] [nvarchar](50) NULL,
	[adress] [nvarchar](max) NULL,
	[fullName] [nvarchar](50) NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[users] ([username], [password], [phone], [adress], [fullName]) VALUES (N'1', N'aaaaaaaa', N'aaaaaaaaaaa', N'vfdv', N'vfdvd')
INSERT [dbo].[users] ([username], [password], [phone], [adress], [fullName]) VALUES (N'2', N'2', N'2', N'2', N'2')
INSERT [dbo].[users] ([username], [password], [phone], [adress], [fullName]) VALUES (N'sa', N'sa', N'12345678', N'Ha Noi', N'Tran The Anh')
INSERT [dbo].[users] ([username], [password], [phone], [adress], [fullName]) VALUES (N'sa1', N'sa', N'12345678', N'Ha Noi', N'Tran The Anh')
INSERT [dbo].[users] ([username], [password], [phone], [adress], [fullName]) VALUES (N'Tvtvt', N'Crvrcrv', N'85882', NULL, N'Vrvrvrv')
/****** Object:  Table [dbo].[type]    Script Date: 10/08/2020 18:57:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[type](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_type] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[type] ON
INSERT [dbo].[type] ([id], [name]) VALUES (1, N'fdsf')
SET IDENTITY_INSERT [dbo].[type] OFF
/****** Object:  Table [dbo].[size]    Script Date: 10/08/2020 18:57:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[size](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nameSize] [nvarchar](50) NULL,
	[price] [money] NULL,
 CONSTRAINT [PK_size] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sales]    Script Date: 10/08/2020 18:57:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nameSales] [nvarchar](50) NULL,
	[dercipsion] [nvarchar](max) NULL,
	[codeSales] [nvarchar](50) NULL,
	[percent_sales] [int] NULL,
	[imgSrc] [nvarchar](max) NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_Sales] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[food_drink]    Script Date: 10/08/2020 18:57:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[food_drink](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[Id_type] [int] NULL,
	[price] [money] NULL,
	[promo_price] [money] NULL,
	[imgSrc] [nvarchar](max) NULL,
	[decripsion] [nvarchar](max) NULL,
 CONSTRAINT [PK_food_drink] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[billDetail]    Script Date: 10/08/2020 18:57:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[billDetail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_bill] [int] NULL,
	[id_food-drink] [int] NULL,
	[price] [money] NULL,
	[id_size] [int] NULL,
 CONSTRAINT [PK_billDetail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bill]    Script Date: 10/08/2020 18:57:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bill](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[price] [money] NULL,
	[dateBill] [datetime] NULL,
	[id_user] [int] NULL,
 CONSTRAINT [PK_bill] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
