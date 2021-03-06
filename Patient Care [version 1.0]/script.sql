USE [master]
GO
/****** Object:  Database [PatientCare]    Script Date: 01-Jan-16 4:02:54 PM ******/
CREATE DATABASE [PatientCare] ON  PRIMARY 
( NAME = N'PatientCare', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\PatientCare.mdf' , SIZE = 2304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'PatientCare_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\PatientCare_log.LDF' , SIZE = 576KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [PatientCare] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PatientCare].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PatientCare] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PatientCare] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PatientCare] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PatientCare] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PatientCare] SET ARITHABORT OFF 
GO
ALTER DATABASE [PatientCare] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [PatientCare] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PatientCare] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PatientCare] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PatientCare] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PatientCare] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PatientCare] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PatientCare] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PatientCare] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PatientCare] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PatientCare] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PatientCare] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PatientCare] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PatientCare] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PatientCare] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PatientCare] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PatientCare] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PatientCare] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PatientCare] SET  MULTI_USER 
GO
ALTER DATABASE [PatientCare] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PatientCare] SET DB_CHAINING OFF 
GO
USE [PatientCare]
GO
/****** Object:  Table [dbo].[Antimicrobial]    Script Date: 01-Jan-16 4:02:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Antimicrobial](
	[AntimicrobialGenericName] [nvarchar](100) NOT NULL,
	[AntimicrobialCategory] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Antimicrobial] PRIMARY KEY CLUSTERED 
(
	[AntimicrobialGenericName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cardiovascular]    Script Date: 01-Jan-16 4:02:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cardiovascular](
	[CardiovascularGenericName] [nvarchar](100) NOT NULL,
	[CardiovascularCategory] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Cardiovascular] PRIMARY KEY CLUSTERED 
(
	[CardiovascularGenericName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[doctor]    Script Date: 01-Jan-16 4:02:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doctor](
	[dUserName] [nvarchar](50) NOT NULL,
	[dPassword] [nvarchar](50) NOT NULL,
	[dName] [nvarchar](100) NOT NULL,
	[dSpeciality] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[dUserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Gastrointestinal]    Script Date: 01-Jan-16 4:02:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gastrointestinal](
	[GastrointestinalGenericName] [nvarchar](100) NOT NULL,
	[GastrointestinalCategory] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Gastrointestinal] PRIMARY KEY CLUSTERED 
(
	[GastrointestinalGenericName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LaboratoryServices]    Script Date: 01-Jan-16 4:02:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LaboratoryServices](
	[LaboratoryServicesName] [nvarchar](100) NOT NULL,
	[LaboratoryServicesCategory] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[LaboratoryServicesName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MedicineForPrescription]    Script Date: 01-Jan-16 4:02:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicineForPrescription](
	[mfpID] [int] IDENTITY(1,1) NOT NULL,
	[MedGenericName] [nvarchar](100) NOT NULL,
	[Intake] [nvarchar](50) NOT NULL,
	[Days] [int] NOT NULL,
	[Comment] [nvarchar](100) NULL,
	[presID] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[mfpID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[patient]    Script Date: 01-Jan-16 4:02:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[patient](
	[pID] [int] NOT NULL,
	[pName] [nvarchar](100) NOT NULL,
	[pAge] [int] NOT NULL,
	[pGender] [nvarchar](7) NOT NULL,
	[pAddress] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[pID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[prescription]    Script Date: 01-Jan-16 4:02:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[prescription](
	[presID] [nvarchar](20) NOT NULL,
	[pDate] [date] NOT NULL,
	[dUserName] [nvarchar](50) NOT NULL,
	[pID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[presID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RadiologicalAndImaging]    Script Date: 01-Jan-16 4:02:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RadiologicalAndImaging](
	[RadiologicalAndImagingName] [nvarchar](100) NOT NULL,
	[RadiologicalAndImagingCategory] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_RadiologicalAndImaging] PRIMARY KEY CLUSTERED 
(
	[RadiologicalAndImagingName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RespiratorySystem]    Script Date: 01-Jan-16 4:02:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RespiratorySystem](
	[RespiratorySystemGenericName] [nvarchar](100) NOT NULL,
	[RespiratorySystemCategory] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_RespiratorySystem] PRIMARY KEY CLUSTERED 
(
	[RespiratorySystemGenericName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TestForPrescription]    Script Date: 01-Jan-16 4:02:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TestForPrescription](
	[testID] [int] IDENTITY(1,1) NOT NULL,
	[testName] [nvarchar](100) NOT NULL,
	[testComment] [nvarchar](100) NULL,
	[presID] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[testID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[MedicineForPrescription]  WITH CHECK ADD FOREIGN KEY([presID])
REFERENCES [dbo].[prescription] ([presID])
GO
ALTER TABLE [dbo].[prescription]  WITH CHECK ADD FOREIGN KEY([dUserName])
REFERENCES [dbo].[doctor] ([dUserName])
GO
ALTER TABLE [dbo].[prescription]  WITH CHECK ADD FOREIGN KEY([pID])
REFERENCES [dbo].[patient] ([pID])
GO
ALTER TABLE [dbo].[TestForPrescription]  WITH CHECK ADD FOREIGN KEY([presID])
REFERENCES [dbo].[prescription] ([presID])
GO
USE [master]
GO
ALTER DATABASE [PatientCare] SET  READ_WRITE 
GO
