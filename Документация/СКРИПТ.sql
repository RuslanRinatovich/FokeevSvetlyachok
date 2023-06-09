USE [master]
GO
/****** Object:  Database [SvetlychokBD]    Script Date: 07.06.2023 20:20:40 ******/
CREATE DATABASE [SvetlychokBD]
GO
USE [SvetlychokBD]
GO
/****** Object:  Table [dbo].[Agent]    Script Date: 07.06.2023 20:20:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Agent](
	[AgentId] [int] IDENTITY(1,1) NOT NULL,
	[AgentName] [nvarchar](50) NOT NULL,
	[AgentTypeId] [int] NOT NULL,
	[LegalAddress] [nvarchar](100) NOT NULL,
	[INN] [nvarchar](20) NOT NULL,
	[KPP] [nvarchar](50) NOT NULL,
	[ManagerFIO] [nvarchar](100) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Logo] [nvarchar](100) NULL,
	[Priority] [smallint] NULL,
 CONSTRAINT [PK_Agents] PRIMARY KEY CLUSTERED 
(
	[AgentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AgentPoint]    Script Date: 07.06.2023 20:20:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AgentPoint](
	[PointId] [int] IDENTITY(1,1) NOT NULL,
	[PointName] [nvarchar](1000) NOT NULL,
	[Address] [nvarchar](1000) NOT NULL,
	[AgentId] [int] NOT NULL,
 CONSTRAINT [PK_Points] PRIMARY KEY CLUSTERED 
(
	[PointId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AgentType]    Script Date: 07.06.2023 20:20:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AgentType](
	[AgentTypeId] [int] IDENTITY(1,1) NOT NULL,
	[AgentTypeName] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_AgentType] PRIMARY KEY CLUSTERED 
(
	[AgentTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Material]    Script Date: 07.06.2023 20:20:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Material](
	[MaterialId] [int] IDENTITY(1,1) NOT NULL,
	[MaterialName] [nvarchar](100) NOT NULL,
	[MaterialTypeId] [int] NOT NULL,
	[CountInPack] [float] NOT NULL,
	[UnitTypeId] [int] NOT NULL,
	[MinimalCount] [int] NOT NULL,
	[Description] [nvarchar](100) NULL,
	[Image] [nvarchar](50) NULL,
	[Price] [float] NOT NULL,
	[Count] [int] NOT NULL,
 CONSTRAINT [PK_Materials] PRIMARY KEY CLUSTERED 
(
	[MaterialId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialSupplier]    Script Date: 07.06.2023 20:20:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialSupplier](
	[MaterialSupplierId] [int] IDENTITY(1,1) NOT NULL,
	[MaterialId] [int] NOT NULL,
	[SupplierId] [int] NOT NULL,
	[Quality] [int] NOT NULL,
	[DeliveryDate] [datetime] NOT NULL,
	[Count] [int] NOT NULL,
 CONSTRAINT [PK_MaterialSuppliers] PRIMARY KEY CLUSTERED 
(
	[MaterialSupplierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialType]    Script Date: 07.06.2023 20:20:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialType](
	[MaterialTypeId] [int] IDENTITY(1,1) NOT NULL,
	[MaterialTypeName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_MaterialTypes] PRIMARY KEY CLUSTERED 
(
	[MaterialTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialWriteOff]    Script Date: 07.06.2023 20:20:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialWriteOff](
	[MaterialWriteOffId] [int] IDENTITY(1,1) NOT NULL,
	[MaterialId] [int] NOT NULL,
	[Reason] [nvarchar](max) NOT NULL,
	[OperationDate] [datetime] NOT NULL,
	[Count] [int] NOT NULL,
 CONSTRAINT [PK_MaterialWarehouse] PRIMARY KEY CLUSTERED 
(
	[MaterialWriteOffId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 07.06.2023 20:20:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[DateOfFormation] [datetime] NULL,
	[DateOfPrepayment] [datetime] NULL,
	[IsActive] [bit] NULL,
	[DateOfPayment] [datetime] NULL,
	[AgentId] [int] NOT NULL,
	[SellDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderProduct]    Script Date: 07.06.2023 20:20:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderProduct](
	[OrderProductId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Count] [int] NOT NULL,
 CONSTRAINT [PK_Sell] PRIMARY KEY CLUSTERED 
(
	[OrderProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PriceHistory]    Script Date: 07.06.2023 20:20:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PriceHistory](
	[PriceHistoryId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[MinimalPrice] [float] NOT NULL,
	[AcceptanceDate] [datetime] NOT NULL,
 CONSTRAINT [PK_AgentProducts] PRIMARY KEY CLUSTERED 
(
	[PriceHistoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PriorityHistory]    Script Date: 07.06.2023 20:20:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PriorityHistory](
	[PriorityHistoryId] [int] IDENTITY(1,1) NOT NULL,
	[AgentId] [int] NOT NULL,
	[Priority] [int] NOT NULL,
	[Date] [date] NOT NULL,
 CONSTRAINT [PK_PriorityHistory] PRIMARY KEY CLUSTERED 
(
	[PriorityHistoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 07.06.2023 20:20:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[Artikul] [nvarchar](50) NOT NULL,
	[ProductName] [nvarchar](50) NOT NULL,
	[ProductTypeId] [int] NOT NULL,
	[Description] [nvarchar](1000) NULL,
	[Image] [nvarchar](50) NULL,
	[Length] [float] NULL,
	[Height] [float] NULL,
	[Width] [float] NULL,
	[Netto] [float] NULL,
	[Brutto] [float] NULL,
	[PeopleCount] [int] NOT NULL,
	[WorkshopId] [int] NOT NULL,
	[ProductionTime] [int] NULL,
	[MinimalPrice] [float] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductMaterial]    Script Date: 07.06.2023 20:20:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductMaterial](
	[ProductMaterialId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[MaterialId] [int] NOT NULL,
	[Count] [int] NOT NULL,
 CONSTRAINT [PK_ProductMaterials] PRIMARY KEY CLUSTERED 
(
	[ProductMaterialId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductType]    Script Date: 07.06.2023 20:20:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductType](
	[ProductTypeId] [int] IDENTITY(1,1) NOT NULL,
	[ProductTypeName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_ProductTypes] PRIMARY KEY CLUSTERED 
(
	[ProductTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SellHistory]    Script Date: 07.06.2023 20:20:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SellHistory](
	[SellHistoryId] [int] IDENTITY(1,1) NOT NULL,
	[AgentId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Count] [int] NOT NULL,
	[Date] [date] NOT NULL,
 CONSTRAINT [PK_SellHistories] PRIMARY KEY CLUSTERED 
(
	[SellHistoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 07.06.2023 20:20:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[SupplierId] [int] IDENTITY(1,1) NOT NULL,
	[SupplierName] [nvarchar](100) NOT NULL,
	[INN] [nvarchar](50) NOT NULL,
	[SupplierTypeId] [int] NOT NULL,
	[Rate] [int] NOT NULL,
	[WorkDate] [date] NOT NULL,
 CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED 
(
	[SupplierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SupplierType]    Script Date: 07.06.2023 20:20:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SupplierType](
	[SupplierTypeId] [int] IDENTITY(1,1) NOT NULL,
	[SupplierTypeName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_SupplierTypes] PRIMARY KEY CLUSTERED 
(
	[SupplierTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UnitType]    Script Date: 07.06.2023 20:20:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UnitType](
	[UnitTypeId] [int] IDENTITY(1,1) NOT NULL,
	[UnitTypeName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_UnitTypes] PRIMARY KEY CLUSTERED 
(
	[UnitTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Workshop]    Script Date: 07.06.2023 20:20:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Workshop](
	[WorkshopId] [int] IDENTITY(1,1) NOT NULL,
	[WorkshopName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Workshops] PRIMARY KEY CLUSTERED 
(
	[WorkshopId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Agent] ON 

INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (1, N'МонтажОрионУрал', 1, N'027573, Тамбовская область, город Коломна, ул. Ленина, 20', N'1692286718', N'181380912', N'Давыдоваа Нина Евгеньевна', N'(35222) 67-39-26', N'pzaitev@blokin.org', N'agent_96.png', 50)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (2, N'МетизСтрой', 1, N'254238, Нижегородская область, город Павловский Посад, проезд Балканская, 23', N'4024742936', N'295608432', N'Ева Борисовна Беспалова', N'8-800-172-62-56', N'kristina.pakomov@burova.ru', N'agent_94.png', 374)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (3, N'РадиоСевер', 2, N'491360, Московская область, город Одинцово, въезд Ленина, 19', N'5889206249', N'372789083', N'Карпов Иосиф Максимович', N'(495) 368-86-51', N'maiy.belov@rogov.ru', N'agent_123.png', 431)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (4, N'Компания КазАлмаз', 3, N'848810, Кемеровская область, город Лотошино, пер. Ломоносова, 90', N'3084797352', N'123190924', N'Марк Фёдорович Муравьёва', N'8-800-533-24-75', N'irina.gusina@vlasova.ru', N'agent_80.png', 396)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (5, N'Компания СервисРадиоГор', 3, N'547196, Ульяновская область, город Серебряные Пруды, въезд Балканская, 81', N'8880473721', N'729975116', N'Попов Вадим Александрович', N'8-800-676-32-86', N'nika.nekrasova@kovalev.ru', N'agent_40.png', 169)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (6, N'ВодТверьХозМашина', 4, N'145030, Сахалинская область, город Шатура, въезд Гоголя, 79', N'4174253174', N'522227145', N'Александра Дмитриевна Ждановаа', N'+7 (922) 849-91-96', N'tkrylov@baranova.net', N'agent_56.png', 8)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (7, N'Тех', 2, N'731935, Калининградская область, город Павловский Посад, наб. Гагарина, 59', N'9282924869', N'587356429', N'Аким Романович Логинова', N'+7 (922) 427-13-31', N'vasilisa99@belyev.ru', N'agent_61.png', 278)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (8, N'ТверьМетизУралСнос', 3, N'880551, Ленинградская область, город Красногорск, ул. Гоголя, 61', N'1076095397', N'947828491', N'Зоя Андреевна Соболева', N'(35222) 57-92-75', N'rlazareva@novikov.ru', N'agent_109.png', 165)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (9, N'МясРеч', 4, N'903648, Калужская область, город Воскресенск, пр. Будапештсткая, 91', N'9254261217', N'656363498', N'Белоусоваа Ирина Максимовна', N'8-800-453-63-45', N'bkozlov@volkov.ru', N'agent_58.png', 355)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (10, N'Флот', 4, N'505562, Тюменская область, город Наро-Фоминск, пр. Косиора, 11', N'1112170258', N'382584255', N'Василий Андреевич Ковалёв', N'8-800-144-25-38', N'gerasim.makarov@kornilov.ru', N'agent_87.png', 473)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (11, N'CибПивОмскСнаб', 4, N'816260, Ивановская область, город Москва, ул. Гагарина, 31', N'5676173945', N'256512286', N'Людмила Александровна Сафонова', N'+7 (922) 153-95-22', N'evorontova@potapova.ru', N'agent_46.png', 477)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (12, N'ЦементАсбоцемент', 4, N'619540, Курская область, город Раменское, пл. Балканская, 12', N'4345774724', N'352469905', N'Воронова Мария Александровна', N'(495) 184-87-92', N'polykov.veronika@artemeva.ru', NULL, 426)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (13, N'ТелеГлавВекторСбыт', 4, N'062489, Челябинская область, город Пушкино, въезд Бухарестская, 07', N'9504787157', N'419758597', N'Екатерина Фёдоровна Ковалёва', N'(35222) 56-15-37', N'nsitnikov@kovaleva.ru', N'agent_31.png', 185)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (14, N'Инфо', 2, N'100469, Рязанская область, город Ногинск, шоссе Гагарина, 57', N'6549468639', N'718386757', N'Баранова Виктор Романович', N'8-800-793-59-97', N'arsenii.mikailova@prokorov.com', N'agent_89.png', 304)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (15, N'ЭлектроРемОрионЛизинг', 4, N'594365, Ярославская область, город Павловский Посад, бульвар Космонавтов, 64', N'1340072597', N'500478249', N'Тарасова Дан Львович', N'(495) 519-97-41', N'anfisa.fedotova@tvetkov.ru', N'agent_68.png', 198)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (16, N'Компания ТелекомХмельГаражПром', 3, N'126668, Ростовская область, город Зарайск, наб. Гагарина, 69', N'1614623826', N'824882264', N'Костина Татьяна Борисовна', N'(812) 983-91-73', N'qkolesnikova@kalinina.ru', N'agent_71.png', 457)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (17, N'Компания Алмаз', 3, N'016215, Воронежская область, город Зарайск, ул. Косиора, 48', N'6698862694', N'662876919', N'Фоминаа Лариса Романовна', N'+7 (922) 688-74-22', N'akalinina@zaitev.ru', N'agent_121.png', 259)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (18, N'МясТрансМоторЛизинг', 2, N'765320, Ивановская область, город Шатура, спуск Гоголя, 88', N'6148685143', N'196332656', N'Тамара Дмитриевна Семёноваа', N'+7 (922) 676-34-94', N'vlad.sokolov@andreev.org', N'agent_62.png', 268)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (19, N'Монтаж', 5, N'066594, Магаданская область, город Шаховская, спуск Сталина, 59', N'6142194281', N'154457435', N'Блохина Сергей Максимович', N'(495) 867-76-15', N'zakar.sazonova@gavrilov.ru', NULL, 300)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (20, N'ВостокГлав', 3, N'217022, Ростовская область, город Озёры, ул. Домодедовская, 19', N'3580946305', N'405017349', N'Инга Фёдоровна Дмитриева', N'(812) 949-29-26', N'gordei95@kirillov.ru', N'agent_63.png', 107)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (21, N'Газ', 5, N'252821, Тамбовская область, город Пушкино, ул. Чехова, 40', N'8876413796', N'955381891', N'Терентьев Илларион Максимович', N'(35222) 22-45-58', N'ulyna.antonov@noskov.ru', N'agent_76.png', 170)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (22, N'ЭлектроТранс', 2, N'434616, Калининградская область, город Павловский Посад, пл. Ладыгина, 83', N'6019144874', N'450629885', N'Сава Александрович Титова', N'(812) 342-24-31', N'boleslav.zukova@nikiforova.com', N'agent_91.png', 129)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (23, N'Электро', 2, N'966815, Новгородская область, город Одинцово, пр. Космонавтов, 19', N'7896029866', N'786038848', N'Шарапова Елена Дмитриевна', N'8-800-714-36-41', N'likacev.makar@antonov.ru', N'agent_93.png', 366)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (24, N'Гор', 1, N'376483, Калужская область, город Сергиев Посад, ул. Славы, 09', N'7088187045', N'440309946', N'Нонна Львовна Одинцоваа', N'(495) 973-48-55', N'maiy12@koklov.net', N'agent_52.png', 175)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (25, N'Компания Гараж', 3, N'395101, Белгородская область, город Балашиха, бульвар 1905 года, 00', N'6190244524', N'399106161', N'Владлена Фёдоровна Ларионоваа', N'+7 (922) 848-38-54', N'asiryeva@andreeva.com', N'agent_66.png', 413)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (26, N'ОрионГлав', 6, N'729639, Магаданская область, город Талдом, въезд Будапештсткая, 98', N'9032455179', N'763045792', N'Тимофеева Григорий Андреевич', N'+7 (922) 684-13-74', N'sermakova@sarova.net', N'agent_106.png', 482)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (27, N'ГлавITФлотПроф', 5, N'447811, Мурманская область, город Егорьевск, ул. Ленина, 24', N'2561361494', N'525678825', N'Зыкова Стефан Максимович', N'(812) 146-66-46', N'savva.rybov@kolobov.ru', N'agent_64.png', 62)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (28, N'ТверьМонтажОмск', 6, N'761751, Амурская область, город Балашиха, шоссе Гоголя, 02', N'2421347164', N'157370604', N'Матвей Романович Большакова', N'8-800-363-43-86', N'dteterina@selezneva.ru', N'agent_128.png', 272)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (29, N'РемСантехОмскБанк', 2, N'289468, Омская область, город Видное, пер. Балканская, 33', N'6823050572', N'176488617', N'Фокина Искра Максимовна', N'(812) 182-44-77', N'anisimov.mark@vorobev.ru', N'agent_57.png', 442)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (30, N'ЭлектроМоторТрансСнос', 2, N'913777, Самарская область, город Красногорск, ул. Бухарестская, 49', N'6608362851', N'799760512', N'Людмила Евгеньевна Новиковаа', N'(35222) 43-62-19', N'inessa.voronov@sidorova.ru', NULL, 151)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (31, N'ТверьХозМорСбыт', 1, N'252101, Ростовская область, город Дорохово, пер. Ленина, 85', N'6681338084', N'460530907', N'Аким Львович Субботина', N'(495) 416-75-67', N'marina58@koroleva.com', N'agent_117.png', 207)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (32, N'Компания ТомскХоз', 3, N'861543, Томская область, город Истра, бульвар Славы, 42', N'8430391035', N'961540858', N'Лазарева Аркадий Сергеевич', N'+7 (922) 849-13-37', N'nelli11@gureva.ru', N'agent_115.png', 464)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (33, N'Компания МясДизайнДизайн', 3, N'557264, Брянская область, город Серпухов, въезд Гоголя, 34', N'8004989990', N'908629456', N'Клементина Сергеевна Стрелкова', N'(812) 535-17-25', N'gleb.gulyev@belyeva.com', N'agent_53.png', 491)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (34, N'Компания ЖелДорТверьМонтаж', 3, N'152424, Рязанская область, город Сергиев Посад, ул. 1905 года, 27', N'3325722996', N'665766347', N'Нестор Максимович Гуляев', N'(495) 521-61-75', N'burova.zlata@zueva.ru', N'agent_85.png', 2)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (35, N'МетизТехАвтоПроф', 3, N'713016, Брянская область, город Подольск, пл. Домодедовская, 93', N'2988890076', N'215491048', N'Егор Фёдорович Третьякова', N'(495) 581-42-46', N'anastasiy.gromov@samsonova.com', N'agent_33.png', 321)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (36, N'Гараж', 5, N'585758, Самарская область, город Красногорск, бульвар Балканская, 13', N'2638464552', N'746822723', N'Панфилов Константин Максимович', N'(35222) 54-72-59', N'antonin51@korolev.com', N'agent_90.png', 107)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (37, N'ГазДизайнЖелДор', 1, N'695230, Курская область, город Красногорск, пр. Гоголя, 64', N'2396029740', N'458924890', N'Лев Иванович Третьяков', N'(495) 797-97-33', N'elizaveta.komarov@rybakov.net', N'agent_49.png', 236)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (38, N'РемГаражЛифт', 2, N'048715, Ивановская область, город Люберцы, проезд Космонавтов, 89', N'1656477206', N'988968838', N'Филатов Владимир Максимович', N'8-800-772-27-53', N'novikova.gleb@sestakov.ru', N'agent_65.png', 374)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (39, N'СантехБашкир', 5, N'180288, Тверская область, город Одинцово, ул. Бухарестская, 37', N'4159215346', N'639267493', N'Виктор Иванович Молчанов', N'+7 (922) 155-87-39', N'nikodim81@kiseleva.com', N'agent_99.png', 369)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (40, N'ЮпитерЛенГараж-М', 1, N'339507, Московская область, город Видное, ул. Космонавтов, 11', N'2038393690', N'259672761', N'Васильева Валерия Борисовна', N'(495) 327-58-25', N'larkipova@gorbunov.ru', N'agent_48.png', 470)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (41, N'ОрионСофтВодСнос', 4, N'577227, Калужская область, город Павловский Посад, наб. Чехова, 35', N'1522348613', N'977738715', N'Мухина Ян Фёдорович', N'(35222) 59-75-11', N'isukanov@sobolev.com', N'agent_97.png', 361)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (42, N'КазХоз', 2, N'384162, Астраханская область, город Одинцово, бульвар Гагарина, 57', N'6503377671', N'232279972', N'Степанова Роман Иванович', N'+7 (922) 728-85-62', N'istrelkova@fomin.ru', NULL, 213)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (43, N'БухВжух', 6, N'481744, Амурская область, город Щёлково, пл. Сталина, 48', N'2320989197', N'359282667', N'Тарасов Болеслав Александрович', N'(495) 367-21-41', N'valentina.bolsakova@aksenova.ru', NULL, 327)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (44, N'ХозЮпитер', 2, N'038182, Курганская область, город Москва, спуск Космонавтов, 16', N'6667635058', N'380592865', N'Максимоваа Вера Фёдоровна', N'+7 (922) 332-48-96', N'jisakova@nazarova.com', N'agent_114.png', 375)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (45, N'ВостокКазРыб', 5, N'059565, Оренбургская область, город Истра, шоссе Домодедовская, 27', N'7411284960', N'176779733', N'Самсонов Родион Романович', N'(495) 987-31-63', N'flukin@misin.org', N'agent_112.png', 361)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (46, N'ЦементКрепТех-М', 4, N'263764, Свердловская область, город Раменское, пер. Косиора, 28', N'5359981084', N'680416300', N'Сергеев Владлен Александрович', N'(812) 838-79-58', N'yna.evdokimov@gordeeva.ru', N'agent_82.png', 189)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (47, N'Строй', 5, N'763019, Омская область, город Шатура, пл. Сталина, 56', N'6678884759', N'279288618', N'Кудрявцев Адриан Андреевич', N'(812) 447-45-59', N'soloveva.adam@andreev.ru', NULL, 12)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (48, N'БашкирЮпитерТомск', 4, N'035268, Сахалинская область, город Волоколамск, проезд Ладыгина, 51', N'1606315697', N'217799345', N'Фадеева Раиса Александровна', N'(812) 189-59-57', N'dyckov.veniamin@kotova.ru', N'agent_59.png', 139)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (49, N'Компания КазМеталКазань', 3, N'532703, Пензенская область, город Чехов, наб. Чехова, 81', N'4598939812', N'303467543', N'Валерий Владимирович Хохлова', N'(495) 685-34-29', N'mmoiseev@teterin.ru', N'agent_130.png', 252)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (50, N'Компания Газ', 3, N'310403, Кировская область, город Солнечногорск, пл. Балканская, 76', N'2262431140', N'247369527', N'Давид Андреевич Фадеев', N'(35222) 75-96-85', N'alina56@zdanov.com', N'agent_120.png', 445)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (51, N'Компания Монтаж', 3, N'036381, Брянская область, город Кашира, бульвар Гагарина, 76', N'6206428565', N'118570048', N'Силин Даниил Иванович', N'(35222) 92-45-98', N'afanasev.anastasiy@muravev.ru', N'agent_75.png', 124)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (52, N'СервисХмельМонтаж', 4, N'928260, Нижегородская область, город Балашиха, пл. Косиора, 44', N'3459886235', N'356196105', N'Анжелика Дмитриевна Горбунова', N'+7 (922) 344-73-38', N'galina31@melnikov.ru', N'agent_92.png', 124)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (53, N'ВодГараж', 2, N'988899, Саратовская область, город Раменское, пр. Славы, 40', N'5575072431', N'684290320', N'Лаврентий Фёдорович Логинова', N'+7 (922) 363-86-67', N'pmaslov@fomiceva.com', N'agent_67.png', 250)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (54, N'CибГаз', 1, N'365674, Архангельская область, город Серебряные Пруды, пр. Ленина, 29', N'6483417250', N'455013058', N'Вячеслав Романович Третьякова', N'(495) 945-37-25', N'inna.sarova@panfilov.ru', N'agent_103.png', 488)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (55, N'БашкирФлотМотор-H', 1, N'008081, Тюменская область, город Ногинск, въезд Гагарина, 94', N'1657476072', N'934931159', N'Марат Алексеевич Фролов', N'(495) 793-84-82', N'morozova.nika@kazakova.ru', N'agent_36.png', 416)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (56, N'МеталСервисМор', 6, N'293265, Иркутская область, город Клин, пр. Славы, 12', N'6922817841', N'580142825', N'Коновалова Кирилл Львович', N'(35222) 91-28-62', N'xdanilov@titov.ru', NULL, 475)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (57, N'Рем', 4, N'707812, Иркутская область, город Шаховская, ул. Гагарина, 17', N'3203830728', N'456254820', N'Шароваа Елизавета Львовна', N'(495) 987-88-53', N'zanna25@nikiforova.com', N'agent_79.png', 329)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (58, N'СантехСеверЛенМашина', 3, N'606990, Новосибирская область, город Павловский Посад, въезд Домодедовская, 38', N'3506691089', N'830713603', N'Павел Максимович Рожков', N'(812) 918-88-43', N'pgorbacev@vasilev.net', N'agent_74.png', 201)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (59, N'Цемент', 3, N'084315, Амурская область, город Шаховская, наб. Чехова, 62', N'9662118663', N'650216214', N'Анфиса Фёдоровна Буроваа', N'8-800-517-78-47', N'panova.klementina@bobrov.ru', N'agent_54.png', 340)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (60, N'Вод', 4, N'964386, Оренбургская область, город Чехов, пл. Косиора, 80', N'1296063939', N'447430051', N'Зоя Романовна Селезнёва', N'(495) 142-19-84', N'savva86@zaiteva.ru', N'agent_129.png', 359)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (61, N'Орион', 6, N'951035, Ивановская область, город Ступино, шоссе Космонавтов, 73', N'2670166502', N'716874456', N'Мартынов Михаил Борисович', N'8-800-621-61-93', N'aleksei63@kiselev.ru', N'agent_77.png', 166)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (62, N'СтройГорНефть', 2, N'444539, Ульяновская область, город Лотошино, спуск Будапештсткая, 95', N'5916775587', N'398299418', N'Тарасова Макар Максимович', N'(812) 385-21-37', N'lysy.kolesnikova@molcanova.com', N'agent_37.png', 161)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (63, N'Компания Хмель', 3, N'889757, Новосибирская область, город Раменское, бульвар 1905 года, 93', N'9004087602', N'297273898', N'Владимир Борисович Суворова', N'(812) 421-77-82', N'ermakov.mark@isakova.ru', N'отсутствует', 2)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (64, N'Компания ВодАлмазIT', 3, N'302100, Нижегородская область, город Мытищи, пер. 1905 года, 63', N'2345297765', N'908449277', N'Гуляев Егор Евгеньевич', N'(35222) 52-76-16', N'zakar37@nikolaeva.ru', N'agent_111.png', 31)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (65, N'БашкирРечТомск', 6, N'136886, Амурская область, город Видное, въезд Космонавтов, 39', N'7027724917', N'823811460', N'Назарова Вера Андреевна', N'8-800-254-71-85', N'aleksandra77@karpov.com', N'agent_100.png', 84)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (66, N'СофтРосБух', 4, N'747695, Амурская область, город Сергиев Посад, въезд Бухарестская, 46', N'8321561226', N'807803984', N'Белова Полина Владимировна', N'+7 (922) 445-69-17', N'ivanova.antonin@rodionov.ru', N'agent_124.png', 69)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (67, N'ТелекомЮпитер', 1, N'959793, Курская область, город Егорьевск, бульвар Ленина, 72', N'9383182378', N'944520594', N'Калинина Татьяна Ивановна', N'(812) 895-67-23', N'kulikov.adrian@zuravlev.org', N'agent_81.png', 302)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (68, N'УралСтройХмель', 4, N'462632, Костромская область, город Шаховская, шоссе Сталина, 92', N'8773558039', N'402502867', N'Август Борисович Красильникова', N'(35222) 39-23-65', N'aleksandr95@kolobova.ru', N'agent_113.png', 372)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (69, N'АсбоцементТехАвто', 5, N'304975, Пензенская область, город Солнечногорск, шоссе Балканская, 76', N'7626076463', N'579234124', N'Сидорова Любовь Ивановна', N'+7 (922) 977-68-84', N'matveev.yliy@kiseleva.ru', N'agent_110.png', 247)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (70, N'Компания ФинансСервис', 3, N'841700, Брянская область, город Серпухов, спуск Домодедовская, 35', N'7491491391', N'673621812', N'Клавдия Сергеевна Виноградова', N'(812) 878-42-71', N'robert.serbakov@safonova.ru', N'agent_38.png', 395)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (71, N'Софт', 2, N'453714, Смоленская область, город Одинцово, спуск Косиора, 84', N'3889910123', N'952047511', N'Петухова Прохор Фёдорович', N'(35222) 12-82-65', N'jterentev@ersov.com', N'agent_122.png', 292)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (72, N'ТелекомГор', 2, N'210024, Белгородская область, город Сергиев Посад, наб. Ломоносова, 43', N'3748947224', N'766431901', N'Ксения Андреевна Михайлова', N'(35222) 78-93-21', N'gorskov.larisa@kalinin.com', N'agent_98.png', 255)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (73, N'РемСтрем', 6, N'373761, Псковская область, город Наро-Фоминск, наб. Гагарина, 03', N'9006569852', N'152177100', N'Альбина Александровна Романова', N'(35222) 55-28-24', N'rafail96@sukin.ru', N'agent_116.png', 88)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (74, N'Лифт', 3, N'479565, Курганская область, город Клин, пл. Ленина, 54', N'6169713039', N'848972934', N'Вера Евгеньевна Денисоваа', N'(812) 484-92-38', N'zinaida01@bespalova.ru', N'agent_101.png', 92)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (75, N'Компания МоторТелекомЦемент-М', 3, N'021293, Амурская область, город Наро-Фоминск, шоссе Славы, 40', N'7326832482', N'440199498', N'Иван Евгеньевич Белоусова', N'(812) 857-95-57', N'larisa44@silin.org', N'agent_118.png', 237)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (76, N'ЮпитерТяжОрионЭкспедиция', 2, N'960726, Томская область, город Орехово-Зуево, въезд 1905 года, 51', N'6843174002', N'935556458', N'Валерий Евгеньевич Виноградов', N'(35222) 95-63-65', N'gblokin@orlov.net', N'agent_44.png', 446)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (77, N'Транс', 5, N'508299, Кемеровская область, город Кашира, пер. Гагарина, 42', N'9604275878', N'951258069', N'Евсеева Болеслав Сергеевич', N'8-800-954-23-89', N'artem.fadeev@polykov.com', N'agent_127.png', 38)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (78, N'РемВод', 2, N'449723, Смоленская область, город Наро-Фоминск, пер. Ломоносова, 94', N'3986603105', N'811373078', N'Медведеваа Ярослава Фёдоровна', N'+7 (922) 353-31-72', N'komarov.elizaveta@agafonova.ru', N'agent_126.png', 1)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (79, N'АсбоцементЛифтРеч-H', 6, N'599158, Ростовская область, город Озёры, ул. Космонавтов, 05', N'6567878928', N'560960507', N'Кондратьева Таисия Андреевна', N'(495) 245-57-16', N'vladlena58@seliverstova.ru', N'agent_105.png', 407)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (80, N'РосАвтоМонтаж', 3, N'331914, Курская область, город Ногинск, спуск Ладыгина, 66', N'4735043946', N'263682488', N'Диана Алексеевна Исаковаа', N'(495) 445-97-76', N'lapin.inessa@isaeva.com', N'agent_55.png', 10)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (81, N'Компания СервисТелеМотор', 3, N'625988, Вологодская область, город Озёры, пр. Гоголя, 18', N'3248454160', N'138472695', N'Фролова Эдуард Борисович', N'+7 (922) 461-25-29', N'veronika.egorov@bespalova.com', N'agent_102.png', 81)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (82, N'ФинансТелеТверь', 6, N'687171, Томская область, город Лотошино, пл. Славы, 59', N'2646091050', N'971874277', N'Зайцеваа Дарья Сергеевна', N'(812) 115-56-93', N'medvedev.klim@afanasev.com', N'agent_45.png', 100)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (83, N'ВодГор', 2, N'265653, Калужская область, город Ступино, шоссе Гоголя, 89', N'4463113470', N'899603778', N'Фаина Фёдоровна Филиппова', N'(35222) 73-72-16', N'tvetkova.robert@sorokin.com', N'agent_125.png', 72)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (84, N'ТяжРадиоУралПроф', 2, N'521087, Орловская область, город Егорьевск, шоссе Ладыгина, 14', N'5688533246', N'401535045', N'София Алексеевна Мухина', N'+7 (922) 885-66-15', N'liliy62@grisina.ru', N'agent_88.png', 278)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (85, N'ГаражЛофт', 2, N'294596, Мурманская область, город Шаховская, пр. Домодедовская, 88', N'2816939574', N'754741128', N'Клавдия Фёдоровна Кудряшова', N'(495) 427-55-66', N'lydmila.belyeva@karpov.ru', N'agent_108.png', 335)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (86, N'ITСтройАлмаз', 2, N'361730, Костромская область, город Волоколамск, шоссе Славы, 36', N'7689065648', N'456612755', N'Алексеева Валериан Андреевич', N'8-800-185-78-91', N'fokin.eduard@samoilov.com', N'agent_83.png', 159)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (87, N'Асбоцемент', 3, N'030119, Курганская область, город Дмитров, пер. Славы, 47', N'1261407459', N'745921890', N'Никитинаа Антонина Андреевна', N'8-800-211-16-23', N'antonin19@panfilov.ru', N'agent_34.png', 273)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (88, N'ТекстильУралАвтоОпт', 4, N'028936, Магаданская область, город Видное, ул. Гагарина, 54', N'3930950057', N'678529397', N'Алина Сергеевна Дьячковаа', N'(35222) 98-76-54', N'hkononova@pavlova.ru', NULL, 176)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (89, N'Компания КрепЦемент', 3, N'423477, Мурманская область, город Кашира, бульвар Домодедовская, 61', N'3025099903', N'606083992', N'Екатерина Львовна Суворова', N'(812) 963-77-87', N'rusakov.efim@nikiforov.ru', N'agent_50.png', 426)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (90, N'КазаньТекстиль', 2, N'231891, Челябинская область, город Шатура, бульвар Ладыгина, 40', N'4584384019', N'149680499', N'Александров Бронислав Максимович', N'(35222) 86-74-21', N'osimonova@andreeva.com', N'agent_47.png', 156)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (91, N'КазЮпитерТомск', 2, N'393450, Тульская область, город Кашира, пр. 1905 года, 47', N'9201745524', N'510248846', N'Рафаил Андреевич Копылов', N'+7 (922) 772-33-58', N'tgavrilov@frolov.ru', N'agent_60.png', 244)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (92, N'Бух', 5, N'409600, Новгородская область, город Ногинск, пл. Гагарина, 68', N'1953785418', N'122905583', N'Татьяна Сергеевна Королёваа', N'+7 (922) 375-49-21', N'belova.vikentii@konstantinova.net', N'agent_78.png', 82)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (93, N'Радио', 6, N'798718, Ленинградская область, город Пушкино, бульвар Балканская, 37', N'9077613654', N'657690787', N'Эмма Андреевна Колесникова', N'8-800-897-32-78', N'rtretykova@kozlov.ru', N'agent_43.png', 221)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (94, N'Креп', 4, N'336489, Калининградская область, город Можайск, наб. Славы, 35', N'4880732317', N'258673591', N'Назар Алексеевич Григорьева', N'(495) 217-46-29', N'savina.dominika@belousova.com', N'agent_39.png', 371)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (95, N'Мобайл', 2, N'606703, Амурская область, город Чехов, пл. Будапештсткая, 91', N'7803888520', N'885703265', N'Екатерина Сергеевна Бобылёва', N'8-800-618-73-37', N'dsiryev@dementeva.com', N'agent_107.png', 464)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (96, N'CибБашкирТекстиль', 1, N'429540, Мурманская область, город Воскресенск, пл. Славы, 36', N'7392007090', N'576103661', N'Григорий Владимирович Елисеева', N'(495) 285-78-38', N'vzimina@zdanova.com', N'1 (2).png', 215)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (97, N'МеталТекстильЛифтТрест', 1, N'786287, Свердловская область, город Волоколамск, пер. Будапештсткая, 72', N'2971553297', N'821859486', N'Одинцов Назар Борисович', N'(812) 753-96-76', N'muravev.trofim@sazonov.net', N'agent_86.png', 425)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (98, N'ОрионТомскТех', 6, N'738763, Курская область, город Егорьевск, спуск Чехова, 66', N'9351493429', N'583041591', N'Георгий Александрович Лукин', N'+7 (922) 542-89-15', N'faina.tikonova@veselov.com', N'agent_119.png', 73)
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (99, N'ЖелДорДизайнМетизТраст', 6, N'170549, Сахалинская область, город Видное, проезд Космонавтов, 89', N'7669116841', N'906390137', N'Игорь Львович Агафонова', N'(812) 123-63-47', N'lnikitina@kulikova.com', NULL, 290)
GO
INSERT [dbo].[Agent] ([AgentId], [AgentName], [AgentTypeId], [LegalAddress], [INN], [KPP], [ManagerFIO], [Phone], [Email], [Logo], [Priority]) VALUES (100, N'БухМясМоторПром', 2, N'677498, Костромская область, город Зарайск, спуск Славы, 59', N'7377410338', N'592041317', N'Нина Дмитриевна Черноваа', N'(35222) 83-23-59', N'varvara49@savin.ru', N'agent_95.png', 158)
SET IDENTITY_INSERT [dbo].[Agent] OFF
GO
SET IDENTITY_INSERT [dbo].[AgentType] ON 

INSERT [dbo].[AgentType] ([AgentTypeId], [AgentTypeName]) VALUES (1, N'МКК')
INSERT [dbo].[AgentType] ([AgentTypeId], [AgentTypeName]) VALUES (2, N'ОАО')
INSERT [dbo].[AgentType] ([AgentTypeId], [AgentTypeName]) VALUES (3, N'ООО')
INSERT [dbo].[AgentType] ([AgentTypeId], [AgentTypeName]) VALUES (4, N'ЗАО')
INSERT [dbo].[AgentType] ([AgentTypeId], [AgentTypeName]) VALUES (5, N'МФО')
INSERT [dbo].[AgentType] ([AgentTypeId], [AgentTypeName]) VALUES (6, N'ПАО')
SET IDENTITY_INSERT [dbo].[AgentType] OFF
GO
SET IDENTITY_INSERT [dbo].[Material] ON 

INSERT [dbo].[Material] ([MaterialId], [MaterialName], [MaterialTypeId], [CountInPack], [UnitTypeId], [MinimalCount], [Description], [Image], [Price], [Count]) VALUES (51, N'Патрон E27 пластиковый белый', 3, 1, 5, 1, N'Патрон E27 пластиковый белый', N'91.jpg', 120, 252)
INSERT [dbo].[Material] ([MaterialId], [MaterialName], [MaterialTypeId], [CountInPack], [UnitTypeId], [MinimalCount], [Description], [Image], [Price], [Count]) VALUES (52, N'Патрон E14 пластиковый белый (Италия)', 3, 2, 5, 5, N'Патрон E14 пластиковый белый (Италия)', N'12.jpg', 120, 980)
INSERT [dbo].[Material] ([MaterialId], [MaterialName], [MaterialTypeId], [CountInPack], [UnitTypeId], [MinimalCount], [Description], [Image], [Price], [Count]) VALUES (53, N'Кольцо патрона g9 купить', 5, 1, 5, 1, N'Материал сталь', N'113.jpg', 150, 299)
INSERT [dbo].[Material] ([MaterialId], [MaterialName], [MaterialTypeId], [CountInPack], [UnitTypeId], [MinimalCount], [Description], [Image], [Price], [Count]) VALUES (54, N'Трубка резьбовая М10х1 L30 мм (ниппель)', 5, 100, 5, 1, N'Трубка резьбовая М10х1 L30 мм (ниппель)', N'14.jpg', 120, 40)
INSERT [dbo].[Material] ([MaterialId], [MaterialName], [MaterialTypeId], [CountInPack], [UnitTypeId], [MinimalCount], [Description], [Image], [Price], [Count]) VALUES (55, N'Труба М10х1 латунь резьба на концах', 5, 10, 5, 1, N'длина 400 мм', N'15.jpg', 150, 109)
INSERT [dbo].[Material] ([MaterialId], [MaterialName], [MaterialTypeId], [CountInPack], [UnitTypeId], [MinimalCount], [Description], [Image], [Price], [Count]) VALUES (56, N'Пружина для плафона купить', 5, 4, 5, 4, N'Пружина для плафона купить', N'16.jpg', 150, 206)
INSERT [dbo].[Material] ([MaterialId], [MaterialName], [MaterialTypeId], [CountInPack], [UnitTypeId], [MinimalCount], [Description], [Image], [Price], [Count]) VALUES (57, N'Провод для люстры прозрачный двухжильный', 1, 10, 2, 10, N'Провод круглый двужильный прозрачный. Сечение: 2х0,75 мм.', N'17.jpg', 150, 200)
INSERT [dbo].[Material] ([MaterialId], [MaterialName], [MaterialTypeId], [CountInPack], [UnitTypeId], [MinimalCount], [Description], [Image], [Price], [Count]) VALUES (58, N'Провод для люстры прозрачный трёхжильный', 1, 1, 2, 1, N'Провод круглый двужильный прозрачный. Сечение: 3х0,75 мм.', N'18.jpg', 400, 1000)
INSERT [dbo].[Material] ([MaterialId], [MaterialName], [MaterialTypeId], [CountInPack], [UnitTypeId], [MinimalCount], [Description], [Image], [Price], [Count]) VALUES (59, N'Цанговый зажим для провода', 5, 3, 5, 3, N'Пластиковый зажим для провода. Ответная часть резьба М10х1.', N'19.jpg', 130, 105)
INSERT [dbo].[Material] ([MaterialId], [MaterialName], [MaterialTypeId], [CountInPack], [UnitTypeId], [MinimalCount], [Description], [Image], [Price], [Count]) VALUES (60, N'Провод с вилкой и выключателем. Белый', 1, 1, 5, 1, N'Провод с вилкой и выключателем. Белый', N'110.jpg', 400, 130)
INSERT [dbo].[Material] ([MaterialId], [MaterialName], [MaterialTypeId], [CountInPack], [UnitTypeId], [MinimalCount], [Description], [Image], [Price], [Count]) VALUES (61, N'Подвеска шар D20 мм', 2, 3, 5, 3, N'Подвеска шар D20 мм, янтарный', N'211.jpg', 80, 0)
INSERT [dbo].[Material] ([MaterialId], [MaterialName], [MaterialTypeId], [CountInPack], [UnitTypeId], [MinimalCount], [Description], [Image], [Price], [Count]) VALUES (62, N'Подвеска дубовый лист 38 мм', 2, 3, 5, 3, N'Подвеска дубовый лист 38 мм', N'212.jpg', 80, 100)
SET IDENTITY_INSERT [dbo].[Material] OFF
GO
SET IDENTITY_INSERT [dbo].[MaterialSupplier] ON 

INSERT [dbo].[MaterialSupplier] ([MaterialSupplierId], [MaterialId], [SupplierId], [Quality], [DeliveryDate], [Count]) VALUES (102, 51, 7, 56, CAST(N'2023-06-04T11:56:15.000' AS DateTime), 150)
SET IDENTITY_INSERT [dbo].[MaterialSupplier] OFF
GO
SET IDENTITY_INSERT [dbo].[MaterialType] ON 

INSERT [dbo].[MaterialType] ([MaterialTypeId], [MaterialTypeName]) VALUES (1, N'Провод')
INSERT [dbo].[MaterialType] ([MaterialTypeId], [MaterialTypeName]) VALUES (2, N'Подвеска')
INSERT [dbo].[MaterialType] ([MaterialTypeId], [MaterialTypeName]) VALUES (3, N'Патрон')
INSERT [dbo].[MaterialType] ([MaterialTypeId], [MaterialTypeName]) VALUES (4, N'Плафон')
INSERT [dbo].[MaterialType] ([MaterialTypeId], [MaterialTypeName]) VALUES (5, N'Крепеж')
SET IDENTITY_INSERT [dbo].[MaterialType] OFF
GO
SET IDENTITY_INSERT [dbo].[MaterialWriteOff] ON 

INSERT [dbo].[MaterialWriteOff] ([MaterialWriteOffId], [MaterialId], [Reason], [OperationDate], [Count]) VALUES (1, 51, N'Сломан', CAST(N'2023-06-04T11:56:42.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[MaterialWriteOff] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (101, N'bra-a-sl2', N'Бра с абажурами', 2, N'Количество лампочек: 2', N'5a1.jpg', 72, 80, 30, 1000, 300, 4, 7, 100, 23600)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (102, N'150', N'Торшер', 5, N'Тип патрона: Е27, мощность: 60 вт', N'1a2.jpg', 60, 150, 60, 6, 7, 5, 9, 100, 12300)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (103, N'Nast-a-b3', N'Настольная лампа с абажуром', 4, N'Настольная лампа с абажуром', N'1a3.jpg', 40, 80, 40, 1000, 1000, 5, 9, 100, 32500)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (104, N'Nast-a-st4', N'Настольная лампа с абажуром', 4, N'Мощность лампочки: 40 Ватт.', N'1a4.jpg', 40, 65, 40, 500, 500, 6, 2, 100, 19800)
INSERT [dbo].[Product] ([ProductId], [Artikul], [ProductName], [ProductTypeId], [Description], [Image], [Length], [Height], [Width], [Netto], [Brutto], [PeopleCount], [WorkshopId], [ProductionTime], [MinimalPrice]) VALUES (105, N'Bee Wall Sconce', N'Светильник декоративный пчела', 2, N'Количество лампочек: 2, Мощность лампочки: 5 Ватт', N'3a5.jpg', 30, 30, 30, 2000, 2000, 10, 5, 100, 31000)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductMaterial] ON 

INSERT [dbo].[ProductMaterial] ([ProductMaterialId], [ProductId], [MaterialId], [Count]) VALUES (102, 101, 54, 5)
INSERT [dbo].[ProductMaterial] ([ProductMaterialId], [ProductId], [MaterialId], [Count]) VALUES (103, 102, 59, 3)
INSERT [dbo].[ProductMaterial] ([ProductMaterialId], [ProductId], [MaterialId], [Count]) VALUES (104, 101, 58, 1)
INSERT [dbo].[ProductMaterial] ([ProductMaterialId], [ProductId], [MaterialId], [Count]) VALUES (105, 103, 51, 2)
INSERT [dbo].[ProductMaterial] ([ProductMaterialId], [ProductId], [MaterialId], [Count]) VALUES (106, 103, 59, 2)
INSERT [dbo].[ProductMaterial] ([ProductMaterialId], [ProductId], [MaterialId], [Count]) VALUES (107, 102, 61, 3)
INSERT [dbo].[ProductMaterial] ([ProductMaterialId], [ProductId], [MaterialId], [Count]) VALUES (108, 104, 52, 3)
INSERT [dbo].[ProductMaterial] ([ProductMaterialId], [ProductId], [MaterialId], [Count]) VALUES (109, 104, 58, 2)
INSERT [dbo].[ProductMaterial] ([ProductMaterialId], [ProductId], [MaterialId], [Count]) VALUES (110, 104, 56, 3)
INSERT [dbo].[ProductMaterial] ([ProductMaterialId], [ProductId], [MaterialId], [Count]) VALUES (111, 105, 51, 2)
INSERT [dbo].[ProductMaterial] ([ProductMaterialId], [ProductId], [MaterialId], [Count]) VALUES (112, 105, 57, 2)
INSERT [dbo].[ProductMaterial] ([ProductMaterialId], [ProductId], [MaterialId], [Count]) VALUES (113, 105, 59, 2)
SET IDENTITY_INSERT [dbo].[ProductMaterial] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductType] ON 

INSERT [dbo].[ProductType] ([ProductTypeId], [ProductTypeName]) VALUES (1, N'Люстры')
INSERT [dbo].[ProductType] ([ProductTypeId], [ProductTypeName]) VALUES (2, N'Бра')
INSERT [dbo].[ProductType] ([ProductTypeId], [ProductTypeName]) VALUES (3, N'Потолочные')
INSERT [dbo].[ProductType] ([ProductTypeId], [ProductTypeName]) VALUES (4, N'Настольные')
INSERT [dbo].[ProductType] ([ProductTypeId], [ProductTypeName]) VALUES (5, N'Торшеры')
SET IDENTITY_INSERT [dbo].[ProductType] OFF
GO
SET IDENTITY_INSERT [dbo].[SellHistory] ON 

INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (104, 2, 101, 2, CAST(N'2023-06-04' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (105, 3, 101, 5, CAST(N'2023-06-08' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (106, 54, 102, 5, CAST(N'2023-06-07' AS Date))
INSERT [dbo].[SellHistory] ([SellHistoryId], [AgentId], [ProductId], [Count], [Date]) VALUES (107, 54, 103, 6, CAST(N'2023-06-07' AS Date))
SET IDENTITY_INSERT [dbo].[SellHistory] OFF
GO
SET IDENTITY_INSERT [dbo].[Supplier] ON 

INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [INN], [SupplierTypeId], [Rate], [WorkDate]) VALUES (1, N'ГаражТелекомГор', N'1718185951', 1, 36, CAST(N'2011-12-20' AS Date))
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [INN], [SupplierTypeId], [Rate], [WorkDate]) VALUES (2, N'Компания Омск', N'1878504395', 2, 2, CAST(N'2012-09-13' AS Date))
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [INN], [SupplierTypeId], [Rate], [WorkDate]) VALUES (3, N'ГорМонтаж', N'1564667734', 3, 79, CAST(N'2016-12-23' AS Date))
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [INN], [SupplierTypeId], [Rate], [WorkDate]) VALUES (4, N'Микро', N'2293562756', 1, 64, CAST(N'2019-05-27' AS Date))
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [INN], [SupplierTypeId], [Rate], [WorkDate]) VALUES (5, N'Электро', N'1755853973', 4, 14, CAST(N'2015-06-16' AS Date))
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [INN], [SupplierTypeId], [Rate], [WorkDate]) VALUES (6, N'Компания Мотор', N'1429908355', 3, 50, CAST(N'2010-12-27' AS Date))
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [INN], [SupplierTypeId], [Rate], [WorkDate]) VALUES (7, N'Асбоцем', N'1944834477', 5, 20, CAST(N'2011-04-10' AS Date))
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [INN], [SupplierTypeId], [Rate], [WorkDate]) VALUES (8, N'ВостокМети', N'1488487851', 3, 58, CAST(N'2012-03-13' AS Date))
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [INN], [SupplierTypeId], [Rate], [WorkDate]) VALUES (9, N'МясКрепТеле', N'2152486844', 6, 59, CAST(N'2018-11-11' AS Date))
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [INN], [SupplierTypeId], [Rate], [WorkDate]) VALUES (10, N'Софт', N'1036521658', 1, 67, CAST(N'2011-11-23' AS Date))
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [INN], [SupplierTypeId], [Rate], [WorkDate]) VALUES (11, N'Компания СервисМикроО', N'1178826599', 3, 5, CAST(N'2012-07-07' AS Date))
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [INN], [SupplierTypeId], [Rate], [WorkDate]) VALUES (12, N'ИнфоГазМотор', N'1954050214', 2, 42, CAST(N'2011-07-23' AS Date))
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [INN], [SupplierTypeId], [Rate], [WorkDate]) VALUES (13, N'Монтаж', N'1163880101', 2, 10, CAST(N'2016-05-23' AS Date))
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [INN], [SupplierTypeId], [Rate], [WorkDate]) VALUES (14, N'ЭлектроЦвет', N'1654184411', 2, 3, CAST(N'2015-06-25' AS Date))
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [INN], [SupplierTypeId], [Rate], [WorkDate]) VALUES (15, N'Компания НефтьITИнф', N'1685247455', 3, 85, CAST(N'2017-03-09' AS Date))
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [INN], [SupplierTypeId], [Rate], [WorkDate]) VALUES (16, N'ТомскНефть', N'1002996016', 3, 95, CAST(N'2015-05-07' AS Date))
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [INN], [SupplierTypeId], [Rate], [WorkDate]) VALUES (17, N'ТомскТяжРеч', N'1102143492', 5, 36, CAST(N'2014-12-22' AS Date))
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [INN], [SupplierTypeId], [Rate], [WorkDate]) VALUES (18, N'УралХме', N'2291253256', 3, 82, CAST(N'2015-05-22' AS Date))
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [INN], [SupplierTypeId], [Rate], [WorkDate]) VALUES (19, N'ВодРыб', N'1113468466', 4, 21, CAST(N'2011-11-25' AS Date))
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [INN], [SupplierTypeId], [Rate], [WorkDate]) VALUES (20, N'УралСервисМон', N'1892306757', 1, 26, CAST(N'2016-12-20' AS Date))
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [INN], [SupplierTypeId], [Rate], [WorkDate]) VALUES (21, N'Казань', N'1965011544', 2, 51, CAST(N'2015-03-16' AS Date))
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [INN], [SupplierTypeId], [Rate], [WorkDate]) VALUES (22, N'Сибурка', N'1949139718', 4, 80, CAST(N'2011-11-09' AS Date))
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [INN], [SupplierTypeId], [Rate], [WorkDate]) VALUES (23, N'ГаражГазМ', N'1740623312', 2, 86, CAST(N'2011-11-20' AS Date))
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [INN], [SupplierTypeId], [Rate], [WorkDate]) VALUES (24, N'МобайлДизайнОмск', N'1014490629', 3, 73, CAST(N'2019-10-28' AS Date))
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [INN], [SupplierTypeId], [Rate], [WorkDate]) VALUES (25, N'КвадроЛюкс', N'1255275062', 5, 76, CAST(N'2014-09-04' AS Date))
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [INN], [SupplierTypeId], [Rate], [WorkDate]) VALUES (26, N'ТверьБухГаз', N'2167673760', 2, 9, CAST(N'2013-11-13' AS Date))
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [INN], [SupplierTypeId], [Rate], [WorkDate]) VALUES (27, N'ТелекомТранс', N'2200735978', 2, 8, CAST(N'2015-01-11' AS Date))
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [INN], [SupplierTypeId], [Rate], [WorkDate]) VALUES (28, N'ГаражГлав', N'1404774111', 1, 89, CAST(N'2013-06-28' AS Date))
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [INN], [SupplierTypeId], [Rate], [WorkDate]) VALUES (29, N'Компания К', N'1468114280', 6, 70, CAST(N'2018-12-07' AS Date))
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [INN], [SupplierTypeId], [Rate], [WorkDate]) VALUES (30, N'ТяжЛифтВостокС', N'1032089879', 2, 66, CAST(N'2012-08-13' AS Date))
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [INN], [SupplierTypeId], [Rate], [WorkDate]) VALUES (31, N'Компания Во', N'2027005945', 6, 11, CAST(N'2016-06-22' AS Date))
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [INN], [SupplierTypeId], [Rate], [WorkDate]) VALUES (32, N'МоторКаз', N'1076279398', 2, 37, CAST(N'2015-08-23' AS Date))
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [INN], [SupplierTypeId], [Rate], [WorkDate]) VALUES (33, N'Сервис', N'2031832854', 2, 25, CAST(N'2011-11-25' AS Date))
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [INN], [SupplierTypeId], [Rate], [WorkDate]) VALUES (34, N'ЮпитерТомс', N'1551173338', 6, 60, CAST(N'2011-07-28' AS Date))
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [INN], [SupplierTypeId], [Rate], [WorkDate]) VALUES (35, N'Мор', N'1906157177', 1, 82, CAST(N'2011-03-06' AS Date))
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [INN], [SupplierTypeId], [Rate], [WorkDate]) VALUES (36, N'СеверТехВостокЛизинг', N'1846812080', 3, 30, CAST(N'2011-02-26' AS Date))
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [INN], [SupplierTypeId], [Rate], [WorkDate]) VALUES (37, N'ЦементОбл', N'2021607106', 3, 42, CAST(N'2015-10-03' AS Date))
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [INN], [SupplierTypeId], [Rate], [WorkDate]) VALUES (38, N'Компания КазаньАвтоCиб', N'1371692583', 1, 23, CAST(N'2015-10-19' AS Date))
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [INN], [SupplierTypeId], [Rate], [WorkDate]) VALUES (39, N'ГаражХозФлот', N'2164720385', 2, 7, CAST(N'2018-08-28' AS Date))
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [INN], [SupplierTypeId], [Rate], [WorkDate]) VALUES (40, N'Компания МорМетал', N'1947163072', 3, 33, CAST(N'2013-11-18' AS Date))
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [INN], [SupplierTypeId], [Rate], [WorkDate]) VALUES (41, N'ГлавРыб', N'1426268088', 5, 46, CAST(N'2018-11-09' AS Date))
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [INN], [SupplierTypeId], [Rate], [WorkDate]) VALUES (42, N'CибCибОрио', N'1988313615', 3, 95, CAST(N'2018-01-13' AS Date))
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [INN], [SupplierTypeId], [Rate], [WorkDate]) VALUES (43, N'ТелеРыбХм', N'2299034130', 3, 3, CAST(N'2012-02-10' AS Date))
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [INN], [SupplierTypeId], [Rate], [WorkDate]) VALUES (44, N'ГлавАвтоГазТрест', N'2059691335', 5, 18, CAST(N'2014-08-04' AS Date))
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [INN], [SupplierTypeId], [Rate], [WorkDate]) VALUES (45, N'ТяжКазаньБашкир', N'1794419510', 6, 85, CAST(N'2015-12-22' AS Date))
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [INN], [SupplierTypeId], [Rate], [WorkDate]) VALUES (46, N'Асбоцемент', N'1650212184', 5, 80, CAST(N'2018-12-09' AS Date))
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [INN], [SupplierTypeId], [Rate], [WorkDate]) VALUES (47, N'Мотор', N'1019917089', 6, 19, CAST(N'2017-04-24' AS Date))
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [INN], [SupplierTypeId], [Rate], [WorkDate]) VALUES (48, N'МорФинансФинансМаш', N'1549496316', 3, 68, CAST(N'2013-06-18' AS Date))
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [INN], [SupplierTypeId], [Rate], [WorkDate]) VALUES (49, N'РыбВектор', N'2275526397', 2, 92, CAST(N'2011-06-20' AS Date))
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [INN], [SupplierTypeId], [Rate], [WorkDate]) VALUES (50, N'Теле', N'2170198203', 6, 11, CAST(N'2010-05-01' AS Date))
SET IDENTITY_INSERT [dbo].[Supplier] OFF
GO
SET IDENTITY_INSERT [dbo].[SupplierType] ON 

INSERT [dbo].[SupplierType] ([SupplierTypeId], [SupplierTypeName]) VALUES (1, N' МКК')
INSERT [dbo].[SupplierType] ([SupplierTypeId], [SupplierTypeName]) VALUES (2, N' ОАО')
INSERT [dbo].[SupplierType] ([SupplierTypeId], [SupplierTypeName]) VALUES (3, N' ООО')
INSERT [dbo].[SupplierType] ([SupplierTypeId], [SupplierTypeName]) VALUES (4, N' ЗАО')
INSERT [dbo].[SupplierType] ([SupplierTypeId], [SupplierTypeName]) VALUES (5, N' МФО')
INSERT [dbo].[SupplierType] ([SupplierTypeId], [SupplierTypeName]) VALUES (6, N' ПАО')
SET IDENTITY_INSERT [dbo].[SupplierType] OFF
GO
SET IDENTITY_INSERT [dbo].[UnitType] ON 

INSERT [dbo].[UnitType] ([UnitTypeId], [UnitTypeName]) VALUES (1, N'л')
INSERT [dbo].[UnitType] ([UnitTypeId], [UnitTypeName]) VALUES (2, N'м')
INSERT [dbo].[UnitType] ([UnitTypeId], [UnitTypeName]) VALUES (3, N'г')
INSERT [dbo].[UnitType] ([UnitTypeId], [UnitTypeName]) VALUES (4, N'кг')
INSERT [dbo].[UnitType] ([UnitTypeId], [UnitTypeName]) VALUES (5, N'шт.')
SET IDENTITY_INSERT [dbo].[UnitType] OFF
GO
SET IDENTITY_INSERT [dbo].[Workshop] ON 

INSERT [dbo].[Workshop] ([WorkshopId], [WorkshopName]) VALUES (1, N'1')
INSERT [dbo].[Workshop] ([WorkshopId], [WorkshopName]) VALUES (2, N'2')
INSERT [dbo].[Workshop] ([WorkshopId], [WorkshopName]) VALUES (3, N'3')
INSERT [dbo].[Workshop] ([WorkshopId], [WorkshopName]) VALUES (4, N'4')
INSERT [dbo].[Workshop] ([WorkshopId], [WorkshopName]) VALUES (5, N'5')
INSERT [dbo].[Workshop] ([WorkshopId], [WorkshopName]) VALUES (6, N'6')
INSERT [dbo].[Workshop] ([WorkshopId], [WorkshopName]) VALUES (7, N'7')
INSERT [dbo].[Workshop] ([WorkshopId], [WorkshopName]) VALUES (8, N'8')
INSERT [dbo].[Workshop] ([WorkshopId], [WorkshopName]) VALUES (9, N'9')
INSERT [dbo].[Workshop] ([WorkshopId], [WorkshopName]) VALUES (10, N'10')
SET IDENTITY_INSERT [dbo].[Workshop] OFF
GO
ALTER TABLE [dbo].[Agent]  WITH CHECK ADD  CONSTRAINT [FK_Agents_AgentTypes] FOREIGN KEY([AgentTypeId])
REFERENCES [dbo].[AgentType] ([AgentTypeId])
GO
ALTER TABLE [dbo].[Agent] CHECK CONSTRAINT [FK_Agents_AgentTypes]
GO
ALTER TABLE [dbo].[AgentPoint]  WITH CHECK ADD  CONSTRAINT [FK_AgentPoints_Agents] FOREIGN KEY([AgentId])
REFERENCES [dbo].[Agent] ([AgentId])
GO
ALTER TABLE [dbo].[AgentPoint] CHECK CONSTRAINT [FK_AgentPoints_Agents]
GO
ALTER TABLE [dbo].[Material]  WITH CHECK ADD  CONSTRAINT [FK_Materials_MaterialTypes] FOREIGN KEY([MaterialTypeId])
REFERENCES [dbo].[MaterialType] ([MaterialTypeId])
GO
ALTER TABLE [dbo].[Material] CHECK CONSTRAINT [FK_Materials_MaterialTypes]
GO
ALTER TABLE [dbo].[Material]  WITH CHECK ADD  CONSTRAINT [FK_Materials_UnitTypes] FOREIGN KEY([UnitTypeId])
REFERENCES [dbo].[UnitType] ([UnitTypeId])
GO
ALTER TABLE [dbo].[Material] CHECK CONSTRAINT [FK_Materials_UnitTypes]
GO
ALTER TABLE [dbo].[MaterialSupplier]  WITH CHECK ADD  CONSTRAINT [FK_MaterialSuppliers_Materials] FOREIGN KEY([MaterialId])
REFERENCES [dbo].[Material] ([MaterialId])
GO
ALTER TABLE [dbo].[MaterialSupplier] CHECK CONSTRAINT [FK_MaterialSuppliers_Materials]
GO
ALTER TABLE [dbo].[MaterialSupplier]  WITH CHECK ADD  CONSTRAINT [FK_MaterialSuppliers_Suppliers] FOREIGN KEY([SupplierId])
REFERENCES [dbo].[Supplier] ([SupplierId])
GO
ALTER TABLE [dbo].[MaterialSupplier] CHECK CONSTRAINT [FK_MaterialSuppliers_Suppliers]
GO
ALTER TABLE [dbo].[MaterialWriteOff]  WITH CHECK ADD  CONSTRAINT [FK_MaterialWarehouse_Materials1] FOREIGN KEY([MaterialId])
REFERENCES [dbo].[Material] ([MaterialId])
GO
ALTER TABLE [dbo].[MaterialWriteOff] CHECK CONSTRAINT [FK_MaterialWarehouse_Materials1]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Agents] FOREIGN KEY([AgentId])
REFERENCES [dbo].[Agent] ([AgentId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Orders_Agents]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK_OrderProducts_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK_OrderProducts_Products]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK_Sell_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([OrderId])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK_Sell_Orders]
GO
ALTER TABLE [dbo].[PriceHistory]  WITH CHECK ADD  CONSTRAINT [FK_AgentProducts_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[PriceHistory] CHECK CONSTRAINT [FK_AgentProducts_Products]
GO
ALTER TABLE [dbo].[PriorityHistory]  WITH CHECK ADD  CONSTRAINT [FK_PriorityHistories_Agents] FOREIGN KEY([AgentId])
REFERENCES [dbo].[Agent] ([AgentId])
GO
ALTER TABLE [dbo].[PriorityHistory] CHECK CONSTRAINT [FK_PriorityHistories_Agents]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Products_ProductTypes] FOREIGN KEY([ProductTypeId])
REFERENCES [dbo].[ProductType] ([ProductTypeId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Products_ProductTypes]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Products_Workshops] FOREIGN KEY([WorkshopId])
REFERENCES [dbo].[Workshop] ([WorkshopId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Products_Workshops]
GO
ALTER TABLE [dbo].[ProductMaterial]  WITH CHECK ADD  CONSTRAINT [FK_ProductMaterials_Materials] FOREIGN KEY([MaterialId])
REFERENCES [dbo].[Material] ([MaterialId])
GO
ALTER TABLE [dbo].[ProductMaterial] CHECK CONSTRAINT [FK_ProductMaterials_Materials]
GO
ALTER TABLE [dbo].[ProductMaterial]  WITH CHECK ADD  CONSTRAINT [FK_ProductMaterials_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[ProductMaterial] CHECK CONSTRAINT [FK_ProductMaterials_Products]
GO
ALTER TABLE [dbo].[SellHistory]  WITH CHECK ADD  CONSTRAINT [FK_SellHistories_Agents] FOREIGN KEY([AgentId])
REFERENCES [dbo].[Agent] ([AgentId])
GO
ALTER TABLE [dbo].[SellHistory] CHECK CONSTRAINT [FK_SellHistories_Agents]
GO
ALTER TABLE [dbo].[SellHistory]  WITH CHECK ADD  CONSTRAINT [FK_SellHistories_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[SellHistory] CHECK CONSTRAINT [FK_SellHistories_Products]
GO
ALTER TABLE [dbo].[Supplier]  WITH CHECK ADD  CONSTRAINT [FK_Suppliers_SupplierTypes] FOREIGN KEY([SupplierTypeId])
REFERENCES [dbo].[SupplierType] ([SupplierTypeId])
GO
ALTER TABLE [dbo].[Supplier] CHECK CONSTRAINT [FK_Suppliers_SupplierTypes]
GO
USE [master]
GO
ALTER DATABASE [SvetlychokBD] SET  READ_WRITE 
GO
