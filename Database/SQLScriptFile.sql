USE [master]
GO
/****** Object:  Database [CINEMATICKET.MDF]    Script Date: 22.03.2024 21:02:43 ******/
CREATE DATABASE [CINEMATICKET.MDF]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CinemaTicket', FILENAME = N'C:\Users\Acer\CinemaTicket.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CinemaTicket_log', FILENAME = N'C:\Users\Acer\CinemaTicket_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [CINEMATICKET.MDF] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CINEMATICKET.MDF].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CINEMATICKET.MDF] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CINEMATICKET.MDF] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CINEMATICKET.MDF] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CINEMATICKET.MDF] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CINEMATICKET.MDF] SET ARITHABORT OFF 
GO
ALTER DATABASE [CINEMATICKET.MDF] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [CINEMATICKET.MDF] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CINEMATICKET.MDF] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CINEMATICKET.MDF] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CINEMATICKET.MDF] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CINEMATICKET.MDF] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CINEMATICKET.MDF] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CINEMATICKET.MDF] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CINEMATICKET.MDF] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CINEMATICKET.MDF] SET  ENABLE_BROKER 
GO
ALTER DATABASE [CINEMATICKET.MDF] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CINEMATICKET.MDF] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CINEMATICKET.MDF] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CINEMATICKET.MDF] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CINEMATICKET.MDF] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CINEMATICKET.MDF] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CINEMATICKET.MDF] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CINEMATICKET.MDF] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CINEMATICKET.MDF] SET  MULTI_USER 
GO
ALTER DATABASE [CINEMATICKET.MDF] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CINEMATICKET.MDF] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CINEMATICKET.MDF] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CINEMATICKET.MDF] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CINEMATICKET.MDF] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CINEMATICKET.MDF] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [CINEMATICKET.MDF] SET QUERY_STORE = ON
GO
ALTER DATABASE [CINEMATICKET.MDF] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [CINEMATICKET.MDF]
GO
/****** Object:  Table [dbo].[Halls]    Script Date: 22.03.2024 21:02:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Halls](
	[HallID] [int] IDENTITY(1,1) NOT NULL,
	[SeatCount] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[HallID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movies]    Script Date: 22.03.2024 21:02:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movies](
	[MovieID] [int] IDENTITY(1,1) NOT NULL,
	[MovieName] [varchar](100) NOT NULL,
	[Genre] [varchar](50) NOT NULL,
	[ReleaseYear] [int] NULL,
	[Director] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[MovieID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Seances]    Script Date: 22.03.2024 21:02:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Seances](
	[SeanceID] [int] IDENTITY(1,1) NOT NULL,
	[HallID] [int] NULL,
	[MovieID] [int] NULL,
	[SeanceTime] [time](7) NULL,
	[SeanceDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[SeanceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Seats]    Script Date: 22.03.2024 21:02:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Seats](
	[SeatID] [int] IDENTITY(1,1) NOT NULL,
	[HallID] [int] NULL,
	[SeatNumber] [int] NULL,
	[IsBooked] [bit] NULL,
	[SeanceID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[SeatID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tickets]    Script Date: 22.03.2024 21:02:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tickets](
	[TicketID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[SeanceID] [int] NULL,
	[SeatNumber] [int] NULL,
	[IsConfirm] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[TicketID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 22.03.2024 21:02:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](200) NOT NULL,
	[Password] [nvarchar](200) NOT NULL,
	[IsAdmin] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Halls] ON 

INSERT [dbo].[Halls] ([HallID], [SeatCount]) VALUES (1, 10)
INSERT [dbo].[Halls] ([HallID], [SeatCount]) VALUES (2, 15)
INSERT [dbo].[Halls] ([HallID], [SeatCount]) VALUES (3, 30)
SET IDENTITY_INSERT [dbo].[Halls] OFF
GO
SET IDENTITY_INSERT [dbo].[Movies] ON 

INSERT [dbo].[Movies] ([MovieID], [MovieName], [Genre], [ReleaseYear], [Director]) VALUES (1, N'Forrest Gump', N'Drama', 1994, N'Robert Zemeckis')
INSERT [dbo].[Movies] ([MovieID], [MovieName], [Genre], [ReleaseYear], [Director]) VALUES (2, N'Fight Club', N'Drama', 1999, N'David Fincher')
INSERT [dbo].[Movies] ([MovieID], [MovieName], [Genre], [ReleaseYear], [Director]) VALUES (3, N'Inception', N'Sci-Fi', 2010, N'Christopher Nolan')
INSERT [dbo].[Movies] ([MovieID], [MovieName], [Genre], [ReleaseYear], [Director]) VALUES (4, N'Toy Story', N'Animation', 1995, N'John Lasseter')
SET IDENTITY_INSERT [dbo].[Movies] OFF
GO
SET IDENTITY_INSERT [dbo].[Seances] ON 

INSERT [dbo].[Seances] ([SeanceID], [HallID], [MovieID], [SeanceTime], [SeanceDate]) VALUES (13, 1, 3, CAST(N'13:00:00' AS Time), CAST(N'2024-03-10' AS Date))
INSERT [dbo].[Seances] ([SeanceID], [HallID], [MovieID], [SeanceTime], [SeanceDate]) VALUES (14, 1, 1, CAST(N'16:00:00' AS Time), CAST(N'2024-03-10' AS Date))
INSERT [dbo].[Seances] ([SeanceID], [HallID], [MovieID], [SeanceTime], [SeanceDate]) VALUES (15, 1, 2, CAST(N'19:30:00' AS Time), CAST(N'2024-03-10' AS Date))
INSERT [dbo].[Seances] ([SeanceID], [HallID], [MovieID], [SeanceTime], [SeanceDate]) VALUES (16, 1, 4, CAST(N'23:00:00' AS Time), CAST(N'2024-03-10' AS Date))
INSERT [dbo].[Seances] ([SeanceID], [HallID], [MovieID], [SeanceTime], [SeanceDate]) VALUES (17, 2, 4, CAST(N'10:00:00' AS Time), CAST(N'2024-03-10' AS Date))
INSERT [dbo].[Seances] ([SeanceID], [HallID], [MovieID], [SeanceTime], [SeanceDate]) VALUES (18, 2, 4, CAST(N'13:30:00' AS Time), CAST(N'2024-03-10' AS Date))
INSERT [dbo].[Seances] ([SeanceID], [HallID], [MovieID], [SeanceTime], [SeanceDate]) VALUES (19, 3, 1, CAST(N'13:30:00' AS Time), CAST(N'2024-03-10' AS Date))
INSERT [dbo].[Seances] ([SeanceID], [HallID], [MovieID], [SeanceTime], [SeanceDate]) VALUES (20, 3, 2, CAST(N'17:00:00' AS Time), CAST(N'2024-03-10' AS Date))
INSERT [dbo].[Seances] ([SeanceID], [HallID], [MovieID], [SeanceTime], [SeanceDate]) VALUES (21, 2, 1, CAST(N'09:00:00' AS Time), CAST(N'2024-03-12' AS Date))
INSERT [dbo].[Seances] ([SeanceID], [HallID], [MovieID], [SeanceTime], [SeanceDate]) VALUES (22, 3, 1, CAST(N'09:00:00' AS Time), CAST(N'2024-03-12' AS Date))
INSERT [dbo].[Seances] ([SeanceID], [HallID], [MovieID], [SeanceTime], [SeanceDate]) VALUES (23, 3, 2, CAST(N'12:00:00' AS Time), CAST(N'2024-03-12' AS Date))
INSERT [dbo].[Seances] ([SeanceID], [HallID], [MovieID], [SeanceTime], [SeanceDate]) VALUES (24, 1, 1, CAST(N'11:00:00' AS Time), CAST(N'2024-03-12' AS Date))
INSERT [dbo].[Seances] ([SeanceID], [HallID], [MovieID], [SeanceTime], [SeanceDate]) VALUES (25, 2, 3, CAST(N'11:30:00' AS Time), CAST(N'2024-03-12' AS Date))
INSERT [dbo].[Seances] ([SeanceID], [HallID], [MovieID], [SeanceTime], [SeanceDate]) VALUES (26, 1, 3, CAST(N'14:40:00' AS Time), CAST(N'2024-03-13' AS Date))
INSERT [dbo].[Seances] ([SeanceID], [HallID], [MovieID], [SeanceTime], [SeanceDate]) VALUES (27, 3, 3, CAST(N'15:30:00' AS Time), CAST(N'2024-03-13' AS Date))
INSERT [dbo].[Seances] ([SeanceID], [HallID], [MovieID], [SeanceTime], [SeanceDate]) VALUES (28, 2, 2, CAST(N'14:00:00' AS Time), CAST(N'2024-03-13' AS Date))
INSERT [dbo].[Seances] ([SeanceID], [HallID], [MovieID], [SeanceTime], [SeanceDate]) VALUES (29, 1, 2, CAST(N'17:30:00' AS Time), CAST(N'2024-03-13' AS Date))
INSERT [dbo].[Seances] ([SeanceID], [HallID], [MovieID], [SeanceTime], [SeanceDate]) VALUES (30, 3, 4, CAST(N'19:00:00' AS Time), CAST(N'2024-03-13' AS Date))
INSERT [dbo].[Seances] ([SeanceID], [HallID], [MovieID], [SeanceTime], [SeanceDate]) VALUES (31, 2, 4, CAST(N'16:00:00' AS Time), CAST(N'2024-03-13' AS Date))
INSERT [dbo].[Seances] ([SeanceID], [HallID], [MovieID], [SeanceTime], [SeanceDate]) VALUES (32, 3, 3, CAST(N'22:00:00' AS Time), CAST(N'2024-03-13' AS Date))
SET IDENTITY_INSERT [dbo].[Seances] OFF
GO
SET IDENTITY_INSERT [dbo].[Seats] ON 

INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (1, 1, 1, 0, 13)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (2, 1, 2, 0, 13)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (3, 1, 3, 0, 13)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (4, 1, 4, 0, 13)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (5, 1, 5, 0, 13)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (6, 1, 6, 0, 13)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (7, 1, 7, 0, 13)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (8, 1, 8, 0, 13)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (9, 1, 9, 0, 13)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (10, 1, 10, 0, 13)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (11, 2, 1, 0, 17)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (12, 2, 2, 0, 17)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (13, 2, 3, 0, 17)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (14, 2, 4, 0, 17)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (15, 2, 5, 0, 17)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (16, 2, 6, 0, 17)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (17, 2, 7, 0, 17)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (18, 2, 8, 0, 17)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (19, 2, 9, 0, 17)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (20, 2, 10, 0, 17)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (21, 2, 11, 0, 17)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (22, 2, 12, 0, 17)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (23, 2, 13, 0, 17)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (24, 2, 14, 0, 17)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (25, 2, 15, 0, 17)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (26, 3, 1, 0, 19)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (27, 3, 2, 0, 19)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (28, 3, 3, 0, 19)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (29, 3, 4, 0, 19)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (30, 3, 5, 0, 19)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (31, 3, 6, 0, 19)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (32, 3, 7, 0, 19)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (33, 3, 8, 0, 19)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (34, 3, 9, 0, 19)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (35, 3, 10, 0, 19)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (36, 3, 11, 0, 19)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (37, 3, 12, 0, 19)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (38, 3, 13, 0, 19)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (39, 3, 14, 0, 19)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (40, 3, 15, 0, 19)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (41, 3, 16, 0, 19)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (42, 3, 17, 0, 19)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (43, 3, 18, 1, 19)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (44, 3, 19, 0, 19)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (45, 3, 20, 0, 19)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (46, 3, 21, 0, 19)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (47, 3, 22, 0, 19)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (48, 3, 23, 0, 19)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (49, 3, 24, 0, 19)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (50, 3, 25, 0, 19)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (51, 3, 26, 0, 19)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (52, 3, 27, 0, 19)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (53, 3, 28, 0, 19)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (54, 3, 29, 0, 19)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (55, 3, 30, 0, 19)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (57, 1, 1, 0, 14)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (58, 1, 2, 0, 14)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (59, 1, 3, 0, 14)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (60, 1, 4, 1, 14)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (61, 1, 5, 0, 14)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (62, 1, 6, 0, 14)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (63, 1, 7, 0, 14)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (64, 1, 8, 0, 14)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (65, 1, 9, 0, 14)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (66, 1, 10, 0, 14)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (67, 1, 1, 0, 15)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (68, 1, 2, 0, 15)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (69, 1, 3, 0, 15)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (70, 1, 4, 1, 15)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (71, 1, 5, 0, 15)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (72, 1, 6, 0, 15)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (73, 1, 7, 0, 15)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (74, 1, 8, 0, 15)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (75, 1, 9, 0, 15)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (76, 1, 10, 0, 15)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (77, 1, 1, 0, 16)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (78, 1, 2, 0, 16)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (79, 1, 3, 0, 16)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (80, 1, 4, 0, 16)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (81, 1, 5, 0, 16)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (82, 1, 6, 0, 16)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (83, 1, 7, 0, 16)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (84, 1, 8, 0, 16)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (85, 1, 9, 0, 16)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (86, 1, 10, 0, 16)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (87, 2, 1, 1, 18)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (88, 2, 2, 1, 18)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (89, 2, 3, 0, 18)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (90, 2, 4, 0, 18)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (91, 2, 5, 0, 18)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (92, 2, 6, 0, 18)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (93, 2, 7, 0, 18)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (94, 2, 8, 0, 18)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (95, 2, 9, 0, 18)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (96, 2, 10, 0, 18)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (97, 2, 11, 0, 18)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (98, 2, 12, 0, 18)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (99, 2, 13, 0, 18)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (100, 2, 14, 0, 18)
GO
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (101, 2, 15, 0, 18)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (102, 3, 1, 0, 20)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (103, 3, 2, 0, 20)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (104, 3, 3, 0, 20)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (105, 3, 4, 0, 20)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (106, 3, 5, 0, 20)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (107, 3, 6, 0, 20)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (108, 3, 7, 0, 20)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (109, 3, 8, 0, 20)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (110, 3, 9, 0, 20)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (111, 3, 10, 0, 20)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (112, 3, 11, 0, 20)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (113, 3, 12, 0, 20)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (114, 3, 13, 0, 20)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (115, 3, 14, 0, 20)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (116, 3, 15, 0, 20)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (117, 3, 16, 0, 20)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (118, 3, 17, 0, 20)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (119, 3, 18, 0, 20)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (120, 3, 19, 0, 20)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (121, 3, 20, 0, 20)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (122, 3, 21, 0, 20)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (123, 3, 22, 0, 20)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (124, 3, 23, 0, 20)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (125, 3, 24, 0, 20)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (126, 3, 25, 0, 20)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (127, 3, 26, 0, 20)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (128, 3, 27, 0, 20)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (129, 3, 28, 0, 20)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (130, 3, 29, 0, 20)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (131, 3, 30, 0, 20)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (132, 2, 1, 0, 21)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (133, 2, 2, 0, 21)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (134, 2, 3, 0, 21)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (135, 2, 4, 0, 21)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (136, 2, 5, 0, 21)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (137, 2, 6, 0, 21)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (138, 2, 7, 0, 21)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (139, 2, 8, 0, 21)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (140, 2, 9, 0, 21)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (141, 2, 10, 0, 21)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (142, 2, 11, 0, 21)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (143, 2, 12, 0, 21)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (144, 2, 13, 0, 21)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (145, 2, 14, 0, 21)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (146, 2, 15, 0, 21)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (147, 3, 1, 0, 22)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (148, 3, 2, 0, 22)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (149, 3, 3, 0, 22)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (150, 3, 4, 0, 22)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (151, 3, 5, 0, 22)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (152, 3, 6, 0, 22)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (153, 3, 7, 0, 22)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (154, 3, 8, 0, 22)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (155, 3, 9, 0, 22)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (156, 3, 10, 0, 22)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (157, 3, 11, 0, 22)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (158, 3, 12, 0, 22)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (159, 3, 13, 0, 22)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (160, 3, 14, 0, 22)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (161, 3, 15, 0, 22)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (162, 3, 16, 0, 22)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (163, 3, 17, 0, 22)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (164, 3, 18, 0, 22)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (165, 3, 19, 0, 22)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (166, 3, 20, 0, 22)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (167, 3, 21, 0, 22)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (168, 3, 22, 0, 22)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (169, 3, 23, 0, 22)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (170, 3, 24, 0, 22)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (171, 3, 25, 0, 22)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (172, 3, 26, 0, 22)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (173, 3, 27, 0, 22)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (174, 3, 28, 0, 22)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (175, 3, 29, 0, 22)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (176, 3, 30, 0, 22)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (177, 3, 1, 0, 23)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (178, 3, 2, 0, 23)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (179, 3, 3, 0, 23)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (180, 3, 4, 0, 23)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (181, 3, 5, 0, 23)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (182, 3, 6, 0, 23)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (183, 3, 7, 0, 23)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (184, 3, 8, 0, 23)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (185, 3, 9, 0, 23)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (186, 3, 10, 0, 23)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (187, 3, 11, 0, 23)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (188, 3, 12, 0, 23)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (189, 3, 13, 0, 23)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (190, 3, 14, 0, 23)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (191, 3, 15, 0, 23)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (192, 3, 16, 0, 23)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (193, 3, 17, 0, 23)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (194, 3, 18, 0, 23)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (195, 3, 19, 0, 23)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (196, 3, 20, 0, 23)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (197, 3, 21, 0, 23)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (198, 3, 22, 0, 23)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (199, 3, 23, 0, 23)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (200, 3, 24, 0, 23)
GO
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (201, 3, 25, 0, 23)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (202, 3, 26, 0, 23)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (203, 3, 27, 0, 23)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (204, 3, 28, 0, 23)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (205, 3, 29, 0, 23)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (206, 3, 30, 0, 23)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (207, 1, 1, 0, 24)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (208, 1, 2, 0, 24)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (209, 1, 3, 0, 24)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (210, 1, 4, 0, 24)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (211, 1, 5, 0, 24)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (212, 1, 6, 0, 24)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (213, 1, 7, 0, 24)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (214, 1, 8, 0, 24)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (215, 1, 9, 0, 24)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (216, 1, 10, 0, 24)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (217, 1, 1, 0, 24)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (218, 1, 2, 0, 24)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (219, 1, 3, 0, 24)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (220, 1, 4, 0, 24)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (221, 1, 5, 0, 24)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (222, 1, 6, 0, 24)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (223, 1, 7, 0, 24)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (224, 1, 8, 0, 24)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (225, 1, 9, 0, 24)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (226, 1, 10, 0, 24)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (227, 2, 1, 0, 25)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (228, 2, 2, 0, 25)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (229, 2, 3, 0, 25)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (230, 2, 4, 0, 25)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (231, 2, 5, 0, 25)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (232, 2, 6, 0, 25)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (233, 2, 7, 0, 25)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (234, 2, 8, 0, 25)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (235, 2, 9, 0, 25)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (236, 2, 10, 0, 25)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (237, 2, 11, 0, 25)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (238, 2, 12, 0, 25)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (239, 2, 13, 0, 25)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (240, 2, 14, 0, 25)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (241, 2, 15, 0, 25)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (242, 1, 1, 0, 26)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (243, 1, 2, 0, 26)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (244, 1, 3, 0, 26)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (245, 1, 4, 0, 26)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (246, 1, 5, 0, 26)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (247, 1, 6, 0, 26)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (248, 1, 7, 0, 26)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (249, 1, 8, 0, 26)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (250, 1, 9, 0, 26)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (251, 1, 10, 0, 26)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (252, 3, 1, 0, 27)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (253, 3, 2, 0, 27)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (254, 3, 3, 0, 27)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (255, 3, 4, 0, 27)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (256, 3, 5, 0, 27)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (257, 3, 6, 0, 27)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (258, 3, 7, 0, 27)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (259, 3, 8, 0, 27)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (260, 3, 9, 0, 27)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (261, 3, 10, 0, 27)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (262, 3, 11, 0, 27)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (263, 3, 12, 0, 27)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (264, 3, 13, 0, 27)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (265, 3, 14, 0, 27)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (266, 3, 15, 0, 27)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (267, 3, 16, 0, 27)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (268, 3, 17, 0, 27)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (269, 3, 18, 0, 27)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (270, 3, 19, 0, 27)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (271, 3, 20, 0, 27)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (272, 3, 21, 0, 27)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (273, 3, 22, 0, 27)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (274, 3, 23, 0, 27)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (275, 3, 24, 0, 27)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (276, 3, 25, 0, 27)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (277, 3, 26, 0, 27)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (278, 3, 27, 0, 27)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (279, 3, 28, 0, 27)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (280, 3, 29, 0, 27)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (281, 3, 30, 0, 27)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (282, 2, 1, 0, 28)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (283, 2, 2, 0, 28)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (284, 2, 3, 0, 28)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (285, 2, 4, 0, 28)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (286, 2, 5, 0, 28)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (287, 2, 6, 0, 28)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (288, 2, 7, 0, 28)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (289, 2, 8, 0, 28)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (290, 2, 9, 0, 28)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (291, 2, 10, 0, 28)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (292, 2, 11, 0, 28)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (293, 2, 12, 0, 28)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (294, 2, 13, 0, 28)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (295, 2, 14, 0, 28)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (296, 2, 15, 0, 28)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (297, 1, 1, 0, 29)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (298, 1, 2, 0, 29)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (299, 1, 3, 0, 29)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (300, 1, 4, 0, 29)
GO
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (301, 1, 5, 0, 29)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (302, 1, 6, 0, 29)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (303, 1, 7, 0, 29)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (304, 1, 8, 0, 29)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (305, 1, 9, 0, 29)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (306, 1, 10, 0, 29)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (307, 3, 1, 0, 30)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (308, 3, 2, 0, 30)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (309, 3, 3, 0, 30)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (310, 3, 4, 0, 30)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (311, 3, 5, 0, 30)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (312, 3, 6, 0, 30)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (313, 3, 7, 0, 30)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (314, 3, 8, 0, 30)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (315, 3, 9, 0, 30)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (316, 3, 10, 0, 30)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (317, 3, 11, 0, 30)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (318, 3, 12, 0, 30)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (319, 3, 13, 0, 30)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (320, 3, 14, 0, 30)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (321, 3, 15, 0, 30)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (322, 3, 16, 0, 30)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (323, 3, 17, 0, 30)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (324, 3, 18, 0, 30)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (325, 3, 19, 0, 30)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (326, 3, 20, 0, 30)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (327, 3, 21, 0, 30)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (328, 3, 22, 0, 30)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (329, 3, 23, 0, 30)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (330, 3, 24, 0, 30)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (331, 3, 25, 0, 30)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (332, 3, 26, 0, 30)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (333, 3, 27, 0, 30)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (334, 3, 28, 0, 30)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (335, 3, 29, 0, 30)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (336, 3, 30, 0, 30)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (337, 2, 1, 0, 31)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (338, 2, 2, 0, 31)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (339, 2, 3, 0, 31)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (340, 2, 4, 0, 31)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (341, 2, 5, 0, 31)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (342, 2, 6, 0, 31)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (343, 2, 7, 0, 31)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (344, 2, 8, 0, 31)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (345, 2, 9, 0, 31)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (346, 2, 10, 0, 31)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (347, 2, 11, 0, 31)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (348, 2, 12, 0, 31)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (349, 2, 13, 0, 31)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (350, 2, 14, 0, 31)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (351, 2, 15, 0, 31)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (352, 3, 1, 0, 32)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (353, 3, 2, 0, 32)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (354, 3, 3, 0, 32)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (355, 3, 4, 0, 32)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (356, 3, 5, 0, 32)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (357, 3, 6, 0, 32)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (358, 3, 7, 0, 32)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (359, 3, 8, 0, 32)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (360, 3, 9, 0, 32)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (361, 3, 10, 0, 32)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (362, 3, 11, 0, 32)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (363, 3, 12, 0, 32)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (364, 3, 13, 0, 32)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (365, 3, 14, 0, 32)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (366, 3, 15, 0, 32)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (367, 3, 16, 0, 32)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (368, 3, 17, 0, 32)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (369, 3, 18, 0, 32)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (370, 3, 19, 0, 32)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (371, 3, 20, 0, 32)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (372, 3, 21, 0, 32)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (373, 3, 22, 0, 32)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (374, 3, 23, 0, 32)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (375, 3, 24, 0, 32)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (376, 3, 25, 0, 32)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (377, 3, 26, 0, 32)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (378, 3, 27, 0, 32)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (379, 3, 28, 0, 32)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (380, 3, 29, 0, 32)
INSERT [dbo].[Seats] ([SeatID], [HallID], [SeatNumber], [IsBooked], [SeanceID]) VALUES (381, 3, 30, 1, 32)
SET IDENTITY_INSERT [dbo].[Seats] OFF
GO
SET IDENTITY_INSERT [dbo].[Tickets] ON 

INSERT [dbo].[Tickets] ([TicketID], [UserID], [SeanceID], [SeatNumber], [IsConfirm]) VALUES (1, 1, 15, 4, 1)
INSERT [dbo].[Tickets] ([TicketID], [UserID], [SeanceID], [SeatNumber], [IsConfirm]) VALUES (4, 2, 14, 4, 1)
INSERT [dbo].[Tickets] ([TicketID], [UserID], [SeanceID], [SeatNumber], [IsConfirm]) VALUES (5, 2, 18, 1, 1)
INSERT [dbo].[Tickets] ([TicketID], [UserID], [SeanceID], [SeatNumber], [IsConfirm]) VALUES (7, 4, 18, 2, 1)
INSERT [dbo].[Tickets] ([TicketID], [UserID], [SeanceID], [SeatNumber], [IsConfirm]) VALUES (8, 1, 32, 30, 1)
INSERT [dbo].[Tickets] ([TicketID], [UserID], [SeanceID], [SeatNumber], [IsConfirm]) VALUES (9, 5, 19, 18, 1)
SET IDENTITY_INSERT [dbo].[Tickets] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password], [IsAdmin]) VALUES (1, N'İsmet', N'Akpınar', N'ismet.tesodev@gmail.com', N'123456', 1)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password], [IsAdmin]) VALUES (2, N'Serkan', N'Türkeli', N'serkan.turkeli@gmail.com', N'turkeli123', 0)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password], [IsAdmin]) VALUES (4, N'Altug', N'Türkeli', N'altugturkeli@hotmail.com', N'altugserkan', 0)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password], [IsAdmin]) VALUES (5, N'Merve', N'Yeşil', N'mervey@gmail.com', N'mrv789', 0)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Seances]  WITH CHECK ADD FOREIGN KEY([HallID])
REFERENCES [dbo].[Halls] ([HallID])
GO
ALTER TABLE [dbo].[Seances]  WITH CHECK ADD FOREIGN KEY([MovieID])
REFERENCES [dbo].[Movies] ([MovieID])
GO
ALTER TABLE [dbo].[Seats]  WITH CHECK ADD FOREIGN KEY([HallID])
REFERENCES [dbo].[Halls] ([HallID])
GO
ALTER TABLE [dbo].[Seats]  WITH CHECK ADD  CONSTRAINT [FK_Seats_Seances] FOREIGN KEY([SeanceID])
REFERENCES [dbo].[Seances] ([SeanceID])
GO
ALTER TABLE [dbo].[Seats] CHECK CONSTRAINT [FK_Seats_Seances]
GO
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD  CONSTRAINT [FK_Tickets_Seances] FOREIGN KEY([SeanceID])
REFERENCES [dbo].[Seances] ([SeanceID])
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [FK_Tickets_Seances]
GO
USE [master]
GO
ALTER DATABASE [CINEMATICKET.MDF] SET  READ_WRITE 
GO
