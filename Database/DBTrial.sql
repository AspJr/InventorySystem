USE [DBTrial]
GO
/****** Object:  Table [dbo].[Job]    Script Date: 04/01/2024 07.27.43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Job](
	[ClientID] [varchar](50) NULL,
	[Volume] [float] NULL,
	[CreatedDate] [date] NULL,
	[JobType] [nchar](1) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobType]    Script Date: 04/01/2024 07.27.43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobType](
	[Code] [nchar](1) NULL,
	[Description] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 04/01/2024 07.27.43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](250) NULL,
	[Qty] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductImage]    Script Date: 04/01/2024 07.27.43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductImage](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Filename] [varchar](max) NULL,
	[ProductID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
 CONSTRAINT [PK_ProductImage] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Job] ([ClientID], [Volume], [CreatedDate], [JobType]) VALUES (N'VANGUARD', 0.89, CAST(N'2020-10-29' AS Date), N'C')
INSERT [dbo].[Job] ([ClientID], [Volume], [CreatedDate], [JobType]) VALUES (N'DSV', 1.32, CAST(N'2020-09-15' AS Date), N'C')
INSERT [dbo].[Job] ([ClientID], [Volume], [CreatedDate], [JobType]) VALUES (N'HSC', 77.77, CAST(N'2020-09-15' AS Date), N'I')
INSERT [dbo].[Job] ([ClientID], [Volume], [CreatedDate], [JobType]) VALUES (N'STEADFAST', 21.4, CAST(N'2020-09-16' AS Date), N'C')
INSERT [dbo].[Job] ([ClientID], [Volume], [CreatedDate], [JobType]) VALUES (N'ACEOIL', 12321, CAST(N'2020-09-16' AS Date), N'C')
INSERT [dbo].[Job] ([ClientID], [Volume], [CreatedDate], [JobType]) VALUES (N'A.HARTRO', 1, CAST(N'2020-09-16' AS Date), N'C')
INSERT [dbo].[Job] ([ClientID], [Volume], [CreatedDate], [JobType]) VALUES (N'A.HARTRO', 1, CAST(N'2020-09-17' AS Date), N'C')
INSERT [dbo].[Job] ([ClientID], [Volume], [CreatedDate], [JobType]) VALUES (N'STARCONC', 2, CAST(N'2020-09-18' AS Date), N'C')
INSERT [dbo].[Job] ([ClientID], [Volume], [CreatedDate], [JobType]) VALUES (N'VANGUARD', 4.8, CAST(N'2020-09-22' AS Date), N'I')
INSERT [dbo].[Job] ([ClientID], [Volume], [CreatedDate], [JobType]) VALUES (N'AGILITY', 1, CAST(N'2020-09-22' AS Date), N'C')
INSERT [dbo].[Job] ([ClientID], [Volume], [CreatedDate], [JobType]) VALUES (N'ALTRON', 1, CAST(N'2020-09-22' AS Date), N'C')
INSERT [dbo].[Job] ([ClientID], [Volume], [CreatedDate], [JobType]) VALUES (N'AGILITY', 1, CAST(N'2020-09-23' AS Date), N'C')
INSERT [dbo].[Job] ([ClientID], [Volume], [CreatedDate], [JobType]) VALUES (N'A.HARTRO', 1, CAST(N'2020-09-23' AS Date), N'C')
INSERT [dbo].[Job] ([ClientID], [Volume], [CreatedDate], [JobType]) VALUES (N'ACEOIL', 1, CAST(N'2020-09-23' AS Date), N'C')
INSERT [dbo].[Job] ([ClientID], [Volume], [CreatedDate], [JobType]) VALUES (N'AMASS', 1, CAST(N'2020-09-30' AS Date), N'C')
INSERT [dbo].[Job] ([ClientID], [Volume], [CreatedDate], [JobType]) VALUES (N'AGILITY', 323, CAST(N'2020-09-30' AS Date), N'C')
INSERT [dbo].[Job] ([ClientID], [Volume], [CreatedDate], [JobType]) VALUES (N'VANGUARD', 0.03, CAST(N'2020-10-06' AS Date), N'C')
INSERT [dbo].[Job] ([ClientID], [Volume], [CreatedDate], [JobType]) VALUES (N'VANGUARD', 0.44, CAST(N'2020-10-06' AS Date), N'C')
INSERT [dbo].[Job] ([ClientID], [Volume], [CreatedDate], [JobType]) VALUES (N'VANGUARD', 5.1, CAST(N'2020-10-06' AS Date), N'C')
INSERT [dbo].[Job] ([ClientID], [Volume], [CreatedDate], [JobType]) VALUES (N'VANGUARD', 2.07, CAST(N'2020-10-06' AS Date), N'C')
INSERT [dbo].[Job] ([ClientID], [Volume], [CreatedDate], [JobType]) VALUES (N'VANGUARD', 0.5, CAST(N'2020-10-06' AS Date), N'C')
INSERT [dbo].[Job] ([ClientID], [Volume], [CreatedDate], [JobType]) VALUES (N'VANGUARD', 0.49, CAST(N'2020-10-06' AS Date), N'C')
INSERT [dbo].[Job] ([ClientID], [Volume], [CreatedDate], [JobType]) VALUES (N'VANGUARD', 3.12, CAST(N'2020-10-08' AS Date), N'C')
INSERT [dbo].[Job] ([ClientID], [Volume], [CreatedDate], [JobType]) VALUES (N'VANGUARD', 1.1, CAST(N'2020-10-08' AS Date), N'C')
INSERT [dbo].[Job] ([ClientID], [Volume], [CreatedDate], [JobType]) VALUES (N'VANGUARD', 5.09, CAST(N'2020-10-12' AS Date), N'C')
INSERT [dbo].[Job] ([ClientID], [Volume], [CreatedDate], [JobType]) VALUES (N'VANGUARD', 1.41, CAST(N'2020-10-12' AS Date), N'C')
INSERT [dbo].[Job] ([ClientID], [Volume], [CreatedDate], [JobType]) VALUES (N'VANGUARD', 1.07, CAST(N'2020-10-13' AS Date), N'C')
INSERT [dbo].[Job] ([ClientID], [Volume], [CreatedDate], [JobType]) VALUES (N'VANGUARD', 1.14, CAST(N'2020-10-13' AS Date), N'C')
INSERT [dbo].[Job] ([ClientID], [Volume], [CreatedDate], [JobType]) VALUES (N'VANGUARD', 50.5, CAST(N'2020-10-13' AS Date), N'C')
INSERT [dbo].[Job] ([ClientID], [Volume], [CreatedDate], [JobType]) VALUES (N'VANGUARD', 0.19, CAST(N'2020-10-13' AS Date), N'C')
INSERT [dbo].[Job] ([ClientID], [Volume], [CreatedDate], [JobType]) VALUES (N'VANGUARD', 1.32, CAST(N'2020-10-13' AS Date), N'C')
INSERT [dbo].[Job] ([ClientID], [Volume], [CreatedDate], [JobType]) VALUES (N'VANGUARD', 4.33, CAST(N'2020-10-13' AS Date), N'C')
INSERT [dbo].[Job] ([ClientID], [Volume], [CreatedDate], [JobType]) VALUES (N'VANGUARD', 0.77, CAST(N'2020-10-13' AS Date), N'C')
INSERT [dbo].[Job] ([ClientID], [Volume], [CreatedDate], [JobType]) VALUES (N'A.HARTRO', 1, CAST(N'2020-10-14' AS Date), N'C')
INSERT [dbo].[Job] ([ClientID], [Volume], [CreatedDate], [JobType]) VALUES (N'VANGUARD', 0.41, CAST(N'2020-10-14' AS Date), N'C')
INSERT [dbo].[Job] ([ClientID], [Volume], [CreatedDate], [JobType]) VALUES (N'VANGUARD', 2.17, CAST(N'2020-10-14' AS Date), N'C')
INSERT [dbo].[Job] ([ClientID], [Volume], [CreatedDate], [JobType]) VALUES (N'VANGUARD', 1.01, CAST(N'2020-10-15' AS Date), N'C')
INSERT [dbo].[Job] ([ClientID], [Volume], [CreatedDate], [JobType]) VALUES (N'VANGUARD', 2, CAST(N'2020-10-16' AS Date), N'C')
INSERT [dbo].[Job] ([ClientID], [Volume], [CreatedDate], [JobType]) VALUES (N'VANGUARD', 5.3, CAST(N'2020-10-19' AS Date), N'C')
INSERT [dbo].[Job] ([ClientID], [Volume], [CreatedDate], [JobType]) VALUES (N'A1ONE', 1, CAST(N'2020-10-20' AS Date), N'C')
INSERT [dbo].[Job] ([ClientID], [Volume], [CreatedDate], [JobType]) VALUES (N'A1ONE', 2, CAST(N'2020-10-20' AS Date), N'C')
INSERT [dbo].[Job] ([ClientID], [Volume], [CreatedDate], [JobType]) VALUES (N'A1ONE', 11.3, CAST(N'2020-10-20' AS Date), N'D')
INSERT [dbo].[Job] ([ClientID], [Volume], [CreatedDate], [JobType]) VALUES (N'VANGUARD', 0.46, CAST(N'2020-10-20' AS Date), N'C')
INSERT [dbo].[Job] ([ClientID], [Volume], [CreatedDate], [JobType]) VALUES (N'VANGUARD', 4.18, CAST(N'2020-10-20' AS Date), N'C')
INSERT [dbo].[Job] ([ClientID], [Volume], [CreatedDate], [JobType]) VALUES (N'VANGUARD', 1.46, CAST(N'2020-10-20' AS Date), N'C')
INSERT [dbo].[Job] ([ClientID], [Volume], [CreatedDate], [JobType]) VALUES (N'VANGUARD', 2.13, CAST(N'2020-10-20' AS Date), N'C')
INSERT [dbo].[Job] ([ClientID], [Volume], [CreatedDate], [JobType]) VALUES (N'VANGUARD', 1.45, CAST(N'2020-10-21' AS Date), N'C')
INSERT [dbo].[Job] ([ClientID], [Volume], [CreatedDate], [JobType]) VALUES (N'VANGUARD', 1.3, CAST(N'2020-10-22' AS Date), N'C')
INSERT [dbo].[Job] ([ClientID], [Volume], [CreatedDate], [JobType]) VALUES (N'VANGUARD', 0.6, CAST(N'2020-10-22' AS Date), N'C')
INSERT [dbo].[Job] ([ClientID], [Volume], [CreatedDate], [JobType]) VALUES (N'VANGUARD', 1.32, CAST(N'2020-10-22' AS Date), N'C')
INSERT [dbo].[Job] ([ClientID], [Volume], [CreatedDate], [JobType]) VALUES (N'VANGUARD', 4.24, CAST(N'2020-10-22' AS Date), N'C')
INSERT [dbo].[Job] ([ClientID], [Volume], [CreatedDate], [JobType]) VALUES (N'ATFREIGHT', 1, CAST(N'2020-10-26' AS Date), N'C')
INSERT [dbo].[Job] ([ClientID], [Volume], [CreatedDate], [JobType]) VALUES (N'A1ONE', 1, CAST(N'2020-10-26' AS Date), N'C')
INSERT [dbo].[Job] ([ClientID], [Volume], [CreatedDate], [JobType]) VALUES (N'VANGUARD', 1, CAST(N'2020-10-26' AS Date), N'C')
INSERT [dbo].[Job] ([ClientID], [Volume], [CreatedDate], [JobType]) VALUES (N'VANGUARD', 17.75, CAST(N'2020-10-26' AS Date), N'C')
INSERT [dbo].[Job] ([ClientID], [Volume], [CreatedDate], [JobType]) VALUES (N'VANGUARD', 11.54, CAST(N'2020-10-26' AS Date), N'C')
INSERT [dbo].[Job] ([ClientID], [Volume], [CreatedDate], [JobType]) VALUES (N'VANGUARD', 1.26, CAST(N'2020-10-27' AS Date), N'C')
INSERT [dbo].[Job] ([ClientID], [Volume], [CreatedDate], [JobType]) VALUES (N'VANGUARD', 0.48, CAST(N'2020-10-27' AS Date), N'C')
INSERT [dbo].[Job] ([ClientID], [Volume], [CreatedDate], [JobType]) VALUES (N'VANGUARD', 5.05, CAST(N'2020-11-02' AS Date), N'C')
INSERT [dbo].[Job] ([ClientID], [Volume], [CreatedDate], [JobType]) VALUES (N'VANGUARD', 0.94, CAST(N'2020-11-02' AS Date), N'C')
INSERT [dbo].[Job] ([ClientID], [Volume], [CreatedDate], [JobType]) VALUES (N'VANGUARD', 2, CAST(N'2020-11-02' AS Date), N'C')
INSERT [dbo].[Job] ([ClientID], [Volume], [CreatedDate], [JobType]) VALUES (N'ALTRON', 0.432, CAST(N'2020-12-30' AS Date), N'C')
INSERT [dbo].[Job] ([ClientID], [Volume], [CreatedDate], [JobType]) VALUES (N'AMASS', 1, CAST(N'2020-12-31' AS Date), N'C')
INSERT [dbo].[Job] ([ClientID], [Volume], [CreatedDate], [JobType]) VALUES (N'DHL', 0.101, CAST(N'2021-01-07' AS Date), N'C')
INSERT [dbo].[Job] ([ClientID], [Volume], [CreatedDate], [JobType]) VALUES (N'DHL', 1.31, CAST(N'2021-01-07' AS Date), N'C')
INSERT [dbo].[Job] ([ClientID], [Volume], [CreatedDate], [JobType]) VALUES (N'DHL', 2.392, CAST(N'2021-01-07' AS Date), N'C')
INSERT [dbo].[Job] ([ClientID], [Volume], [CreatedDate], [JobType]) VALUES (N'VANGUARD', 1, CAST(N'2021-03-17' AS Date), N'C')
INSERT [dbo].[Job] ([ClientID], [Volume], [CreatedDate], [JobType]) VALUES (N'DSV', 0.943, CAST(N'2021-01-12' AS Date), N'C')
INSERT [dbo].[Job] ([ClientID], [Volume], [CreatedDate], [JobType]) VALUES (N'PANAL', 2.5, CAST(N'2021-04-13' AS Date), N'C')
INSERT [dbo].[Job] ([ClientID], [Volume], [CreatedDate], [JobType]) VALUES (N'DSV', 10.178, CAST(N'2021-01-12' AS Date), N'C')
INSERT [dbo].[Job] ([ClientID], [Volume], [CreatedDate], [JobType]) VALUES (N'DSV', 4.823, CAST(N'2021-01-12' AS Date), N'C')
INSERT [dbo].[Job] ([ClientID], [Volume], [CreatedDate], [JobType]) VALUES (N'DSV', 4.169, CAST(N'2021-01-12' AS Date), N'C')
INSERT [dbo].[Job] ([ClientID], [Volume], [CreatedDate], [JobType]) VALUES (N'VANGUARD', 1, CAST(N'2021-05-27' AS Date), N'C')
INSERT [dbo].[Job] ([ClientID], [Volume], [CreatedDate], [JobType]) VALUES (N'DHL', 1, CAST(N'2021-01-14' AS Date), N'C')
INSERT [dbo].[Job] ([ClientID], [Volume], [CreatedDate], [JobType]) VALUES (N'DHL', 1, CAST(N'2021-01-29' AS Date), N'C')
INSERT [dbo].[Job] ([ClientID], [Volume], [CreatedDate], [JobType]) VALUES (N'ATFREIGHT', 1, CAST(N'2021-06-01' AS Date), N'C')
INSERT [dbo].[Job] ([ClientID], [Volume], [CreatedDate], [JobType]) VALUES (N'GAC', 1.323, CAST(N'2021-06-01' AS Date), N'C')
INSERT [dbo].[Job] ([ClientID], [Volume], [CreatedDate], [JobType]) VALUES (N'CENTRAL', 19.67, CAST(N'2021-06-02' AS Date), N'C')
INSERT [dbo].[Job] ([ClientID], [Volume], [CreatedDate], [JobType]) VALUES (N'CENTRAL', 18.56, CAST(N'2021-06-02' AS Date), N'C')
GO
INSERT [dbo].[JobType] ([Code], [Description]) VALUES (N'C', N'COLLECTION')
INSERT [dbo].[JobType] ([Code], [Description]) VALUES (N'D', N'DELIVERY')
INSERT [dbo].[JobType] ([Code], [Description]) VALUES (N'I', N'INTERNAL RAILING')
INSERT [dbo].[JobType] ([Code], [Description]) VALUES (N'L', N'LCL')
GO
ALTER TABLE [dbo].[ProductImage]  WITH CHECK ADD  CONSTRAINT [FK_ProductImage_ProductImage] FOREIGN KEY([ID])
REFERENCES [dbo].[ProductImage] ([ID])
GO
ALTER TABLE [dbo].[ProductImage] CHECK CONSTRAINT [FK_ProductImage_ProductImage]
GO
