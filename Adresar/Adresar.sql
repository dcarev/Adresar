USE [master]
GO
/****** Object:  Database [Adresar]    Script Date: 14.10.2020. 1:06:02 ******/
CREATE DATABASE [Adresar]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Adresar', FILENAME = N'D:\Projekti\Adresar\Data\Adresar.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Adresar_log', FILENAME = N'D:\Projekti\Adresar\Data\Adresar_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Adresar] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Adresar].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Adresar] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Adresar] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Adresar] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Adresar] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Adresar] SET ARITHABORT OFF 
GO
ALTER DATABASE [Adresar] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Adresar] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Adresar] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Adresar] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Adresar] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Adresar] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Adresar] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Adresar] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Adresar] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Adresar] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Adresar] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Adresar] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Adresar] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Adresar] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Adresar] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Adresar] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Adresar] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Adresar] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Adresar] SET  MULTI_USER 
GO
ALTER DATABASE [Adresar] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Adresar] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Adresar] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Adresar] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Adresar] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Adresar]
GO
/****** Object:  Table [dbo].[Kontakt]    Script Date: 14.10.2020. 1:06:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kontakt](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Ime] [nvarchar](50) NOT NULL,
	[Prezime] [nvarchar](50) NOT NULL,
	[Telefon] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NULL,
	[VrijemeKreiranja] [datetimeoffset](7) NULL CONSTRAINT [DF_Kontakt_VrijemeKreiranja]  DEFAULT (sysdatetimeoffset()),
	[ZadnjaIzmjena] [datetimeoffset](7) NULL CONSTRAINT [DF_Kontakt_ZadnjaIzmjena]  DEFAULT (sysdatetimeoffset()),
 CONSTRAINT [PK_Kontakt] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Kontakt] ON 

INSERT [dbo].[Kontakt] ([ID], [Ime], [Prezime], [Telefon], [Email], [VrijemeKreiranja], [ZadnjaIzmjena]) VALUES (1, N'Dario', N'Carev', N'+385912345678', N'dario@adresar.hr', CAST(N'2020-10-03T17:14:43.9558469+02:00' AS DateTimeOffset), CAST(N'2020-10-03T17:14:43.9558469+02:00' AS DateTimeOffset))
INSERT [dbo].[Kontakt] ([ID], [Ime], [Prezime], [Telefon], [Email], [VrijemeKreiranja], [ZadnjaIzmjena]) VALUES (2, N'Ivan', N'Perić', N'+385991234567', N'ivan.peric@test.com', CAST(N'2020-10-03T17:17:03.2427316+02:00' AS DateTimeOffset), CAST(N'2020-10-03T17:17:03.2427316+02:00' AS DateTimeOffset))
INSERT [dbo].[Kontakt] ([ID], [Ime], [Prezime], [Telefon], [Email], [VrijemeKreiranja], [ZadnjaIzmjena]) VALUES (3, N'Stjepan', N'Horvat', N'+385923334444', N'horvats@gmail.com', CAST(N'2020-10-03T17:27:11.8616851+02:00' AS DateTimeOffset), CAST(N'2020-10-03T17:27:11.8616851+02:00' AS DateTimeOffset))
INSERT [dbo].[Kontakt] ([ID], [Ime], [Prezime], [Telefon], [Email], [VrijemeKreiranja], [ZadnjaIzmjena]) VALUES (4, N'Marija', N'Kovačević', N'+385915252525', N'marija.kovacevic@hotmail.com', CAST(N'2020-10-03T17:27:58.2759951+02:00' AS DateTimeOffset), CAST(N'2020-10-03T17:27:58.2759951+02:00' AS DateTimeOffset))
INSERT [dbo].[Kontakt] ([ID], [Ime], [Prezime], [Telefon], [Email], [VrijemeKreiranja], [ZadnjaIzmjena]) VALUES (5, N'Ana', N'Novak', N'+38598777666', N'ana.novak@gmail.com', CAST(N'2020-10-03T17:28:17.5170702+02:00' AS DateTimeOffset), CAST(N'2020-10-03T17:28:17.5170702+02:00' AS DateTimeOffset))
INSERT [dbo].[Kontakt] ([ID], [Ime], [Prezime], [Telefon], [Email], [VrijemeKreiranja], [ZadnjaIzmjena]) VALUES (6, N'Zdenko', N'Jurić', N'+38512233445', N'zjuric@zg.t-com.hr', CAST(N'2020-10-03T17:32:04.3912009+02:00' AS DateTimeOffset), CAST(N'2020-10-03T17:32:04.3912009+02:00' AS DateTimeOffset))
INSERT [dbo].[Kontakt] ([ID], [Ime], [Prezime], [Telefon], [Email], [VrijemeKreiranja], [ZadnjaIzmjena]) VALUES (7, N'Ines', N'Knežević', N'+38521212313', N'ines.knezevic@optima.hr', CAST(N'2020-10-03T17:33:03.4163743+02:00' AS DateTimeOffset), CAST(N'2020-10-03T17:33:03.4163743+02:00' AS DateTimeOffset))
INSERT [dbo].[Kontakt] ([ID], [Ime], [Prezime], [Telefon], [Email], [VrijemeKreiranja], [ZadnjaIzmjena]) VALUES (8, N'Luka', N'Bulić', N'+38542535646', N'luka.bulic@vz.t-com.hr', CAST(N'2020-10-03T17:34:09.8480304+02:00' AS DateTimeOffset), CAST(N'2020-10-03T17:34:09.8480304+02:00' AS DateTimeOffset))
INSERT [dbo].[Kontakt] ([ID], [Ime], [Prezime], [Telefon], [Email], [VrijemeKreiranja], [ZadnjaIzmjena]) VALUES (9, N'Branka', N'Bebić', N'+385976543210', N'branka@bbc@com', CAST(N'2020-10-04T11:18:03.2384584+02:00' AS DateTimeOffset), CAST(N'2020-10-04T11:18:03.2384584+02:00' AS DateTimeOffset))
INSERT [dbo].[Kontakt] ([ID], [Ime], [Prezime], [Telefon], [Email], [VrijemeKreiranja], [ZadnjaIzmjena]) VALUES (10, N'Nikola', N'Tesla', N'+38515566778', N'nikola.tesla@acdc.info', CAST(N'2020-10-04T11:20:03.4082711+02:00' AS DateTimeOffset), CAST(N'2020-10-04T11:20:03.4082711+02:00' AS DateTimeOffset))
INSERT [dbo].[Kontakt] ([ID], [Ime], [Prezime], [Telefon], [Email], [VrijemeKreiranja], [ZadnjaIzmjena]) VALUES (11, N'Zoran', N'Šprajc', N'+38598123456', N'zoran.sprajc@rtl.hr', CAST(N'2020-10-05T01:11:30.9424719+02:00' AS DateTimeOffset), CAST(N'2020-10-05T01:11:30.9424719+02:00' AS DateTimeOffset))
INSERT [dbo].[Kontakt] ([ID], [Ime], [Prezime], [Telefon], [Email], [VrijemeKreiranja], [ZadnjaIzmjena]) VALUES (12, N'Franka', N'Batelić', N'+385 98 555-444', NULL, CAST(N'2020-10-13T21:34:45.4892914+02:00' AS DateTimeOffset), CAST(N'2020-10-13T21:36:00.8456980+02:00' AS DateTimeOffset))
INSERT [dbo].[Kontakt] ([ID], [Ime], [Prezime], [Telefon], [Email], [VrijemeKreiranja], [ZadnjaIzmjena]) VALUES (13, N'Ema', N'Kovač', N'+385 99 112-2334', NULL, CAST(N'2020-10-13T21:37:05.2087169+02:00' AS DateTimeOffset), CAST(N'2020-10-13T21:37:05.2087169+02:00' AS DateTimeOffset))
INSERT [dbo].[Kontakt] ([ID], [Ime], [Prezime], [Telefon], [Email], [VrijemeKreiranja], [ZadnjaIzmjena]) VALUES (14, N'Goran', N'Bare', N'01 666-6666', N'goran.bare@majke.hr', CAST(N'2020-10-13T21:39:22.8607984+02:00' AS DateTimeOffset), CAST(N'2020-10-13T21:39:22.8607984+02:00' AS DateTimeOffset))
INSERT [dbo].[Kontakt] ([ID], [Ime], [Prezime], [Telefon], [Email], [VrijemeKreiranja], [ZadnjaIzmjena]) VALUES (15, N'Hrvoje', N'Kečkeš', N'092-939-4959', N'hrvoje.keckes@hnk.hr', CAST(N'2020-10-13T21:40:42.2116168+02:00' AS DateTimeOffset), CAST(N'2020-10-13T21:40:42.2116168+02:00' AS DateTimeOffset))
INSERT [dbo].[Kontakt] ([ID], [Ime], [Prezime], [Telefon], [Email], [VrijemeKreiranja], [ZadnjaIzmjena]) VALUES (16, N'Jelena', N'Rozga', N'021-314-151', N'jelena.rozga@magazin.hr', CAST(N'2020-10-13T21:42:18.9174191+02:00' AS DateTimeOffset), CAST(N'2020-10-13T21:42:18.9174191+02:00' AS DateTimeOffset))
INSERT [dbo].[Kontakt] ([ID], [Ime], [Prezime], [Telefon], [Email], [VrijemeKreiranja], [ZadnjaIzmjena]) VALUES (17, N'Ksenija', N'Pajić', N'098 456-789', N'ksenija.pajic@sapunice.com', CAST(N'2020-10-13T21:46:11.5854685+02:00' AS DateTimeOffset), CAST(N'2020-10-13T21:46:11.5854685+02:00' AS DateTimeOffset))
INSERT [dbo].[Kontakt] ([ID], [Ime], [Prezime], [Telefon], [Email], [VrijemeKreiranja], [ZadnjaIzmjena]) VALUES (18, N'Milan', N'Kekin', N'+385 1 878-3334', N'mile@hladno-pivo.hr', CAST(N'2020-10-13T21:48:05.1091288+02:00' AS DateTimeOffset), CAST(N'2020-10-13T21:50:32.8274851+02:00' AS DateTimeOffset))
INSERT [dbo].[Kontakt] ([ID], [Ime], [Prezime], [Telefon], [Email], [VrijemeKreiranja], [ZadnjaIzmjena]) VALUES (19, N'Oliver', N'Mlakar', N'01 334-3344', N'oliver.mlakar@hrt.hr', CAST(N'2020-10-13T21:53:00.5564271+02:00' AS DateTimeOffset), CAST(N'2020-10-13T21:53:00.5564271+02:00' AS DateTimeOffset))
INSERT [dbo].[Kontakt] ([ID], [Ime], [Prezime], [Telefon], [Email], [VrijemeKreiranja], [ZadnjaIzmjena]) VALUES (20, N'Lana', N'Pavić', N'+385 97 6718993', NULL, CAST(N'2020-10-13T21:54:53.6161149+02:00' AS DateTimeOffset), CAST(N'2020-10-13T21:54:53.6161149+02:00' AS DateTimeOffset))
INSERT [dbo].[Kontakt] ([ID], [Ime], [Prezime], [Telefon], [Email], [VrijemeKreiranja], [ZadnjaIzmjena]) VALUES (21, N'Tereza', N'Kesovija', N'020 491-379', N'tereza@cmc.hr', CAST(N'2020-10-13T21:56:23.3721152+02:00' AS DateTimeOffset), CAST(N'2020-10-13T21:56:23.3721152+02:00' AS DateTimeOffset))
INSERT [dbo].[Kontakt] ([ID], [Ime], [Prezime], [Telefon], [Email], [VrijemeKreiranja], [ZadnjaIzmjena]) VALUES (22, N'Šime', N'Vrsaljko', N'+34 810 456-7891', N'sime@atletico.es', CAST(N'2020-10-13T21:58:52.7227410+02:00' AS DateTimeOffset), CAST(N'2020-10-13T21:58:52.7227410+02:00' AS DateTimeOffset))
INSERT [dbo].[Kontakt] ([ID], [Ime], [Prezime], [Telefon], [Email], [VrijemeKreiranja], [ZadnjaIzmjena]) VALUES (23, N'Viktorija', N'Rađa', N'+385 21 379-146', NULL, CAST(N'2020-10-13T22:01:15.4248041+02:00' AS DateTimeOffset), CAST(N'2020-10-13T22:01:15.4248041+02:00' AS DateTimeOffset))
INSERT [dbo].[Kontakt] ([ID], [Ime], [Prezime], [Telefon], [Email], [VrijemeKreiranja], [ZadnjaIzmjena]) VALUES (24, N'Damir', N'Martinović', N'051 619-374', N'mrle@let3.com', CAST(N'2020-10-13T22:06:01.2645123+02:00' AS DateTimeOffset), CAST(N'2020-10-13T22:06:01.2645123+02:00' AS DateTimeOffset))
SET IDENTITY_INSERT [dbo].[Kontakt] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Kontakt_Ime_A]    Script Date: 14.10.2020. 1:06:02 ******/
CREATE NONCLUSTERED INDEX [IX_Kontakt_Ime_A] ON [dbo].[Kontakt]
(
	[Ime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Kontakt_Ime_D]    Script Date: 14.10.2020. 1:06:02 ******/
CREATE NONCLUSTERED INDEX [IX_Kontakt_Ime_D] ON [dbo].[Kontakt]
(
	[Ime] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Kontakt_Prezime_A]    Script Date: 14.10.2020. 1:06:02 ******/
CREATE NONCLUSTERED INDEX [IX_Kontakt_Prezime_A] ON [dbo].[Kontakt]
(
	[Prezime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Kontakt_Prezime_D]    Script Date: 14.10.2020. 1:06:02 ******/
CREATE NONCLUSTERED INDEX [IX_Kontakt_Prezime_D] ON [dbo].[Kontakt]
(
	[Prezime] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[SP_IzmijeniKontakt]    Script Date: 14.10.2020. 1:06:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ====================================================================
-- Author:		Dario Carev
-- Create date: 4.10.2020.
-- Description:	Ažurira kontakt
-- ====================================================================
CREATE PROCEDURE [dbo].[SP_IzmijeniKontakt](
	@ID bigint,
	@Ime nvarchar(50),
	@Prezime nvarchar(50),
	@Telefon nvarchar(50),
	@Email nvarchar(50) = NULL
)
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE
		Kontakt
	SET
		Ime = @Ime,
		Prezime = @Prezime,
		Telefon = @Telefon,
		Email = @Email,
		ZadnjaIzmjena = SYSDATETIMEOFFSET()
	WHERE
		ID = @ID;
		
	SELECT
		ID,
		Ime,
		Prezime,
		Telefon,
		Email,
		VrijemeKreiranja,
		ZadnjaIzmjena
	FROM
		Kontakt
	WHERE
		ID = @ID;
END

GO
/****** Object:  StoredProcedure [dbo].[SP_Kontakt]    Script Date: 14.10.2020. 1:06:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ====================================================================
-- Author:		Dario Carev
-- Create date: 3.10.2020.
-- Description:	Vraća kontakat
-- ====================================================================
CREATE PROCEDURE [dbo].[SP_Kontakt]
	@ID bigint = 0
AS
BEGIN
	SET NOCOUNT ON;

    SELECT
		ID,
		Ime,
		Prezime,
		Telefon,
		Email,
		VrijemeKreiranja,
		ZadnjaIzmjena,
		TotalRecords = COUNT(*) OVER()
	FROM
		Kontakt
	WHERE
		ID = @ID
END

GO
/****** Object:  StoredProcedure [dbo].[SP_ListaKontakata]    Script Date: 14.10.2020. 1:06:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ====================================================================
-- Author:		Dario Carev
-- Create date: 3.10.2020.
-- Description:	Vraća listu kontakata prema upitu, poretku i stranici
-- ====================================================================
CREATE PROCEDURE [dbo].[SP_ListaKontakata](
	@Filter nvarchar(200) = '',
	@SortColumn nvarchar(100) = 'ID',
	@SortOrder nvarchar(10) = 'ASC',
	@Page int = 1,
	@PageSize int = 10
)
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
		ID,
		Ime,
		Prezime,
		Telefon,
		Email,
		VrijemeKreiranja,
		ZadnjaIzmjena,
		TotalRecords = COUNT(*) OVER()
	FROM
		Kontakt
	WHERE
		Ime LIKE '%' + @Filter + '%'
		OR Prezime LIKE '%' + @Filter + '%'
	ORDER BY 
		CASE WHEN @SortColumn = 'ID' AND @SortOrder ='ASC' THEN ID END,
		CASE WHEN @SortColumn = 'ID' AND @SortOrder ='DESC' THEN ID END DESC,
		CASE WHEN @SortColumn = 'Ime' AND @SortOrder ='ASC' THEN Ime END,
		CASE WHEN @SortColumn = 'Ime' AND @SortOrder ='DESC' THEN Ime END DESC,
		CASE WHEN @SortColumn = 'Prezime' AND @SortOrder ='ASC' THEN Prezime END,
		CASE WHEN @SortColumn = 'Prezime' AND @SortOrder ='DESC' THEN Prezime END DESC,
		CASE WHEN @SortColumn = 'Telefon' AND @SortOrder ='ASC' THEN Telefon END,
		CASE WHEN @SortColumn = 'Telefon' AND @SortOrder ='DESC' THEN Telefon END DESC,
		CASE WHEN @SortColumn = 'Email' AND @SortOrder ='ASC' THEN Email END,
		CASE WHEN @SortColumn = 'Email' AND @SortOrder ='DESC' THEN Email END DESC,
		CASE WHEN @SortColumn = 'VrijemeKreiranja' AND @SortOrder ='ASC' THEN VrijemeKreiranja END,
		CASE WHEN @SortColumn = 'VrijemeKreiranja' AND @SortOrder ='DESC' THEN VrijemeKreiranja END DESC,
		CASE WHEN @SortColumn = 'ZadnjaIzmjena' AND @SortOrder ='ASC' THEN ZadnjaIzmjena END,
		CASE WHEN @SortColumn = 'ZadnjaIzmjena' AND @SortOrder ='DESC' THEN ZadnjaIzmjena END DESC
	OFFSET (@Page-1)*@PageSize ROWS FETCH NEXT @PageSize ROWS ONLY
END

GO
/****** Object:  StoredProcedure [dbo].[SP_NoviKontakt]    Script Date: 14.10.2020. 1:06:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ====================================================================
-- Author:		Dario Carev
-- Create date: 3.10.2020.
-- Description:	Stvara novi kontakt
-- ====================================================================
CREATE PROCEDURE [dbo].[SP_NoviKontakt](
	@Ime nvarchar(50),
	@Prezime nvarchar(50),
	@Telefon nvarchar(50),
	@Email nvarchar(50) = NULL
)
AS
BEGIN
	SET NOCOUNT ON;

    INSERT INTO
		Kontakt(Ime, Prezime, Telefon, Email)
		VALUES (@Ime, @Prezime, @Telefon, @Email)

	SELECT
		ID,
		Ime,
		Prezime,
		Telefon,
		Email,
		VrijemeKreiranja,
		ZadnjaIzmjena
	FROM
		Kontakt
	WHERE
		ID = SCOPE_IDENTITY();
END

GO
/****** Object:  StoredProcedure [dbo].[SP_ObrisiKontakt]    Script Date: 14.10.2020. 1:06:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ====================================================================
-- Author:		Dario Carev
-- Create date: 3.10.2020.
-- Description:	Stvara novi kontakt
-- ====================================================================
CREATE PROCEDURE [dbo].[SP_ObrisiKontakt]
	@ID bigint
AS
BEGIN
	DELETE FROM Kontakt WHERE ID = @ID;
END

GO
USE [master]
GO
ALTER DATABASE [Adresar] SET  READ_WRITE 
GO
