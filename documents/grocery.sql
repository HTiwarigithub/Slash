USE [master]
GO
/****** Object:  Database [DB_A3CE37_Grocery]    Script Date: 04-05-2020 12:07:19 ******/
CREATE DATABASE [DB_A3CE37_Grocery]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB_A3CE37_Grocery_Data', FILENAME = N'H:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\DB_A3CE37_Grocery_DATA.mdf' , SIZE = 8192KB , MAXSIZE = 51200KB , FILEGROWTH = 10%)
 LOG ON 
( NAME = N'DB_A3CE37_Grocery_Log', FILENAME = N'H:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\DB_A3CE37_Grocery_Log.LDF' , SIZE = 3072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DB_A3CE37_Grocery] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB_A3CE37_Grocery].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB_A3CE37_Grocery] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB_A3CE37_Grocery] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB_A3CE37_Grocery] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB_A3CE37_Grocery] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB_A3CE37_Grocery] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB_A3CE37_Grocery] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DB_A3CE37_Grocery] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB_A3CE37_Grocery] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB_A3CE37_Grocery] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB_A3CE37_Grocery] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB_A3CE37_Grocery] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB_A3CE37_Grocery] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB_A3CE37_Grocery] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB_A3CE37_Grocery] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB_A3CE37_Grocery] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DB_A3CE37_Grocery] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB_A3CE37_Grocery] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB_A3CE37_Grocery] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB_A3CE37_Grocery] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB_A3CE37_Grocery] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB_A3CE37_Grocery] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DB_A3CE37_Grocery] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB_A3CE37_Grocery] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DB_A3CE37_Grocery] SET  MULTI_USER 
GO
ALTER DATABASE [DB_A3CE37_Grocery] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB_A3CE37_Grocery] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB_A3CE37_Grocery] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB_A3CE37_Grocery] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DB_A3CE37_Grocery] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DB_A3CE37_Grocery] SET QUERY_STORE = OFF
GO
USE [DB_A3CE37_Grocery]
GO
/****** Object:  UserDefinedFunction [dbo].[Split]    Script Date: 04-05-2020 12:07:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create FUNCTION [dbo].[Split](@String varchar(MAX), @Delimiter char(1))       
returns @temptable TABLE (items varchar(MAX))       
as       
begin      
    declare @idx int       
    declare @slice varchar(8000)       

    select @idx = 1       
        if len(@String)<1 or @String is null  return       

    while @idx!= 0       
    begin       
        set @idx = charindex(@Delimiter,@String)       
        if @idx!=0       
            set @slice = left(@String,@idx - 1)       
        else       
            set @slice = @String       

        if(len(@slice)>0)  
            insert into @temptable(Items) values(@slice)       

        set @String = right(@String,len(@String) - @idx)       
        if len(@String) = 0 break       
    end   
return 
end;
GO
/****** Object:  Table [dbo].[addtble]    Script Date: 04-05-2020 12:07:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[addtble](
	[add_id] [int] IDENTITY(1,1) NOT NULL,
	[country_name] [nvarchar](250) NULL,
	[state_name] [nvarchar](250) NULL,
	[address_name] [nvarchar](250) NULL,
	[address_line1] [nvarchar](250) NULL,
	[address_line2] [nvarchar](250) NULL,
	[lattitude] [nvarchar](250) NULL,
	[longitude] [nvarchar](250) NULL,
	[timest] [datetime] NULL,
	[addtype] [nvarchar](255) NULL,
	[cid] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[add_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Consumer]    Script Date: 04-05-2020 12:07:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Consumer](
	[Cid] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NULL,
	[Mobile] [nvarchar](100) NULL,
	[Gender] [nvarchar](100) NULL,
	[Otp] [nvarchar](100) NULL,
	[access_token] [nvarchar](255) NULL,
	[walletid] [nvarchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[Cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customers]    Script Date: 04-05-2020 12:07:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customers](
	[first_name] [nvarchar](50) NULL,
	[last_name] [nvarchar](50) NULL,
	[phone] [nvarchar](100) NULL,
	[zipcode] [nvarchar](50) NULL,
	[state] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DocType]    Script Date: 04-05-2020 12:07:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocType](
	[Did] [int] IDENTITY(1,1) NOT NULL,
	[DocName] [varchar](255) NOT NULL,
 CONSTRAINT [PK_doc] PRIMARY KEY CLUSTERED 
(
	[Did] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[favusershop]    Script Date: 04-05-2020 12:07:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[favusershop](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Sid] [nvarchar](250) NULL,
	[cid] [nvarchar](250) NULL,
	[isfav] [nvarchar](250) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[kyc_data]    Script Date: 04-05-2020 12:07:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[kyc_data](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Did] [varchar](255) NOT NULL,
	[Cid] [varchar](255) NOT NULL,
	[DocNumber] [varchar](255) NOT NULL,
	[D_File] [varchar](255) NOT NULL,
 CONSTRAINT [PK_kyc] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[logintemp]    Script Date: 04-05-2020 12:07:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[logintemp](
	[iod] [nvarchar](250) NULL,
	[mobile] [nvarchar](250) NULL,
	[sid] [nvarchar](250) NULL,
	[kyc] [nvarchar](250) NULL,
	[walletid] [nvarchar](250) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[materslot]    Script Date: 04-05-2020 12:07:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[materslot](
	[sloteid] [int] IDENTITY(1,1) NOT NULL,
	[slote_name] [nvarchar](250) NULL,
	[timeset] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[sloteid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[offer]    Script Date: 04-05-2020 12:07:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[offer](
	[offerid] [int] IDENTITY(1,1) NOT NULL,
	[offername] [nvarchar](250) NULL,
	[offerpic] [nvarchar](250) NULL,
	[discounttype] [nvarchar](250) NULL,
	[ammount] [nvarchar](250) NULL,
	[sid] [nvarchar](250) NULL,
	[description] [nvarchar](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[offerid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Owner]    Script Date: 04-05-2020 12:07:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Owner](
	[Oid] [int] IDENTITY(1,1) NOT NULL,
	[Mobile] [nvarchar](255) NULL,
	[Otp] [nvarchar](255) NULL,
	[access_token] [nvarchar](255) NULL,
	[kyc] [nvarchar](20) NULL,
	[walletid] [nvarchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 04-05-2020 12:07:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Pid] [int] IDENTITY(1,1) NOT NULL,
	[Sid] [nvarchar](255) NULL,
	[P_Name] [nvarchar](255) NULL,
	[P_Desc] [nvarchar](255) NULL,
	[P_Type] [nvarchar](255) NULL,
	[P_Category] [nvarchar](255) NULL,
	[Offer_Price] [nvarchar](255) NULL,
	[P_Warranty] [nvarchar](255) NULL,
	[Default_Package] [nvarchar](255) NULL,
	[Default_Price] [nvarchar](255) NULL,
	[Pac_Id] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_category]    Script Date: 04-05-2020 12:07:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_category](
	[cat_id] [int] IDENTITY(1,1) NOT NULL,
	[cat_name] [nvarchar](255) NOT NULL,
	[cat_image] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[cat_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Images]    Script Date: 04-05-2020 12:07:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Images](
	[Image_id] [int] IDENTITY(1,1) NOT NULL,
	[pid] [nvarchar](255) NULL,
	[Image_Name] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Image_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_package]    Script Date: 04-05-2020 12:07:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_package](
	[Pac_Id] [int] IDENTITY(1,1) NOT NULL,
	[Pid] [nvarchar](255) NULL,
	[Package] [nvarchar](255) NULL,
	[Package_Price] [nvarchar](255) NULL,
	[Count] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Pac_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_sub_category]    Script Date: 04-05-2020 12:07:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_sub_category](
	[sub_cat_id] [int] IDENTITY(1,1) NOT NULL,
	[cat_id] [nvarchar](100) NOT NULL,
	[sub_cat_name] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[sub_cat_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ratingreview]    Script Date: 04-05-2020 12:07:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ratingreview](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userid] [nvarchar](250) NULL,
	[shopid] [nvarchar](250) NULL,
	[orderid] [nvarchar](250) NULL,
	[rating] [nvarchar](250) NULL,
	[description] [nvarchar](250) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[selectedCategory]    Script Date: 04-05-2020 12:07:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[selectedCategory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Sid] [nvarchar](255) NULL,
	[cat_id] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shop]    Script Date: 04-05-2020 12:07:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shop](
	[Sid] [int] IDENTITY(1,1) NOT NULL,
	[oid] [nvarchar](255) NULL,
	[Shop_Name] [nvarchar](255) NULL,
	[Owner_Name] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[Shop_latitiude] [nvarchar](255) NULL,
	[Shop_longitude] [nvarchar](255) NULL,
	[Shop_address] [nvarchar](255) NULL,
	[Pincode] [nvarchar](255) NULL,
	[Alternate_No] [nvarchar](255) NULL,
	[statusshop] [nvarchar](250) NULL,
	[MinOrderPrice] [nvarchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[Sid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shop_Images]    Script Date: 04-05-2020 12:07:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shop_Images](
	[shop_image_id] [int] IDENTITY(1,1) NOT NULL,
	[Sid] [nvarchar](100) NULL,
	[shop_image] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[shop_image_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[slotemaster]    Script Date: 04-05-2020 12:07:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[slotemaster](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[sid] [nvarchar](250) NULL,
	[sunday] [nvarchar](250) NULL,
	[monday] [nvarchar](250) NULL,
	[tuesday] [nvarchar](250) NULL,
	[wednesday] [nvarchar](250) NULL,
	[thursday] [nvarchar](250) NULL,
	[friday] [nvarchar](250) NULL,
	[saturday] [nvarchar](250) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblcart]    Script Date: 04-05-2020 12:07:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblcart](
	[cartid] [int] IDENTITY(1,1) NOT NULL,
	[pacid] [int] NULL,
	[cid] [int] NULL,
	[counts] [nvarchar](100) NULL,
	[timest] [datetime] NULL,
	[orderid] [nvarchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[cartid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbleOrder]    Script Date: 04-05-2020 12:07:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbleOrder](
	[orderid] [int] IDENTITY(1,1) NOT NULL,
	[firstname] [nvarchar](255) NULL,
	[orderamount] [nvarchar](255) NULL,
	[paymode] [nvarchar](255) NULL,
	[lastname] [nvarchar](255) NULL,
	[phonenumber] [nvarchar](255) NULL,
	[address] [nvarchar](255) NULL,
	[zip] [nvarchar](255) NULL,
	[city] [nvarchar](255) NULL,
	[datetime] [nvarchar](255) NULL,
	[trasactionId] [nvarchar](1) NULL,
	[cid] [nvarchar](250) NULL,
	[orderstatus] [nvarchar](250) NULL,
	[status] [nvarchar](250) NOT NULL,
	[oid] [nvarchar](250) NULL,
	[ratid] [nvarchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[orderid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSlote]    Script Date: 04-05-2020 12:07:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSlote](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[daynames] [nvarchar](250) NULL,
	[sloteId] [nvarchar](250) NULL,
	[shop_id] [nvarchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transaction_Money]    Script Date: 04-05-2020 12:07:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaction_Money](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[w_id] [nvarchar](100) NULL,
	[Oid] [nvarchar](100) NULL,
	[TransactionId] [nvarchar](100) NULL,
	[OrderId] [nvarchar](100) NULL,
	[Amount] [nvarchar](100) NULL,
	[Transaction_type] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[transactions]    Script Date: 04-05-2020 12:07:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transactions](
	[transactionid] [int] IDENTITY(1,1) NOT NULL,
	[walleteid] [nvarchar](250) NULL,
	[description] [nvarchar](250) NULL,
	[avaliblebalance] [nvarchar](250) NULL,
	[transationfrom] [nvarchar](250) NULL,
	[transamount] [nvarchar](250) NULL,
	[transactiontype] [nvarchar](250) NULL,
	[transactionstatus] [nvarchar](250) NULL,
	[txnrcptId] [nvarchar](250) NULL,
	[payMode] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Wallet]    Script Date: 04-05-2020 12:07:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wallet](
	[W_Id] [int] IDENTITY(1,1) NOT NULL,
	[Amount] [nvarchar](100) NULL,
	[transtype] [nvarchar](250) NULL,
	[transactionid] [nvarchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[W_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Consumer] ON 

INSERT [dbo].[Consumer] ([Cid], [Name], [Email], [Mobile], [Gender], [Otp], [access_token], [walletid]) VALUES (1, N'Ashutosh', N'ashutosh.v2infotech@gmail.com', N'9151134737', N'male', N'4612', NULL, N'2')
SET IDENTITY_INSERT [dbo].[Consumer] OFF
INSERT [dbo].[customers] ([first_name], [last_name], [phone], [zipcode], [state]) VALUES (N'kashish', N'jonathan', N'898989898', N'141001', N'punjab')
INSERT [dbo].[customers] ([first_name], [last_name], [phone], [zipcode], [state]) VALUES (N'rajesh', N'james', NULL, N'99990', N'delhi')
INSERT [dbo].[customers] ([first_name], [last_name], [phone], [zipcode], [state]) VALUES (N'abraham', N'middleton', NULL, N'00000', N'puna')
INSERT [dbo].[customers] ([first_name], [last_name], [phone], [zipcode], [state]) VALUES (N'bob', N'marley', NULL, N'00001', N'brazil')
INSERT [dbo].[customers] ([first_name], [last_name], [phone], [zipcode], [state]) VALUES (N'charlie', N'yatze', NULL, N'11111', N'mongolia')
SET IDENTITY_INSERT [dbo].[DocType] ON 

INSERT [dbo].[DocType] ([Did], [DocName]) VALUES (1, N'Aadhar')
INSERT [dbo].[DocType] ([Did], [DocName]) VALUES (2, N'PAN card')
INSERT [dbo].[DocType] ([Did], [DocName]) VALUES (3, N'Voter card')
INSERT [dbo].[DocType] ([Did], [DocName]) VALUES (4, N'Gst No')
INSERT [dbo].[DocType] ([Did], [DocName]) VALUES (5, N'Fssai')
SET IDENTITY_INSERT [dbo].[DocType] OFF
SET IDENTITY_INSERT [dbo].[favusershop] ON 

INSERT [dbo].[favusershop] ([id], [Sid], [cid], [isfav]) VALUES (1, N'1', N'1', N'true')
INSERT [dbo].[favusershop] ([id], [Sid], [cid], [isfav]) VALUES (2, N'18', N'1', N'true')
SET IDENTITY_INSERT [dbo].[favusershop] OFF
SET IDENTITY_INSERT [dbo].[kyc_data] ON 

INSERT [dbo].[kyc_data] ([id], [Did], [Cid], [DocNumber], [D_File]) VALUES (1, N'1', N'1', N'123456789012', N'IMG-20191106-WA0000.jpg')
SET IDENTITY_INSERT [dbo].[kyc_data] OFF
INSERT [dbo].[logintemp] ([iod], [mobile], [sid], [kyc], [walletid]) VALUES (N'1004', N'9151134737', NULL, N'false', N'1005')
SET IDENTITY_INSERT [dbo].[materslot] ON 

INSERT [dbo].[materslot] ([sloteid], [slote_name], [timeset]) VALUES (1, N'06.00 am to 08.00 am', NULL)
INSERT [dbo].[materslot] ([sloteid], [slote_name], [timeset]) VALUES (2, N'08.00 am to 10.00 am', NULL)
INSERT [dbo].[materslot] ([sloteid], [slote_name], [timeset]) VALUES (3, N'10.00 am to 12.00 pm', NULL)
INSERT [dbo].[materslot] ([sloteid], [slote_name], [timeset]) VALUES (4, N'12.00 pm to 02.00 pm', NULL)
INSERT [dbo].[materslot] ([sloteid], [slote_name], [timeset]) VALUES (5, N'02.00 pm to 04.00 pm', NULL)
INSERT [dbo].[materslot] ([sloteid], [slote_name], [timeset]) VALUES (6, N'04.00 pm to 06.00 pm', NULL)
INSERT [dbo].[materslot] ([sloteid], [slote_name], [timeset]) VALUES (7, N'06.00 pm to 08.00 pm', NULL)
INSERT [dbo].[materslot] ([sloteid], [slote_name], [timeset]) VALUES (8, N'08.00 pm to 10.00 pm', NULL)
INSERT [dbo].[materslot] ([sloteid], [slote_name], [timeset]) VALUES (9, N'10.00 pm to 12.00 am', NULL)
SET IDENTITY_INSERT [dbo].[materslot] OFF
SET IDENTITY_INSERT [dbo].[Owner] ON 

INSERT [dbo].[Owner] ([Oid], [Mobile], [Otp], [access_token], [kyc], [walletid]) VALUES (1, N'9871949688', N'9673', NULL, N'false', N'1')
INSERT [dbo].[Owner] ([Oid], [Mobile], [Otp], [access_token], [kyc], [walletid]) VALUES (2, N'9899999999', N'5999', NULL, N'false', N'3')
INSERT [dbo].[Owner] ([Oid], [Mobile], [Otp], [access_token], [kyc], [walletid]) VALUES (3, N'9888888888', N'8013', NULL, N'false', N'4')
INSERT [dbo].[Owner] ([Oid], [Mobile], [Otp], [access_token], [kyc], [walletid]) VALUES (4, N'9841949688', N'6935', NULL, N'false', N'5')
INSERT [dbo].[Owner] ([Oid], [Mobile], [Otp], [access_token], [kyc], [walletid]) VALUES (1004, N'9151134737', N'9673', NULL, N'false', N'1005')
SET IDENTITY_INSERT [dbo].[Owner] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Pid], [Sid], [P_Name], [P_Desc], [P_Type], [P_Category], [Offer_Price], [P_Warranty], [Default_Package], [Default_Price], [Pac_Id]) VALUES (1, N'1', N'rice', N'fhvc', N'Veg', N'for jv', N'86', N'xhh', N'1kg', N'1', N'1')
INSERT [dbo].[Product] ([Pid], [Sid], [P_Name], [P_Desc], [P_Type], [P_Category], [Offer_Price], [P_Warranty], [Default_Package], [Default_Price], [Pac_Id]) VALUES (2, N'1', N'qwerty', N'jd8du', N'Veg', N'hxjx', N'65353', N'jxjx', N'500gram', N'1', N'2')
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[Product_category] ON 

INSERT [dbo].[Product_category] ([cat_id], [cat_name], [cat_image]) VALUES (1, N'Grocery', N'right_arrow.png')
INSERT [dbo].[Product_category] ([cat_id], [cat_name], [cat_image]) VALUES (2, N'Dairy', N'IMG-20191111-WA0000.jpg')
INSERT [dbo].[Product_category] ([cat_id], [cat_name], [cat_image]) VALUES (3, N'Qerfxxc', N'IMG-20191106-WA0000.jpg')
INSERT [dbo].[Product_category] ([cat_id], [cat_name], [cat_image]) VALUES (4, N'oubchv', N'IMG-20191106-WA0000.jpg')
INSERT [dbo].[Product_category] ([cat_id], [cat_name], [cat_image]) VALUES (5, N'grains', N'IMG-20191109-WA0002.jpg')
INSERT [dbo].[Product_category] ([cat_id], [cat_name], [cat_image]) VALUES (6, N'pulses', N'IMG-20191109-WA0001.jpg')
INSERT [dbo].[Product_category] ([cat_id], [cat_name], [cat_image]) VALUES (7, N'uyhh', N'IMG-20191109-WA0000.jpg')
INSERT [dbo].[Product_category] ([cat_id], [cat_name], [cat_image]) VALUES (8, N'qwety', N'IMG-20190910-WA0000.jpg')
INSERT [dbo].[Product_category] ([cat_id], [cat_name], [cat_image]) VALUES (9, N'jfnfbdkxnn', N'IMG-20190913-WA0002.jpg')
SET IDENTITY_INSERT [dbo].[Product_category] OFF
SET IDENTITY_INSERT [dbo].[Product_Images] ON 

INSERT [dbo].[Product_Images] ([Image_id], [pid], [Image_Name]) VALUES (1, N'1', N'IMG-20191106-WA0000.jpg')
INSERT [dbo].[Product_Images] ([Image_id], [pid], [Image_Name]) VALUES (2, N'2', N'IMG-20191106-WA0000.jpg')
SET IDENTITY_INSERT [dbo].[Product_Images] OFF
SET IDENTITY_INSERT [dbo].[Product_package] ON 

INSERT [dbo].[Product_package] ([Pac_Id], [Pid], [Package], [Package_Price], [Count]) VALUES (1, N'1', N'1kg', N'1', N'0')
INSERT [dbo].[Product_package] ([Pac_Id], [Pid], [Package], [Package_Price], [Count]) VALUES (2, N'2', N'500gram', N'1', N'0')
INSERT [dbo].[Product_package] ([Pac_Id], [Pid], [Package], [Package_Price], [Count]) VALUES (3, N'2', N'1kg', N'2', N'0')
SET IDENTITY_INSERT [dbo].[Product_package] OFF
SET IDENTITY_INSERT [dbo].[ratingreview] ON 

INSERT [dbo].[ratingreview] ([id], [userid], [shopid], [orderid], [rating], [description]) VALUES (1, N'1', N'1', N'1', N'4.0', N'good')
INSERT [dbo].[ratingreview] ([id], [userid], [shopid], [orderid], [rating], [description]) VALUES (2, N'1', N'1', N'2', N'4.0', N'nice')
INSERT [dbo].[ratingreview] ([id], [userid], [shopid], [orderid], [rating], [description]) VALUES (3, N'3', N'3', N'3', N'3.5', N'good')
SET IDENTITY_INSERT [dbo].[ratingreview] OFF
SET IDENTITY_INSERT [dbo].[selectedCategory] ON 

INSERT [dbo].[selectedCategory] ([id], [Sid], [cat_id]) VALUES (4, N'18', N'2')
INSERT [dbo].[selectedCategory] ([id], [Sid], [cat_id]) VALUES (5, N'18', N'5')
INSERT [dbo].[selectedCategory] ([id], [Sid], [cat_id]) VALUES (6, N'18', N'3')
INSERT [dbo].[selectedCategory] ([id], [Sid], [cat_id]) VALUES (7, N'18', N'6')
SET IDENTITY_INSERT [dbo].[selectedCategory] OFF
SET IDENTITY_INSERT [dbo].[Shop] ON 

INSERT [dbo].[Shop] ([Sid], [oid], [Shop_Name], [Owner_Name], [Email], [Shop_latitiude], [Shop_longitude], [Shop_address], [Pincode], [Alternate_No], [statusshop], [MinOrderPrice]) VALUES (1, N'1', N'Big Bazar', N'abc', N'abc@gmail.com', N'28.587207293803743', N'77.31670126318932', N'sector 2 noida', N'201301', N'9630852147', N'false', N'100')
INSERT [dbo].[Shop] ([Sid], [oid], [Shop_Name], [Owner_Name], [Email], [Shop_latitiude], [Shop_longitude], [Shop_address], [Pincode], [Alternate_No], [statusshop], [MinOrderPrice]) VALUES (18, N'2', N'chcfghg', N'dffc', N'vhftg@gmail.com', N'28.587095420772034', N'77.31659766286612', N'hdgcxdf', N'47457', N'9632580741', N'false', N'250')
INSERT [dbo].[Shop] ([Sid], [oid], [Shop_Name], [Owner_Name], [Email], [Shop_latitiude], [Shop_longitude], [Shop_address], [Pincode], [Alternate_No], [statusshop], [MinOrderPrice]) VALUES (1017, N'1', N'kchachac', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'false', N'100')
SET IDENTITY_INSERT [dbo].[Shop] OFF
SET IDENTITY_INSERT [dbo].[Shop_Images] ON 

INSERT [dbo].[Shop_Images] ([shop_image_id], [Sid], [shop_image]) VALUES (1, N'1', N'IMG-20191106-WA0000.jpg')
INSERT [dbo].[Shop_Images] ([shop_image_id], [Sid], [shop_image]) VALUES (4, N'18', N'IMG-20190913-WA0002.jpg')
INSERT [dbo].[Shop_Images] ([shop_image_id], [Sid], [shop_image]) VALUES (5, N'18', N'IMG-20190911-WA0004.jpg')
INSERT [dbo].[Shop_Images] ([shop_image_id], [Sid], [shop_image]) VALUES (6, N'18', N'IMG-20190910-WA0000.jpg')
SET IDENTITY_INSERT [dbo].[Shop_Images] OFF
SET IDENTITY_INSERT [dbo].[slotemaster] ON 

INSERT [dbo].[slotemaster] ([id], [sid], [sunday], [monday], [tuesday], [wednesday], [thursday], [friday], [saturday]) VALUES (1, N'1', N'10.00 am to 10.00 pm', N'10.00 am to 10.00 pm', N'10.00 am to 10.00 pm', N'10.00 am to 10.00 pm', N'10.00 am to 10.00 pm', N'10.00 am to 10.00 pm', N'10.00 am to 10.00 pm')
INSERT [dbo].[slotemaster] ([id], [sid], [sunday], [monday], [tuesday], [wednesday], [thursday], [friday], [saturday]) VALUES (2, N'8', N'10.00 am to 10.00 pm', N'10.00 am to 10.00 pm', N'10.00 am to 10.00 pm', N'10.00 am to 10.00 pm', N'10.00 am to 10.00 pm', N'10.00 am to 10.00 pm', N'10.00 am to 10.00 pm')
INSERT [dbo].[slotemaster] ([id], [sid], [sunday], [monday], [tuesday], [wednesday], [thursday], [friday], [saturday]) VALUES (3, N'9', N'10.00 am to 10.00 pm', N'10.00 am to 10.00 pm', N'10.00 am to 10.00 pm', N'10.00 am to 10.00 pm', N'10.00 am to 10.00 pm', N'10.00 am to 10.00 pm', N'10.00 am to 10.00 pm')
INSERT [dbo].[slotemaster] ([id], [sid], [sunday], [monday], [tuesday], [wednesday], [thursday], [friday], [saturday]) VALUES (4, N'10', N'10.00 am to 10.00 pm', N'10.00 am to 10.00 pm', N'10.00 am to 10.00 pm', N'10.00 am to 10.00 pm', N'10.00 am to 10.00 pm', N'10.00 am to 10.00 pm', N'10.00 am to 10.00 pm')
INSERT [dbo].[slotemaster] ([id], [sid], [sunday], [monday], [tuesday], [wednesday], [thursday], [friday], [saturday]) VALUES (5, N'11', N'10.00 am to 10.00 pm', N'10.00 am to 10.00 pm', N'10.00 am to 10.00 pm', N'10.00 am to 10.00 pm', N'10.00 am to 10.00 pm', N'10.00 am to 10.00 pm', N'10.00 am to 10.00 pm')
INSERT [dbo].[slotemaster] ([id], [sid], [sunday], [monday], [tuesday], [wednesday], [thursday], [friday], [saturday]) VALUES (6, N'12', N'10.00 am to 10.00 pm', N'10.00 am to 10.00 pm', N'10.00 am to 10.00 pm', N'10.00 am to 10.00 pm', N'10.00 am to 10.00 pm', N'10.00 am to 10.00 pm', N'10.00 am to 10.00 pm')
INSERT [dbo].[slotemaster] ([id], [sid], [sunday], [monday], [tuesday], [wednesday], [thursday], [friday], [saturday]) VALUES (7, N'13', N'10.00 am to 10.00 pm', N'10.00 am to 10.00 pm', N'10.00 am to 10.00 pm', N'10.00 am to 10.00 pm', N'10.00 am to 10.00 pm', N'10.00 am to 10.00 pm', N'10.00 am to 10.00 pm')
INSERT [dbo].[slotemaster] ([id], [sid], [sunday], [monday], [tuesday], [wednesday], [thursday], [friday], [saturday]) VALUES (11, N'17', N'10.00 am to 10.00 pm', N'10.00 am to 10.00 pm', N'10.00 am to 10.00 pm', N'10.00 am to 10.00 pm', N'10.00 am to 10.00 pm', N'10.00 am to 10.00 pm', N'10.00 am to 10.00 pm')
INSERT [dbo].[slotemaster] ([id], [sid], [sunday], [monday], [tuesday], [wednesday], [thursday], [friday], [saturday]) VALUES (1011, N'1017', N'10.00 am to 10.00 pm', N'10.00 am to 10.00 pm', N'10.00 am to 10.00 pm', N'10.00 am to 10.00 pm', N'10.00 am to 10.00 pm', N'10.00 am to 10.00 pm', N'10.00 am to 10.00 pm')
INSERT [dbo].[slotemaster] ([id], [sid], [sunday], [monday], [tuesday], [wednesday], [thursday], [friday], [saturday]) VALUES (8, N'14', N'10.00 am to 10.00 pm', N'10.00 am to 10.00 pm', N'10.00 am to 10.00 pm', N'10.00 am to 10.00 pm', N'10.00 am to 10.00 pm', N'10.00 am to 10.00 pm', N'10.00 am to 10.00 pm')
INSERT [dbo].[slotemaster] ([id], [sid], [sunday], [monday], [tuesday], [wednesday], [thursday], [friday], [saturday]) VALUES (9, N'15', N'10.00 am to 10.00 pm', N'10.00 am to 10.00 pm', N'10.00 am to 10.00 pm', N'10.00 am to 10.00 pm', N'10.00 am to 10.00 pm', N'10.00 am to 10.00 pm', N'10.00 am to 10.00 pm')
INSERT [dbo].[slotemaster] ([id], [sid], [sunday], [monday], [tuesday], [wednesday], [thursday], [friday], [saturday]) VALUES (10, N'16', N'10.00 am to 10.00 pm', N'10.00 am to 10.00 pm', N'10.00 am to 10.00 pm', N'10.00 am to 10.00 pm', N'10.00 am to 10.00 pm', N'10.00 am to 10.00 pm', N'10.00 am to 10.00 pm')
INSERT [dbo].[slotemaster] ([id], [sid], [sunday], [monday], [tuesday], [wednesday], [thursday], [friday], [saturday]) VALUES (12, N'18', N'10.00 am to 10.00 pm', N'10.00 am to 10.00 pm', N'10.00 am to 10.00 pm', N'10.00 am to 10.00 pm', N'10.00 am to 10.00 pm', N'10.00 am to 10.00 pm', N'10.00 am to 10.00 pm')
SET IDENTITY_INSERT [dbo].[slotemaster] OFF
SET IDENTITY_INSERT [dbo].[tblcart] ON 

INSERT [dbo].[tblcart] ([cartid], [pacid], [cid], [counts], [timest], [orderid]) VALUES (7, 1, 1, N'1', NULL, NULL)
SET IDENTITY_INSERT [dbo].[tblcart] OFF
SET IDENTITY_INSERT [dbo].[tbleOrder] ON 

INSERT [dbo].[tbleOrder] ([orderid], [firstname], [orderamount], [paymode], [lastname], [phonenumber], [address], [zip], [city], [datetime], [trasactionId], [cid], [orderstatus], [status], [oid], [ratid]) VALUES (1, N'ashutosh', N'1', N'paytm', N'jaiswal', N'9151134737', N'noida', N'110096', NULL, N'1911081028', NULL, N'1', NULL, N'2', N'1', N'1')
INSERT [dbo].[tbleOrder] ([orderid], [firstname], [orderamount], [paymode], [lastname], [phonenumber], [address], [zip], [city], [datetime], [trasactionId], [cid], [orderstatus], [status], [oid], [ratid]) VALUES (2, N'hfhfhfh', N'1', N'paytm', N'hfhhr', N'9151134737', N'hd', N'255', NULL, N'1911081038', NULL, N'1', NULL, N'1', N'1', N'2')
INSERT [dbo].[tbleOrder] ([orderid], [firstname], [orderamount], [paymode], [lastname], [phonenumber], [address], [zip], [city], [datetime], [trasactionId], [cid], [orderstatus], [status], [oid], [ratid]) VALUES (3, N'djjf', N'1', N'paytm', N'dhdhf', N'9151134737', N'dncjc', N'8989', NULL, N'1911081115', NULL, N'1', NULL, N'1', N'1', NULL)
INSERT [dbo].[tbleOrder] ([orderid], [firstname], [orderamount], [paymode], [lastname], [phonenumber], [address], [zip], [city], [datetime], [trasactionId], [cid], [orderstatus], [status], [oid], [ratid]) VALUES (4, N'srdgdh', N'1', N'paytm', N'gedgdg', N'9151134737', N'ffsd', N'555', NULL, N'1911081123', NULL, N'1', NULL, N'1', N'1', NULL)
INSERT [dbo].[tbleOrder] ([orderid], [firstname], [orderamount], [paymode], [lastname], [phonenumber], [address], [zip], [city], [datetime], [trasactionId], [cid], [orderstatus], [status], [oid], [ratid]) VALUES (5, N'gdgdgdv', N'3', N'paytm', N'sgdghd', N'9151134737', N'fggg', N'5555', NULL, N'1911081130', NULL, N'1', NULL, N'1', N'1', NULL)
INSERT [dbo].[tbleOrder] ([orderid], [firstname], [orderamount], [paymode], [lastname], [phonenumber], [address], [zip], [city], [datetime], [trasactionId], [cid], [orderstatus], [status], [oid], [ratid]) VALUES (6, N'gdgdgdv', N'3', N'paytm', N'sgdghd', N'9151134737', N'fggg', N'5555', NULL, N'1911081133', NULL, N'1', NULL, N'0', N'1', NULL)
INSERT [dbo].[tbleOrder] ([orderid], [firstname], [orderamount], [paymode], [lastname], [phonenumber], [address], [zip], [city], [datetime], [trasactionId], [cid], [orderstatus], [status], [oid], [ratid]) VALUES (7, N'egdgdg', N'1', N'paytm', N'sgddg', N'9151134737', N'xxbbc', N'8898', NULL, N'1911131623', NULL, N'1', NULL, N'0', N'1', NULL)
INSERT [dbo].[tbleOrder] ([orderid], [firstname], [orderamount], [paymode], [lastname], [phonenumber], [address], [zip], [city], [datetime], [trasactionId], [cid], [orderstatus], [status], [oid], [ratid]) VALUES (8, N'ffn', N'1', N'paytm', N'XD ', N'9151134737', N',cvx', N'88', NULL, N'1911131625', NULL, N'1', NULL, N'0', N'1', NULL)
INSERT [dbo].[tbleOrder] ([orderid], [firstname], [orderamount], [paymode], [lastname], [phonenumber], [address], [zip], [city], [datetime], [trasactionId], [cid], [orderstatus], [status], [oid], [ratid]) VALUES (9, N'fghh', N'1', N'paytm', N'fghh', N'9151134737', N'dgg', N'889', NULL, N'1911131630', NULL, N'1', NULL, N'0', N'1', NULL)
INSERT [dbo].[tbleOrder] ([orderid], [firstname], [orderamount], [paymode], [lastname], [phonenumber], [address], [zip], [city], [datetime], [trasactionId], [cid], [orderstatus], [status], [oid], [ratid]) VALUES (10, N'fghh', N'1', N'paytm', N'fghh', N'9151134737', N'dgg', N'889', NULL, N'1911131631', NULL, N'1', NULL, N'0', N'1', NULL)
INSERT [dbo].[tbleOrder] ([orderid], [firstname], [orderamount], [paymode], [lastname], [phonenumber], [address], [zip], [city], [datetime], [trasactionId], [cid], [orderstatus], [status], [oid], [ratid]) VALUES (11, N'fgbg', N'1', N'paytm', N'tgg', N'9151134737', N'xgxv', N'78', NULL, N'1911131636', NULL, N'1', NULL, N'0', N'1', NULL)
INSERT [dbo].[tbleOrder] ([orderid], [firstname], [orderamount], [paymode], [lastname], [phonenumber], [address], [zip], [city], [datetime], [trasactionId], [cid], [orderstatus], [status], [oid], [ratid]) VALUES (12, N'fgbg', N'1', N'paytm', N'tgg', N'9151134737', N'xgxv', N'78', NULL, N'1911131637', NULL, N'1', NULL, N'0', N'1', NULL)
INSERT [dbo].[tbleOrder] ([orderid], [firstname], [orderamount], [paymode], [lastname], [phonenumber], [address], [zip], [city], [datetime], [trasactionId], [cid], [orderstatus], [status], [oid], [ratid]) VALUES (13, N'bxxb', N'1', N'paytm', N'gcbcb', N'9151134737', N'xbnc', N'889', NULL, N'1911131640', NULL, N'1', NULL, N'0', N'1', NULL)
INSERT [dbo].[tbleOrder] ([orderid], [firstname], [orderamount], [paymode], [lastname], [phonenumber], [address], [zip], [city], [datetime], [trasactionId], [cid], [orderstatus], [status], [oid], [ratid]) VALUES (14, N'vhb', N'0', N'paytm', N'rgv', N'9151134737', N'vvv', N'88', NULL, N'1911131643', NULL, N'1', NULL, N'0', N'1', NULL)
INSERT [dbo].[tbleOrder] ([orderid], [firstname], [orderamount], [paymode], [lastname], [phonenumber], [address], [zip], [city], [datetime], [trasactionId], [cid], [orderstatus], [status], [oid], [ratid]) VALUES (15, N'vhb', N'0', N'paytm', N'rgv', N'9151134737', N'vvv', N'88', NULL, N'1911131644', NULL, N'1', NULL, N'0', N'1', NULL)
INSERT [dbo].[tbleOrder] ([orderid], [firstname], [orderamount], [paymode], [lastname], [phonenumber], [address], [zip], [city], [datetime], [trasactionId], [cid], [orderstatus], [status], [oid], [ratid]) VALUES (16, N'fgg', N'0', N'paytm', N'f', N'9151134737', N'fff', N'888', NULL, N'1911131654', NULL, N'1', NULL, N'0', N'1', NULL)
INSERT [dbo].[tbleOrder] ([orderid], [firstname], [orderamount], [paymode], [lastname], [phonenumber], [address], [zip], [city], [datetime], [trasactionId], [cid], [orderstatus], [status], [oid], [ratid]) VALUES (17, N'tty', N'0', N'paytm', N'ghh', N'9151134737', N'vv', N'88', NULL, N'1911131737', NULL, N'1', NULL, N'0', N'1', NULL)
INSERT [dbo].[tbleOrder] ([orderid], [firstname], [orderamount], [paymode], [lastname], [phonenumber], [address], [zip], [city], [datetime], [trasactionId], [cid], [orderstatus], [status], [oid], [ratid]) VALUES (18, N'rfg', N'0', N'paytm', N'ggg', N'9151134737', N'gbb', N'888', NULL, N'1911131752', NULL, N'1', NULL, N'0', N'1', NULL)
INSERT [dbo].[tbleOrder] ([orderid], [firstname], [orderamount], [paymode], [lastname], [phonenumber], [address], [zip], [city], [datetime], [trasactionId], [cid], [orderstatus], [status], [oid], [ratid]) VALUES (19, N'rfg', N'0', N'paytm', N'ggg', N'9151134737', N'gbb', N'888', NULL, N'1911131754', NULL, N'1', NULL, N'0', N'1', NULL)
SET IDENTITY_INSERT [dbo].[tbleOrder] OFF
SET IDENTITY_INSERT [dbo].[transactions] ON 

INSERT [dbo].[transactions] ([transactionid], [walleteid], [description], [avaliblebalance], [transationfrom], [transamount], [transactiontype], [transactionstatus], [txnrcptId], [payMode]) VALUES (1, N'2', N'Rupees 200 is added in your Wallet', N'200', N'0', N'200', N'CRE', N'TXN_FAILURE', NULL, N'paytm')
INSERT [dbo].[transactions] ([transactionid], [walleteid], [description], [avaliblebalance], [transationfrom], [transamount], [transactiontype], [transactionstatus], [txnrcptId], [payMode]) VALUES (2, N'2', N'Rupees 25 is added in your Wallet', N'225', N'0', N'25', N'CRE', N'TXN_FAILURE', N'20191113111212800110168387601000638', N'paytm')
INSERT [dbo].[transactions] ([transactionid], [walleteid], [description], [avaliblebalance], [transationfrom], [transamount], [transactiontype], [transactionstatus], [txnrcptId], [payMode]) VALUES (3, N'2', N'Rupees 25 is added in your Wallet', N'225', N'0', N'25', N'CRE', N'INT', NULL, N'paytm')
INSERT [dbo].[transactions] ([transactionid], [walleteid], [description], [avaliblebalance], [transationfrom], [transamount], [transactiontype], [transactionstatus], [txnrcptId], [payMode]) VALUES (4, N'2', N'Rupees 25 is added in your Wallet', N'225', N'0', N'25', N'CRE', N'TXN_FAILURE', NULL, N'paytm')
INSERT [dbo].[transactions] ([transactionid], [walleteid], [description], [avaliblebalance], [transationfrom], [transamount], [transactiontype], [transactionstatus], [txnrcptId], [payMode]) VALUES (5, N'2', N'Rupees 2 is added in your Wallet', N'277', N'0', N'2', N'CRE', N'TXN_FAILURE', N'20191113111212800110168418101007256', N'paytm')
INSERT [dbo].[transactions] ([transactionid], [walleteid], [description], [avaliblebalance], [transationfrom], [transamount], [transactiontype], [transactionstatus], [txnrcptId], [payMode]) VALUES (7, N'2', N'Rupees 3 is added in your Wallet', N'278', N'0', N'3', N'CRE', N'TXN_FAILURE', NULL, N'paytm')
INSERT [dbo].[transactions] ([transactionid], [walleteid], [description], [avaliblebalance], [transationfrom], [transamount], [transactiontype], [transactionstatus], [txnrcptId], [payMode]) VALUES (8, N'2', N'Rupees 25 is added in your Wallet', N'308', N'0', N'25', N'CRE', N'TXN_FAILURE', NULL, N'paytm')
INSERT [dbo].[transactions] ([transactionid], [walleteid], [description], [avaliblebalance], [transationfrom], [transamount], [transactiontype], [transactionstatus], [txnrcptId], [payMode]) VALUES (6, N'2', N'Rupees 3 is added in your Wallet', N'278', N'0', N'3', N'CRE', N'TXN_FAILURE', NULL, N'paytm')
INSERT [dbo].[transactions] ([transactionid], [walleteid], [description], [avaliblebalance], [transationfrom], [transamount], [transactiontype], [transactionstatus], [txnrcptId], [payMode]) VALUES (9, N'2', N'Rupees 14 is added in your Wallet', N'322', N'0', N'14', N'CRE', N'TXN_FAILURE', NULL, N'paytm')
INSERT [dbo].[transactions] ([transactionid], [walleteid], [description], [avaliblebalance], [transationfrom], [transamount], [transactiontype], [transactionstatus], [txnrcptId], [payMode]) VALUES (10, N'2', N'Rupees 14 is added in your Wallet', N'322', N'0', N'14', N'CRE', N'TXN_FAILURE', NULL, N'paytm')
INSERT [dbo].[transactions] ([transactionid], [walleteid], [description], [avaliblebalance], [transationfrom], [transamount], [transactiontype], [transactionstatus], [txnrcptId], [payMode]) VALUES (11, N'2', N'Rupees 1 is added in your Wallet', N'337', N'0', N'1', N'CRE', N'TXN_FAILURE', N'20191113111212800110168745701014982', N'paytm')
SET IDENTITY_INSERT [dbo].[transactions] OFF
SET IDENTITY_INSERT [dbo].[Wallet] ON 

INSERT [dbo].[Wallet] ([W_Id], [Amount], [transtype], [transactionid]) VALUES (1, N'0.0', N'0.0', NULL)
INSERT [dbo].[Wallet] ([W_Id], [Amount], [transtype], [transactionid]) VALUES (2, N'337', N'0.0', NULL)
INSERT [dbo].[Wallet] ([W_Id], [Amount], [transtype], [transactionid]) VALUES (3, N'0.0', N'0.0', NULL)
INSERT [dbo].[Wallet] ([W_Id], [Amount], [transtype], [transactionid]) VALUES (4, N'0.0', N'0.0', NULL)
INSERT [dbo].[Wallet] ([W_Id], [Amount], [transtype], [transactionid]) VALUES (5, N'0.0', N'0.0', NULL)
INSERT [dbo].[Wallet] ([W_Id], [Amount], [transtype], [transactionid]) VALUES (1005, N'0.0', N'0.0', NULL)
SET IDENTITY_INSERT [dbo].[Wallet] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [UC_consumer]    Script Date: 04-05-2020 12:07:59 ******/
ALTER TABLE [dbo].[Consumer] ADD  CONSTRAINT [UC_consumer] UNIQUE NONCLUSTERED 
(
	[Email] ASC,
	[Mobile] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_Owner]    Script Date: 04-05-2020 12:07:59 ******/
ALTER TABLE [dbo].[Owner] ADD  CONSTRAINT [UK_Owner] UNIQUE NONCLUSTERED 
(
	[Mobile] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Shop] ADD  DEFAULT ('false') FOR [statusshop]
GO
ALTER TABLE [dbo].[tbleOrder] ADD  DEFAULT ('0') FOR [status]
GO
ALTER TABLE [dbo].[transactions] ADD  CONSTRAINT [avbal_default]  DEFAULT ((0.0)) FOR [avaliblebalance]
GO
ALTER TABLE [dbo].[Wallet] ADD  DEFAULT ('0.0') FOR [transtype]
GO
ALTER TABLE [dbo].[Shop]  WITH CHECK ADD CHECK  (([MinOrderPrice]>=(100)))
GO
/****** Object:  StoredProcedure [dbo].[address_op]    Script Date: 04-05-2020 12:07:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[address_op]
(
@ActionType nvarchar(20) = NULL,
@country_name nvarchar(255) = NULL,
@state_name nvarchar(255) = NULL,
@address_name nvarchar(255) = NULL,
@address_line1 nvarchar(255) = NULL,
@address_line2 nvarchar(255) = NULL,
@lattitude nvarchar(255) = NULL,
@longitude nvarchar(255) = NULL,
@cid nvarchar(255) = NULL,
@addtype nvarchar(255) = NULL,
@add_id nvarchar(255)=NULL
)

AS
BEGIN
IF @ActionType = 'getAddress'
BEGIN
	select * from addtble where cid=@Cid

END

IF @ActionType = 'addAddress'
BEGIN
	INSERT INTO addtble (country_name,state_name,address_name,address_line1,address_line2,lattitude,longitude,cid,addtype)Values(@country_name,@state_name,
	@address_name,@address_line1,@address_line2,@lattitude,@longitude,@cid,@addtype)
END

IF @ActionType = 'editAddress'
BEGIN
	UPDATE addtble set country_name=@country_name,state_name=@state_name,address_name=@address_name,address_line1=@address_line1,address_line2=@address_line2,lattitude=@lattitude,longitude=@longitude,cid=@cid,addtype=@addtype where add_id=@add_id
END

IF @ActionType = 'deleteAddress'
BEGIN
	delete from addtble where add_id=@add_id
END
END



GO
/****** Object:  StoredProcedure [dbo].[GetProductList]    Script Date: 04-05-2020 12:07:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetProductList](
@sid  nvarchar(100)= null,
@cid  nvarchar(100)= null
)

AS
BEGIN
SELECT p.*,
(SELECT  cast(SUM(CAST(tj.counts AS int)) as varchar) as counts
FROM (select pd.*,pc.pacid,pc.cid,pc.counts,pc.Package_Price,pc.Package from  Product as pd  left join (select tc.cartid,tc.pacid,tc.cid,tc.counts,pp.*  from  Product_package as pp left join (select cartid,pacid,cid,counts from tblcart where cid=@cid) as tc on tc.pacid=pp.Pac_Id) as pc on pd.Pid=pc.Pid ) as tj
where tj.pid is not null AND tj.Pid = p.Pid
GROUP BY tj.Pid 
FOR JSON PATH) AS Count,
(SELECT pac.*,
(SELECT cast(SUM(CAST(dj.counts AS int)) as varchar) as counts
FROM (select pd.Pac_Id , pc.pacid,pc.cid,pc.counts from Product as pd left join (select tc.cartid ,pp.*, tc.pacid, tc.cid, tc.counts from Product_package as pp left join (select cartid,pacid,cid,counts from tblcart where cid =@cid) as tc on tc.pacid = pp.Pac_Id ) as pc on pd.Pid = pc.pid) as dj
where dj.Pac_Id is not null AND dj.pacid = pac.Pac_Id
group by dj.Pac_Id
FOR JSON PATH) AS packagesCount
FROM Product_package as pac 
WHERE pac.Pid = p.Pid
FOR JSON PATH) AS packages,
(SELECT i.*
FROM  Product_Images as i
WHERE i.pid=p.Pid
FOR JSON PATH) AS Images
FROM Product as p
where sid=@sid
ORDER BY p.Pid
FOR JSON PATH
END




GO
/****** Object:  StoredProcedure [dbo].[GetShopDetail]    Script Date: 04-05-2020 12:07:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetShopDetail]
(
@oid nvarchar(255)=null
)

AS
BEGIN
SELECT S.*,
(SELECT sc.* 
FROM selectedCategory as sc
WHERE sc.Sid = S.Sid
FOR JSON PATH) AS category,
(SELECT i.*
FROM  Shop_Images as i
WHERE i.Sid=S.Sid
FOR JSON PATH) AS Images
FROM Shop as S
where S.oid = @oid
ORDER BY S.Sid
FOR JSON PATH
END
GO
/****** Object:  StoredProcedure [dbo].[Home]    Script Date: 04-05-2020 12:07:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Home](
@ActionType nvarchar(250)=null,
@oid nvarchar(250)=null,
@sid nvarchar(250)=null
)
as begin
if @ActionType ='select'
begin
declare @countnew  nvarchar(250);
declare @countprocessing nvarchar(250);
declare @completed nvarchar(250);
declare @productcount nvarchar(250);
declare @offercount nvarchar(250);
select @countnew=count(*) from tbleOrder where oid=@oid and status=0;
select @countprocessing=count(*) from tbleOrder where oid=@oid and status=1;
select @completed=count(*) from tbleOrder where oid=@oid and status=2;
select @productcount =count(*) from Product where Sid=@sid;
select @offercount =count(*) from Offer where sid=@sid;
select @offercount as offer, @productcount as productcount,@countnew as new , @countprocessing as processing ,@completed as completed

end
end

GO
/****** Object:  StoredProcedure [dbo].[kyc_docData]    Script Date: 04-05-2020 12:07:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[kyc_docData]
(
@ActionType nvarchar(20) = NULL,
@id nvarchar(255) = NULL,
@Did nvarchar(255) = NULL,
@Cid nvarchar(255) = NULL,
@DocNumber nvarchar(255) = NULL,
@D_File nvarchar(255) = NULL
)

AS
BEGIN
IF @ActionType = 'Insert'
BEGIN
SET NOCOUNT ON;
	INSERT INTO kyc_data (Did,Cid,DocNumber,D_File)Values(@Did,@Cid,@DocNumber,@D_File)
END
IF @ActionType = 'Update'
BEGIN
UPDATE kyc_data SET Did=@Did,Cid=@Cid,DocNumber=@DocNumber,D_File=@D_File  where id = @id
END
IF @ActionType = 'Select'
BEGIN
Select * from kyc_data where Cid=@Cid
END
IF @ActionType = 'Delete'
BEGIN
DELETE FROM kyc_data WHERE id = @id
END
END
GO
/****** Object:  StoredProcedure [dbo].[prcAdminShop]    Script Date: 04-05-2020 12:07:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[prcAdminShop](
@Action nvarchar (100) = NULL,
@Sid nvarchar(250) = NULL,
@oid nvarchar(250) = NULL
)

AS 
BEGIN
IF @Action = 'select'
BEGIN
select sp.*,
(SELECT spi.* 
from Shop_Images as spi
WHERE spi.Sid = sp.Sid
FOR JSON PATH) AS ShopImages,
(SELECT kd.*
from kyc_data as kd
WHERE kd.Cid = sp.oid
FOR JSON PATH ) AS KycData
FROM Shop as sp 
ORDER BY sp.Sid
FOR JSON PATH
END

IF @Action = 'approvedShop'
BEGIN
select sp.*,
(SELECT spi.*
from Shop_Images as spi
WHERE spi.Sid = sp.Sid
FOR JSON PATH) AS ShopImages,
(SELECT kd.* 
from kyc_data as kd
WHERE kd.Cid= sp.Sid
FOR JSON PATH) AS KycData
FROM Shop as sp 
WHERE sp.statusshop= 'true'
ORDER BY sp.Sid
FOR JSON PATH
END

IF @Action = 'UnApprovedShop'
BEGIN
select sp.*,
(SELECT spi.*
from Shop_Images as spi
WHERE spi.Sid = sp.Sid
FOR JSON PATH) AS ShopImages,
(SELECT kd.* 
from kyc_data as kd
WHERE kd.Cid= sp.Sid
FOR JSON PATH) AS KycData
FROM Shop as sp 
WHERE sp.statusshop= 'false'
ORDER BY sp.Sid
FOR JSON PATH
END

IF @Action = 'update'
BEGIN
UPDATE Shop set statusshop = 'true' where Sid = @Sid
UPDATE Owner set kyc = 'true' where Oid = @oid
END
END




GO
/****** Object:  StoredProcedure [dbo].[prccart]    Script Date: 04-05-2020 12:07:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[prccart]
(
@ActionType nvarchar(20) = NULL,
@Pac_Id nvarchar (20)= NULL,
@Pid nvarchar (20)= NULL,
@Package nvarchar (20)= NULL,
@Package_Price nvarchar(100)= null,
@Count nvarchar(100)= null,
@default_pack nvarchar(100)= null,
@cid  nvarchar(100)= null,
@pacid nvarchar(100) = null,
@cartid nvarchar(100) = null
)
 
 AS
BEGIN
IF @ActionType = 'Insert'
BEGIN
SET NOCOUNT ON;
	INSERT INTO tblcart (pacid,cid,counts)Values(@Pac_Id,@cid,@Count)
END
IF @ActionType = 'Update'
BEGIN
UPDATE tblcart SET counts=@Count where cid =@cid and pacid =@Pac_Id 
END

IF @ActionType = 'getCount'
BEGIN
select cartid from  tblcart  where cid =@cid and pacid =@Pac_Id 
END


IF @ActionType = 'getCart'
BEGIN
select sp.Shop_Name,pd.Default_Price,pd.Offer_Price
,pd.P_Category,pd.P_Desc,pd.P_Name,pd.P_Type,pd.P_Warranty ,pd.Default_Package,(SELECT i.*
FROM  Product_Images as i
WHERE i.pid=pd.Pid
FOR JSON PATH) AS Images,
pp.Pac_Id,pp.Package,pp.Package_Price,pp.Pid,tc.cartid,tc.cid,tc.counts,tc.pacid from  Shop as sp
FULL  JOIN Product as pd ON sp.Sid=pd.Sid
FULL  JOIN Product_package as pp ON pd.Pid=pp.Pid
FULL  JOIN tblcart as tc ON tc.pacid =pp.Pac_Id
where tc.cid =@cid
FOR JSON AUTO
END
IF @ActionType = 'getCartCount'
BEGIN
select SUM(CAST(counts AS int)) from tblcart where cid = @cid
END

IF @ActionType = 'DefaultCartCount'
BEGIN
UPDATE tblcart SET counts = @Count where pacid = @pacid ;
END


IF @ActionType = 'RemoveProduct'
BEGIN
DELETE FROM  tblcart where pacid=@pacid;
END
END

GO
/****** Object:  StoredProcedure [dbo].[prcconsumer]    Script Date: 04-05-2020 12:07:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[prcconsumer]
(
@ActionType nvarchar(20) = NULL,
@Cid nvarchar (20)= NULL,
@Name nvarchar(100)= null,
@Email nvarchar(100)= null,
@Mobile nvarchar(100)= null,
@Gender nvarchar(100)= null,
@Otp nvarchar(100)=null,
@access_token nvarchar(255)=null
)
 
 AS
BEGIN
IF @ActionType = 'Insert'
BEGIN
SET NOCOUNT ON;
    declare @tempcid nvarchar(250)=null;
	INSERT INTO Consumer ( Name, Email, Mobile, Gender)Values(@Name, @Email, @Mobile, @Gender)
	select  @tempcid= SCOPE_IDENTITY();
	declare @temp nvarchar(250)=null;
	insert into wallet (Amount) values (0.0)
	select  @temp= SCOPE_IDENTITY();
	update Consumer set walletid=@temp where Cid=@tempcid;
END
IF @ActionType = 'Update'
BEGIN
UPDATE Consumer SET Otp=@Otp where Cid = @Cid
END
IF @ActionType = 'Select'
BEGIN
Select * from Consumer 
END
IF @ActionType = 'Delete'
BEGIN
DELETE FROM Consumer WHERE Cid = @Cid
END
IF @ActionType = 'UpdateToken'
BEGIN
UPDATE Consumer SET access_token=@access_token where Cid = @Cid 
END
IF @ActionType = 'getconsumerWallet'
BEGIN
select * from Consumer where Cid=@Cid and Name=@Name and Email=@Email and Mobile= @Mobile ;
END
END
GO
/****** Object:  StoredProcedure [dbo].[prcfav]    Script Date: 04-05-2020 12:07:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[prcfav](
@ActionType nvarchar (250),
@sid nvarchar(250),
@cid nvarchar (250)
)
AS
BEGIN

if @ActionType='addFav'
BEGIN
declare @idtemp nvarchar(250);
select @idtemp=id from  favusershop where cid=@cid and sid=@sid
select @idtemp as id
if @idtemp is null
begin
insert into favusershop (Sid,cid,isfav) values(@sid,@cid,'true')
end
else
begin
declare @idtemp2 nvarchar(250);
select @idtemp2=isfav from favusershop where id= @idtemp;
if @idtemp2='true'
begin
update favusershop set isfav='false' where sid=@sid and cid =@cid
end
else
update favusershop set isfav='true' where sid=@sid and cid =@cid
end
END
END
GO
/****** Object:  StoredProcedure [dbo].[prcmasterslot]    Script Date: 04-05-2020 12:07:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[prcmasterslot]
(
@ActionType nvarchar(20) = NULL,
@Sid nvarchar(250)=null
)
 AS
BEGIN
IF @ActionType = 'getList'
BEGIN
select * from slotemaster where sid=@Sid;
END
END






GO
/****** Object:  StoredProcedure [dbo].[prcoffer]    Script Date: 04-05-2020 12:07:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[prcoffer]
(
@ActionType nvarchar(20) = NULL,
@offername nvarchar(255)=null,
@offerpic nvarchar(255)= null,
@discounttype nvarchar(255)= null,
@ammount nvarchar(255)= null,
@sid nvarchar(255)= null,
@description nvarchar(255)= null,
@offerid nvarchar(255)= null
)
 AS
BEGIN
IF @ActionType = 'insert'
BEGIN
INSERT INTO offer (offername,offerpic,discounttype,ammount,sid,description)Values(@offername,@offerpic,@discounttype,@ammount,@sid,@description )
END

IF @ActionType = 'delete'
BEGIN
delete from offer where offerid=@offerid
END



IF @ActionType = 'Update'
BEGIN
UPDATE offer SET offername=@offername,offerpic=@offerpic,discounttype=@discounttype,ammount=@ammount,sid=@sid , description=@description where offerid=@offerid
END

IF @ActionType = 'get'
BEGIN
select * from offer where sid=@sid
END



END


GO
/****** Object:  StoredProcedure [dbo].[prcorder]    Script Date: 04-05-2020 12:07:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[prcorder]
(
@ActionType nvarchar(20) = NULL,
@orderId nvarchar (250)= NULL,
@firstname nvarchar (250)= NULL,
@lastname nvarchar (250)= NULL,
@orderamount nvarchar(250)= null,
@paymode nvarchar(250)= null,
@phonenumber nvarchar(250)= null,
@address  nvarchar(250)= null,
@zip nvarchar(250)= null,
@city nvarchar(250)= null,
@datetime nvarchar(250)= null,
@trasactionId nvarchar(250)= null,
@packagearray nvarchar(250)=null,
@cartId nvarchar(250)=null,
@cid nvarchar(250)=null,
@sid nvarchar(250)=null,
@oid nvarchar(250)=null,
@status nvarchar (250)=null
)
AS
BEGIN
IF @ActionType = 'insert'
BEGIN
    declare @oidtemp nvarchar(250);
    select @oidtemp=oid from Shop where Sid=@sid;
	insert into tbleOrder (firstname,lastname,orderamount,paymode,phonenumber,address,zip,datetime,oid,cid) values (@firstname,@lastname,@orderamount,@paymode,@phonenumber,@address,@zip,@datetime,@oidtemp,@cid);
	select SCOPE_IDENTITY() as orderid;
 END

IF @ActionType = 'orderupdate'
BEGIN
	update tblcart set orderid=@orderId where cartid=@cartId 
END

IF @ActionType = 'getHistory'
BEGIN
select * from tbleOrder where cid=@cid;
END

IF @ActionType = 'getOrderShop'
BEGIN
select * from tbleOrder where oid=@oid;
END

IF @ActionType = 'changeOrderStatus'
BEGIN
update tbleOrder set status=@status where orderid=@orderId ;
END
END
 
 



GO
/****** Object:  StoredProcedure [dbo].[prcotp]    Script Date: 04-05-2020 12:07:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[prcotp]
(
@ActionType nvarchar(20) = NULL,
@Mobile nvarchar(100)= null,
@Otp nvarchar(100)=null
)
 
 AS
BEGIN
IF @ActionType = 'Select'
BEGIN
SELECT Cid,Name,Email,Mobile,Gender,access_token from Consumer where Otp=@Otp
END
IF @ActionType = 'Update'
BEGIN
UPDATE Consumer SET Otp=@Otp where Mobile=@Mobile
END
END
GO
/****** Object:  StoredProcedure [dbo].[prcowner]    Script Date: 04-05-2020 12:07:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[prcowner]
(
@ActionType nvarchar(20) = NULL,
@Oid nvarchar (20)= NULL,
@Mobile nvarchar(100)= null,
@Otp nvarchar(100)=null,
@access_token nvarchar(255)=null
)
 
 AS
BEGIN
IF @ActionType = 'Insert'
BEGIN
declare @kyc nvarchar(250) ='false'
SET NOCOUNT ON;
    declare @tempcid nvarchar(250)=null;
	INSERT INTO Owner ( Mobile,kyc)Values(@Mobile,@kyc)
	select  @tempcid= SCOPE_IDENTITY();
	declare @temp nvarchar(250)=null;
	insert into wallet (Amount) values (0.0)
	select  @temp= SCOPE_IDENTITY();
	update Owner set walletid=@temp where Oid=@tempcid;
END
IF @ActionType = 'Update'
BEGIN
UPDATE Owner SET Otp=@Otp where Oid = @Oid
END
IF @ActionType = 'Select'
BEGIN
Select * from Owner 
END
IF @ActionType = 'Delete'
BEGIN
DELETE FROM Owner WHERE Oid = @Oid
END
IF @ActionType = 'UpdateToken'
BEGIN
UPDATE Owner SET access_token=@access_token where Oid = @Oid
END
IF @ActionType = 'getownerWallet'
BEGIN
select * from Owner where Oid=@Oid and Mobile=@Mobile ;
END
END
GO
/****** Object:  StoredProcedure [dbo].[prcownerotp]    Script Date: 04-05-2020 12:07:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[prcownerotp]
(
@ActionType nvarchar(20) = NULL,
@Mobile nvarchar(100)= null,
@Otp nvarchar(100)=null
)
 
 AS
BEGIN
IF @ActionType = 'Select'
BEGIN
DECLARE @oid nvarchar(250);
DECLARE @mobilen nvarchar(250);
DECLARE @sid nvarchar(250);
DECLARE @kyc nvarchar(250);
DECLARE @walletid nvarchar(250);
SELECT @oid=Oid from Owner where Otp=@Otp
SELECT @Mobilen=Mobile from Owner where Otp=@Otp
SELECT @kyc=kyc from Owner where Otp=@Otp
SELECT @walletid=walletid from Owner where Otp=@Otp
select @sid=sid from Shop where Oid=@oid;
delete from logintemp;
INSERT INTO logintemp (iod,mobile,sid,kyc,walletid)Values(@oid,@mobilen,@sid,@kyc,@walletid)
select * from logintemp

END
IF @ActionType = 'Update'
BEGIN
UPDATE Owner SET Otp=@Otp where Mobile=@Mobile
END
END

GO
/****** Object:  StoredProcedure [dbo].[prcprocategory]    Script Date: 04-05-2020 12:07:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[prcprocategory]
(
@ActionType nvarchar(20) = NULL,
@cat_id nvarchar (20)= NULL,
@cat_name nvarchar (255)= NULL,
@cat_image nvarchar (255)= NULL
)
 
 AS
BEGIN
IF @ActionType = 'Insert'
BEGIN
SET NOCOUNT ON;
	INSERT INTO Product_category (cat_name,cat_image)Values(@cat_name,@cat_image)
END
IF @ActionType = 'Update'
BEGIN
UPDATE Product_category SET cat_name=@cat_name,cat_image=@cat_image where cat_id=@cat_id
END
IF @ActionType = 'Select'
BEGIN
Select * from Product_category 
END
IF @ActionType = 'Delete'
BEGIN
DELETE FROM Product_category WHERE cat_id=@cat_id
END
END
GO
/****** Object:  StoredProcedure [dbo].[prcproduct]    Script Date: 04-05-2020 12:07:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[prcproduct]
(
@ActionType nvarchar(20) = NULL,
@pid nvarchar (20)= NULL,
@Sid nvarchar (20)= NULL,
@P_Name nvarchar (20)= NULL,
@P_Desc nvarchar(100)= null,
@P_Type nvarchar(100)= null,
@P_Category nvarchar(100)= null,
@Offer_Price nvarchar(100)= null,
@P_Warranty nvarchar(100)= null,
@Oid nvarchar (250)=null,
@imagearrayNew nvarchar (250)=null,
@imagearrayOld nvarchar (250)=null,
@packagearrayOld nvarchar (250)=null
)
 
 AS
BEGIN
IF @ActionType = 'Insert'
BEGIN
SET NOCOUNT ON;
	INSERT INTO Product (Sid,P_Name,P_Desc,P_Type,P_Category,Offer_Price,P_Warranty)Values(@Sid,@P_Name,@P_Desc,@P_Type,@P_Category,@Offer_Price,@P_Warranty)
END
IF @ActionType = 'Select'
BEGIN
Select * from Product WHERE Sid=@Sid 
END

IF @ActionType = 'Selectowner'
BEGIN
declare @sid2 nvarchar(250)=null;
select @sid2 =sid from Shop where oid=@Oid
Select * from Product WHERE Sid=@sid2 
END

IF @ActionType = 'Update'
BEGIN
UPDATE Product SET P_Name=@P_Name,P_Desc=@P_Desc,P_Type=@P_Type,P_Category=@P_Category,Offer_Price=@Offer_Price,P_Warranty=@P_Warranty where Pid = @pid AND Sid=@Sid;
delete from Product_Images where Image_id in (select value from STRING_SPLIT(@imagearrayOld,','));
INSERT INTO Product_Images (pid, Image_Name)(SELECT @pid ,items FROM [dbo].[Split](@imagearrayNew, ','))
delete from Product_package where Pac_Id in (select value from STRING_SPLIT(@packagearrayOld,','));
END


IF @ActionType = 'Delete'
BEGIN
DELETE FROM Product WHERE Pid=@pid
END
END


GO
/****** Object:  StoredProcedure [dbo].[prcproductimage]    Script Date: 04-05-2020 12:07:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[prcproductimage]
(
@ActionType nvarchar(20) = NULL,
@Image_id nvarchar (20)= NULL,
@pid nvarchar (20)= NULL,
@Image_Name nvarchar(100)= null
)
 
 AS
BEGIN
IF @ActionType = 'Insert'
BEGIN
SET NOCOUNT ON;
	INSERT INTO Product_Images (pid,Image_Name)Values(@pid,@Image_Name)
END
IF @ActionType = 'Update'
BEGIN
UPDATE Product_Images SET Image_Name=@Image_Name where pid = @pid
END
IF @ActionType = 'Select'
BEGIN
Select * from Product_Images WHERE pid=@pid 
END
IF @ActionType = 'Delete'
BEGIN
DELETE FROM Product_Images WHERE Image_id = @Image_id
END
END
GO
/****** Object:  StoredProcedure [dbo].[prcproductpackage]    Script Date: 04-05-2020 12:07:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[prcproductpackage]
(
@ActionType nvarchar(20) = NULL,
@Pac_Id nvarchar (20)= NULL,
@Pid nvarchar (20)= NULL,
@Package nvarchar (20)= NULL,
@Package_Price nvarchar(100)= null,
@Count nvarchar(100)= null,
@default_pack nvarchar(100)= null,
@cid  nvarchar(100)= null

)
 
 AS
BEGIN
IF @ActionType = 'Insert'
BEGIN
	INSERT INTO Product_package (Pid,Package,Package_Price,Count)Values(@Pid,@Package,@Package_Price,'0')
END

IF @ActionType = 'Add'
BEGIN
INSERT INTO tblcart (pacid,cid,counts)Values(@Pac_Id,@cid,@Count)
END

IF @ActionType = 'Update'
BEGIN
UPDATE Product_package SET Pid=@Pid,Package=@Package,Package_Price=@Package_Price where Pac_Id=@Pac_Id
END
IF @ActionType = 'Select'
BEGIN
Select * from Product_package WHERE Pid=@Pid
END
IF @ActionType = 'Delete'
BEGIN
DELETE FROM Product_package WHERE Pac_Id=@Pac_Id
END
IF @ActionType = 'UpdateCount'
BEGIN
UPDATE Product_package SET Count=@Count where Pac_Id=@Pac_Id
END
IF @ActionType = 'selectbydfault'
BEGIN
Select * from Product_package WHERE Package=@default_pack
END
IF @ActionType = 'selectCount'
BEGIN
Select Pac_Id,Pid,Count from Product_package WHERE Pid=@Pid
END
IF @ActionType = 'getItem'
BEGIN
Select * from Product_package 
END
END

GO
/****** Object:  StoredProcedure [dbo].[prcratingreview]    Script Date: 04-05-2020 12:07:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[prcratingreview](
@ActionType nvarchar(250) = NULL,
@Shopid nvarchar (250) = NULL,
@orderid nvarchar (250) = NULL,
@rating  nvarchar(250) = NULL,
@description nvarchar(250) = NULL,
@cid nvarchar(250) = NULL
)
AS 
BEGIN
if @ActionType = 'getReviewShop'
BEGIN
select rr.*,tbo.orderid ,sp.Sid,sp.oid from ratingreview as rr full join tbleOrder as tbo on rr.id=tbo.ratid full join Shop as sp on tbo.oid=sp.oid where Sid=@Shopid;

END

if @ActionType = 'setRating'
BEGIN
select *  from tbleOrder where orderid=@orderid
declare @tempratid nvarchar(250);
insert into ratingreview (userid,shopid,orderid,rating,description) values (@cid,@Shopid,@orderid,@rating,@description)
select @tempratid = SCOPE_IDENTITY();
update tbleOrder set ratid =@tempratid where orderid=@orderid
END

IF @ActionType = 'getUserReview'
BEGIN
select * from ratingreview where  orderid = @orderid and userid=@cid 
END
END
GO
/****** Object:  StoredProcedure [dbo].[prcselectedCategory]    Script Date: 04-05-2020 12:07:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[prcselectedCategory]
(
@ActionType nvarchar(20) = NULL,
@id nvarchar(255)=null,
@Sid nvarchar(255)=null,
@cat_id nvarchar(255)= null
)
 AS
BEGIN
IF @ActionType = 'Insert'
BEGIN
SET NOCOUNT ON;
	INSERT INTO selectedCategory (Sid,cat_id)(SELECT @Sid ,items FROM [dbo].[Split](@cat_id, ','))
END
IF @ActionType = 'Update'
BEGIN
UPDATE selectedCategory SET cat_id=@cat_id where id = @id
END
IF @ActionType = 'Select'
BEGIN
Select cat_id from selectedCategory Where Sid = @Sid
END
IF @ActionType = 'Delete'
BEGIN
DELETE FROM selectedCategory WHERE id = @id
END
END
GO
/****** Object:  StoredProcedure [dbo].[prcshop]    Script Date: 04-05-2020 12:07:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[prcshop]
(
@ActionType nvarchar(20) = NULL,
@Sid nvarchar(255)=null,
@oid nvarchar(255)= null,
@Shop_Name nvarchar(255)= null,
@Owner_Name nvarchar(255)= null,
@Email nvarchar(255)= null,
@Shop_latitiude nvarchar(255)= null,
@Shop_longitude nvarchar(255)= null,
@Shop_address nvarchar(255)= null,
@Pincode nvarchar(255)= null,
@Alternate_No nvarchar(255)= null,
@imagearrayOld nvarchar(255)=null,
@imagearrayNew nvarchar(255)=null,
@day nvarchar(255)=null,
@time nvarchar(255)=null,
@MinOrderPrice nvarchar(255) = null
)
 
 AS
BEGIN
IF @ActionType = 'Insert'
BEGIN
SET NOCOUNT ON;
    declare @temp nvarchar(250)
	INSERT INTO Shop (MinOrderPrice,oid,Shop_Name,Owner_Name,Email,Shop_latitiude,Shop_longitude,Shop_address,Pincode,Alternate_No) Values (@MinOrderPrice,@oid,@Shop_Name,@Owner_Name,@Email,@Shop_latitiude,@Shop_longitude,@Shop_address,@Pincode,@Alternate_No)
	set @temp= SCOPE_IDENTITY()
	INSERT INTO slotemaster ( sid,sunday,monday,tuesday,wednesday,thursday,friday,saturday) values (@temp, '10.00 am to 10.00 pm', '10.00 am to 10.00 pm', '10.00 am to 10.00 pm', '10.00 am to 10.00 pm', '10.00 am to 10.00 pm', '10.00 am to 10.00 pm', '10.00 am to 10.00 pm') 
    select @temp as sid;
END
IF @ActionType = 'Update'
BEGIN

UPDATE Shop SET oid=@oid,Shop_Name=@Shop_Name,Owner_Name=@Owner_Name,Email=@Email,Shop_latitiude=@Shop_latitiude,Shop_longitude=@Shop_longitude,
Shop_address=@Shop_address,Pincode=@Pincode,Alternate_No=@Alternate_No,MinOrderPrice=@MinOrderPrice where Sid = @Sid
delete from Shop_Images where shop_image_id in (select value from STRING_SPLIT(@imagearrayOld,','));
INSERT INTO Shop_Images (Sid, shop_image)(SELECT @Sid ,items FROM [dbo].[Split](@imagearrayNew, ','))


END
IF @ActionType = 'Select'
BEGIN

select *,(SELECT si.*FROM  Shop_Images as siWHERE si.Sid=sp.SidFOR JSON PATH) AS ShopImages,(SELECT fv.isfavFROM favusershop as fvWHERE fv.Sid = sp.SidFOR JSON PATH) AS favouritesfrom Shop as sp left join (select ratingreview.shopid, AVG (cast (rating as float)) as rating , count(*) as ratingnumber from ratingreview  GROUP BY ratingreview.shopid ) as sr on sr.shopid=sp.SidFOR JSON PATH
END

IF @ActionType = 'Selectsid'
BEGIN
select sp.oid,sp.Shop_Name,sp.Owner_Name,sp.Email,sp.Pincode,sp.Shop_address,sp.Shop_latitiude,sp.Shop_longitude,sp.Alternate_No,sp.MinOrderPrice,spi.shop_image,spi.shop_image_id from Shop as sp full join Shop_Images as spi on sp.Sid=spi.Sid where sp.Sid=@sid
END

IF @ActionType = 'Delete'
BEGIN
DELETE FROM Shop WHERE Sid = @Sid
END


if @ActionType ='SelectRating'
begin
select rr.*, cs.Name from ratingreview as rr full join Consumer as cs  on rr.userid=cs.Cid where rr.shopid=@Sid;
end 


if @ActionType ='editSlote'
begin
if(@day='sunday')
begin
update slotemaster set sunday=@time where sid=@Sid;
end
if(@day='monday')
begin
update slotemaster set monday=@time where sid=@Sid;
end
if(@day='tuesday')
begin
update slotemaster set tuesday=@time where sid=@Sid;
end
if(@day='wednesday')
begin
update slotemaster set wednesday=@time where sid=@Sid;
end
if(@day='thursday')
begin
update slotemaster set thursday=@time where sid=@Sid;
end
if(@day='friday')
begin
update slotemaster set friday=@time where sid=@Sid;
end
if(@day='saturday')
begin
update slotemaster set saturday=@time where sid=@Sid;
end
end 
END





                          
						  
GO
/****** Object:  StoredProcedure [dbo].[prcshopimage]    Script Date: 04-05-2020 12:07:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[prcshopimage]
(
@ActionType nvarchar(20) = NULL,
@shop_image_id nvarchar (20)= NULL,
@Sid nvarchar (20)= NULL,
@shop_image nvarchar(100)= null
)
 
 AS
BEGIN
IF @ActionType = 'Insert'
BEGIN
SET NOCOUNT ON;
	INSERT INTO Shop_Images (Sid,shop_image)Values(@Sid,@shop_image)
END
IF @ActionType = 'Update'
BEGIN
UPDATE Shop_Images SET shop_image=@shop_image where Sid = @Sid
END
IF @ActionType = 'Select'
BEGIN
Select * from Shop_Images WHERE Sid=@Sid 
END
IF @ActionType = 'Delete'
BEGIN
DELETE FROM Shop_Images WHERE shop_image_id = @shop_image_id
END
END
GO
/****** Object:  StoredProcedure [dbo].[prcslotemaster]    Script Date: 04-05-2020 12:07:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[prcslotemaster](
@ActionType nvarchar(250) = NULL
)
AS
BEGIN
IF @ActionType = 'Insert'
BEGIN
select * from slotemaster
END
END
GO
/****** Object:  StoredProcedure [dbo].[prctransaction]    Script Date: 04-05-2020 12:07:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[prctransaction]
(
@ActionType nvarchar(20) = NULL,
@Id nvarchar (255)= NULL,
@w_id nvarchar (255)= NULL,
@Oid nvarchar (255)= NULL,
@TransactionId nvarchar(255)= null,
@OrderId nvarchar(255)=null,
@Amount nvarchar(255)=null,
@Transaction_type nvarchar(255)=null
)
 
 AS
BEGIN
IF @ActionType = 'Insert'
BEGIN
SET NOCOUNT ON;
	INSERT INTO Transaction_Money ( w_id,Oid,TransactionId,OrderId,Amount,Transaction_type)Values(@w_id,@Oid,@TransactionId,@OrderId,@Amount,@Transaction_type)
END
IF @ActionType = 'Update'
BEGIN
UPDATE Transaction_Money SET w_id=@w_id,TransactionId=@TransactionId,OrderId=@OrderId,Amount=@Amount,Transaction_type=@Transaction_type where Oid = @Oid
END
IF @ActionType = 'Select'
BEGIN
Select * from Transaction_Money where Oid = @Oid
END
IF @ActionType = 'Delete'
BEGIN
DELETE FROM Transaction_Money WHERE Oid = @Oid
END
END


select * from transactions
GO
/****** Object:  StoredProcedure [dbo].[prcwallet]    Script Date: 04-05-2020 12:07:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[prcwallet]
(
@ActionType nvarchar(20) = NULL,
@W_Id nvarchar (255)= NULL,
@Oid nvarchar (255)= NULL,
@Amount nvarchar(255)=null
)
 
 AS
BEGIN
IF @ActionType = 'Insert'
BEGIN
SET NOCOUNT ON;
	INSERT INTO Wallet ( Oid,Amount)Values(@Oid,'0')
END
IF @ActionType = 'Update'
BEGIN
UPDATE Wallet SET Amount=@Amount where Oid = @Oid
END
IF @ActionType = 'Select'
BEGIN
Select * from Wallet where Oid = @Oid
END
IF @ActionType = 'Delete'
BEGIN
DELETE FROM Wallet WHERE Oid = @Oid
END
END
GO
/****** Object:  StoredProcedure [dbo].[prodefaultPackage]    Script Date: 04-05-2020 12:07:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[prodefaultPackage]
(
@ActionType nvarchar(20) = NULL,
@Pac_Id nvarchar(255)= null,
@Default_Package nvarchar(255)=null,
@Default_Price nvarchar(255)=null,
@Pid nvarchar(255)=null
)
 
 AS
BEGIN
IF @ActionType = 'Select'
BEGIN
SELECT * from Product;
END
IF @ActionType = 'Update'
BEGIN
UPDATE Product SET Default_Package=@Default_Package,Default_Price=@Default_Price,Pac_Id=@Pac_Id where Pid=@Pid
END
END
GO
/****** Object:  StoredProcedure [dbo].[sloteselection]    Script Date: 04-05-2020 12:07:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sloteselection]
(
@ActionType nvarchar(20) = NULL,
@shop_id nvarchar(250)=null,
@slote_id nvarchar(250)=null,
@dname nvarchar(250)
)
 AS
BEGIN
IF @ActionType = 'setSelection'
BEGIN
insert into tblSlote (shop_id,sloteId,daynames) values (@shop_id,@slote_id,@dname);
END

END


GO
/****** Object:  StoredProcedure [dbo].[walleteNew]    Script Date: 04-05-2020 12:07:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[walleteNew] 
(
@ActionType nvarchar(250) = NULL,
@wid nvarchar (250)= NULL,
@des nvarchar (250)=null,
@avbal nvarchar (250)=null,
@camount nvarchar (250)=null,
@from nvarchar(250)=null,
@txntype nvarchar(250)=null,
@status nvarchar (250)=null,
@tid nvarchar (250)=null,
@txnrcptId nvarchar (250)=null,
@payMode nvarchar (250)=null
)
AS
BEGIN
IF @ActionType = 'Insert'
BEGIN
select * from Wallet
END
IF @ActionType = 'Update'
BEGIN
select * from Wallet
end
IF @ActionType = 'Select'
BEGIN
select ts.*,wl.Amount from transactions as ts full join Wallet as wl on ts.walleteid=wl.W_Id where ts.walleteid=@wid;
END
IF @ActionType = 'SelectDEB'
BEGIN 
select ts.*,wl.Amount from transactions as ts full join Wallet as wl on ts.walleteid=wl.W_Id where ts.walleteid=@wid and ts.transactiontype='DEB';
END

IF @ActionType = 'SelectCRE'
BEGIN
select ts.*,wl.Amount from transactions as ts full join Wallet as wl on ts.walleteid=wl.W_Id where ts.walleteid=@wid and ts.transactiontype='CRE';
END
IF @ActionType = 'Delete'
BEGIN
select * from Wallet
END
IF @ActionType = 'UpdateToken'
BEGIN
select * from transactions
END

IF @ActionType = 'inittransation'
BEGIN
insert into transactions (walleteid,description,avaliblebalance,transationfrom,transamount,transactiontype,transactionstatus,payMode) values(@wid,@des,@avbal,@from,@camount,@txntype,@status,@payMode);
SELECT SCOPE_IDENTITY() as transid;
UPDATE Wallet set Amount=@avbal where W_Id=@wid
END

IF @ActionType = 'updatetxn'
BEGIN
update transactions set transactionstatus=@status, txnrcptId=@txnrcptId where transactionid=@tid;
END
END
GO
USE [master]
GO
ALTER DATABASE [DB_A3CE37_Grocery] SET  READ_WRITE 
GO
