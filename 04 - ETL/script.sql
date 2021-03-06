USE [master]
GO
/****** Object:  Database [Demo.PowerBI]    Script Date: 10/06/2017 15:28:27 ******/
CREATE DATABASE [Demo.PowerBI]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Demo.PowerBI', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQL2014\MSSQL\DATA\Demo.PowerBI.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Demo.PowerBI_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQL2014\MSSQL\DATA\Demo.PowerBI_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Demo.PowerBI] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Demo.PowerBI].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Demo.PowerBI] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Demo.PowerBI] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Demo.PowerBI] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Demo.PowerBI] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Demo.PowerBI] SET ARITHABORT OFF 
GO
ALTER DATABASE [Demo.PowerBI] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Demo.PowerBI] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Demo.PowerBI] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Demo.PowerBI] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Demo.PowerBI] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Demo.PowerBI] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Demo.PowerBI] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Demo.PowerBI] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Demo.PowerBI] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Demo.PowerBI] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Demo.PowerBI] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Demo.PowerBI] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Demo.PowerBI] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Demo.PowerBI] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Demo.PowerBI] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Demo.PowerBI] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Demo.PowerBI] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Demo.PowerBI] SET RECOVERY FULL 
GO
ALTER DATABASE [Demo.PowerBI] SET  MULTI_USER 
GO
ALTER DATABASE [Demo.PowerBI] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Demo.PowerBI] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Demo.PowerBI] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Demo.PowerBI] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Demo.PowerBI] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Demo.PowerBI', N'ON'
GO
USE [Demo.PowerBI]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 10/06/2017 15:28:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [varchar](120) NOT NULL,
	[Age] [int] NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  StoredProcedure [dbo].[FillCustomer]    Script Date: 10/06/2017 15:28:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FillCustomer]
AS
BEGIN
	truncate table customer;
	insert into customer(FullName) values ('John Doe');
	insert into customer(FullName) values ('Sam Avrange');
	insert into customer(FullName) values ('Bob Leponge');
END

GO
/****** Object:  StoredProcedure [dbo].[InsertCustomer]    Script Date: 10/06/2017 15:28:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertCustomer]
	@FullName varchar(120), 
	@Age int
AS
BEGIN
	insert into
		dbo.Customer
	values
		(@FullName, @Age)
END

GO
/****** Object:  StoredProcedure [dbo].[UpdateCustomer]    Script Date: 10/06/2017 15:28:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateCustomer]
	@FullName varchar(120), 
	@Age int
AS
BEGIN
	update
		dbo.Customer
	set
		Age = @Age
	where
		FullName = @FullName
END

GO
USE [master]
GO
ALTER DATABASE [Demo.PowerBI] SET  READ_WRITE 
GO
