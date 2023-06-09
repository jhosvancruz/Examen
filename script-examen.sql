USE [master]
GO
/****** Object:  Database [Bdiexamen]    Script Date: 27/05/2023 04:22:46 p. m. ******/
CREATE DATABASE [Bdiexamen]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Bdiexamen', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Bdiexamen.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Bdiexamen_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Bdiexamen_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Bdiexamen] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Bdiexamen].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Bdiexamen] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Bdiexamen] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Bdiexamen] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Bdiexamen] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Bdiexamen] SET ARITHABORT OFF 
GO
ALTER DATABASE [Bdiexamen] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Bdiexamen] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Bdiexamen] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Bdiexamen] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Bdiexamen] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Bdiexamen] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Bdiexamen] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Bdiexamen] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Bdiexamen] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Bdiexamen] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Bdiexamen] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Bdiexamen] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Bdiexamen] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Bdiexamen] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Bdiexamen] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Bdiexamen] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Bdiexamen] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Bdiexamen] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Bdiexamen] SET  MULTI_USER 
GO
ALTER DATABASE [Bdiexamen] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Bdiexamen] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Bdiexamen] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Bdiexamen] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Bdiexamen] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Bdiexamen] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Bdiexamen] SET QUERY_STORE = ON
GO
ALTER DATABASE [Bdiexamen] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Bdiexamen]
GO
/****** Object:  Table [dbo].[tblExamen]    Script Date: 27/05/2023 04:22:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblExamen](
	[idExamen] [int] NOT NULL,
	[Nombre] [varchar](255) NULL,
	[Descripcion] [varchar](255) NULL
) ON [PRIMARY]
GO
INSERT [dbo].[tblExamen] ([idExamen], [Nombre], [Descripcion]) VALUES (1, N'Exmane__1', N'Descripcion del examen 1')
INSERT [dbo].[tblExamen] ([idExamen], [Nombre], [Descripcion]) VALUES (2, N'Examen 2', N'Esto es el examen 2')
GO
/****** Object:  StoredProcedure [dbo].[spActualizar]    Script Date: 27/05/2023 04:22:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spActualizar]
    @idExamen INT,
    @nombre VARCHAR(50),
    @descripcion VARCHAR(100)
AS
BEGIN
    UPDATE tblExamen
    SET Nombre = @nombre, descripcion = @descripcion
    WHERE idExamen = @idExamen
END
GO
/****** Object:  StoredProcedure [dbo].[spAgregar]    Script Date: 27/05/2023 04:22:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spAgregar]
    @idExamen INT,
    @nombre VARCHAR(50),
    @descripcion VARCHAR(100)
AS
BEGIN
    INSERT INTO tblExamen(idExamen, nombre, descripcion)
    VALUES (@idExamen, @nombre, @descripcion);
END;
GO
/****** Object:  StoredProcedure [dbo].[spConsultar]    Script Date: 27/05/2023 04:22:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spConsultar]
    @idExamen INT
AS
BEGIN
    SELECT idExamen, nombre, descripcion
    FROM tblExamen
    WHERE idExamen = @idExamen
END
GO
/****** Object:  StoredProcedure [dbo].[spEliminar]    Script Date: 27/05/2023 04:22:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spEliminar]
    @idExamen INT
AS
BEGIN
    DELETE FROM tblExamen
    WHERE idExamen = @idExamen
END
GO
USE [master]
GO
ALTER DATABASE [Bdiexamen] SET  READ_WRITE 
GO
