USE [master]
GO
/****** Object:  Database [DB_A3CE37_locapi]    Script Date: 19-06-2020 02:01:10 PM ******/
CREATE DATABASE [DB_A3CE37_locapi]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB_A3CE37_locapi_Data', FILENAME = N'H:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\DB_A3CE37_locapi_DATA.mdf' , SIZE = 8192KB , MAXSIZE = 51200KB , FILEGROWTH = 10%)
 LOG ON 
( NAME = N'DB_A3CE37_locapi_Log', FILENAME = N'H:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\DB_A3CE37_locapi_Log.LDF' , SIZE = 3072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DB_A3CE37_locapi] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB_A3CE37_locapi].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB_A3CE37_locapi] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB_A3CE37_locapi] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB_A3CE37_locapi] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB_A3CE37_locapi] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB_A3CE37_locapi] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB_A3CE37_locapi] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DB_A3CE37_locapi] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB_A3CE37_locapi] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB_A3CE37_locapi] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB_A3CE37_locapi] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB_A3CE37_locapi] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB_A3CE37_locapi] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB_A3CE37_locapi] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB_A3CE37_locapi] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB_A3CE37_locapi] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DB_A3CE37_locapi] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB_A3CE37_locapi] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB_A3CE37_locapi] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB_A3CE37_locapi] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB_A3CE37_locapi] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB_A3CE37_locapi] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DB_A3CE37_locapi] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB_A3CE37_locapi] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DB_A3CE37_locapi] SET  MULTI_USER 
GO
ALTER DATABASE [DB_A3CE37_locapi] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB_A3CE37_locapi] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB_A3CE37_locapi] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB_A3CE37_locapi] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DB_A3CE37_locapi] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DB_A3CE37_locapi] SET QUERY_STORE = OFF
GO
USE [DB_A3CE37_locapi]
GO
/****** Object:  Table [dbo].[Again]    Script Date: 19-06-2020 02:01:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Again](
	[againid] [int] IDENTITY(1,1) NOT NULL,
	[project_name] [nvarchar](100) NULL,
	[value] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[againid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[callerdetail]    Script Date: 19-06-2020 02:01:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[callerdetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[Mobile] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 19-06-2020 02:01:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[Message] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[employee]    Script Date: 19-06-2020 02:01:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employee](
	[eid] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[phone] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[latitude] [nvarchar](50) NOT NULL,
	[longitude] [nvarchar](50) NOT NULL,
	[profilePic] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[eid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Faq]    Script Date: 19-06-2020 02:01:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Faq](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Question] [nvarchar](255) NULL,
	[Answer] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PartyUsers]    Script Date: 19-06-2020 02:01:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PartyUsers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Gender] [nvarchar](255) NULL,
	[DOB] [nvarchar](255) NULL,
	[Mobile] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[Otp] [nvarchar](255) NULL,
	[Password] [nvarchar](255) NULL,
	[ProfilePic] [nvarchar](255) NULL,
	[deviceToken] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Privacy]    Script Date: 19-06-2020 02:01:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Privacy](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Heading] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 19-06-2020 02:01:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[C_Id] [nvarchar](20) NULL,
	[P_Name] [nvarchar](255) NULL,
	[P_Pic] [nvarchar](255) NULL,
	[P_Desc] [nvarchar](255) NULL,
	[P_price] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[property]    Script Date: 19-06-2020 02:01:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[property](
	[pid] [int] IDENTITY(1,1) NOT NULL,
	[eid] [int] NULL,
	[owner_type] [nvarchar](50) NULL,
	[title] [nvarchar](50) NULL,
	[mobile_1] [nvarchar](255) NULL,
	[mobile_2] [nvarchar](255) NULL,
	[description] [nvarchar](255) NULL,
	[latitude] [nvarchar](50) NULL,
	[longitude] [nvarchar](50) NULL,
	[area] [nvarchar](50) NULL,
	[area_type] [nvarchar](50) NULL,
	[rent] [nvarchar](50) NULL,
	[width] [nvarchar](50) NULL,
	[length] [nvarchar](50) NULL,
	[shopno] [nvarchar](50) NULL,
	[eload] [nvarchar](50) NULL,
	[water_point] [nvarchar](50) NULL,
	[security_deposite] [nvarchar](50) NULL,
	[address] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[propertyPics]    Script Date: 19-06-2020 02:01:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[propertyPics](
	[picid] [int] IDENTITY(1,1) NOT NULL,
	[pid] [int] NULL,
	[filename] [nvarchar](50) NULL,
	[filetype] [nvarchar](50) NULL,
	[filesize] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 19-06-2020 02:01:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[C_Name] [nvarchar](255) NULL,
	[C_Pic] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TandC]    Script Date: 19-06-2020 02:01:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TandC](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Heading] [nvarchar](255) NULL,
	[Tc1] [nvarchar](255) NULL,
	[Tc2] [nvarchar](255) NULL,
	[Tc3] [nvarchar](255) NULL,
	[Tc4] [nvarchar](255) NULL,
	[Tc5] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCart]    Script Date: 19-06-2020 02:01:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCart](
	[cartid] [int] IDENTITY(1,1) NOT NULL,
	[Pid] [nvarchar](20) NULL,
	[Uid] [nvarchar](20) NULL,
	[count] [nvarchar](255) NULL,
	[oid] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[cartid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbleOrder]    Script Date: 19-06-2020 02:01:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbleOrder](
	[orderid] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[orderamount] [nvarchar](255) NULL,
	[paymode] [nvarchar](255) NULL,
	[email] [nvarchar](255) NULL,
	[phonenumber] [nvarchar](255) NULL,
	[address] [nvarchar](255) NULL,
	[date] [nvarchar](255) NULL,
	[time] [nvarchar](255) NULL,
	[uid] [nvarchar](250) NULL,
	[orderstatus] [nvarchar](250) NULL,
	[status] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[orderid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[womensafetyTandC]    Script Date: 19-06-2020 02:01:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[womensafetyTandC](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Heading] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[womenSafetyUser]    Script Date: 19-06-2020 02:01:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[womenSafetyUser](
	[USER_ID] [int] IDENTITY(1,1) NOT NULL,
	[Full_Name] [nvarchar](255) NULL,
	[Phone] [nvarchar](255) NULL,
	[email] [nvarchar](255) NULL,
	[address] [nvarchar](255) NULL,
	[password] [nvarchar](255) NULL,
	[otp] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[USER_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Again] ON 

INSERT [dbo].[Again] ([againid], [project_name], [value]) VALUES (1, N'teleMedicine', N'0')
SET IDENTITY_INSERT [dbo].[Again] OFF
GO
SET IDENTITY_INSERT [dbo].[callerdetail] ON 

INSERT [dbo].[callerdetail] ([Id], [Name], [Email], [Mobile], [Address]) VALUES (1, N'Aditya', N'aditya@gmail.com', N'9871949688', N'Rohini Delhi')
INSERT [dbo].[callerdetail] ([Id], [Name], [Email], [Mobile], [Address]) VALUES (2, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[callerdetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Contact] ON 

INSERT [dbo].[Contact] ([Id], [Name], [Email], [Message]) VALUES (1, N'Aditya', N'aditya', N'helloqwertyuiop')
INSERT [dbo].[Contact] ([Id], [Name], [Email], [Message]) VALUES (2, N'Aditya', N'aditya@gmail.com', N'helloqwertyuiop')
INSERT [dbo].[Contact] ([Id], [Name], [Email], [Message]) VALUES (3, N'aditya ', N'adi@gmail.com', N'hyy')
INSERT [dbo].[Contact] ([Id], [Name], [Email], [Message]) VALUES (4, N'', N'', N'')
INSERT [dbo].[Contact] ([Id], [Name], [Email], [Message]) VALUES (5, N'', N'', N'')
INSERT [dbo].[Contact] ([Id], [Name], [Email], [Message]) VALUES (6, N'', N'', N'')
INSERT [dbo].[Contact] ([Id], [Name], [Email], [Message]) VALUES (7, N'', N'', N'')
INSERT [dbo].[Contact] ([Id], [Name], [Email], [Message]) VALUES (8, N'dfghg', N'ghghgh', N'hghg')
INSERT [dbo].[Contact] ([Id], [Name], [Email], [Message]) VALUES (9, N'djf', N'sjsj', N'djj')
INSERT [dbo].[Contact] ([Id], [Name], [Email], [Message]) VALUES (10, N'fff', N'tt', N'ccc')
SET IDENTITY_INSERT [dbo].[Contact] OFF
GO
SET IDENTITY_INSERT [dbo].[employee] ON 

INSERT [dbo].[employee] ([eid], [name], [email], [phone], [password], [latitude], [longitude], [profilePic]) VALUES (1, N'Ashutosh', N'ashutosh.v2infotech@gmail.com', N'9630258741', N'123456', N'28.5872391', N'77.3165992', N'hairstyle.jpg')
SET IDENTITY_INSERT [dbo].[employee] OFF
GO
SET IDENTITY_INSERT [dbo].[Faq] ON 

INSERT [dbo].[Faq] ([Id], [Question], [Answer]) VALUES (3, NULL, NULL)
INSERT [dbo].[Faq] ([Id], [Question], [Answer]) VALUES (4, N'why to choose us ?', N'Because we are the best.')
INSERT [dbo].[Faq] ([Id], [Question], [Answer]) VALUES (5, N'why to choose us ?', N'Because we are the best.')
INSERT [dbo].[Faq] ([Id], [Question], [Answer]) VALUES (6, N'question 2', N'answer two')
INSERT [dbo].[Faq] ([Id], [Question], [Answer]) VALUES (7, N'question 3', N'hello ques.')
SET IDENTITY_INSERT [dbo].[Faq] OFF
GO
SET IDENTITY_INSERT [dbo].[PartyUsers] ON 

INSERT [dbo].[PartyUsers] ([Id], [Name], [Gender], [DOB], [Mobile], [Email], [Otp], [Password], [ProfilePic], [deviceToken]) VALUES (1, N'abhi', N'Male', N'01/01/1990', N'9627499853', N'abc@gmail.com', N'9468', N'1234', N'', N'ljhasfdnnlzs568794544')
INSERT [dbo].[PartyUsers] ([Id], [Name], [Gender], [DOB], [Mobile], [Email], [Otp], [Password], [ProfilePic], [deviceToken]) VALUES (31, N'adi', N'Male', N'01/01/1990', N'9871949688', N'ashu@gmail.com', N'3542', N'123456', N'', N'ljhasfdnnlzs568794544')
INSERT [dbo].[PartyUsers] ([Id], [Name], [Gender], [DOB], [Mobile], [Email], [Otp], [Password], [ProfilePic], [deviceToken]) VALUES (32, N'ashutoshjais', N'Male', N'01/01/1990', N'8299727845', N'abc@gmail.com', N'7286', N'1234', N'eda2abc1-5598-417e-8c88-072950cf5de94568833951170230837.jpg', N'ljhasfdnnlzs568794544')
INSERT [dbo].[PartyUsers] ([Id], [Name], [Gender], [DOB], [Mobile], [Email], [Otp], [Password], [ProfilePic], [deviceToken]) VALUES (33, N'abhay', N'Male', N'01/01/1990', N'1212121212', N'abc@gmail.com', N'2331', N'1234', N'79ae3c05-a086-4208-9b96-3953cfbea04a943499707.jpg', N'ljhasfdnnlzs568794544')
INSERT [dbo].[PartyUsers] ([Id], [Name], [Gender], [DOB], [Mobile], [Email], [Otp], [Password], [ProfilePic], [deviceToken]) VALUES (34, N'mani', N'Male', N'01/01/1990', N'3434343434', N'abc@gmail.com', N'3111', N'1234', N'85d7ddc0-c21f-4951-b5df-7cad60d37e02372049849.jpg', N'ljhasfdnnlzs568794544')
INSERT [dbo].[PartyUsers] ([Id], [Name], [Gender], [DOB], [Mobile], [Email], [Otp], [Password], [ProfilePic], [deviceToken]) VALUES (35, N'adityajais', N'Male', N'01/01/1990', N'5656565656', N'abc@gmail.com', N'1596', N'1234', N'Screenshot_2020-03-20-13-25-22-462_com.example.parentbustracker.jpg', N'ljhasfdnnlzs568794544')
INSERT [dbo].[PartyUsers] ([Id], [Name], [Gender], [DOB], [Mobile], [Email], [Otp], [Password], [ProfilePic], [deviceToken]) VALUES (36, N'raju', N'Male', N'01/01/1990', N'4545454545', N'abc@gmail.com', N'7525', N'1234', N'IMG-20200316-WA0017.jpg', N'ljhasfdnnlzs568794544')
INSERT [dbo].[PartyUsers] ([Id], [Name], [Gender], [DOB], [Mobile], [Email], [Otp], [Password], [ProfilePic], [deviceToken]) VALUES (39, N'laxman', N'Male', N'01/01/1990', N'4545454547', N'abc@gmail.com', N'5861', N'1234', N'', N'ljhasfdnnlzs568794544')
INSERT [dbo].[PartyUsers] ([Id], [Name], [Gender], [DOB], [Mobile], [Email], [Otp], [Password], [ProfilePic], [deviceToken]) VALUES (40, N'rakesh', N'Male', N'01/01/1990', N'3333333333', N'abc@gmail.com', N'6241', N'1234', N'', N'ljhasfdnnlzs568794544')
INSERT [dbo].[PartyUsers] ([Id], [Name], [Gender], [DOB], [Mobile], [Email], [Otp], [Password], [ProfilePic], [deviceToken]) VALUES (41, N'addd', N'Male', N'01/01/1990', N'8888888888', N'abc@gmail.com', N'2148', N'addd', N'f32c8c67-f36b-4174-8a9b-0da3432b38b850383393.jpg', N'ljhasfdnnlzs568794544')
INSERT [dbo].[PartyUsers] ([Id], [Name], [Gender], [DOB], [Mobile], [Email], [Otp], [Password], [ProfilePic], [deviceToken]) VALUES (42, N'abbishek', N'Male', N'01/01/1990', N'9999955555', N'abc@gmail.com', N'8577', N'Abhishek@123', N'image_picker7462855678188044706.jpg', N'ljhasfdnnlzs568794544')
INSERT [dbo].[PartyUsers] ([Id], [Name], [Gender], [DOB], [Mobile], [Email], [Otp], [Password], [ProfilePic], [deviceToken]) VALUES (44, N'aditya', N'Male', N'01/01/1990', N'7404340561', N'abc@gmail.com', N'1993', N'Aditya@123', N'image_picker5468508825237848110.jpg', N'ljhasfdnnlzs568794544')
INSERT [dbo].[PartyUsers] ([Id], [Name], [Gender], [DOB], [Mobile], [Email], [Otp], [Password], [ProfilePic], [deviceToken]) VALUES (48, N'ashutoshh', N'Male', N'01/01/1990', N'7878787878', N'abc@gmail.com', N'3707', N'123456', N'd28bc717-cd52-498a-af1b-92e879853f011253147568.jpg', N'ljhasfdnnlzs568794544')
INSERT [dbo].[PartyUsers] ([Id], [Name], [Gender], [DOB], [Mobile], [Email], [Otp], [Password], [ProfilePic], [deviceToken]) VALUES (51, N'abhichauhan', N'Male', N'01/01/1990', N'8888855555', N'abc@gmail.com', N'0945', N'Abhi', N'', N'ljhasfdnnlzs568794544')
SET IDENTITY_INSERT [dbo].[PartyUsers] OFF
GO
SET IDENTITY_INSERT [dbo].[Privacy] ON 

INSERT [dbo].[Privacy] ([Id], [Heading]) VALUES (6, N'dffgfg')
INSERT [dbo].[Privacy] ([Id], [Heading]) VALUES (7, N'new privacy added')
INSERT [dbo].[Privacy] ([Id], [Heading]) VALUES (8, N'Information recieved by us from your registration on business-standard.com or other digital products 
of Business Standard will be used by business Standard in accordance with our Privacy Policy. Kindly read the below mentioned details.')
SET IDENTITY_INSERT [dbo].[Privacy] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [C_Id], [P_Name], [P_Pic], [P_Desc], [P_price]) VALUES (1, N'1', N'Plate', N'cat.jpg', N'this is plate', N'100')
INSERT [dbo].[Product] ([Id], [C_Id], [P_Name], [P_Pic], [P_Desc], [P_price]) VALUES (2, NULL, NULL, N'africa-en-galaxy-a80-a805-sm-a805fzkdxfe-frontblack-171210134.jpg', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[property] ON 

INSERT [dbo].[property] ([pid], [eid], [owner_type], [title], [mobile_1], [mobile_2], [description], [latitude], [longitude], [area], [area_type], [rent], [width], [length], [shopno], [eload], [water_point], [security_deposite], [address]) VALUES (1, 1, N'N.A', N'TITLE', N'2555255555', N'5855555555', N'', N'28.58533821', N'77.3143589', N' N.A', N'N.A', N'588', N' N.A', N' N.A', N'35', N' N.A', N'N.A', N'588', N'B-64, B Block, Sector 2, Noida, Uttar Pradesh 2013')
SET IDENTITY_INSERT [dbo].[property] OFF
GO
SET IDENTITY_INSERT [dbo].[Service] ON 

INSERT [dbo].[Service] ([Id], [C_Name], [C_Pic]) VALUES (1, N'CROCKERY', N'crockery.jpg')
INSERT [dbo].[Service] ([Id], [C_Name], [C_Pic]) VALUES (2, N'WAITERS', N'waiters.jpg')
INSERT [dbo].[Service] ([Id], [C_Name], [C_Pic]) VALUES (3, N'CATERING SERVICES', N'catering.jpg')
INSERT [dbo].[Service] ([Id], [C_Name], [C_Pic]) VALUES (4, N'HOUSE DECORATION', N'decoration.jpg')
SET IDENTITY_INSERT [dbo].[Service] OFF
GO
SET IDENTITY_INSERT [dbo].[TandC] ON 

INSERT [dbo].[TandC] ([Id], [Heading], [Tc1], [Tc2], [Tc3], [Tc4], [Tc5]) VALUES (2, N'dZFKahdf j xzbdhjznn', N'ghdsf', N'zdfjhg', N'dsafjshg', N'afshdf', N'dsjdfbhj')
INSERT [dbo].[TandC] ([Id], [Heading], [Tc1], [Tc2], [Tc3], [Tc4], [Tc5]) VALUES (3, N'dfgfg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TandC] ([Id], [Heading], [Tc1], [Tc2], [Tc3], [Tc4], [Tc5]) VALUES (4, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TandC] ([Id], [Heading], [Tc1], [Tc2], [Tc3], [Tc4], [Tc5]) VALUES (5, N't&c', N'one', N'two', N'three', N'four', N'five')
SET IDENTITY_INSERT [dbo].[TandC] OFF
GO
SET IDENTITY_INSERT [dbo].[tblCart] ON 

INSERT [dbo].[tblCart] ([cartid], [Pid], [Uid], [count], [oid]) VALUES (1, N'1', N'1', N'1', NULL)
INSERT [dbo].[tblCart] ([cartid], [Pid], [Uid], [count], [oid]) VALUES (2, N'1', N'32', N'1', NULL)
INSERT [dbo].[tblCart] ([cartid], [Pid], [Uid], [count], [oid]) VALUES (3, N'1', N'35', N'1', NULL)
INSERT [dbo].[tblCart] ([cartid], [Pid], [Uid], [count], [oid]) VALUES (4, N'1', N'40', N'1', NULL)
INSERT [dbo].[tblCart] ([cartid], [Pid], [Uid], [count], [oid]) VALUES (5, N'1', N'41', N'2', NULL)
INSERT [dbo].[tblCart] ([cartid], [Pid], [Uid], [count], [oid]) VALUES (6, N'1', N'42', N'1', NULL)
INSERT [dbo].[tblCart] ([cartid], [Pid], [Uid], [count], [oid]) VALUES (7, N'1', N'44', N'2', NULL)
INSERT [dbo].[tblCart] ([cartid], [Pid], [Uid], [count], [oid]) VALUES (8, N'1', N'48', N'1', NULL)
SET IDENTITY_INSERT [dbo].[tblCart] OFF
GO
SET IDENTITY_INSERT [dbo].[tbleOrder] ON 

INSERT [dbo].[tbleOrder] ([orderid], [name], [orderamount], [paymode], [email], [phonenumber], [address], [date], [time], [uid], [orderstatus], [status]) VALUES (1, N'', N'', N'cash', N'', N'', N'', N'', N'', N'32', NULL, NULL)
INSERT [dbo].[tbleOrder] ([orderid], [name], [orderamount], [paymode], [email], [phonenumber], [address], [date], [time], [uid], [orderstatus], [status]) VALUES (2, N'', N'', N'cash', N'', N'', N'', N'', N'', N'32', NULL, NULL)
INSERT [dbo].[tbleOrder] ([orderid], [name], [orderamount], [paymode], [email], [phonenumber], [address], [date], [time], [uid], [orderstatus], [status]) VALUES (3, N'Abhishek chauhan ', N'', N'cash', N'abhishek.chauhans136@gmail.com ', N'9627499853 ', N'noida', N'', N'', N'42', NULL, NULL)
SET IDENTITY_INSERT [dbo].[tbleOrder] OFF
GO
SET IDENTITY_INSERT [dbo].[womensafetyTandC] ON 

INSERT [dbo].[womensafetyTandC] ([Id], [Heading]) VALUES (1, N'Information recieved by us from your registration on business-standard.com or other digital products   of Business Standard will be used by business Standard in accordance with our Privacy Policy. Kindly read the below mentioned details.')
INSERT [dbo].[womensafetyTandC] ([Id], [Heading]) VALUES (2, N'On registration we expect you to provide Business Standard with an accurate and complete information of the compulsory fields. We also expect you to keep the information secure, Specifically access passwords and payment information. kindly update the information 
periodically to keep your account relevant. Business Standard will rely on any information you provide to us.')
INSERT [dbo].[womensafetyTandC] ([Id], [Heading]) VALUES (3, N'Each registration is for a single user only. On registration, you will choose a user name and password("ID")')
SET IDENTITY_INSERT [dbo].[womensafetyTandC] OFF
GO
SET IDENTITY_INSERT [dbo].[womenSafetyUser] ON 

INSERT [dbo].[womenSafetyUser] ([USER_ID], [Full_Name], [Phone], [email], [address], [password], [otp]) VALUES (1, N'Aditya', N'9871949688', N'aditya@gmail.com', N'Rohini, New Delhi-34', N'123456789', N'4663')
INSERT [dbo].[womenSafetyUser] ([USER_ID], [Full_Name], [Phone], [email], [address], [password], [otp]) VALUES (2, N'Ashutosh', N'8299727845', N'ashutosh@gmail.com', N'Rohini, New Delhi-34', N'123456', N'3592')
INSERT [dbo].[womenSafetyUser] ([USER_ID], [Full_Name], [Phone], [email], [address], [password], [otp]) VALUES (3, N'Adityaaa', N'9871949686', N'adityaaa@gmail.com', N'Rohini, New Delhi-34', N'1900', N'7545')
INSERT [dbo].[womenSafetyUser] ([USER_ID], [Full_Name], [Phone], [email], [address], [password], [otp]) VALUES (4, N'cffggggg', N'cffggggg', N'1234', N'ashutoshjaiswal110@gmail.com', N'1234', N'1864')
INSERT [dbo].[womenSafetyUser] ([USER_ID], [Full_Name], [Phone], [email], [address], [password], [otp]) VALUES (5, N'Adityaaa', N'9871949686', N'adityaaa@gmail.com', N'Rohini, New Delhi-34', N'123456789', N'9560')
INSERT [dbo].[womenSafetyUser] ([USER_ID], [Full_Name], [Phone], [email], [address], [password], [otp]) VALUES (6, N'ashuu', N'9991900825', N'as@gmail.com', N'noida', N'1234', N'7505')
INSERT [dbo].[womenSafetyUser] ([USER_ID], [Full_Name], [Phone], [email], [address], [password], [otp]) VALUES (7, N'aq', N'5454545454', N'z@gmail.com', N'Noida', N'1234', N'4583')
INSERT [dbo].[womenSafetyUser] ([USER_ID], [Full_Name], [Phone], [email], [address], [password], [otp]) VALUES (8, N'sghf', N'1414141414', N'ad@gmail.com', N'c', N'1234', N'851')
INSERT [dbo].[womenSafetyUser] ([USER_ID], [Full_Name], [Phone], [email], [address], [password], [otp]) VALUES (9, N'sffxc', N'5554555685', N'adfddad@gmail.con', N'svhcv', N'1234', N'3623')
INSERT [dbo].[womenSafetyUser] ([USER_ID], [Full_Name], [Phone], [email], [address], [password], [otp]) VALUES (10, N'a', N'4747474747', N'a@gmail.com', N'noida', N'1234', N'7917')
INSERT [dbo].[womenSafetyUser] ([USER_ID], [Full_Name], [Phone], [email], [address], [password], [otp]) VALUES (11, N'Adityaaaa', N'9871949685', N'adityaaaa@gmail.com', N'Rohini, New Delhi-34', N'123456789', N'8037')
INSERT [dbo].[womenSafetyUser] ([USER_ID], [Full_Name], [Phone], [email], [address], [password], [otp]) VALUES (12, N'afzsfae', N'5154554545', N'aadr@gmail.com', N'afsgsg', N'1233', N'8916')
INSERT [dbo].[womenSafetyUser] ([USER_ID], [Full_Name], [Phone], [email], [address], [password], [otp]) VALUES (13, N'ajayjaiswal', N'9999999999', N'ashutoshjaiswal110@gmail.com', N'noida', N'12345', N'8816')
INSERT [dbo].[womenSafetyUser] ([USER_ID], [Full_Name], [Phone], [email], [address], [password], [otp]) VALUES (14, N'aww', N'1000000000', N'w@gmail.com', N'noida', N'12345678', N'5805')
INSERT [dbo].[womenSafetyUser] ([USER_ID], [Full_Name], [Phone], [email], [address], [password], [otp]) VALUES (15, N'ankur', N'5555555555', N'aa@gmail.com', N'noida', N'123456789', N'9731')
INSERT [dbo].[womenSafetyUser] ([USER_ID], [Full_Name], [Phone], [email], [address], [password], [otp]) VALUES (16, N'demo', N'7777777777', N'demo@gmail.com', N'noida', N'1234', N'9864')
INSERT [dbo].[womenSafetyUser] ([USER_ID], [Full_Name], [Phone], [email], [address], [password], [otp]) VALUES (17, N'ajay', N'1111111111', N'asj@gmail.com', N'noida', N'12345', N'8884')
INSERT [dbo].[womenSafetyUser] ([USER_ID], [Full_Name], [Phone], [email], [address], [password], [otp]) VALUES (18, N'ajay', N'1111111111', N'ajayjaiswalnew312@gmail.com', N'noida', N'1234', N'1099')
INSERT [dbo].[womenSafetyUser] ([USER_ID], [Full_Name], [Phone], [email], [address], [password], [otp]) VALUES (19, N'abhishek', N'4444444444', N'abhi@gmail.com', N'noida', N'12345', N'5976')
INSERT [dbo].[womenSafetyUser] ([USER_ID], [Full_Name], [Phone], [email], [address], [password], [otp]) VALUES (20, N'demoaccount', N'0000000001', N'demoaccount@gmail.com', N'Rohini, New Delhi-34', N'12345', N'1687')
INSERT [dbo].[womenSafetyUser] ([USER_ID], [Full_Name], [Phone], [email], [address], [password], [otp]) VALUES (21, N'ss', N'8888888888', N'ss@gmail.com', N'Noida', N'1234', N'2594')
INSERT [dbo].[womenSafetyUser] ([USER_ID], [Full_Name], [Phone], [email], [address], [password], [otp]) VALUES (22, N'fjfjf', N'7777777777', N'xnxn@gmail.com', N'ccncjj', N'1234', N'9387')
INSERT [dbo].[womenSafetyUser] ([USER_ID], [Full_Name], [Phone], [email], [address], [password], [otp]) VALUES (23, N'zfgzzcc', N'4544444444', N'ddd@gmail.com', N'zffzc ', N'11', N'9334')
INSERT [dbo].[womenSafetyUser] ([USER_ID], [Full_Name], [Phone], [email], [address], [password], [otp]) VALUES (24, N'Aditya', N'9871949688', N'adityagupta1jan@gmail.com', N'Rohini new delhi', N'1234', N'6449')
INSERT [dbo].[womenSafetyUser] ([USER_ID], [Full_Name], [Phone], [email], [address], [password], [otp]) VALUES (25, N'Adi', N'7404340561', N'adi@gmail.com', N'PitamPura, New Delhi-34', N'123456', N'1455')
INSERT [dbo].[womenSafetyUser] ([USER_ID], [Full_Name], [Phone], [email], [address], [password], [otp]) VALUES (26, N'Addy', N'9582375056', N'addygupta454@gmail.com', N'Punjabi Bagh, New Delhi - 34', N'123456789', N'4224')
SET IDENTITY_INSERT [dbo].[womenSafetyUser] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [unique_email]    Script Date: 19-06-2020 02:01:39 PM ******/
ALTER TABLE [dbo].[employee] ADD  CONSTRAINT [unique_email] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [unique_name]    Script Date: 19-06-2020 02:01:39 PM ******/
ALTER TABLE [dbo].[employee] ADD  CONSTRAINT [unique_name] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [unique_phone]    Script Date: 19-06-2020 02:01:39 PM ******/
ALTER TABLE [dbo].[employee] ADD  CONSTRAINT [unique_phone] UNIQUE NONCLUSTERED 
(
	[phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UC_Mobile]    Script Date: 19-06-2020 02:01:39 PM ******/
ALTER TABLE [dbo].[PartyUsers] ADD  CONSTRAINT [UC_Mobile] UNIQUE NONCLUSTERED 
(
	[Mobile] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UC_Name]    Script Date: 19-06-2020 02:01:39 PM ******/
ALTER TABLE [dbo].[PartyUsers] ADD  CONSTRAINT [UC_Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_pid]    Script Date: 19-06-2020 02:01:39 PM ******/
ALTER TABLE [dbo].[property] ADD  CONSTRAINT [PK_pid] PRIMARY KEY NONCLUSTERED 
(
	[pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_picid]    Script Date: 19-06-2020 02:01:39 PM ******/
ALTER TABLE [dbo].[propertyPics] ADD  CONSTRAINT [PK_picid] PRIMARY KEY NONCLUSTERED 
(
	[picid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[employee] ADD  DEFAULT ('28.2314') FOR [latitude]
GO
ALTER TABLE [dbo].[employee] ADD  DEFAULT ('77.1253') FOR [longitude]
GO
ALTER TABLE [dbo].[property] ADD  DEFAULT (NULL) FOR [owner_type]
GO
ALTER TABLE [dbo].[property] ADD  DEFAULT (NULL) FOR [title]
GO
ALTER TABLE [dbo].[property] ADD  DEFAULT (NULL) FOR [mobile_1]
GO
ALTER TABLE [dbo].[property] ADD  DEFAULT (NULL) FOR [mobile_2]
GO
ALTER TABLE [dbo].[property] ADD  DEFAULT (NULL) FOR [description]
GO
ALTER TABLE [dbo].[property] ADD  DEFAULT (NULL) FOR [latitude]
GO
ALTER TABLE [dbo].[property] ADD  DEFAULT (NULL) FOR [longitude]
GO
ALTER TABLE [dbo].[property] ADD  DEFAULT (NULL) FOR [area]
GO
ALTER TABLE [dbo].[property] ADD  DEFAULT (NULL) FOR [area_type]
GO
ALTER TABLE [dbo].[property] ADD  DEFAULT (NULL) FOR [rent]
GO
ALTER TABLE [dbo].[property] ADD  DEFAULT (NULL) FOR [width]
GO
ALTER TABLE [dbo].[property] ADD  DEFAULT (NULL) FOR [length]
GO
ALTER TABLE [dbo].[property] ADD  DEFAULT (NULL) FOR [shopno]
GO
ALTER TABLE [dbo].[property] ADD  DEFAULT (NULL) FOR [eload]
GO
ALTER TABLE [dbo].[property] ADD  DEFAULT (NULL) FOR [water_point]
GO
ALTER TABLE [dbo].[property] ADD  DEFAULT (NULL) FOR [security_deposite]
GO
ALTER TABLE [dbo].[property] ADD  DEFAULT (NULL) FOR [address]
GO
ALTER TABLE [dbo].[propertyPics] ADD  DEFAULT (NULL) FOR [filename]
GO
ALTER TABLE [dbo].[propertyPics] ADD  DEFAULT (NULL) FOR [filetype]
GO
ALTER TABLE [dbo].[propertyPics] ADD  DEFAULT (NULL) FOR [filesize]
GO
/****** Object:  StoredProcedure [dbo].[GetAllData]    Script Date: 19-06-2020 02:01:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllData]
AS
BEGIN
SELECT 
    e.*,p.*,pics.* FROM  
	employee  as e 
FULL OUTER JOIN property as p ON e.eid=p.eid 
FULL OUTER JOIN propertyPics as pics ON p.pid=pics.pid
where  e.eid=p.eid

order by e.eid
FOR JSON AUTO
END
GO
/****** Object:  StoredProcedure [dbo].[prcAgain]    Script Date: 19-06-2020 02:01:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[prcAgain](
@action nvarchar(100) = null,
@project_name nvarchar(100) = null,
@value nvarchar(50) = null
)

as
begin
if @action = 'select'
begin
select * from Again where project_name=@project_name ;
end
end
GO
/****** Object:  StoredProcedure [dbo].[prccallerdetail]    Script Date: 19-06-2020 02:01:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[prccallerdetail]
(
@ActionType NVarChar(20) = null,
@Id NVarChar(20) = null,
@Name NVarChar(20) = null,
@Email NVarChar(20) = null,
@Mobile NVarChar(20) = null,
@Address NVarChar(20) = null
)
AS
BEGIN
IF @ActionType = 'Insert'
BEGIN
INSERT INTO callerdetail (Name,Email,Mobile,Address) VALUES (@Name,@Email,@Mobile,@Address)
END
IF @ActionType = 'Select'
BEGIN
Select * from callerdetail
END
IF @ActionType = 'Update'
BEGIN
UPDATE callerdetail SET Name=@Name, Email=@Email, Mobile=@Mobile, Address=@Address WHERE Id=@Id
END
IF @ActionType = 'delete'
BEGIN
DELETE FROM callerdetail WHERE Id=@Id
END
END
GO
/****** Object:  StoredProcedure [dbo].[prccart]    Script Date: 19-06-2020 02:01:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[prccart]
(
@Actiontype NVarChar(20) = null,
@cartid NVarChar(20) = null,
@Pid NVarChar(20) = null,
@Uid NVarChar(20) = null,
@count NVarChar(255) = null
)
AS
BEGIN
IF @Actiontype = 'Insert'
BEGIN
SET NOCOUNT ON;
Insert into tblCart(Pid,Uid,count) values(@Pid,@Uid,@count)
END
IF @Actiontype = 'Update'
BEGIN
UPDATE tblcart SET count=@count where Uid=@Uid AND Pid=@Pid 
END
IF @ActionType = 'getCount'
BEGIN
select cartid from  tblcart  where Uid =@Uid and Pid =@Pid 
END
IF @ActionType = 'getCart'
BEGIN
select sv.*,pd.*,tc.* from  Service as sv
FULL  JOIN Product as pd ON sv.Id=pd.C_Id
FULL  JOIN tblcart as tc ON tc.Pid =pd.Id
where tc.Uid = @Uid
FOR JSON AUTO
END
IF @ActionType = 'getCartCount'
BEGIN
select SUM(CAST(count AS int)) from tblcart where Uid = @Uid
END
IF @ActionType = 'RemoveProduct'
BEGIN
DELETE FROM  tblcart where cartid=@cartid
END
END
GO
/****** Object:  StoredProcedure [dbo].[prccontact]    Script Date: 19-06-2020 02:01:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[prccontact]
(
@ActionType NvarChar(20) = null,
@Id NVarchar(20) = null,
@Name NVarChar(255) = null,
@Email NVarChar(255) = null,
@Message NVarChar(255) = null
)
AS
BEGIN
IF @ActionType = 'Insert'
BEGIN
SET NOCOUNT ON;
INSERT INTO Contact (Name,Email,Message) VALUES(@Name,@Email,@Message)
END
IF @ActionType = 'Select'
BEGIN
SELECT * FROM Contact
END
IF @ActionType = 'Update'
BEGIN
UPDATE Contact SET Name=@Name,Email=@Email,Message=@Message WHERE Id=@Id
END
IF @ActionType = 'Delete'
BEGIN
DELETE FROM Contact WHERE Id=@Id
END
END
GO
/****** Object:  StoredProcedure [dbo].[prcFaq]    Script Date: 19-06-2020 02:01:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[prcFaq]
(
@ActionType NVarChar(20) = null,
@Id NVarChar(20) = null,
@Ques NVarChar(255) = null,
@Ans NVarChar(255) = null
)
AS
BEGIN
IF @ActionType = 'Insert'
BEGIN
INSERT INTO Faq (Question,Answer) VALUES (@Ques,@Ans)
END
IF @ActionType = 'Select'
BEGIN
SELECT * FROM Faq
END
IF @ActionType = 'Update'
BEGIN
UPDATE Faq SET Question=@Ques, Answer=@Ans WHERE Id=@Id
END
IF @ActionType = 'Delete'
BEGIN
DELETE FROM Faq WHERE Id=@Id
END
END
GO
/****** Object:  StoredProcedure [dbo].[prclocation]    Script Date: 19-06-2020 02:01:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[prclocation]
(
@ActionType nvarchar(20) = NULL,
@eid nvarchar(10) = NULL,
@latitude nvarchar(50) = null,
@longitude nvarchar(50) = null
)

 AS
BEGIN
IF @ActionType = 'Update'
BEGIN
SET NOCOUNT ON;
	UPDATE employee SET latitude = @latitude, longitude = @longitude WHERE eid = @eid
END
IF @ActionType = 'Select'
BEGIN
Select latitude,longitude,name,profilePic from employee
END
END
GO
/****** Object:  StoredProcedure [dbo].[prcPrivacy]    Script Date: 19-06-2020 02:01:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[prcPrivacy]
(
@ActionType NVarChar(20) = null,
@Id NVarChar(20) = null,
@Heading NVarChar(255) = null
)
AS
BEGIN
IF @ActionType = 'Insert'
BEGIN
INSERT INTO Privacy (Heading) VALUES (@Heading)
END
IF @ActionType = 'Select'
BEGIN
SELECT * FROM Privacy
END
IF @ActionType = 'Update'
BEGIN
UPDATE Privacy SET Heading=@Heading WHERE Id=@Id
END
IF @ActionType = 'Delete'
BEGIN
DELETE FROM Privacy WHERE Id=@Id
END
END
GO
/****** Object:  StoredProcedure [dbo].[prcproduct]    Script Date: 19-06-2020 02:01:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[prcproduct]
(
@ActionType NvarChar(20) = null,
@Id NVarchar(20) = null,
@C_Id NVarchar(20) = null,
@P_Name NVarChar(255) = null,
@P_Pic NVarChar(255) = null,
@P_Desc NVarChar(255) = null,
@P_price NVarChar(255) = null
)
AS
BEGIN
IF @ActionType = 'Insert'
BEGIN
SET NOCOUNT ON;
INSERT INTO Product (C_Id,P_Name,P_Pic,P_Desc,P_price) VALUES(@C_Id,@P_Name,@P_Pic,@P_Desc,@P_price)
END
IF @ActionType = 'Select'
BEGIN
SELECT * FROM Product WHERE C_Id=@C_Id
END
IF @ActionType = 'Update'
BEGIN
declare @temp1 nvarchar(250)
select @temp1=P_Pic from Product WHERE Id = @Id
IF @P_Pic = 'NO'
BEGIN
UPDATE Product SET C_Id=@C_Id,P_Name=@P_Name,P_Pic=@temp1,P_Desc=@P_Desc,P_price=@P_price WHERE Id=@Id
END
ELSE
BEGIN
UPDATE Product SET C_Id=@C_Id,P_Name=@P_Name,P_Pic=@P_Pic,P_Desc=@P_Desc,P_price=@P_price WHERE Id=@Id
END
END

IF @ActionType = 'Delete'
BEGIN
DELETE FROM Product WHERE Id=@Id
END
END
GO
/****** Object:  StoredProcedure [dbo].[prcproperty]    Script Date: 19-06-2020 02:01:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[prcproperty]
(
@ActionType nvarchar(20) = NULL,
@eid int,
@owner_type nvarchar(50) = NULL,
@title nvarchar(50) = NULL,
@mobile_1 nvarchar(50) = NULL,
@mobile_2 nvarchar(50) = NULL,
@description nvarchar(255) = NULL,
@latitude nvarchar(50) = NULL,
@longitude nvarchar(50) = NULL,
@area nvarchar(50) = NULL,
@area_type nvarchar(50) = NULL,
@rent nvarchar(50) = NULL,
@width nvarchar(50) = NULL,
@length nvarchar(50) = NULL,
@shopno nvarchar(50) = NULL,
@eload nvarchar(50) = NULL,
@water_point nvarchar(50) = NULL,
@security_deposite nvarchar(50) = NULL,
@address varchar(50) = NULL
)

 AS
BEGIN
IF @ActionType = 'Insert'
BEGIN
SET NOCOUNT ON;
	INSERT INTO property (eid,owner_type,title,mobile_1,mobile_2,description,latitude,longitude,area,area_type,rent,width,length,shopno,eload,water_point,security_deposite,address) 
	Values(@eid,@owner_type,@title,@mobile_1,@mobile_2,@description,@latitude,@longitude,@area,@area_type,@rent,@width,@length,@shopno,@eload,@water_point,@security_deposite,@address)
END
IF @ActionType = 'Select'
BEGIN
Select * from property where eid = @eid
END
END

GO
/****** Object:  StoredProcedure [dbo].[prcpropertyPics]    Script Date: 19-06-2020 02:01:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[prcpropertyPics]
(
@ActionType nvarchar(20) = NULL,
@pid int,
@filename nvarchar(50) = null,
@filetype nvarchar(100) = null,
@filesize nvarchar(50) = null
)

 AS
BEGIN
IF @ActionType = 'Insert'
BEGIN
SET NOCOUNT ON;
	INSERT INTO propertyPics (pid,filename,filetype,filesize)Values(@pid,@filename,@filetype,@filesize)
END
IF @ActionType = 'Select'
BEGIN
Select * from propertyPics where pid = @pid
END
END
GO
/****** Object:  StoredProcedure [dbo].[prcservice]    Script Date: 19-06-2020 02:01:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[prcservice]
(
@ActionType NvarChar(20) = null,
@Id NVarchar(20) = null,
@C_Name NVarChar(255) = null,
@C_Pic NVarChar(255) = null
)
AS
BEGIN
IF @ActionType = 'Insert'
BEGIN
SET NOCOUNT ON;
INSERT INTO Service (C_Name,C_Pic) VALUES(@C_Name,@C_Pic)
END
IF @ActionType = 'Select'
BEGIN
SELECT * FROM Service
END
IF @ActionType = 'Update'
BEGIN
declare @temp1 nvarchar(250)
select @temp1=C_Pic from Service WHERE Id = @Id
IF @C_Pic = 'NO'
BEGIN
UPDATE Service SET C_Name=@C_Name,C_Pic=@temp1 WHERE Id=@Id
END
ELSE
BEGIN
UPDATE Service SET C_Name=@C_Name,C_Pic=@C_Pic WHERE Id=@Id
END
END
IF @ActionType = 'Delete'
BEGIN
DELETE FROM Service WHERE Id=@Id
END
END
GO
/****** Object:  StoredProcedure [dbo].[prcTandC]    Script Date: 19-06-2020 02:01:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[prcTandC]
(
@ActionType NVarChar(20) = null,
@Id NVarChar(20) = null,
@Heading NVarChar(255) = null,
@Tc1 NVarChar(255) = null,
@Tc2 NVarChar(255) = null,
@Tc3 NVarChar(255) = null,
@Tc4 NVarChar(255) = null,
@Tc5 NVarChar(255) = null
)
AS
BEGIN
IF @ActionType = 'Insert'
BEGIN
INSERT INTO TandC (Heading,Tc1,Tc2,Tc3,Tc4,Tc5) VALUES (@Heading,@Tc1,@Tc2,@Tc3,@Tc4,@Tc5)
END
IF @ActionType = 'Select'
BEGIN
SELECT * FROM TandC
END
IF @ActionType = 'Update'
BEGIN
UPDATE TandC SET Heading=@Heading, Tc1=@Tc1,Tc2=@Tc2,Tc3=@Tc3,Tc4=@Tc4,Tc5=@Tc5 WHERE Id=@Id
END
IF @ActionType = 'Delete'
BEGIN
DELETE FROM TandC WHERE Id=@Id
END
END
GO
/****** Object:  StoredProcedure [dbo].[prctblOrder]    Script Date: 19-06-2020 02:01:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[prctblOrder]
(
@ActionType NVarChar(20) = null,
@orderid NVarChar(20) = null,
@name NVarChar(255) = null,
@orderamount NVarChar(255) = null,
@paymode NVarChar(255) = null,
@email NVarChar(255) = null,
@phonenumber NVarChar(255) = null,
@address NVarChar(255) = null,
@date NVarChar(255) = null,
@time NVarChar(255) = null,
@uid NVarChar(255) = null,
@orderstatus NVarChar(255) = '0',
@status NVarChar(255) = '0',
@cartId NVarChar(25) = null
)
AS
BEGIN
IF @ActionType = 'Insert'
BEGIN
INSERT INTO tbleOrder(name,orderamount,paymode,email,phonenumber,address,date,time,uid) VALUES (@name,@orderamount,@paymode,@email,@phonenumber,@address,@date,@time,@uid)
update tblCart set oid=SCOPE_IDENTITY() where cartid=@cartId 
END
IF @ActionType = 'getHistory'
BEGIN
select * from tbleOrder where uid=@uid
END

IF @ActionType = 'getOrderList'
BEGIN
select * from tbleOrder
END
IF @ActionType = 'changeOrderStatus'
BEGIN
update tbleOrder set status=@status where orderid=@orderId 
END
IF @ActionType = 'Delete'
BEGIN
DELETE FROM tbleOrder WHERE orderid=@orderId 
END
END
GO
/****** Object:  StoredProcedure [dbo].[prcuser]    Script Date: 19-06-2020 02:01:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[prcuser]
(
@ActionType nvarchar(20) = NULL,
@name nvarchar(50) = null,
@email nvarchar(100) = null,
@phone nvarchar(50) = null,
@password nvarchar(50) = null,
@profilePic nvarchar(255) = null
)

 AS
BEGIN
IF @ActionType = 'Insert'
BEGIN
SET NOCOUNT ON;
	INSERT INTO employee (name,email,phone,password,profilePic)Values(@name,@email,@phone,@password,@profilePic)
END
IF @ActionType = 'Select'
BEGIN
Select eid,name,email,phone from employee where email = @email 
END
END
GO
/****** Object:  StoredProcedure [dbo].[prcusers]    Script Date: 19-06-2020 02:01:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[prcusers]
(
@ActionType nvarchar(20) = NULL,
@Id nvarchar (20)= NULL,
@Name nvarchar(100)= null,
@Gender nvarchar(100)= null,
@DOB nvarchar(100)= null,
@Mobile nvarchar(100)= null,
@Email nvarchar(100)= null,
@Otp nvarchar(100)= null,
@profilePic nvarchar(255)= null,
@deviceToken nvarchar(255)= null,
@Password nvarchar(250) = null,
@value nvarchar(250) = null,
@oldpassword nvarchar(250) = null
)

 AS
BEGIN
IF @ActionType = 'Insert'
BEGIN
SET NOCOUNT ON;
	INSERT INTO PartyUsers (Name, Gender, DOB, Mobile, Email, Otp, Password, ProfilePic, deviceToken)Values(@Name, @Gender, @DOB, @Mobile, @Email, @Otp, @Password, @profilePic, @deviceToken)
END
IF @ActionType = 'resendOtp'
BEGIN
UPDATE PartyUsers SET  Otp=@Otp where Mobile=@Mobile;
END
IF @ActionType = 'forgetPassword'
BEGIN
UPDATE PartyUsers SET  Otp=@Otp,Password=@Password where Mobile=@Mobile;
END
IF @ActionType = 'update'
BEGIN
declare @temp1 nvarchar(250)
select @temp1=ProfilePic from PartyUsers WHERE Id = @Id
IF @profilePic = 'NO'
BEGIN
UPDATE PartyUsers SET  Name=@Name,Gender=@Gender,DOB=@DOB,Mobile=@Mobile, Email=@Email, ProfilePic=@temp1,deviceToken=@deviceToken WHERE Id = @Id
SELECT * FROM PartyUsers WHERE Id = @Id
END
ELSE
BEGIN
UPDATE PartyUsers SET  Name=@Name,Gender=@Gender,DOB=@DOB,Mobile=@Mobile, Email=@Email, ProfilePic=@profilePic,deviceToken=@deviceToken WHERE Id = @Id
SELECT * FROM PartyUsers WHERE Id = @Id
END
END
IF @ActionType = 'login'
BEGIN
Select * from PartyUsers WHERE (Mobile=@value OR Name=@value) AND Password=@Password
END
IF @ActionType = 'OtpAuth'
BEGIN
Select * from PartyUsers WHERE Otp=@Otp
END
IF @ActionType = 'changePassword'
BEGIN
declare @temp nvarchar(250)
select @temp=Password from PartyUsers WHERE Id = @Id
IF @temp = @oldpassword
BEGIN
UPDATE PartyUsers set Password=@Password WHERE Id = @Id
END
END
IF @ActionType = 'Delete'
BEGIN
DELETE FROM PartyUsers WHERE Id = @Id
END
END





GO
/****** Object:  StoredProcedure [dbo].[prcwomensafetyTandC]    Script Date: 19-06-2020 02:01:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[prcwomensafetyTandC]
(
@ActionType NVarChar(20) = null,
@Id NVarChar(20) = null,
@Heading VarChar(max) = null
)
AS
BEGIN
IF @ActionType = 'Insert'
BEGIN
INSERT INTO womensafetyTandC (Heading) VALUES (@Heading)
END
IF @ActionType = 'Select'
BEGIN
SELECT * FROM womensafetyTandC
END
IF @ActionType = 'Update'
BEGIN
UPDATE womensafetyTandC SET Heading=@Heading WHERE Id=@Id
END
IF @ActionType = 'Delete'
BEGIN
DELETE FROM womensafetyTandC WHERE Id=@Id
END
END
GO
/****** Object:  StoredProcedure [dbo].[prcwomenSafetyUser]    Script Date: 19-06-2020 02:01:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[prcwomenSafetyUser]
(
@ActionType nvarchar(200) = null,
@USER_ID nvarchar(255) = null,
@Full_Name nvarchar(255) = null,
@Phone nvarchar(255) = null,
@email nvarchar(255) = null,
@password nvarchar(255) = null,
@oldpassword nvarchar(250)= null,
@newpassword nvarchar(250)= null,
@otp nvarchar(255) = null,
@address nvarchar(255) = null
)
AS
BEGIN
declare @count int;
IF @ActionType = 'Insert'
BEGIN
set @count = (select COUNT(*) from womenSafetyUser where Phone = @email or email = @email)
if @count = 0
begin
declare @otptemp int;
set @otptemp = ROUND(((9999 - 1 -1) * RAND() + 1), 0);
INSERT INTO womenSafetyUser(Full_Name,Phone,email,address,password,otp) VALUES(@Full_Name,@Phone,@email,@address,@password,@otptemp)
declare @id int = Scope_Identity();
select otp,USER_ID from womenSafetyUser where USER_ID = @id
END
END

if @ActionType = 'Select'
begin
select * from womenSafetyUser where (Phone = @email or email = @email) AND password = @password
end

if @ActionType = 'changePassword'
begin
UPDATE womenSafetyUser set 
password = @newpassword 
WHERE otp = @otp 
end

if @ActionType = 'changePasswordOtp'
begin
declare @otptemp1 int;
set @otptemp1 = ROUND(((9999 - 1 -1) * RAND() + 1), 0);
update womenSafetyUser set otp = @otptemp1 where USER_ID = @USER_ID AND password = @oldpassword
select otp from womenSafetyUser where USER_ID = @USER_ID AND password = @oldpassword
end


if @ActionType = 'otp_submit'
begin
set @count = (SELECT COUNT(*) from womenSafetyUser where otp = @otp);
if @count = 1
begin
select * from womenSafetyUser where otp = @otp  and USER_ID = @USER_ID
end
if @count > 1
begin
UPDATE womenSafetyUser SET otp = '' where otp = @otp and USER_ID != @USER_ID
select * from womenSafetyUser where otp = @otp  and USER_ID = @USER_ID
end
end

if @ActionType = 'resendOTP'
begin
set @count = ROUND(((9999 - 1 -1) * RAND() + 1), 0);
update womenSafetyUser set
otp = @count WHERE USER_ID = @USER_ID
select otp from womenSafetyUser where USER_ID = @USER_ID
end

if @ActionType = 'editProfile'
begin
update womenSafetyUser set 
Full_Name = @Full_Name,
Phone = @Phone,
email = @email,
address = @address
WHERE USER_ID = @USER_ID
select * from womenSafetyUser where USER_ID = @USER_ID
END

if @ActionType = 'forgot_password_get_otp'
begin
declare @count2 int = 0;
set @count2 = ROUND(((9999 - 1 -1) * RAND() + 1), 0);
update womenSafetyUser set otp = @count2 where email = @email OR Phone = @email;
select otp from womenSafetyUser where email = @email OR Phone = @email;
end

if @ActionType = 'forgot_password_update_pass'
begin
update womenSafetyUser set password = @password where otp  = @otp;
end

if @ActionType = 'phoneValidOrNot'
BEGIN
declare @phoneCount int = 0;
set @phoneCount = (SELECT COUNT(*) from womenSafetyUser where email = @email OR Phone = @email)
if @phoneCount = '1'
BEGIN
SELECT 'valid' as validPhone
END
ELSE
BEGIN
SELECT 'Not valid' as validPhone
END
END

END
GO
USE [master]
GO
ALTER DATABASE [DB_A3CE37_locapi] SET  READ_WRITE 
GO
