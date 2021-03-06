USE [oneweek]
GO
ALTER TABLE [dbo].[location] DROP CONSTRAINT [FK_customerLocation_customer]
GO
ALTER TABLE [dbo].[customerPreferenceMapping] DROP CONSTRAINT [FK_customerPreferenceMapping_preference]
GO
ALTER TABLE [dbo].[customerPreferenceMapping] DROP CONSTRAINT [FK_customerPreferenceMapping_customer]
GO
ALTER TABLE [dbo].[businessPrefernceMapping] DROP CONSTRAINT [FK_businessPrefernceMapping_preference]
GO
ALTER TABLE [dbo].[businessPrefernceMapping] DROP CONSTRAINT [FK_businessPrefernceMapping_business]
GO
ALTER TABLE [dbo].[locationHistory] DROP CONSTRAINT [DF_locationHistory_dateTime]
GO
ALTER TABLE [dbo].[business] DROP CONSTRAINT [DF_business_modifiedDateTime]
GO
/****** Object:  Index [IX_userTag]    Script Date: 07/25/2016 16:58:41 ******/
DROP INDEX [IX_userTag] ON [dbo].[customer]
GO
/****** Object:  Index [IX_email]    Script Date: 07/25/2016 16:58:41 ******/
DROP INDEX [IX_email] ON [dbo].[customer]
GO
/****** Object:  Table [dbo].[preference]    Script Date: 07/25/2016 16:58:41 ******/
DROP TABLE [dbo].[preference]
GO
/****** Object:  Table [dbo].[locationHistory]    Script Date: 07/25/2016 16:58:41 ******/
DROP TABLE [dbo].[locationHistory]
GO
/****** Object:  Table [dbo].[location]    Script Date: 07/25/2016 16:58:41 ******/
DROP TABLE [dbo].[location]
GO
/****** Object:  Table [dbo].[customerPreferenceMapping]    Script Date: 07/25/2016 16:58:41 ******/
DROP TABLE [dbo].[customerPreferenceMapping]
GO
/****** Object:  Table [dbo].[customer]    Script Date: 07/25/2016 16:58:41 ******/
DROP TABLE [dbo].[customer]
GO
/****** Object:  Table [dbo].[businessPrefernceMapping]    Script Date: 07/25/2016 16:58:41 ******/
DROP TABLE [dbo].[businessPrefernceMapping]
GO
/****** Object:  Table [dbo].[business]    Script Date: 07/25/2016 16:58:41 ******/
DROP TABLE [dbo].[business]
GO
USE [master]
GO
/****** Object:  Database [oneweek]    Script Date: 07/25/2016 16:58:41 ******/
DROP DATABASE [oneweek]
GO
/****** Object:  Database [oneweek]    Script Date: 07/25/2016 16:58:41 ******/
CREATE DATABASE [oneweek]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'oneweek', FILENAME = N'F:\Software\Installation\SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\oneweek.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'oneweek_log', FILENAME = N'F:\Software\Installation\SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\oneweek_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [oneweek] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [oneweek].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [oneweek] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [oneweek] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [oneweek] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [oneweek] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [oneweek] SET ARITHABORT OFF 
GO
ALTER DATABASE [oneweek] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [oneweek] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [oneweek] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [oneweek] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [oneweek] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [oneweek] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [oneweek] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [oneweek] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [oneweek] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [oneweek] SET  DISABLE_BROKER 
GO
ALTER DATABASE [oneweek] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [oneweek] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [oneweek] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [oneweek] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [oneweek] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [oneweek] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [oneweek] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [oneweek] SET RECOVERY FULL 
GO
ALTER DATABASE [oneweek] SET  MULTI_USER 
GO
ALTER DATABASE [oneweek] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [oneweek] SET DB_CHAINING OFF 
GO
ALTER DATABASE [oneweek] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [oneweek] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [oneweek] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'oneweek', N'ON'
GO
USE [oneweek]
GO
/****** Object:  Table [dbo].[business]    Script Date: 07/25/2016 16:58:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[business](
	[businessId] [int] IDENTITY(1,1) NOT NULL,
	[businessName] [varchar](100) NOT NULL,
	[businessDesc] [varchar](1000) NULL,
	[location] [geography] NOT NULL,
	[modifiedDateTime] [datetime] NULL,
	[createdDateTime] [date] NULL,
 CONSTRAINT [PK_business] PRIMARY KEY CLUSTERED 
(
	[businessId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[businessPrefernceMapping]    Script Date: 07/25/2016 16:58:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[businessPrefernceMapping](
	[businessPrefId] [int] IDENTITY(1,1) NOT NULL,
	[businessId] [int] NOT NULL,
	[preferenceId] [int] NOT NULL,
 CONSTRAINT [PK_businessPrefernceMapping] PRIMARY KEY CLUSTERED 
(
	[businessPrefId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[customer]    Script Date: 07/25/2016 16:58:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[customer](
	[customerId] [int] IDENTITY(1,1) NOT NULL,
	[userTag] [varchar](50) NOT NULL,
	[emailId] [varchar](100) NULL,
	[mobileNumber] [bigint] NOT NULL,
	[modifiedDateTime] [datetime] NULL CONSTRAINT [DF_customer_modifiedDateTime]  DEFAULT (getdate()),
	[createdDateTime] [datetime] NULL,
 CONSTRAINT [PK_customer] PRIMARY KEY CLUSTERED 
(
	[customerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_mobileNumber] UNIQUE NONCLUSTERED 
(
	[mobileNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[customerPreferenceMapping]    Script Date: 07/25/2016 16:58:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customerPreferenceMapping](
	[cusotmerPrefernceId] [int] IDENTITY(1,1) NOT NULL,
	[customerId] [int] NOT NULL,
	[preferenceId] [int] NOT NULL,
 CONSTRAINT [PK_customerPreferenceMapping] PRIMARY KEY CLUSTERED 
(
	[cusotmerPrefernceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[location]    Script Date: 07/25/2016 16:58:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[location](
	[locationId] [int] IDENTITY(1,1) NOT NULL,
	[customerId] [int] NOT NULL,
	[location] [geography] NOT NULL,
	[modifiedDateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_customerLocation] PRIMARY KEY CLUSTERED 
(
	[locationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[locationHistory]    Script Date: 07/25/2016 16:58:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[locationHistory](
	[locationHistoryId] [int] IDENTITY(1,1) NOT NULL,
	[locationId] [int] NOT NULL,
	[customerId] [int] NOT NULL,
	[location] [geography] NOT NULL,
	[dateTime] [datetime] NULL,
	[action] [varchar](50) NULL,
 CONSTRAINT [PK_locationHistory] PRIMARY KEY CLUSTERED 
(
	[locationHistoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[preference]    Script Date: 07/25/2016 16:58:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[preference](
	[preferenceId] [int] IDENTITY(1,1) NOT NULL,
	[prefernceName] [varchar](100) NOT NULL,
 CONSTRAINT [PK_preference] PRIMARY KEY CLUSTERED 
(
	[preferenceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_email]    Script Date: 07/25/2016 16:58:41 ******/
CREATE NONCLUSTERED INDEX [IX_email] ON [dbo].[customer]
(
	[emailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_userTag]    Script Date: 07/25/2016 16:58:41 ******/
CREATE NONCLUSTERED INDEX [IX_userTag] ON [dbo].[customer]
(
	[userTag] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[business] ADD  CONSTRAINT [DF_business_modifiedDateTime]  DEFAULT (getdate()) FOR [modifiedDateTime]
GO
ALTER TABLE [dbo].[locationHistory] ADD  CONSTRAINT [DF_locationHistory_dateTime]  DEFAULT (getdate()) FOR [dateTime]
GO
ALTER TABLE [dbo].[businessPrefernceMapping]  WITH CHECK ADD  CONSTRAINT [FK_businessPrefernceMapping_business] FOREIGN KEY([businessId])
REFERENCES [dbo].[business] ([businessId])
GO
ALTER TABLE [dbo].[businessPrefernceMapping] CHECK CONSTRAINT [FK_businessPrefernceMapping_business]
GO
ALTER TABLE [dbo].[businessPrefernceMapping]  WITH CHECK ADD  CONSTRAINT [FK_businessPrefernceMapping_preference] FOREIGN KEY([preferenceId])
REFERENCES [dbo].[preference] ([preferenceId])
GO
ALTER TABLE [dbo].[businessPrefernceMapping] CHECK CONSTRAINT [FK_businessPrefernceMapping_preference]
GO
ALTER TABLE [dbo].[customerPreferenceMapping]  WITH CHECK ADD  CONSTRAINT [FK_customerPreferenceMapping_customer] FOREIGN KEY([customerId])
REFERENCES [dbo].[customer] ([customerId])
GO
ALTER TABLE [dbo].[customerPreferenceMapping] CHECK CONSTRAINT [FK_customerPreferenceMapping_customer]
GO
ALTER TABLE [dbo].[customerPreferenceMapping]  WITH CHECK ADD  CONSTRAINT [FK_customerPreferenceMapping_preference] FOREIGN KEY([preferenceId])
REFERENCES [dbo].[preference] ([preferenceId])
GO
ALTER TABLE [dbo].[customerPreferenceMapping] CHECK CONSTRAINT [FK_customerPreferenceMapping_preference]
GO
ALTER TABLE [dbo].[location]  WITH CHECK ADD  CONSTRAINT [FK_customerLocation_customer] FOREIGN KEY([customerId])
REFERENCES [dbo].[customer] ([customerId])
GO
ALTER TABLE [dbo].[location] CHECK CONSTRAINT [FK_customerLocation_customer]
GO
USE [master]
GO
ALTER DATABASE [oneweek] SET  READ_WRITE 
GO
