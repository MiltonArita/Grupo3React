USE [master]
GO
/****** Object:  Database [GRUPO3]    Script Date: 7 jun. 2021 00:23:54 ******/
CREATE DATABASE [GRUPO3]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GRUPO3', FILENAME = N'C:\db\GRUPO3.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GRUPO3_log', FILENAME = N'C:\db\GRUPO3_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [GRUPO3] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GRUPO3].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GRUPO3] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GRUPO3] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GRUPO3] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GRUPO3] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GRUPO3] SET ARITHABORT OFF 
GO
ALTER DATABASE [GRUPO3] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GRUPO3] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GRUPO3] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GRUPO3] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GRUPO3] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GRUPO3] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GRUPO3] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GRUPO3] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GRUPO3] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GRUPO3] SET  DISABLE_BROKER 
GO
ALTER DATABASE [GRUPO3] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GRUPO3] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GRUPO3] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GRUPO3] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GRUPO3] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GRUPO3] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GRUPO3] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GRUPO3] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [GRUPO3] SET  MULTI_USER 
GO
ALTER DATABASE [GRUPO3] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GRUPO3] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GRUPO3] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GRUPO3] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GRUPO3] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [GRUPO3] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'GRUPO3', N'ON'
GO
ALTER DATABASE [GRUPO3] SET QUERY_STORE = OFF
GO
USE [GRUPO3]
GO
/****** Object:  Table [dbo].[Citas]    Script Date: 7 jun. 2021 00:23:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Citas](
	[IdCita] [int] IDENTITY(1,1) NOT NULL,
	[IdCliente] [int] NOT NULL,
	[IdDoctor] [int] NOT NULL,
	[ComentarioAdicional] [varchar](50) NULL,
	[FechaCita] [date] NULL,
 CONSTRAINT [PK_Cita] PRIMARY KEY CLUSTERED 
(
	[IdCita] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 7 jun. 2021 00:23:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[IdCliente] [int] NOT NULL,
	[Cliente] [nvarchar](50) NOT NULL,
	[FechaNacimiento] [date] NOT NULL,
	[Procedencia] [nvarchar](50) NOT NULL,
	[Identidad] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ComentariosFarmacia]    Script Date: 7 jun. 2021 00:23:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ComentariosFarmacia](
	[IdComentarioFarmacia] [int] IDENTITY(1,1) NOT NULL,
	[idFarmacia] [int] NOT NULL,
	[Comentarios] [text] NOT NULL,
	[PlanDeAccion] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdComentarioFarmacia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DirectorioMedico]    Script Date: 7 jun. 2021 00:23:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DirectorioMedico](
	[IdDoctor] [int] NOT NULL,
	[NombreDoctor] [nvarchar](50) NOT NULL,
	[Especialidad] [nvarchar](50) NOT NULL,
	[ClinicaAsignada] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_DirectorioMedico] PRIMARY KEY CLUSTERED 
(
	[IdDoctor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Farmacia]    Script Date: 7 jun. 2021 00:23:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Farmacia](
	[idFarmacia] [int] IDENTITY(1,1) NOT NULL,
	[CodigoArticulo] [int] NOT NULL,
	[NombreArticulo] [text] NOT NULL,
	[Descripcion] [text] NOT NULL,
	[Proveedor] [text] NOT NULL,
	[PrecioVenta] [numeric](10, 2) NOT NULL,
	[DescuentoAplicado] [numeric](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[idFarmacia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Citas] ON 

INSERT [dbo].[Citas] ([IdCita], [IdCliente], [IdDoctor], [ComentarioAdicional], [FechaCita]) VALUES (1, 3, 7, N'Llegar media hora antes', CAST(N'2021-01-01' AS Date))
INSERT [dbo].[Citas] ([IdCita], [IdCliente], [IdDoctor], [ComentarioAdicional], [FechaCita]) VALUES (2, 7, 1, N'Reprogramado', CAST(N'2021-01-02' AS Date))
INSERT [dbo].[Citas] ([IdCita], [IdCliente], [IdDoctor], [ComentarioAdicional], [FechaCita]) VALUES (3, 1, 10, NULL, CAST(N'2021-02-04' AS Date))
INSERT [dbo].[Citas] ([IdCita], [IdCliente], [IdDoctor], [ComentarioAdicional], [FechaCita]) VALUES (4, 10, 2, NULL, CAST(N'2021-02-04' AS Date))
INSERT [dbo].[Citas] ([IdCita], [IdCliente], [IdDoctor], [ComentarioAdicional], [FechaCita]) VALUES (9, 11, 3, N'No olvide traer recetas de cita anterior', CAST(N'2021-02-04' AS Date))
INSERT [dbo].[Citas] ([IdCita], [IdCliente], [IdDoctor], [ComentarioAdicional], [FechaCita]) VALUES (10, 12, 15, N'Se reprogramo para 201-02-05', CAST(N'2021-02-05' AS Date))
INSERT [dbo].[Citas] ([IdCita], [IdCliente], [IdDoctor], [ComentarioAdicional], [FechaCita]) VALUES (11, 2, 20, N'Paciente alergica a Lidocaina', CAST(N'2021-02-05' AS Date))
INSERT [dbo].[Citas] ([IdCita], [IdCliente], [IdDoctor], [ComentarioAdicional], [FechaCita]) VALUES (12, 15, 1, N'Reprogramado', CAST(N'2021-02-05' AS Date))
INSERT [dbo].[Citas] ([IdCita], [IdCliente], [IdDoctor], [ComentarioAdicional], [FechaCita]) VALUES (13, 14, 5, N'Paciente solicito cambio fecha cita', CAST(N'2021-02-06' AS Date))
INSERT [dbo].[Citas] ([IdCita], [IdCliente], [IdDoctor], [ComentarioAdicional], [FechaCita]) VALUES (14, 30, 8, NULL, CAST(N'2021-02-07' AS Date))
INSERT [dbo].[Citas] ([IdCita], [IdCliente], [IdDoctor], [ComentarioAdicional], [FechaCita]) VALUES (15, 90, 21, NULL, CAST(N'2021-02-08' AS Date))
INSERT [dbo].[Citas] ([IdCita], [IdCliente], [IdDoctor], [ComentarioAdicional], [FechaCita]) VALUES (16, 8, 19, N'Reprogramado', CAST(N'2021-03-08' AS Date))
INSERT [dbo].[Citas] ([IdCita], [IdCliente], [IdDoctor], [ComentarioAdicional], [FechaCita]) VALUES (17, 81, 20, N'Llegara una hora despues', CAST(N'2021-01-06' AS Date))
INSERT [dbo].[Citas] ([IdCita], [IdCliente], [IdDoctor], [ComentarioAdicional], [FechaCita]) VALUES (18, 85, 67, N'Llegara 20 minutos antes', CAST(N'2021-11-05' AS Date))
INSERT [dbo].[Citas] ([IdCita], [IdCliente], [IdDoctor], [ComentarioAdicional], [FechaCita]) VALUES (19, 15, 55, N'Llegara muy tarde', CAST(N'2021-10-04' AS Date))
INSERT [dbo].[Citas] ([IdCita], [IdCliente], [IdDoctor], [ComentarioAdicional], [FechaCita]) VALUES (20, 9, 45, N'Reprogramado', CAST(N'2021-12-09' AS Date))
INSERT [dbo].[Citas] ([IdCita], [IdCliente], [IdDoctor], [ComentarioAdicional], [FechaCita]) VALUES (21, 7, 32, N'Se reprogramo', CAST(N'2021-08-10' AS Date))
INSERT [dbo].[Citas] ([IdCita], [IdCliente], [IdDoctor], [ComentarioAdicional], [FechaCita]) VALUES (22, 1, 16, N'Reprogramado', CAST(N'2021-03-08' AS Date))
INSERT [dbo].[Citas] ([IdCita], [IdCliente], [IdDoctor], [ComentarioAdicional], [FechaCita]) VALUES (23, 84, 64, N'Paciente solicito cambiar fecha', CAST(N'2021-11-03' AS Date))
INSERT [dbo].[Citas] ([IdCita], [IdCliente], [IdDoctor], [ComentarioAdicional], [FechaCita]) VALUES (24, 6, 60, N'Se reprogramo para 2021-02-06', CAST(N'2021-01-05' AS Date))
INSERT [dbo].[Citas] ([IdCita], [IdCliente], [IdDoctor], [ComentarioAdicional], [FechaCita]) VALUES (25, 86, 54, NULL, CAST(N'2021-12-06' AS Date))
INSERT [dbo].[Citas] ([IdCita], [IdCliente], [IdDoctor], [ComentarioAdicional], [FechaCita]) VALUES (26, 87, 62, N'Estara Puntual', CAST(N'2021-08-10' AS Date))
SET IDENTITY_INSERT [dbo].[Citas] OFF
GO
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (1, N'Abadie John Milton', CAST(N'1940-01-01' AS Date), N'SAN PEDRO SULA', N'1401-1986-12123')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (2, N'Abadie Aguilar Javier Arturo', CAST(N'1941-02-02' AS Date), N'TEGUCIGALPA', N'0801-1977-06838')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (3, N'Acosta Bonilla Manuel', CAST(N'1942-03-03' AS Date), N'TEGUCIGALPA', N'1804-1929-02627')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (4, N'Acosta Carcamo Mario Donaldo', CAST(N'1943-04-04' AS Date), N'ROATAN', N'1521-1962-00039')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (5, N'Acosta Garcia Kileer', CAST(N'1944-05-05' AS Date), N'SAN PEDRO SULA', N'0501-1966-06479')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (6, N'Acosta Artica Miguel Angel', CAST(N'1945-06-06' AS Date), N'TEGUCIGALPA', N'1501-1953-00402')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (7, N'Acosta Salguero Hector Reynaldo', CAST(N'1946-07-07' AS Date), N'S P S', N'0107-1939-00315')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (8, N'Acosta Reyes Maria Elena', CAST(N'1947-08-08' AS Date), N'TEGUCIGALPA', N'0804-1970-01928')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (9, N'Aceituno Ulloa Rene Mauricio', CAST(N'1948-09-09' AS Date), N'TEGUCIGALPA', N'0801-1969-04035')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (10, N'Aguilar C. Armando', CAST(N'1949-10-10' AS Date), N'TEGUCIGALPA', N'1301-1930-00126')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (11, N'Aguilar Carcamo Jose Efrain', CAST(N'1950-11-11' AS Date), N'TEGUCIGALPA', N'1501-1963-01096')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (12, N'Aguilar Cruz Sixto', CAST(N'1951-12-12' AS Date), N'TEGUCIGALPA', N'0601-1985-01511')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (13, N'Aguilar Garcia Isauro', CAST(N'1952-01-13' AS Date), N'TEGUCIGALPA', N'0401-1940-00070')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (14, N'Aguilar I. Irma Elizabeth', CAST(N'1953-02-14' AS Date), N'TEGUCIGALPA', N'0801-1964-05151')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (15, N'Aguilar Martinez Salustio', CAST(N'1954-03-15' AS Date), N'SAN PEDRO SULA', N'0801-1934-01689')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (16, N'Aguilar Medina Efrain Antonio', CAST(N'1955-04-16' AS Date), N'TEGUCIGALPA', N'0801-1966-02533')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (17, N'Aguilar Murillo Humberto N.', CAST(N'1956-05-17' AS Date), N'S P S', N'0501-1925-00517')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (18, N'Aguilar Pineda Ana Gabriela', CAST(N'1957-06-18' AS Date), N'TEGUCIGALPA', N'0801-1974-02446')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (19, N'Aguilar P. Jose Isaias', CAST(N'1958-07-19' AS Date), N'TEGUCIGALPA', N'0714-1949-00201')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (20, N'Aguilar Guifarro Carlos Ramon', CAST(N'1959-08-20' AS Date), N'LA CEIBA', N'0208-1973-00621')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (21, N'Aguilar Smith Jaime', CAST(N'1960-09-21' AS Date), N'PUERTO CORTES', N'0506-1943-00283')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (22, N'Aguilar R. Efrain Alexander', CAST(N'1961-10-22' AS Date), N'TEGUCIGALPA', N'0801-1976-09730')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (23, N'Aguilar Romero Marvin Omar', CAST(N'1962-11-23' AS Date), N'TEGUCIGALPA', N'0824-1967-00467')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (24, N'Aguilar S. Mario Alfonso', CAST(N'1963-12-24' AS Date), N'TEGUCIGALPA', N'1601-1953-00149')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (25, N'Aguilar Valladares Jose Ramon', CAST(N'1964-01-25' AS Date), N'SAN PEDRO SULA', N'0501-1943-00721')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (26, N'Aguilar Villafranca Jose Salvador', CAST(N'1965-02-26' AS Date), N'TEGUCIGALPA', N'0801-1965-04274')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (27, N'Aguilera Celino', CAST(N'1966-03-27' AS Date), N'TEGUCIGALPA', N'0601-1967-00580')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (28, N'Agurcia Mercadla David Gerardo', CAST(N'1967-04-28' AS Date), N'TEGUCIGALPA', N'0801-1969-03870')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (29, N'Alcerro Diaz Joaquin Donato', CAST(N'1968-05-01' AS Date), N'TEGUCIGALPA', N'0801-1944-02305')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (30, N'Alcerro Milla Juan Jose', CAST(N'1969-06-02' AS Date), N'TEGUCIGALPA', N'0801-1972-03547')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (31, N'Alcerro Saravia, Servando', CAST(N'1970-07-03' AS Date), N'COMAYAGUA', N'0302-1959-00003')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (32, N'Aleman Avila Jose Maria', CAST(N'1971-08-04' AS Date), N'SIGUATEPEQUE', N'1303-1945-00101')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (33, N'Alfaro Rodriguez Alejandro', CAST(N'1972-09-05' AS Date), N'COMAYAGUA', N'1401-1942-00326')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (34, N'Almendares L. Jose Expectacion', CAST(N'1973-10-06' AS Date), N'TEGUCIGALPA', N'1204-1960-00009')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (35, N'Almendares L. Marco Javier', CAST(N'1974-11-07' AS Date), N'TEGUCIGALPA', N'0801-1965-03155')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (36, N'Alonzo de Quezada Alba', CAST(N'1975-12-08' AS Date), N'TEGUCIGALPA', N'0801-1924-00277')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (37, N'Alvarado Alvarado Pedro Ruben', CAST(N'1976-01-09' AS Date), N'COPAN', N'0405-1963-00135')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (38, N'Alvarado C. Manuel Enrique', CAST(N'1977-02-10' AS Date), N'TEGUCIGALPA', N'0601-1984-01352')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (39, N'Alvarado Cruz Marco Alejandro', CAST(N'1978-03-11' AS Date), N'SANTA ROSA', N'0401-1980-00227')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (40, N'Alvarado Crespo Maria Elena', CAST(N'1979-04-12' AS Date), N'TEGUCIGALPA', N'0101-1954-00028')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (41, N'Alvarado Medina Luisa Dolores', CAST(N'1980-05-13' AS Date), N'SAN PEDRO SULA', N'0501-1959-04335')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (42, N'Alvarado Echeverria Martin', CAST(N'1981-06-14' AS Date), N'TEGUCIGALPA', N'0801-1963-07837')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (43, N'Alvarado Flores Rossana Maria', CAST(N'1982-07-15' AS Date), N'TEGUCIGALPA', N'0801-1968-02894')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (44, N'Alvarado Bueso Andres Alejandro', CAST(N'1983-08-16' AS Date), N'TEGUCIGALPA', N'0801-1979-01952')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (45, N'Alvarado Hernandez Hugo Vicente', CAST(N'1984-09-17' AS Date), N'LIMA, CORTES', N'0401-1951-00038')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (46, N'Alvarado Galvez Jose Roberto', CAST(N'1985-10-18' AS Date), N'TEGUCIGALPA', N'0801-1970-04362')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (47, N'Alvarado Moreno Rina Auxiliadora', CAST(N'1986-11-19' AS Date), N'TEGUCIGALPA', N'0704-1962-00319')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (48, N'Alvarado Chinchilla Carlos Roberto', CAST(N'1987-12-20' AS Date), N'COPAN', N'0406-1981-00536')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (49, N'Alvarado Pena Moris Amilcar', CAST(N'1988-01-21' AS Date), N'TEGUCIGALPA', N'0420-1970-00096')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (50, N'Alvarado Ramirez Jose Jesus', CAST(N'1989-02-22' AS Date), N'TEGUCIGALPA', N'0401-1937-00313')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (51, N'Alvarado Ramirez  Edna', CAST(N'1990-03-23' AS Date), N'TEGU CIGALPA', N'1301-1944-00078')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (52, N'Alvarado Sorto Loany Patricia', CAST(N'1991-04-24' AS Date), N'TEGUCIGALPA', N'0208-1964-00099')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (53, N'Alvarado Ney Juan Carlos', CAST(N'1992-05-25' AS Date), N'TEGUCIGALPA', N'0801-1968-00613')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (54, N'Alvarado Reina Ernesto', CAST(N'1993-06-26' AS Date), N'SAN PEDRO SULA', N'0801-1943-03054')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (55, N'Alvarado Tejada Zoilo', CAST(N'1994-07-27' AS Date), N'SAN PEDRO SULA', N'1701-1970-00871')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (56, N'Alvarenga Funez Fernando', CAST(N'1995-08-28' AS Date), N'TEGUCIGALPA', N'0501-1937-01165')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (57, N'Alvarenga Mairena Oscar R.', CAST(N'1996-09-01' AS Date), N'TEGUCIGALPA', N'0801-1951-04421')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (58, N'Alvarenga Urbina Abraham', CAST(N'1997-10-02' AS Date), N'GRACIAS, LEMPIRA', N'1312-1974-00146')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (59, N'Alvarez Alvarado Florentino', CAST(N'1998-11-03' AS Date), N'TEGUCIGALPA', N'0801-1938-00017')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (60, N'Alvarez Duron Oscar', CAST(N'1999-12-04' AS Date), N'CHOLUTECA', N'0801-1933-01793')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (61, N'Alvarez Galo Jaime Anselmo', CAST(N'2000-01-05' AS Date), N'TEGUCIGALPA', N'0801-1958-02755')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (62, N'Alvarez Jose Gaspar', CAST(N'2001-02-06' AS Date), N'TEGUCIGALPA', N'0601-1973-02672')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (63, N'Alvarez Sagastume Lidia', CAST(N'2002-03-07' AS Date), N'TEGUCIGALPA', N'1808-1972-00562')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (64, N'Alvarez Sambula Francisco', CAST(N'2003-04-08' AS Date), N'TEGUCIGALPA', N'0203-1944-00077')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (65, N'Amador Rico Luis Rene', CAST(N'2004-05-09' AS Date), N'TEGUCIGALPA', N'0826-1947-00048')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (66, N'Amaya Chirinos Marconi Hiram', CAST(N'2005-06-10' AS Date), N'TEGUCIGALPA', N'1801-1965-00529')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (67, N'Amaya Duron Marco Antonio', CAST(N'2006-07-11' AS Date), N'TEGUCIGALPA', N'1809-1943-00002')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (68, N'Anchecta Chinchilla Jose Roberto', CAST(N'2007-08-12' AS Date), N'TEGUCIGALPA', N'1416-1955-00122')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (69, N'Andino Aguilar Iris Ondina', CAST(N'2008-09-13' AS Date), N'TEGUCIGALPA', N'0801-1956-01290')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (70, N'Andino Martinez Jose Reynaldo', CAST(N'2009-10-14' AS Date), N'TEGUCIGALPA', N'0801-1947-00114')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (71, N'Andino Lopez Orbeleany', CAST(N'2010-11-15' AS Date), N'TEGUCIGALPA', N'0801-1942-02232')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (72, N'Andonie Mejia Karla Maricruz', CAST(N'2011-12-16' AS Date), N'SAN PEDRO SULA', N'0501-1969-03528')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (73, N'Anemis Lopez Edwin Alberto', CAST(N'2012-01-17' AS Date), N'TEGUCIGALPA', N'0506-1959-00929')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (74, N'Andrade A. Javier Ladislado', CAST(N'2013-02-18' AS Date), N'GRACIAS LEMPIRA', N'0801-1970-03257')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (75, N'Andrade Amador Sayda Pamela', CAST(N'2014-03-19' AS Date), N'GRACIAS LEMPIRA', N'0801-1977-09995')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (76, N'Aquino Guevara Jose Gilberto', CAST(N'2015-04-20' AS Date), N'TEGUCIGALPA', N'1401-1984-01249')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (77, N'Araujo Dunaway Kenneth', CAST(N'2016-05-21' AS Date), N'SAN PEDRO SULA', N'0501-1955-03295')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (78, N'Atala Farach Nick Wady', CAST(N'2017-06-22' AS Date), N'TEGUCIGALPA', N'0801-1961-02184')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (79, N'Arevalo Sandoval Jose Luis', CAST(N'2018-07-23' AS Date), N'COMAYAGUA', N'0301-1968-01182')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (80, N'Argenal O. Roger Omar', CAST(N'2019-08-24' AS Date), N'CHOLUTECA', N'0801-1980-12651')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (81, N'Aquino Mendoza Jose Gilberto', CAST(N'2020-09-25' AS Date), N'TEGUCIGALPA', N'0601-1949-00129')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (82, N'Argenal Cerrato Josue', CAST(N'2021-10-26' AS Date), N'TEGUCIGALPA', N'0801-1969-08449')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (83, N'Argueta Gustavo', CAST(N'1940-11-27' AS Date), N'LA ESPERANZA', N'0801-1961-05117')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (84, N'Argueta Claros Jony Omar', CAST(N'1941-12-28' AS Date), N'SANTA ROSA', N'1313-1971-00208')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (85, N'Argueta Aguilar Donaldo', CAST(N'1942-01-01' AS Date), N'TEGUIGALPA', N'1001-1927-00031')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (86, N'Argueta Bourdeth Conan Rafael', CAST(N'1943-02-02' AS Date), N'INTIBUCA', N'1013-1935-00004')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (87, N'Argueta Caceres Jose Martho', CAST(N'1944-03-03' AS Date), N'COMAYAGUA', N'1001-1984-00037')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (88, N'Argueta de Guilbert Ana Luz', CAST(N'1945-04-04' AS Date), N'TEGUCIGALPA', N'0301-1957-00076')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (89, N'Arguijo Benitez Besser', CAST(N'1946-05-05' AS Date), N'TEGUCIGALPA', N'1201-1965-00266')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (90, N'Arevalo Cerna Marlon Javier', CAST(N'1947-06-06' AS Date), N'TEGUCIGALPA', N'0820-1937-00144')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (91, N'Arita Vasquez Merlyn Alberto', CAST(N'1948-07-07' AS Date), N'LA CEIBA', N'0209-1976-01210')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (92, N'Arita Aguilar Oscar Manuel', CAST(N'1949-08-08' AS Date), N'TEGUCIGALPA', N'1415-1950-00106')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (93, N'Arita Rodriguez Rafael Ramiro', CAST(N'1950-09-09' AS Date), N'TEGUCIGALPA', N'0406-1966-00233')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (94, N'Arita Mejia Carlos Humberto', CAST(N'1951-10-10' AS Date), N'TEGUCIGALPA', N'1407-1944-00095')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (95, N'Arita Quinonez Roberto', CAST(N'1952-11-11' AS Date), N'TEGUCIGALPA', N'0501-1939-00700')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (96, N'Arita Valle Jose Tomas', CAST(N'1953-12-12' AS Date), N'TEGUCIGALPA', N'1401-1962-00106')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (97, N'Armijo Rodriguez Francisco Evelio', CAST(N'1954-01-13' AS Date), N'SAN PEDRO SULA', N'2101-1985-00066')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (98, N'Arriaga M. Jose Rolando', CAST(N'1955-02-14' AS Date), N'SAN PEDRO SULA', N'0501-1941-00313')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (99, N'Aspra Iglesias Dagoberto', CAST(N'1956-03-15' AS Date), N'TEGUCIGALPA', N'0801-1966-02956')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (100, N'Avelar Rajo Sandra Lizeth', CAST(N'1957-04-16' AS Date), N'TEGUCIGALPA', N'0318-1970-00005')
GO
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (101, N'Avila Baca Rebeca Angelina', CAST(N'1958-05-17' AS Date), N'SIGUATEPEQUE', N'0801-1967-02075')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (102, N'Avila Bier Lilian Graciela', CAST(N'1959-06-18' AS Date), N'TEGUCIGALPA', N'0107-1952-00711')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (103, N'Avila E. Marlon Rolando', CAST(N'1960-07-19' AS Date), N'LA CEIBA', N'1601-1969-00323')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (104, N'Avila Gonzalez Jose Augusto', CAST(N'1961-08-20' AS Date), N'TEGUCIGALPA', N'0801-1952-03350')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (105, N'Avila Gonzalez de Diaz Digna', CAST(N'1962-09-21' AS Date), N'TEGUCIGALPA', N'0801-1948-01450')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (106, N'Avila Macias Angel Gustavo', CAST(N'1963-10-22' AS Date), N'TEGUCIGALPA', N'1201-1937-00020')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (107, N'Avila Venegas Carlos Armando', CAST(N'1964-11-23' AS Date), N'S.P.S.', N'0501-1941-01478')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (108, N'Avila Ortiz Felix Antonio', CAST(N'1965-12-24' AS Date), N'TEGUCIGALPA', N'0703-1964-00686')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (109, N'Aviles Flores Roberto', CAST(N'1966-01-25' AS Date), N'TEGUCIGALPA', N'0801-1934-00241')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (110, N'Avilez Jeronimo Devir Caleb', CAST(N'1967-02-26' AS Date), N'TEGUCIGALPA', N'0404-1962-00497')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (111, N'Ayala Orellana Juan Jose', CAST(N'1968-03-27' AS Date), N'INTIBUCA', N'1010-1952-00006')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (112, N'Ayes Callejas Francisco', CAST(N'1969-04-28' AS Date), N'Tegucigalpa', N'0801-1983-04872')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (113, N'Ayes Cerna Armando', CAST(N'1970-05-01' AS Date), N'TEGUCIGALPA', N'1501-1938-00317')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (114, N'Azcona Bocock Javier Enrique', CAST(N'1971-06-02' AS Date), N'TEGUCIGALPA', N'0101-1976-01491')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (115, N'Azcona del Hoyo Maria Yolanda', CAST(N'1972-07-03' AS Date), N'TEGUCIGALPA', N'0101-1940-00061')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (116, N'Azcona S. Fernando Francisco', CAST(N'1973-08-04' AS Date), N'LA CEIBA', N'0801-1981-42002')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (117, N'Baca Mondragon Nery Esteban', CAST(N'1974-09-05' AS Date), N'TEGUCIGALPA', N'0801-1960-02319')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (118, N'Baca Perez Adislao', CAST(N'1975-10-06' AS Date), N'TEGUCIGALPA', N'0611-1958-00071')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (119, N'Baez Carazo Carlos Alfredo', CAST(N'1976-11-07' AS Date), N'TEGUCIGALPA', N'0801-1971-12065')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (120, N'Baez Aquirre Karla Victoria', CAST(N'1977-12-08' AS Date), N'TEGUCIGALPA', N'0801-1979-01044')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (121, N'Bascha Pinel Suyapa Karina', CAST(N'1978-01-09' AS Date), N'TOCOA', N'0209-1973-00180')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (122, N'Baide San Martin Maria Fatima', CAST(N'1979-02-10' AS Date), N'SAN PEDRO SULA', N'0401-1957-00486')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (123, N'Baide Urmeneta Martin', CAST(N'1980-03-11' AS Date), N'TEGUCIGALPA', N'0801-1944-00139')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (124, N'Banegas Cruz Alfredo', CAST(N'1981-04-12' AS Date), N'TEGUCIGALPA', N'0803-1944-00321')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (125, N'Banegas Mejia Otilio', CAST(N'1982-05-13' AS Date), N'TEGUCIGALPA', N'0501-1942-00890')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (126, N'Banegas Padilla Delmy Anarda', CAST(N'1983-06-14' AS Date), N'TEGUCIGALPA', N'1705-1953-00046')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (127, N'Barahona L. Gustavo Adolfo', CAST(N'1984-07-15' AS Date), N'TEGUCIGALPA', N'0801-1953-01987')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (128, N'Barahona Barahona Nicolas Alfredo', CAST(N'1985-08-16' AS Date), N'YORO', N'0501-1970-00075')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (129, N'Barahona Lizardo Reynaldo', CAST(N'1986-09-17' AS Date), N'TEGUCIGALPA', N'0307-1937-00019')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (130, N'Barahona Matute Mario Fabricio', CAST(N'1987-10-18' AS Date), N'CEIBA', N'0101-1970-01619')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (131, N'Barahona Rodriguez Jose Franklin', CAST(N'1988-11-19' AS Date), N'TEGUCIGALPA', N'0801-1949-00021')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (132, N'Barahona Rodriguez Miriam Suyapa', CAST(N'1989-12-20' AS Date), N'CEIBA', N'0801-1976-03245')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (133, N'Barahona Salgado Marcio Said', CAST(N'1990-01-21' AS Date), N'TEGUCIGALPA', N'0301-1979-01247')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (134, N'Barahona Valle Marco Tulio', CAST(N'1991-02-22' AS Date), N'TEGUCIGALPA', N'0801-1949-02767')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (135, N'Barnica Solorzano Rene', CAST(N'1992-03-23' AS Date), N'TEGUCIGALPA', N'0801-1971-02550')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (136, N'Baron Lupiac Juan F.', CAST(N'1993-04-24' AS Date), N'TEGUCIGALPA', N'0615-1936-00152')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (137, N'Bascha Pinel Suyapa Karina', CAST(N'1994-05-25' AS Date), N'LA CEIBA', N'0209-1973-00184')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (138, N'Baquedano Reyes Marco Antonio', CAST(N'1995-06-26' AS Date), N'TEGUCIGALPA', N'0107-1954-00946')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (139, N'Barrientos Paniagua Juan Carlos', CAST(N'1996-07-27' AS Date), N'TEGUCIGALPA', N'0801-1961-01439')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (140, N'Batres Pineda Marco Antonio', CAST(N'1997-08-28' AS Date), N'TEGUCIGALPA', N'1301-1944-00153')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (141, N'Beall Caballero Allan Julian', CAST(N'1998-09-01' AS Date), N'SAN PEDRO SULA', N'0501-1952-01654')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (142, N'Benavides Paz Juan Angel', CAST(N'1999-10-02' AS Date), N'TEGUCIGALPA', N'0706-1962-00596')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (143, N'Bendeck Bonilla Tito', CAST(N'2000-11-03' AS Date), N'SAN PEDRO SULA', N'1613-1979-00108')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (144, N'Beneditt Lainez Hilda Rosario', CAST(N'2001-12-04' AS Date), N'TEGUCIGALPA', N'0601-1953-00841')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (145, N'Bennett Connor Patrick James', CAST(N'2002-01-05' AS Date), N'CEIBA', N'0101-1968-01508')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (146, N'Blanco Luque Lourdes Pamela', CAST(N'2003-02-06' AS Date), N'SAN PEDRO SULA', N'0501-1961-04441')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (147, N'Blanco Merlo Isaac', CAST(N'2004-03-07' AS Date), N'S P S', N'1703-1983-00014')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (148, N'Bocanegra Aleman Lis Maria', CAST(N'2005-04-08' AS Date), N'TEGUCIGALPA', N'0801-1974-03978')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (149, N'Bocanegra Deras Francisco Alberto', CAST(N'2006-05-09' AS Date), N'OCOTEPEQUE', N'0401-1981-02601')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (150, N'Bocanegra Padilla Dayani Ivette', CAST(N'2007-06-10' AS Date), N'TEGUCIGALPA', N'1401-1981-01715')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (151, N'Boesch Molina Otto Armando', CAST(N'2008-07-11' AS Date), N'YORO', N'0804-1965-02724')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (152, N'Bogran Guillen Norberto Napoleon', CAST(N'2009-08-12' AS Date), N'TEGUCIGALPA', N'0801-1975-03835')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (153, N'Bogran Idiaquez Roberto', CAST(N'2010-09-13' AS Date), N'TEGUCIGALPA', N'0801-1945-01750')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (154, N'Bogran Rivera Jorge', CAST(N'2011-10-14' AS Date), N'TEGUCIGALPA', N'0511-1952-00102')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (155, N'Bogran Zelaya Maria Teresa', CAST(N'2012-11-15' AS Date), N'SAN PEDRO SULA', N'0801-1951-04538')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (156, N'Bonilla Andino Douglas Josue', CAST(N'2013-12-16' AS Date), N'TEGUCIGALPA', N'0801-1972-02912')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (157, N'Bonilla Bardales Zoila Argentina', CAST(N'2014-01-17' AS Date), N'TEGUCIGALPA', N'0310-1952-00003')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (158, N'Bonilla Mejia Melvin Edgardo', CAST(N'2015-02-18' AS Date), N'TEGUCIGALPA', N'0501-1973-02666')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (159, N'Bonilla Euceda Teodoro', CAST(N'2016-03-19' AS Date), N'TEGUCIGALPA', N'1701-1970-01183')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (160, N'Bonilla Galindo Rosa Helena', CAST(N'2017-04-20' AS Date), N'TEGUCIGALPA', N'0801-1965-05358')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (161, N'Bonilla Gonzalez Miguel Angel', CAST(N'2018-05-21' AS Date), N'TEGUCIGALPA', N'0801-1965-01410')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (162, N'Bonilla Juan Francisco', CAST(N'2019-06-22' AS Date), N'TEGUCIGALPA', N'0701-1944-00120')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (163, N'Bonilla Lujan Miguel Angel', CAST(N'2020-07-23' AS Date), N'SAN PEDRO SULA', N'1803-1951-00088')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (164, N'Bonilla Solorzano Gloria Marina', CAST(N'2021-08-24' AS Date), N'TEGUCIGALPA', N'0801-1975-23573')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (165, N'Boquin Hernandez Mario E.', CAST(N'1940-09-25' AS Date), N'TEGUCIGALPA', N'0506-1957-01147')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (166, N'Bodden Jose Walter', CAST(N'1941-10-26' AS Date), N'TEGUCIGALPA', N'0801-1966-01755')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (167, N'Bouloy C. Walton Rolando', CAST(N'1942-11-27' AS Date), N'SAN PEDRO SULA', N'0107-1952-01246')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (168, N'Bracamonte Rivas Teodoro', CAST(N'1943-12-28' AS Date), N'TEGUCIGALPA', N'1703-1984-00509')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (169, N'Briceno Jose Efrain', CAST(N'1944-01-01' AS Date), N'TEGUCIGALPA', N'0604-1957-00070')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (170, N'Briceno Carlos Humberto', CAST(N'1945-02-02' AS Date), N'TEGUCIGALPA', N'0604-1950-00049')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (171, N'Bruhl Kalton Harold', CAST(N'1946-03-03' AS Date), N'TEGUCIGALPA', N'0801-1976-11040')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (172, N'Bueso Caballero Ramon Arturo', CAST(N'1947-04-04' AS Date), N'SANTA ROSA', N'0401-1972-00409')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (173, N'Bueso Caballero Hector Guillermo', CAST(N'1948-05-05' AS Date), N'TEGUCIGALPA', N'0401-1973-00704')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (174, N'Bueso Gomez Luque', CAST(N'1949-06-06' AS Date), N'SAN PEDRO SULA', N'3607-1984-00030')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (175, N'Bueso Hernandez Hector Rodolfo', CAST(N'1950-07-07' AS Date), N'SAN PEDRO SULA', N'0501-1962-03123')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (176, N'Bueso Hernandez Jorge', CAST(N'1951-08-08' AS Date), N'TEGUCUGALPA', N'0501-1963-07458')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (177, N'Bueso Melghen Oscar Orlando', CAST(N'1952-09-09' AS Date), N'LA ESPERANZA', N'1001-1951-00096')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (178, N'Bueso P. Carlos Enrique', CAST(N'1953-10-10' AS Date), N'SAN PEDRO SULA', N'0401-1951-00613')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (179, N'Bulnes de Kurwahn Marina', CAST(N'1954-11-11' AS Date), N'TEGUCIGLPA', N'0301-1941-00156')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (180, N'Bulnes Acosta Maria Teresa', CAST(N'1955-12-12' AS Date), N'TEGUCIGALPA', N'1518-1945-00009')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (181, N'Burgos Cordova Jorge Alberto', CAST(N'1956-01-13' AS Date), N'TEGUCIGALPA', N'0801-1960-04081')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (182, N'Burgos Molina Jorge Alberto', CAST(N'1957-02-14' AS Date), N'TEGUCIGALPA', N'0801-1937-00844')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (183, N'Bustillo M. Reina Marina', CAST(N'1958-03-15' AS Date), N'JUTICALPA', N'0801-1960-03068')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (184, N'Bustillo Martinez Gaudy Alejandra', CAST(N'1959-04-16' AS Date), N'TEGUCIGALPA', N'1401-1976-00148')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (185, N'Bustillo Hernandez Isbela', CAST(N'1960-05-17' AS Date), N'TEGUCIGALPA', N'1207-1982-00086')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (186, N'Bustillo Murcia Manfredo Geovanni', CAST(N'1961-06-18' AS Date), N'TEGUCIGALPA', N'0801-1956-06138')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (187, N'Bustillo Palma Gustavo Enrique', CAST(N'1962-07-19' AS Date), N'LA CEIBA', N'0801-1958-06464')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (188, N'Bustillo Romero Rafael', CAST(N'1963-08-20' AS Date), N'COMAYAGUA', N'0301-1969-00089')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (189, N'Bustillo Rosales Mario', CAST(N'1964-09-21' AS Date), N'TEGUCIGALPA', N'0801-1918-00035')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (190, N'Bustillo Zelaya Stephani Claudett', CAST(N'1965-10-22' AS Date), N'TEGUCIGALPA', N'0801-1985-10650')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (191, N'Bustillo Vasquez Daniel Adan', CAST(N'1966-11-23' AS Date), N'CHOLUTECA', N'0604-1943-00041')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (192, N'Caballero Castro Guillermo Arturo', CAST(N'1967-12-24' AS Date), N'TEGUCIGALPA', N'0501-1963-01649')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (193, N'Caballero Mejia Luis Octavio', CAST(N'1968-01-25' AS Date), N'TEGUCIGALPA', N'1614-1946-00054')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (194, N'Caballero Carlos Pascual', CAST(N'1969-02-26' AS Date), N'LA PAZ', N'1612-1984-00064')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (195, N'Cabrera Cabrera Emilio', CAST(N'1970-03-27' AS Date), N'TEGUCIGALPA', N'0803-1958-00273')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (196, N'Caceres Andino Sofia Dolores', CAST(N'1971-04-28' AS Date), N'TEGUCIGALPA', N'0801-1964-08957')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (197, N'Caceres Castellanos Edgardo', CAST(N'1972-05-01' AS Date), N'TEGUCIGLAPA', N'0801-1966-10157')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (198, N'Caceres Rojas Rafael', CAST(N'1973-06-02' AS Date), N'PUERTO CORTES', N'0801-1930-01008')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (199, N'Calderon Yoleth Emelina', CAST(N'1974-07-03' AS Date), N'TEGUCIGALPA', N'1702-1963-00034')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (200, N'Calderon Canales Wilfredo', CAST(N'1975-08-04' AS Date), N'TEGUCIGALPA', N'1808-1958-00033')
GO
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (201, N'Calderon Maldonado Mario Alejandro', CAST(N'1976-09-05' AS Date), N'TEGUCIGALPA', N'1701-1981-01273')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (202, N'Calix Bardales Santos Mauricio', CAST(N'1977-10-06' AS Date), N'LA CEIBA', N'0101-1951-00662')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (203, N'Calix Bonilla Manuel Enrique', CAST(N'1978-11-07' AS Date), N'TEGUCIGALPA', N'0801-1970-02185')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (204, N'Calix Bonilla Jose Fernando', CAST(N'1979-12-08' AS Date), N'TEGUCIGALPA', N'0801-1966-062238')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (205, N'Calix Figueroa Jose Ramon', CAST(N'1980-01-09' AS Date), N'TEGUCIGALPA', N'1501-1944-00090')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (206, N'Calix Ponce Soraya Carolina', CAST(N'1981-02-10' AS Date), N'TEGUCIGALPA', N'0801-1973-00957')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (207, N'Calix  Hernandez Jacobo Antonio', CAST(N'1982-03-11' AS Date), N'TEGUCIGALPA', N'1301-1970-00447')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (208, N'Calix Hernandez Erika Yolanda', CAST(N'1983-04-12' AS Date), N'TEGUCIGALPA', N'1503-1992-01378')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (209, N'Calix  Molina Marco Antonio', CAST(N'1984-05-13' AS Date), N'TEGUCIGALPA', N'0801-1961-05670')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (210, N'Calix Jose Octavio', CAST(N'1985-06-14' AS Date), N'TEGUCIGALPA', N'0703-1953-00165')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (211, N'Calix Orellana Jorge Alberto', CAST(N'1986-07-15' AS Date), N'GRACIAS', N'0401-1962-00538')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (212, N'Calix Rodriguez Marco Antonio', CAST(N'1987-08-16' AS Date), N'TEGUCIGALPA', N'0801-1939-01399')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (213, N'Calix Urtecho Carlos Roberto', CAST(N'1988-09-17' AS Date), N'CATACAMAS', N'1503-1947-00092')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (214, N'Calix Vallecillo Carlos David', CAST(N'1989-10-18' AS Date), N'TEGUCIGALPA', N'0703-1968-00250')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (215, N'Callejas Weitaver Raul', CAST(N'1990-11-19' AS Date), N'TEGUCIGALPA', N'0801-1947-03148')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (216, N'Callizo Molina Marco Tulio', CAST(N'1991-12-20' AS Date), N'TEGUCIGALPA', N'0501-1941-00599')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (217, N'Cambar Palada Yolany Isabel.', CAST(N'1992-01-21' AS Date), N'TEGUCIGALPA', N'0801-1967-09521')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (218, N'Campos Acosta Jessica Maria', CAST(N'1993-02-22' AS Date), N'TEGUCIGALPA', N'0801-1976-11811')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (219, N'Campos Aguilar Victor Manuel', CAST(N'1994-03-23' AS Date), N'TEGUCIGALPA', N'0801-1961-08218')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (220, N'Campos Aplinio', CAST(N'1995-04-24' AS Date), N'LA LIMA', N'0702-1958-00062')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (221, N'Canales Carias Alberto', CAST(N'1996-05-25' AS Date), N'SAN PEDRO SULA', N'1701-1947-00064')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (222, N'Canales Girbal Jose Manuel', CAST(N'1997-06-26' AS Date), N'TEGUCIGALPA', N'0801-1958-05926')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (223, N'Canizales Nadia Celina', CAST(N'1998-07-27' AS Date), N'TEGUCIGALPA', N'0506-1966-00184')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (224, N'Cantarero Claudina Cecilia', CAST(N'1999-08-28' AS Date), N'TEGUCIGALPA', N'1315-1955-00060')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (225, N'Cantarero Bonilla Jose Dolores', CAST(N'2000-09-01' AS Date), N'TEGUCIGALPA', N'0301-1975-01692')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (226, N'Cantarero Jesus Adolfo', CAST(N'2001-10-02' AS Date), N'TEGUCIGALPA', N'0801-1936-00578')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (227, N'Carvajal Rivas Laureano', CAST(N'2002-11-03' AS Date), N'TEGUCIGALPA', N'0501-1950-00809')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (228, N'Caramo Tercero Orlando E.', CAST(N'2003-12-04' AS Date), N'TEGUCIGALPA', N'0615-1934-00147')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (229, N'Cardona Arguelles Jose Francisco', CAST(N'2004-01-05' AS Date), N'TEGUCIGALPA', N'1501-1947-00259')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (230, N'Cardona Laitano Rigoberto', CAST(N'2005-02-06' AS Date), N'TEGUCIGALPA', N'0801-1946-03492')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (231, N'Cardona Padilla Lidia Estela', CAST(N'2006-03-07' AS Date), N'TEGUCIGALPA', N'1508-1947-00053')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (232, N'Cardona Valle Ricardo Guillermo', CAST(N'2007-04-08' AS Date), N'OCOTEPEQUE', N'1401-1970-00161')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (233, N'Cardona Figueroa Jose Manuel', CAST(N'2008-05-09' AS Date), N'TEGUCIGALPA', N'0101-1966-00025')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (234, N'Cardona Rivera Miguel Angel', CAST(N'2009-06-10' AS Date), N'TEGUCIGALPA', N'1601-1969-00353')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (235, N'Cardenas Ardon Henry Mauricio', CAST(N'2010-07-11' AS Date), N'TEGUCIGALPA', N'0801-1974-00189')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (236, N'Carias Guszaine Suyapa de J', CAST(N'2011-08-12' AS Date), N'TEGUCIGALPA', N'0801-1962-09448')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (237, N'Carias Garcia Ada Leticia', CAST(N'2012-09-13' AS Date), N'TEGUCIGALPA', N'1501-1965-00505')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (238, N'Carranza Polanco Alex Javier', CAST(N'2013-10-14' AS Date), N'TEGUCIGALPA', N'1415-1966-00052')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (239, N'Carrasco Castro Ernesto Alfonso', CAST(N'2014-11-15' AS Date), N'TEGUCIGALPA', N'0801-1977-07062')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (240, N'Carvajal Manuel de Jesus', CAST(N'2015-12-16' AS Date), N'TEGUCIGALPA', N'0611-1972-00867')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (241, N'Carvajal Santos Gabino', CAST(N'2016-01-17' AS Date), N'TEGUCIGALPA', N'0611-1984-03344')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (242, N'Carvajal Velasquez Leslie', CAST(N'2017-02-18' AS Date), N'SAN PEDRO SULA', N'1804-1956-00216')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (243, N'Casco Fortin Leonardo', CAST(N'2018-03-19' AS Date), N'TEGUCIGALPA', N'0801-1948-03376')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (244, N'Casco Gomez Santos Reinaldo', CAST(N'2019-04-20' AS Date), N'SAN PEDRO SULA', N'0714-1949-00106')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (245, N'Casco Zelaya Jorge Omar', CAST(N'2020-05-21' AS Date), N'TEGUCIGALPA', N'0107-1951-00501')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (246, N'Castaneda Lainez Reina Gladis', CAST(N'2021-06-22' AS Date), N'SIGUATEPEQUE', N'0318-1946-00488')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (247, N'Castellanos Juan Wilfredo', CAST(N'1940-07-23' AS Date), N'TEGUCIGALPA', N'1606-1971-00131')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (248, N'Castellanos A. Mario Rolando', CAST(N'1941-08-24' AS Date), N'SAN PEDRO SULA', N'1608-1939-00056')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (249, N'Castellanos de Rivera Salome', CAST(N'1942-09-25' AS Date), N'TEGUCIGALPA', N'0301-1942-00234')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (250, N'Castillo Escoto Polivio Parminides', CAST(N'1943-10-26' AS Date), N'TEGUCIGALPA', N'0801-1972-04357')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (251, N'Castillo G. Miguel Antonio', CAST(N'1944-11-27' AS Date), N'TEGUCIGALPA', N'0703-1959-00977')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (252, N'Castillo Ochoa Ruben Emilio', CAST(N'1945-12-28' AS Date), N'TEGUCIGALPA', N'1211-1949-00017')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (253, N'Castillo Padilla Gabriel', CAST(N'1946-01-01' AS Date), N'TEGUCIGALPA', N'0309-1950-00052')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (254, N'Castillo Santos Marco Tulio', CAST(N'1947-02-02' AS Date), N'TRUJILLO', N'0201-1943-00062')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (255, N'Castro Alonso Cristiam Tomas', CAST(N'1948-03-03' AS Date), N'TEGUCIGALPA', N'0801-1962-00219')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (256, N'Castro Canales Marco Tulio', CAST(N'1949-04-04' AS Date), N'TEGUCIGALPA', N'0807-1948-00346')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (257, N'Castro Alvarado Gloria Argentina', CAST(N'1950-05-05' AS Date), N'TEGUCIGALPA', N'1701-1984-02184')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (258, N'Castro de Gallardo Norma E.', CAST(N'1951-06-06' AS Date), N'SAN PEDRO SULA', N'0401-1941-00876')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (259, N'Castro Fiallos Abraham', CAST(N'1952-07-07' AS Date), N'TEGUCIGALPA', N'0801-1943-00701')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (260, N'Castro Hernandez Marco Aurelio', CAST(N'1953-08-08' AS Date), N'TEGUCIGALPA', N'1701-1985-02100')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (261, N'Castro Mendoza Maria Fernanda', CAST(N'1954-09-09' AS Date), N'TEGUCIGALPA', N'0801-1973-06728')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (262, N'Castro Mendoza Maria Jose', CAST(N'1955-10-10' AS Date), N'TEGUCIGALPA', N'0801-1985-17857')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (263, N'Castro Marquez Eva Fabiola', CAST(N'1956-11-11' AS Date), N'TEGUCIGALPA', N'0801-1973-04527')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (264, N'Castro Martinez Carlos A.', CAST(N'1957-12-12' AS Date), N'TEGUCIGALPA', N'0804-1941-00515')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (265, N'Castro Mejia Rosa Maria', CAST(N'1958-01-13' AS Date), N'TEGUCIGALPA', N'0801-1968-06260')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (266, N'Castro O. Jose Alejandrino', CAST(N'1959-02-14' AS Date), N'TEGUCIGALPA', N'0613-1964-00065')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (267, N'Castro Parada Allan Wady', CAST(N'1960-03-15' AS Date), N'TEGUCIGALPA', N'0801-1979-08874')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (268, N'Castro Rivera Jose Manuel', CAST(N'1961-04-16' AS Date), N'TEGUCIGALPA', N'0506-1952-00621')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (269, N'Castro Rivera Nestor Armando', CAST(N'1962-05-17' AS Date), N'TEGUCIGALPA', N'0703-1931-00302')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (270, N'Castro Roque Martha', CAST(N'1963-06-18' AS Date), N'TEGUCIGALPA', N'0801-1934-00104')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (271, N'Cayetano Bernardez Jose Antonio', CAST(N'1964-07-19' AS Date), N'TEGUCIGALPA', N'0206-1959-00085')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (272, N'Cedeno Pineda Julia Concepcion', CAST(N'1965-08-20' AS Date), N'LA CEIBA', N'0101-1963-00017')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (273, N'Cerna Garcia Omar', CAST(N'1966-09-21' AS Date), N'JUTICALPA', N'3501-1984-00003')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (274, N'Cerna Cardona Eley Franett', CAST(N'1967-10-22' AS Date), N'SIGUATEPEQUE', N'0318-1969-00370')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (275, N'Cerna Paz Norma', CAST(N'1968-11-23' AS Date), N'TEGUCIGALPA', N'0501-1960-00540')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (276, N'Cerrato Chinchilla Celeste Aida', CAST(N'1969-12-24' AS Date), N'GRACIAS', N'0801-1969-03083')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (277, N'Cerrato Funez Jesus Alonso', CAST(N'1970-01-25' AS Date), N'NACAOME', N'1701-1973-00990')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (278, N'Cerrato V. Fredis Alonso', CAST(N'1971-02-26' AS Date), N'TEGUCIGALPA', N'0706-1960-00054')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (279, N'Cerrato Sampson Francisco Javier', CAST(N'1972-03-27' AS Date), N'LA CEIBA', N'0101-1964-01967')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (280, N'Cerritos Olivera Ramon Ines', CAST(N'1973-04-28' AS Date), N'TEGUCIGALPA', N'1807-1941-00138')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (281, N'Chacon Ferrufino Reinaldo', CAST(N'1974-05-01' AS Date), N'DANLI', N'0702-1955-00095')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (282, N'Chacon Pacheco Jorge Orlando', CAST(N'1975-06-02' AS Date), N'OCOTEPEQUE', N'1401-1981-01856')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (283, N'Chang Castillo Rigoberto', CAST(N'1976-07-03' AS Date), N'TEGUCIGALPA', N'0801-1974-12927')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (284, N'Chang Carias Catherine Yamileth', CAST(N'1977-08-04' AS Date), N'TEGUCIGALPA', N'0801-1984-12294')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (285, N'Chang Vides Alejandra Maria de D.', CAST(N'1978-09-05' AS Date), N'TEGUCIGALPA', N'0801-1979-08985')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (286, N'Chavarria de Maria Elly', CAST(N'1979-10-06' AS Date), N'SAN PEDRO SULA', N'0801-1965-04197')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (287, N'Chavarria Sierra Jose Arturo', CAST(N'1980-11-07' AS Date), N'TEGUCIGALPA', N'0801-1931-01089')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (288, N'Chavarria de Monrroy Selma', CAST(N'1981-12-08' AS Date), N'TEGUCIGALPA', N'0801-1947-03714')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (289, N'Chavez Madison David Guillermo', CAST(N'1982-01-09' AS Date), N'TEGUCIGALPA', N'0801-1972-07274')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (290, N'Chavez Romero Felix Alberto', CAST(N'1983-02-10' AS Date), N'TOCOA', N'0505-1967-00647')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (291, N'Chavez Jaime Rene', CAST(N'1984-03-11' AS Date), N'TEGUCIGALPA', N'1001-1959-00051')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (292, N'Chinchilla  Rodriguez Martha Elena', CAST(N'1985-04-12' AS Date), N'SAN PEDRO SULA', N'0301-1958-00984')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (293, N'Chinchilla Banegas Oscar Fernando', CAST(N'1986-05-13' AS Date), N'SANTA ROSA', N'0401-1972-00088')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (294, N'Chinchilla Chinchilla Ana Lourdes', CAST(N'1987-06-14' AS Date), N'OCOTEPEQUE', N'1401-1979-00344')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (295, N'Chinchilla Collart Blanca Lidia', CAST(N'1988-07-15' AS Date), N'TEGUCIGALPA', N'0419-1942-00009')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (296, N'Chinchilla Mejia Carlos Roberto', CAST(N'1989-08-16' AS Date), N'LA CEIBA', N'0107-1971-00339')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (297, N'Chinchilla Mejia Eduardo Antonio', CAST(N'1990-09-17' AS Date), N'TEGUCIGALPA', N'1401-1983-00170')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (298, N'Chinchilla Rodriguez Jorge Luis', CAST(N'1991-10-18' AS Date), N'CORTES', N'0301-1956-00072')
INSERT [dbo].[Clientes] ([IdCliente], [Cliente], [FechaNacimiento], [Procedencia], [Identidad]) VALUES (299, N'Chirinos Orellana Yimy Daniel', CAST(N'1992-11-19' AS Date), N'ROATAN', N'0801-1981-05746')
GO
SET IDENTITY_INSERT [dbo].[ComentariosFarmacia] ON 

INSERT [dbo].[ComentariosFarmacia] ([IdComentarioFarmacia], [idFarmacia], [Comentarios], [PlanDeAccion]) VALUES (1, 3, N'Cliente comento efecto adversos graves', N'hacer estudio en cuanto a medicamento')
INSERT [dbo].[ComentariosFarmacia] ([IdComentarioFarmacia], [idFarmacia], [Comentarios], [PlanDeAccion]) VALUES (12, 3, N'Medicina demasiado cara', N'Buscar consultar otro proveedor')
INSERT [dbo].[ComentariosFarmacia] ([IdComentarioFarmacia], [idFarmacia], [Comentarios], [PlanDeAccion]) VALUES (14, 4, N'Cliente le dieron dosis incorrecta ', N'mejorar procedimiento')
INSERT [dbo].[ComentariosFarmacia] ([IdComentarioFarmacia], [idFarmacia], [Comentarios], [PlanDeAccion]) VALUES (15, 20, N'No se encontro existencia en farmacia', NULL)
INSERT [dbo].[ComentariosFarmacia] ([IdComentarioFarmacia], [idFarmacia], [Comentarios], [PlanDeAccion]) VALUES (18, 30, N'Precio no es el mismo que mencionado en pagina', N'actualizar website')
INSERT [dbo].[ComentariosFarmacia] ([IdComentarioFarmacia], [idFarmacia], [Comentarios], [PlanDeAccion]) VALUES (1018, 31, N'Precio Alto', N'Hacer Descuento')
INSERT [dbo].[ComentariosFarmacia] ([IdComentarioFarmacia], [idFarmacia], [Comentarios], [PlanDeAccion]) VALUES (1019, 32, N'Entrega Tardia', N'Mejorar las entregas')
INSERT [dbo].[ComentariosFarmacia] ([IdComentarioFarmacia], [idFarmacia], [Comentarios], [PlanDeAccion]) VALUES (1020, 33, N'Muy bien la Atencion', N'Seguir asi')
INSERT [dbo].[ComentariosFarmacia] ([IdComentarioFarmacia], [idFarmacia], [Comentarios], [PlanDeAccion]) VALUES (1021, 34, N'Agregar mas Medicamentos', N'Aumento de Productos')
INSERT [dbo].[ComentariosFarmacia] ([IdComentarioFarmacia], [idFarmacia], [Comentarios], [PlanDeAccion]) VALUES (1022, 35, N'Buen precio', N'Que se mantenga')
INSERT [dbo].[ComentariosFarmacia] ([IdComentarioFarmacia], [idFarmacia], [Comentarios], [PlanDeAccion]) VALUES (1023, 36, N'Precio Alto', N'Hacer Descuento')
SET IDENTITY_INSERT [dbo].[ComentariosFarmacia] OFF
GO
INSERT [dbo].[DirectorioMedico] ([IdDoctor], [NombreDoctor], [Especialidad], [ClinicaAsignada]) VALUES (1, N'Dr. Daniel Simon', N'Medicina Interna', N'8C')
INSERT [dbo].[DirectorioMedico] ([IdDoctor], [NombreDoctor], [Especialidad], [ClinicaAsignada]) VALUES (2, N'Dr. Carlos Gallegos', N'Medicina Interna', N'8D')
INSERT [dbo].[DirectorioMedico] ([IdDoctor], [NombreDoctor], [Especialidad], [ClinicaAsignada]) VALUES (3, N'Dr. Sergio Velez', N'Pediatria', N'13B')
INSERT [dbo].[DirectorioMedico] ([IdDoctor], [NombreDoctor], [Especialidad], [ClinicaAsignada]) VALUES (4, N'Dr. Juan Diaz Singuense', N'Ginecologia y Obstetricia', N'6C')
INSERT [dbo].[DirectorioMedico] ([IdDoctor], [NombreDoctor], [Especialidad], [ClinicaAsignada]) VALUES (5, N'Dra. Lucia de Mancia', N'Ginecologia y Obstetricia', N'6D')
INSERT [dbo].[DirectorioMedico] ([IdDoctor], [NombreDoctor], [Especialidad], [ClinicaAsignada]) VALUES (6, N'Dr. Gustavo Castaneda', N'Ortopedia y Traumatolog�a', N'11B')
INSERT [dbo].[DirectorioMedico] ([IdDoctor], [NombreDoctor], [Especialidad], [ClinicaAsignada]) VALUES (7, N'Dr. Hermelindo Umanzor', N'Ortopedia y Traumatolog�a', N'11C')
INSERT [dbo].[DirectorioMedico] ([IdDoctor], [NombreDoctor], [Especialidad], [ClinicaAsignada]) VALUES (8, N'Dr.Francisco Octavio Giron', N'Reumatologia', N'14B')
INSERT [dbo].[DirectorioMedico] ([IdDoctor], [NombreDoctor], [Especialidad], [ClinicaAsignada]) VALUES (9, N'Dra. Carla Carcamo', N'Otorrinolaringologia', N'12B')
INSERT [dbo].[DirectorioMedico] ([IdDoctor], [NombreDoctor], [Especialidad], [ClinicaAsignada]) VALUES (10, N'Dr. Carlos Oqueli', N'Urologia', N'14C')
INSERT [dbo].[DirectorioMedico] ([IdDoctor], [NombreDoctor], [Especialidad], [ClinicaAsignada]) VALUES (11, N'Dr. Miguel A. Cardoza', N'Cirugia General', N'3A')
INSERT [dbo].[DirectorioMedico] ([IdDoctor], [NombreDoctor], [Especialidad], [ClinicaAsignada]) VALUES (12, N'Dr. Gustavo Zuniga', N'Gastroenterologia', N'5B')
INSERT [dbo].[DirectorioMedico] ([IdDoctor], [NombreDoctor], [Especialidad], [ClinicaAsignada]) VALUES (13, N'Dr. Victor Ramirez', N'Dermatologia', N'4C')
INSERT [dbo].[DirectorioMedico] ([IdDoctor], [NombreDoctor], [Especialidad], [ClinicaAsignada]) VALUES (14, N'Dr. Emec Cherenfant', N'Cirugia Plastica y Reconstructiva', N'3C')
INSERT [dbo].[DirectorioMedico] ([IdDoctor], [NombreDoctor], [Especialidad], [ClinicaAsignada]) VALUES (15, N'Dr. Jose M. Matheu', N'Medicina Fisica y Rehabilitacion', N'8B')
INSERT [dbo].[DirectorioMedico] ([IdDoctor], [NombreDoctor], [Especialidad], [ClinicaAsignada]) VALUES (16, N'Dr.Carlos Caraccioli', N'Oftalmologia', N'10A')
INSERT [dbo].[DirectorioMedico] ([IdDoctor], [NombreDoctor], [Especialidad], [ClinicaAsignada]) VALUES (17, N'Dr.Ricardo Toro', N'Oftalmologia', N'10B')
INSERT [dbo].[DirectorioMedico] ([IdDoctor], [NombreDoctor], [Especialidad], [ClinicaAsignada]) VALUES (18, N'Dr. Jose Castro Alonzo', N'Foniatra', N'5A')
INSERT [dbo].[DirectorioMedico] ([IdDoctor], [NombreDoctor], [Especialidad], [ClinicaAsignada]) VALUES (19, N'Ramon Funez', N'Cardiologos intervencionista', N'2B')
INSERT [dbo].[DirectorioMedico] ([IdDoctor], [NombreDoctor], [Especialidad], [ClinicaAsignada]) VALUES (20, N'Jorge Barrientos', N'Cardiologos intervencionista', N'2C')
INSERT [dbo].[DirectorioMedico] ([IdDoctor], [NombreDoctor], [Especialidad], [ClinicaAsignada]) VALUES (21, N'Jesus Adelmo Arita', N'Cirujanos', N'3L')
INSERT [dbo].[DirectorioMedico] ([IdDoctor], [NombreDoctor], [Especialidad], [ClinicaAsignada]) VALUES (22, N'Lazaro Bustillo', N'Cirujanos', N'3M')
INSERT [dbo].[DirectorioMedico] ([IdDoctor], [NombreDoctor], [Especialidad], [ClinicaAsignada]) VALUES (23, N'Anny Landa', N'Dermatologa', N'4A')
INSERT [dbo].[DirectorioMedico] ([IdDoctor], [NombreDoctor], [Especialidad], [ClinicaAsignada]) VALUES (24, N'Kathia Chinchilla', N'Dermatologa / Patologa', N'4B')
INSERT [dbo].[DirectorioMedico] ([IdDoctor], [NombreDoctor], [Especialidad], [ClinicaAsignada]) VALUES (25, N'George Fracer', N'Ginecologia', N'6A')
INSERT [dbo].[DirectorioMedico] ([IdDoctor], [NombreDoctor], [Especialidad], [ClinicaAsignada]) VALUES (26, N'Oscar Alberto Guzman', N'Ginecologia', N'6B')
INSERT [dbo].[DirectorioMedico] ([IdDoctor], [NombreDoctor], [Especialidad], [ClinicaAsignada]) VALUES (27, N'Gerardo Paz', N'Internistas', N'7B')
INSERT [dbo].[DirectorioMedico] ([IdDoctor], [NombreDoctor], [Especialidad], [ClinicaAsignada]) VALUES (28, N'Humberto Salomon', N'Internistas', N'7C')
INSERT [dbo].[DirectorioMedico] ([IdDoctor], [NombreDoctor], [Especialidad], [ClinicaAsignada]) VALUES (29, N'Denis Zelaya', N'Internista /intensivista', N'7A')
INSERT [dbo].[DirectorioMedico] ([IdDoctor], [NombreDoctor], [Especialidad], [ClinicaAsignada]) VALUES (30, N'Mario Lanza', N'Neumologo /Internista', N'9B')
INSERT [dbo].[DirectorioMedico] ([IdDoctor], [NombreDoctor], [Especialidad], [ClinicaAsignada]) VALUES (31, N'Carlos Santiago Pastelin', N'Reumatolo /Internista', N'14A')
INSERT [dbo].[DirectorioMedico] ([IdDoctor], [NombreDoctor], [Especialidad], [ClinicaAsignada]) VALUES (32, N'Oswaldo Farjardo', N'Neurocirujano', N'9D')
INSERT [dbo].[DirectorioMedico] ([IdDoctor], [NombreDoctor], [Especialidad], [ClinicaAsignada]) VALUES (33, N'Carlos del Cid', N'Ortopeda', N'11A')
INSERT [dbo].[DirectorioMedico] ([IdDoctor], [NombreDoctor], [Especialidad], [ClinicaAsignada]) VALUES (34, N'Jose Ramon Henriquez', N'Otorrino', N'12A')
INSERT [dbo].[DirectorioMedico] ([IdDoctor], [NombreDoctor], [Especialidad], [ClinicaAsignada]) VALUES (35, N'Jose Francisco Aguilar', N'Pediatra', N'13A')
INSERT [dbo].[DirectorioMedico] ([IdDoctor], [NombreDoctor], [Especialidad], [ClinicaAsignada]) VALUES (36, N'Jose Elias Mendoza', N'Urologo', N'14E')
INSERT [dbo].[DirectorioMedico] ([IdDoctor], [NombreDoctor], [Especialidad], [ClinicaAsignada]) VALUES (37, N'Arleth Dacosta', N'Cirujano Vascular', N'3K')
INSERT [dbo].[DirectorioMedico] ([IdDoctor], [NombreDoctor], [Especialidad], [ClinicaAsignada]) VALUES (38, N'Emec Cherefant', N'Cirujano Plastico y Maxilofacial', N'3J')
INSERT [dbo].[DirectorioMedico] ([IdDoctor], [NombreDoctor], [Especialidad], [ClinicaAsignada]) VALUES (39, N'Geovanny Portillo', N'Cirujano Pediatra', N'3H')
INSERT [dbo].[DirectorioMedico] ([IdDoctor], [NombreDoctor], [Especialidad], [ClinicaAsignada]) VALUES (40, N'Dr. Gerson Fu', N'Ginecologia y Obstetricia', N'6E')
INSERT [dbo].[DirectorioMedico] ([IdDoctor], [NombreDoctor], [Especialidad], [ClinicaAsignada]) VALUES (41, N'Dr. George Frazer', N'Ginecologia y Obstetricia', N'6F')
INSERT [dbo].[DirectorioMedico] ([IdDoctor], [NombreDoctor], [Especialidad], [ClinicaAsignada]) VALUES (42, N'Dr. Ferrufino', N'Ortopedia y Traumatologia', N'11D')
INSERT [dbo].[DirectorioMedico] ([IdDoctor], [NombreDoctor], [Especialidad], [ClinicaAsignada]) VALUES (43, N'Dr. Horacio Ortega', N'Ortopedia y Traumatologia', N'11E')
INSERT [dbo].[DirectorioMedico] ([IdDoctor], [NombreDoctor], [Especialidad], [ClinicaAsignada]) VALUES (44, N'Dr. Luis Enrique Rivera', N'Neurocirujano', N'9E')
INSERT [dbo].[DirectorioMedico] ([IdDoctor], [NombreDoctor], [Especialidad], [ClinicaAsignada]) VALUES (45, N'Dr. Javier Sanchez', N'Neurocirujano', N'9F')
INSERT [dbo].[DirectorioMedico] ([IdDoctor], [NombreDoctor], [Especialidad], [ClinicaAsignada]) VALUES (46, N'Dr, Hector Ruiz', N'Urologia', N'14D')
INSERT [dbo].[DirectorioMedico] ([IdDoctor], [NombreDoctor], [Especialidad], [ClinicaAsignada]) VALUES (47, N'Dr. Emec Cherefant', N'Cirujano Plastico', N'3I')
INSERT [dbo].[DirectorioMedico] ([IdDoctor], [NombreDoctor], [Especialidad], [ClinicaAsignada]) VALUES (48, N'Dr. Adelmo Arita', N'Cirujano General', N'3E')
INSERT [dbo].[DirectorioMedico] ([IdDoctor], [NombreDoctor], [Especialidad], [ClinicaAsignada]) VALUES (49, N'Dr. Lazaro Pompilio Bustillo', N'Cirujano General', N'3F')
INSERT [dbo].[DirectorioMedico] ([IdDoctor], [NombreDoctor], [Especialidad], [ClinicaAsignada]) VALUES (50, N'Dra. Arleth Dacosta', N'Cirujano Cardiovascular', N'3D')
INSERT [dbo].[DirectorioMedico] ([IdDoctor], [NombreDoctor], [Especialidad], [ClinicaAsignada]) VALUES (51, N'Dr. Raul Lopez', N'Cirujano Oncologo', N'3G')
INSERT [dbo].[DirectorioMedico] ([IdDoctor], [NombreDoctor], [Especialidad], [ClinicaAsignada]) VALUES (52, N'Dr. Alex Medina', N'Neurologo', N'9G')
INSERT [dbo].[DirectorioMedico] ([IdDoctor], [NombreDoctor], [Especialidad], [ClinicaAsignada]) VALUES (53, N'Dr. Francisco Ramirez', N'Neurologo Pediatra', N'9H')
INSERT [dbo].[DirectorioMedico] ([IdDoctor], [NombreDoctor], [Especialidad], [ClinicaAsignada]) VALUES (54, N'Dra. Sheyla Licona', N'Pediatria', N'13C')
INSERT [dbo].[DirectorioMedico] ([IdDoctor], [NombreDoctor], [Especialidad], [ClinicaAsignada]) VALUES (55, N'Dra Kathya Chinchilla', N'Dermatologia', N'4D')
INSERT [dbo].[DirectorioMedico] ([IdDoctor], [NombreDoctor], [Especialidad], [ClinicaAsignada]) VALUES (56, N'Dra. Anany Alejandra Aguilar', N'Dermatologia', N'4E')
INSERT [dbo].[DirectorioMedico] ([IdDoctor], [NombreDoctor], [Especialidad], [ClinicaAsignada]) VALUES (57, N'Dr. Denis Zelaya', N'Medicina Interna', N'8F')
INSERT [dbo].[DirectorioMedico] ([IdDoctor], [NombreDoctor], [Especialidad], [ClinicaAsignada]) VALUES (58, N'Dr. Jose Rolando Diaz Romero', N'Anestesiologo', N'1A')
INSERT [dbo].[DirectorioMedico] ([IdDoctor], [NombreDoctor], [Especialidad], [ClinicaAsignada]) VALUES (59, N'Dr. Rigoberto Iraheta Reyes', N'Anestesiologo', N'1B')
INSERT [dbo].[DirectorioMedico] ([IdDoctor], [NombreDoctor], [Especialidad], [ClinicaAsignada]) VALUES (60, N'Dr. Juan Pablo Soto  Quezada', N'Angiologia', N'1C')
INSERT [dbo].[DirectorioMedico] ([IdDoctor], [NombreDoctor], [Especialidad], [ClinicaAsignada]) VALUES (61, N'Dr. Marcelino  Eduardo Abadie Guillen', N'Angiologia', N'2A')
INSERT [dbo].[DirectorioMedico] ([IdDoctor], [NombreDoctor], [Especialidad], [ClinicaAsignada]) VALUES (62, N'Dr. Ricardo Adolfo Perez', N'Cirugia General', N'3B')
INSERT [dbo].[DirectorioMedico] ([IdDoctor], [NombreDoctor], [Especialidad], [ClinicaAsignada]) VALUES (63, N'Dr. Gonzalo Mauricio Pineda Silva', N'Medicina Familiar', N'8A')
INSERT [dbo].[DirectorioMedico] ([IdDoctor], [NombreDoctor], [Especialidad], [ClinicaAsignada]) VALUES (64, N'Dr. Gil Marcelino Vasquez Barahona', N'Medicina Interna e Intensiva', N'8G')
INSERT [dbo].[DirectorioMedico] ([IdDoctor], [NombreDoctor], [Especialidad], [ClinicaAsignada]) VALUES (65, N'Dr. ?ngel Federico Velasquez Castillo', N'Neurocirugia', N'9C')
INSERT [dbo].[DirectorioMedico] ([IdDoctor], [NombreDoctor], [Especialidad], [ClinicaAsignada]) VALUES (66, N'Dr. Arturo Avila Guzman', N'Nefrologia', N'9A')
INSERT [dbo].[DirectorioMedico] ([IdDoctor], [NombreDoctor], [Especialidad], [ClinicaAsignada]) VALUES (67, N'Dr. Jose Francisco Lopez Borjas', N'Otorrinolaringologia', N'12C')
GO
SET IDENTITY_INSERT [dbo].[Farmacia] ON 

INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (3, 672905, N'AAS                                             ', N'500 MG 20 COMPRIMIDOS                           ', N'SANOFI AVENTIS S.A.                               ', CAST(1.36 AS Numeric(10, 2)), CAST(0.15 AS Numeric(10, 2)))
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (4, 700021, N'AAS                                             ', N'500 MG 20 COMPRIMIDOS                           ', N'SANOFI AVENTIS S.A.                               ', CAST(1.30 AS Numeric(10, 2)), CAST(0.08 AS Numeric(10, 2)))
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (5, 672685, N'AAS 100                                         ', N'100 MG 20 COMPRIMIDOS                           ', N'SANOFI AVENTIS S.A.                               ', CAST(1.34 AS Numeric(10, 2)), CAST(0.15 AS Numeric(10, 2)))
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (6, 700013, N'AAS 100                                         ', N'100 MG 20 COMPRIMIDOS                           ', N'SANOFI AVENTIS S.A.                               ', CAST(1.12 AS Numeric(10, 2)), CAST(0.08 AS Numeric(10, 2)))
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (7, 656168, N'ABILIFY                                         ', N'7.5 MG/ML 1 VIAL 1.3 ML                         ', N'OTSUKA PHARMACEUTICAL                             ', CAST(5.76 AS Numeric(10, 2)), CAST(0.08 AS Numeric(10, 2)))
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (8, 652738, N'ABILIFY                                         ', N'1 MG/ML SOLUCION ORAL 150 ML                    ', N'OTSUKA PHARMACEUTICAL                             ', CAST(131.13 AS Numeric(10, 2)), CAST(0.08 AS Numeric(10, 2)))
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (9, 728154, N'ABILIFY                                         ', N'5 MG 28 COMPRIMIDOS                             ', N'OTSUKA PHARMACEUTICAL                             ', CAST(132.79 AS Numeric(10, 2)), CAST(0.08 AS Numeric(10, 2)))
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (10, 728196, N'ABILIFY                                         ', N'10 MG 28 COMPRIMIDOS                            ', N'OTSUKA PHARMACEUTICAL                             ', CAST(140.93 AS Numeric(10, 2)), CAST(0.08 AS Numeric(10, 2)))
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (11, 728220, N'ABILIFY                                         ', N'15 MG 28 COMPRIMIDOS                            ', N'OTSUKA PHARMACEUTICAL                             ', CAST(140.93 AS Numeric(10, 2)), CAST(0.08 AS Numeric(10, 2)))
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (12, 651609, N'ABILIFY                                         ', N'15 MG 28 COMPRIMIDOS BUCODISPERSABLES           ', N'OTSUKA PHARMACEUTICAL                             ', CAST(140.93 AS Numeric(10, 2)), CAST(0.08 AS Numeric(10, 2)))
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (13, 651608, N'ABILIFY                                         ', N'10 MG 28 COMPRIMIDOS BUCODISPERSABLES           ', N'OTSUKA PHARMACEUTICAL                             ', CAST(140.93 AS Numeric(10, 2)), CAST(0.08 AS Numeric(10, 2)))
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (14, 651607, N'ABILIFY                                         ', N'5 MG 28 COMPRIMIDOS BUCODISPERSABLES            ', N'BRISTOL MYERS SQUIBB                              ', CAST(132.79 AS Numeric(10, 2)), CAST(0.08 AS Numeric(10, 2)))
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (15, 677331, N'ABRION EFG                                      ', N'150 MG 1 COMPRIMIDO RECUBIERTO                  ', N'CENTRUM                                           ', CAST(20.79 AS Numeric(10, 2)), NULL)
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (16, 677332, N'ABRION EFG                                      ', N'150 MG 3 COMPRIMIDOS RECUBIERTOS                ', N'CENTRUM                                           ', CAST(39.00 AS Numeric(10, 2)), NULL)
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (17, 818872, N'ABSORCOL                                        ', N'10 MG 28 COMPRIMIDOS                            ', N'ROVI                                              ', CAST(51.41 AS Numeric(10, 2)), CAST(0.08 AS Numeric(10, 2)))
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (18, 879155, N'ABSORLENT MATRIX                                ', N'25 MCG/24 H 8 PARCHES TRANSDERMICOS 0.75 MG     ', N'ESTEVE                                            ', CAST(5.57 AS Numeric(10, 2)), CAST(0.08 AS Numeric(10, 2)))
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (19, 985093, N'ABSORLENT MATRIX                                ', N'50 MCG/24 H 8 PARCHES TRANSDERMICOS 1.5 MG      ', N'ESTEVE                                            ', CAST(7.88 AS Numeric(10, 2)), CAST(0.08 AS Numeric(10, 2)))
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (20, 879346, N'ABSORLENT MATRIX                                ', N'100 MCG/24 H 8 PARCHES TRANSDERMICOS 3 MG       ', N'ESTEVE                                            ', CAST(8.68 AS Numeric(10, 2)), CAST(0.08 AS Numeric(10, 2)))
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (21, 679472, N'ABSORLENT PLUS                                  ', N'50/250 MCG/24 H 8 PARCHES TRANSDERMICOS         ', N'ESTEVE                                            ', CAST(8.85 AS Numeric(10, 2)), NULL)
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (22, 662278, N'ABSTRAL                                         ', N'100 MCG 10 COMPRIMIDOS SUBLINGUALES             ', N'PROSTRAKAN FARMACEUTICA, S.L.                     ', CAST(91.79 AS Numeric(10, 2)), CAST(0.08 AS Numeric(10, 2)))
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (23, 662280, N'ABSTRAL                                         ', N'200 MCG 10 COMPRIMIDOS SUBLINGUALES             ', N'PROSTRAKAN FARMACEUTICA, S.L.                     ', CAST(91.79 AS Numeric(10, 2)), CAST(0.08 AS Numeric(10, 2)))
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (24, 662282, N'ABSTRAL                                         ', N'300 MCG 10 COMPRIMIDOS SUBLINGUALES             ', N'PROSTRAKAN FARMACEUTICA, S.L.                     ', CAST(91.79 AS Numeric(10, 2)), CAST(0.08 AS Numeric(10, 2)))
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (25, 670030, N'BISOPROLOL COR SANDOZ EFG                       ', N'5 MG 60 COMPRIMIDOS RECUBIERTOS                 ', N'SANDOZ FARMACEUTICA                               ', CAST(3.29 AS Numeric(10, 2)), NULL)
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (26, 670039, N'BISOPROLOL COR SANDOZ EFG                       ', N'10 MG 30 COMPRIMIDOS RECUBIERTOS                ', N'SANDOZ FARMACEUTICA                               ', CAST(3.29 AS Numeric(10, 2)), NULL)
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (27, 670043, N'BISOPROLOL COR SANDOZ EFG                       ', N'10 MG 60 COMPRIMIDOS RECUBIERTOS                ', N'SANDOZ FARMACEUTICA                               ', CAST(6.57 AS Numeric(10, 2)), NULL)
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (28, 720292, N'BISOPROLOL EDIGEN EFG                           ', N'5 MG 30 COMPRIMIDOS RECUBIERTOS                 ', N'EDIGEN                                            ', CAST(2.36 AS Numeric(10, 2)), NULL)
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (29, 720276, N'BISOPROLOL EDIGEN EFG                           ', N'10 MG 30 COMPRIMIDOS RECUBIERTOS                ', N'EDIGEN                                            ', CAST(3.29 AS Numeric(10, 2)), NULL)
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (30, 650856, N'BISOPROLOL EDIGEN EFG                           ', N'5 MG 60 COMPRIMIDOS RECUBIERTOS                 ', N'EDIGEN                                            ', CAST(3.29 AS Numeric(10, 2)), NULL)
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (31, 650775, N'BISOPROLOL EDIGEN EFG                           ', N'10 MG 60 COMPRIMIDOS RECUBIERTOS                ', N'EDIGEN                                            ', CAST(6.57 AS Numeric(10, 2)), NULL)
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (32, 652726, N'BISOPROLOL LABIANA EFG                          ', N'5 MG 30 COMPRIMIDOS                             ', N'LABIANA LIFE SCIENCES                             ', CAST(3.12 AS Numeric(10, 2)), NULL)
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (33, 652728, N'BISOPROLOL LABIANA EFG                          ', N'5 MG 60 COMPRIMIDOS                             ', N'LABIANA LIFE SCIENCES                             ', CAST(3.65 AS Numeric(10, 2)), NULL)
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (34, 652729, N'BISOPROLOL LABIANA EFG                          ', N'10 MG 30 COMPRIMIDOS                            ', N'LABIANA LIFE SCIENCES                             ', CAST(3.65 AS Numeric(10, 2)), NULL)
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (35, 652730, N'BISOPROLOL LABIANA EFG                          ', N'10 MG 60 COMPRIMIDOS                            ', N'LABIANA LIFE SCIENCES                             ', CAST(7.29 AS Numeric(10, 2)), NULL)
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (36, 673543, N'BISOPROLOL MYLAN PHARMACEUTICALS EFG            ', N'5 MG 30 COMPRIMIDOS RECUBIERTOS                 ', N'MYLAN PHARMACEUTICALS S.L.                        ', CAST(2.36 AS Numeric(10, 2)), NULL)
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (37, 673546, N'BISOPROLOL MYLAN PHARMACEUTICALS EFG            ', N'5 MG 60 COMPRIMIDOS RECUBIERTOS                 ', N'MYLAN PHARMACEUTICALS S.L.                        ', CAST(3.29 AS Numeric(10, 2)), NULL)
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (38, 673564, N'BISOPROLOL MYLAN PHARMACEUTICALS EFG            ', N'10 MG 30 COMPRIMIDOS RECUBIERTOS                ', N'MYLAN PHARMACEUTICALS S.L.                        ', CAST(3.29 AS Numeric(10, 2)), NULL)
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (39, 673568, N'BISOPROLOL MYLAN PHARMACEUTICALS EFG            ', N'10 MG 60 COMPRIMIDOS RECUBIERTOS                ', N'MYLAN PHARMACEUTICALS S.L.                        ', CAST(6.57 AS Numeric(10, 2)), NULL)
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (40, 865048, N'BISOPROLOL NORMON EFG                           ', N'5 MG 30 COMPRIMIDOS RECUBIERTOS                 ', N'NORMON                                            ', CAST(2.36 AS Numeric(10, 2)), NULL)
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (41, 665193, N'BISOPROLOL NORMON EFG                           ', N'2.5 MG 28 COMPRIMIDOS RECUBIERTOS               ', N'NORMON                                            ', CAST(2.40 AS Numeric(10, 2)), NULL)
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (42, 865089, N'BISOPROLOL NORMON EFG                           ', N'5 MG 60 COMPRIMIDOS RECUBIERTOS                 ', N'NORMON                                            ', CAST(3.29 AS Numeric(10, 2)), NULL)
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (43, 867937, N'BISOPROLOL NORMON EFG                           ', N'10 MG 30 COMPRIMIDOS RECUBIERTOS                ', N'NORMON                                            ', CAST(3.29 AS Numeric(10, 2)), NULL)
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (44, 693259, N'CONTUGESIC                                      ', N'RETARD 120 MG 60 COMPRIMIDOS                    ', N'MUNDIPHARMA PHARMACEUTICALS                       ', CAST(15.00 AS Numeric(10, 2)), CAST(0.15 AS Numeric(10, 2)))
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (45, 671929, N'COPALIA                                         ', N'5/160 MG 28 COMPRIMIDOS RECUBIERTOS             ', N'URIACH                                            ', CAST(37.40 AS Numeric(10, 2)), CAST(0.08 AS Numeric(10, 2)))
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (46, 671923, N'COPALIA                                         ', N'10/160 MG 28 COMPRIMIDOS RECUBIERTOS            ', N'URIACH                                            ', CAST(40.60 AS Numeric(10, 2)), CAST(0.08 AS Numeric(10, 2)))
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (47, 658727, N'COPALIA                                         ', N'5/160 MG 28 COMPRIMIDOS RECUBIERTOS             ', N'URIACH                                            ', CAST(41.52 AS Numeric(10, 2)), CAST(0.08 AS Numeric(10, 2)))
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (48, 658728, N'COPALIA                                         ', N'10/160 MG 28 COMPRIMIDOS RECUBIERTOS            ', N'URIACH                                            ', CAST(44.15 AS Numeric(10, 2)), CAST(0.08 AS Numeric(10, 2)))
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (49, 699918, N'COPINAL                                         ', N'300 MG 30 CAPSULAS                              ', N'VI?AS                                             ', CAST(5.10 AS Numeric(10, 2)), CAST(0.15 AS Numeric(10, 2)))
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (50, 696351, N'COPINAL                                         ', N'300 MG 30 SOBRES SUSPENSION                     ', N'VI?AS                                             ', CAST(5.60 AS Numeric(10, 2)), CAST(0.15 AS Numeric(10, 2)))
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (51, 699900, N'COPINAL                                         ', N'300 MG 60 CAPSULAS                              ', N'VI?AS                                             ', CAST(9.27 AS Numeric(10, 2)), CAST(0.15 AS Numeric(10, 2)))
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (52, 696344, N'COPINAL                                         ', N'300 MG 60 SOBRES SUSPENSION                     ', N'VI?AS                                             ', CAST(10.13 AS Numeric(10, 2)), CAST(0.15 AS Numeric(10, 2)))
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (53, 656074, N'CORALEN                                         ', N'150 MG 28 COMPRIMIDOS                           ', N'ALTER                                             ', CAST(3.90 AS Numeric(10, 2)), NULL)
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (54, 656082, N'CORALEN                                         ', N'300 MG 28 COMPRIMIDOS                           ', N'ALTER                                             ', CAST(7.95 AS Numeric(10, 2)), NULL)
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (55, 656090, N'CORALEN                                         ', N'300 MG 14 COMPRIMIDOS                           ', N'ALTER                                             ', CAST(3.90 AS Numeric(10, 2)), NULL)
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (56, 656517, N'CORDIPLAST                                      ', N'5 MG/24 H 30 PARCHES TRANSDERMICOS 18.7 MG      ', N'UCB PHARMA, S.A.                                  ', CAST(8.30 AS Numeric(10, 2)), NULL)
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (57, 751008, N'CORDIPLAST                                      ', N'10 MG/24 H 30 PARCHES TRANSDERMICOS 37.4 MG     ', N'UCB PHARMA, S.A.                                  ', CAST(16.66 AS Numeric(10, 2)), NULL)
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (58, 656518, N'CORDIPLAST                                      ', N'15 MG/24 H 30 PARCHES TRANSDERMICOS 56.2 MG     ', N'UCB PHARMA, S.A.                                  ', CAST(25.01 AS Numeric(10, 2)), NULL)
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (59, 750927, N'CORDIPLAST                                      ', N'10 MG/24 H 7 PARCHES TRANSDERMICOS 37.4 MG      ', N'UCB PHARMA, S.A.                                  ', CAST(3.90 AS Numeric(10, 2)), NULL)
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (60, 750760, N'CORDIPLAST                                      ', N'5 MG/24 H 7 PARCHES TRANSDERMICOS 18.7 MG       ', N'UCB PHARMA, S.A.                                  ', CAST(3.12 AS Numeric(10, 2)), NULL)
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (61, 750901, N'CORDIPLAST                                      ', N'15 MG/24 H 7 PARCHES TRANSDERMICOS 56.2 MG      ', N'UCB PHARMA, S.A.                                  ', CAST(5.85 AS Numeric(10, 2)), NULL)
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (62, 750893, N'CORDIPLAST                                      ', N'5 MG/24 H 30 PARCHES TRANSDERMICOS 18.7 MG      ', N'SCHWARZ PHARMA                                    ', CAST(17.56 AS Numeric(10, 2)), CAST(0.08 AS Numeric(10, 2)))
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (63, 930685, N'DASTOSIN                                        ', N'10 MG/5 ML JARABE 150 ML                        ', N'ASTELLAS PHARMA                                   ', CAST(2.76 AS Numeric(10, 2)), CAST(0.15 AS Numeric(10, 2)))
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (64, 930677, N'DASTOSIN                                        ', N'20 MG 30 CAPSULAS                               ', N'ASTELLAS PHARMA                                   ', CAST(3.12 AS Numeric(10, 2)), CAST(0.15 AS Numeric(10, 2)))
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (65, 653105, N'DASTOSIN                                        ', N'10 MG/5 ML JARABE 250 ML                        ', N'ASTELLAS PHARMA                                   ', CAST(3.93 AS Numeric(10, 2)), CAST(0.15 AS Numeric(10, 2)))
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (66, 992529, N'DATOLAN                                         ', N'7.5 MG 30 COMPRIMIDOS RECUBIERTOS PELICULA      ', N'FAES FARMA                                        ', CAST(3.12 AS Numeric(10, 2)), NULL)
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (67, 740233, N'DAUNOBLASTINA                                   ', N'20 MG 1 VIAL 1 AMP 10 ML                        ', N'PFIZER                                            ', CAST(6.56 AS Numeric(10, 2)), CAST(0.15 AS Numeric(10, 2)))
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (68, 665845, N'DAXAS                                           ', N'500 MCG 30 COMPRIMIDOS RECUBIERTOS              ', N'NYCOMED PHARMA S.A.                               ', CAST(57.84 AS Numeric(10, 2)), CAST(0.08 AS Numeric(10, 2)))
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (69, 740464, N'DECA DURABOLIN                                  ', N'25 MG 1 AMPOLLA 1 ML                            ', N'MERCK SHARP DOHME                                 ', CAST(2.23 AS Numeric(10, 2)), CAST(0.15 AS Numeric(10, 2)))
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (70, 740480, N'DECA DURABOLIN                                  ', N'50 MG 1 AMPOLLA 1 ML                            ', N'MERCK SHARP DOHME                                 ', CAST(2.83 AS Numeric(10, 2)), CAST(0.15 AS Numeric(10, 2)))
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (71, 662101, N'DECALTREX FLAS                                  ', N'1500 MG/400 UI 60 COMPRIMIDOS BUCODISPERSABLES  ', N'VALOMED                                           ', CAST(11.16 AS Numeric(10, 2)), CAST(0.08 AS Numeric(10, 2)))
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (72, 745174, N'DECAPEPTYL DIARIO                               ', N'0.1 MG 7 VIALES POLVO + 7 AMPOLLAS DISOLV 1 ML  ', N'IPSEN PHARMA                                      ', CAST(36.08 AS Numeric(10, 2)), CAST(0.15 AS Numeric(10, 2)))
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (73, 990325, N'DECAPEPTYL MENSUAL                              ', N'3.75 MG 1 VIAL POLVO + 1 AMPOLLA DISOLVENTE 2 ML', N'IPSEN PHARMA                                      ', CAST(159.02 AS Numeric(10, 2)), CAST(0.15 AS Numeric(10, 2)))
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (74, 665072, N'DECAPEPTYL SEMESTRAL                            ', N'22.5 MG 1 VIAL POLVO + 1 AMPOLLA DISOLVENTE 2 ML', N'IPSEN PHARMA                                      ', CAST(564.50 AS Numeric(10, 2)), CAST(0.08 AS Numeric(10, 2)))
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (75, 668889, N'DECAPEPTYL TRIMESTRAL                           ', N'11.25 MG 1 VIAL POLVO + 1 AMPOLLA DISOLV 2 ML   ', N'IPSEN PHARMA                                      ', CAST(338.49 AS Numeric(10, 2)), CAST(0.15 AS Numeric(10, 2)))
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (76, 740621, N'DECENTAN                                        ', N'8 MG 50 COMPRIMIDOS                             ', N'MERCK S.L.                                        ', CAST(2.01 AS Numeric(10, 2)), CAST(0.15 AS Numeric(10, 2)))
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (77, 740613, N'DECENTAN                                        ', N'8 MG 25 COMPRIMIDOS                             ', N'MERCK S.L.                                        ', CAST(1.55 AS Numeric(10, 2)), CAST(0.15 AS Numeric(10, 2)))
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (78, 882985, N'DECIPAR                                         ', N'20 MG/2000UI 2 JER 0.2 ML                       ', N'SANOFI AVENTIS S.A.U                              ', CAST(4.93 AS Numeric(10, 2)), CAST(0.08 AS Numeric(10, 2)))
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (79, 883066, N'DECIPAR                                         ', N'20 MG/2000UI 2 AMP. 0.2ML                       ', N'SANOFI AVENTIS S.A.U                              ', CAST(4.93 AS Numeric(10, 2)), CAST(0.08 AS Numeric(10, 2)))
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (80, 749721, N'EFORTIL                                         ', N'10 MG 6 AMPOLLAS 1 ML                           ', N'BOEHRINGER INGELHEIM ESPA?A                       ', CAST(1.73 AS Numeric(10, 2)), CAST(0.15 AS Numeric(10, 2)))
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (81, 851444, N'EFUDIX                                          ', N'5% POMADA 20 G                                  ', N'MEDA PHARMA SAU                                   ', CAST(5.48 AS Numeric(10, 2)), CAST(0.15 AS Numeric(10, 2)))
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (82, 661615, N'EKISTOL                                         ', N'100 MG 56 COMPRIMIDOS                           ', N'LACER                                             ', CAST(34.97 AS Numeric(10, 2)), CAST(0.08 AS Numeric(10, 2)))
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (83, 696526, N'ELCATONINA CEPA                                 ', N'40 UE 10 AMPOLLAS 1 ML                          ', N'UCB PHARMA, S.A.                                  ', CAST(63.63 AS Numeric(10, 2)), CAST(0.15 AS Numeric(10, 2)))
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (84, 866186, N'ELCATONINA CEPA NASAL                           ', N'40 UE/DOSIS PULVERIZACION NASAL 24 DOSIS        ', N'UCB PHARMA, S.A.                                  ', CAST(51.56 AS Numeric(10, 2)), CAST(0.15 AS Numeric(10, 2)))
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (85, 955583, N'ELDICET                                         ', N'50 MG 50 COMPRIMIDOS                            ', N'ABBOTT LABORATORIES                               ', CAST(4.64 AS Numeric(10, 2)), CAST(0.15 AS Numeric(10, 2)))
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (86, 759316, N'ELEBLOC                                         ', N'1% COLIRIO 5 ML                                 ', N'ALCON CUSI                                        ', CAST(3.08 AS Numeric(10, 2)), CAST(0.15 AS Numeric(10, 2)))
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (87, 759324, N'ELEBLOC                                         ', N'2% COLIRIO 5 ML                                 ', N'ALCON CUSI                                        ', CAST(3.17 AS Numeric(10, 2)), CAST(0.15 AS Numeric(10, 2)))
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (88, 651231, N'ELECOR                                          ', N'25 MG 30 COMPRIMIDOS RECUBIERTOS CON PELICULA   ', N'ALMIRALL S.A.                                     ', CAST(88.90 AS Numeric(10, 2)), CAST(0.08 AS Numeric(10, 2)))
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (89, 651235, N'ELECOR                                          ', N'50 MG 30 COMPRIMIDOS RECUBIERTOS CON PELICULA   ', N'ALMIRALL S.A.                                     ', CAST(88.90 AS Numeric(10, 2)), CAST(0.08 AS Numeric(10, 2)))
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (90, 891515, N'ELGAM                                           ', N'20 MG 14 CAPSULAS                               ', N'DAIICHI SANKYO ESPA?A                             ', CAST(3.12 AS Numeric(10, 2)), NULL)
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (91, 757443, N'FABROVEN                                        ', N'60 CAPSULAS                                     ', N'PIERRE FABRE IBERICA                              ', CAST(7.99 AS Numeric(10, 2)), CAST(0.15 AS Numeric(10, 2)))
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (92, 808667, N'FACTOPAN                                        ', N'800 MG 40 COMPRIMIDOS LIBERACION PROLONGADA     ', N'LIADE                                             ', CAST(5.92 AS Numeric(10, 2)), CAST(0.08 AS Numeric(10, 2)))
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (93, 871616, N'FAGASTRIL                                       ', N'20 MG 28 COMPRIMIDOS                            ', N'QUIMIFAR                                          ', CAST(3.12 AS Numeric(10, 2)), NULL)
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (94, 871608, N'FAGASTRIL                                       ', N'40 MG 14 COMPRIMIDOS                            ', N'QUIMIFAR                                          ', CAST(3.12 AS Numeric(10, 2)), NULL)
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (95, 872564, N'FAGASTRIL                                       ', N'40 MG 28 COMPRIMIDOS                            ', N'QUIMIFAR                                          ', CAST(5.68 AS Numeric(10, 2)), NULL)
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (96, 688192, N'FAGUS                                           ', N'150 MG 20 COMPRIMIDOS EFERVESCENTES             ', N'ALLEN FARMACEUTICA                                ', CAST(4.26 AS Numeric(10, 2)), NULL)
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (97, 730275, N'FALCOL                                          ', N'100 MG 20 COMPRIMIDOS                           ', N'ANGELINI FARMAC?UTICA S.A.                        ', CAST(2.89 AS Numeric(10, 2)), NULL)
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (98, 659769, N'GABAPENTINA CANTABRIA EFG                       ', N'300 MG 90 CAPSULAS                              ', N'CANTABRIA PHARMA                                  ', CAST(16.36 AS Numeric(10, 2)), NULL)
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (99, 659770, N'GABAPENTINA CANTABRIA EFG                       ', N'400 MG 90 CAPSULAS                              ', N'CANTABRIA PHARMA                                  ', CAST(22.14 AS Numeric(10, 2)), NULL)
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (100, 655885, N'GABAPENTINA CINFA EFG                           ', N'300 MG 30 CAPSULAS                              ', N'CINFA                                             ', CAST(5.74 AS Numeric(10, 2)), NULL)
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (101, 655883, N'GABAPENTINA CINFA EFG                           ', N'400 MG 30 CAPSULAS                              ', N'CINFA                                             ', CAST(7.68 AS Numeric(10, 2)), NULL)
GO
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (102, 655888, N'GABAPENTINA CINFA EFG                           ', N'300 MG 90 CAPSULAS                              ', N'CINFA                                             ', CAST(16.36 AS Numeric(10, 2)), NULL)
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (103, 655884, N'GABAPENTINA CINFA EFG                           ', N'400 MG 90 CAPSULAS                              ', N'CINFA                                             ', CAST(22.14 AS Numeric(10, 2)), NULL)
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (104, 654663, N'GABAPENTINA COLORKERN EFG                       ', N'300 MG 90 CAPSULAS                              ', N'KERN PHARMA                                       ', CAST(17.37 AS Numeric(10, 2)), NULL)
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (105, 654664, N'GABAPENTINA COLORKERN EFG                       ', N'400 MG 90 CAPSULAS                              ', N'KERN PHARMA                                       ', CAST(23.15 AS Numeric(10, 2)), NULL)
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (106, 779199, N'GABAPENTINA COMBINO PHARM EFG                   ', N'300 MG 30 CAPSULAS                              ', N'COMBINO PHARM                                     ', CAST(5.79 AS Numeric(10, 2)), NULL)
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (107, 933341, N'HARTMANN RINGER LACTATO                         ', N'1 VIAFLEX 1000 ML                               ', N'BAXTER                                            ', CAST(2.48 AS Numeric(10, 2)), CAST(0.08 AS Numeric(10, 2)))
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (108, 851030, N'HAVELOX                                         ', N'400 MG 5 COMPR RECUB                            ', N'RECORDATI ESPA?A S.L.                             ', CAST(22.64 AS Numeric(10, 2)), CAST(0.08 AS Numeric(10, 2)))
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (109, 851048, N'HAVELOX                                         ', N'400 MG 7 COMPR RECUB                            ', N'RECORDATI ESPA?A S.L.                             ', CAST(31.69 AS Numeric(10, 2)), CAST(0.08 AS Numeric(10, 2)))
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (110, 673921, N'HAVRIX                                          ', N'720 U ELISA 1 JER PRE IM                        ', N'GLAXO SMITHKLINE                                  ', CAST(18.20 AS Numeric(10, 2)), CAST(0.08 AS Numeric(10, 2)))
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (111, 676858, N'HAVRIX                                          ', N'1440 U ELISA 1 JER IM                           ', N'GLAXO SMITHKLINE                                  ', CAST(27.77 AS Numeric(10, 2)), CAST(0.08 AS Numeric(10, 2)))
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (112, 904813, N'HBVAXPRO                                        ', N'5 MCG 1 VIAL 0.5 ML                             ', N'SANOFI PASTEUR MSD                                ', CAST(9.05 AS Numeric(10, 2)), CAST(0.15 AS Numeric(10, 2)))
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (113, 886127, N'IBUMAC                                          ', N'800 MG 40 COMPRIMIDOS LIBERACION PROLONGADA     ', N'TEVA PHARMA S.L.U.                                ', CAST(3.12 AS Numeric(10, 2)), NULL)
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (114, 654698, N'IBUPROFENO (ARGININA) CINFA EFG                 ', N'400 MG 30 SOBRES GRANULADO                      ', N'CINFA                                             ', CAST(3.12 AS Numeric(10, 2)), NULL)
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (115, 654702, N'IBUPROFENO (ARGININA) CINFA EFG                 ', N'600 MG 40 SOBRES GRANULADO                      ', N'CINFA                                             ', CAST(4.14 AS Numeric(10, 2)), NULL)
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (116, 654701, N'IBUPROFENO (ARGININA) CINFA EFG                 ', N'600 MG 20 SOBRES GRANULADO                      ', N'CINFA                                             ', CAST(3.12 AS Numeric(10, 2)), NULL)
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (117, 654697, N'IBUPROFENO (ARGININA) CINFAMED EFG              ', N'600 MG 40 SOBRES GRANULADO                      ', N'CINFA                                             ', CAST(4.14 AS Numeric(10, 2)), NULL)
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (118, 654696, N'IBUPROFENO (ARGININA) CINFAMED EFG              ', N'600 MG 20 SOBRES GRANULADO                      ', N'CINFA                                             ', CAST(3.12 AS Numeric(10, 2)), NULL)
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (119, 654695, N'IBUPROFENO (ARGININA) CINFAMED EFG              ', N'400 MG 30 SOBRES GRANULADO                      ', N'CINFA                                             ', CAST(3.12 AS Numeric(10, 2)), NULL)
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (120, 660009, N'IBUPROFENO (ARGININA) CODRAMOL EFG              ', N'600 MG 40 SOBRES GRANULADO                      ', N'FARMALIDER                                        ', CAST(4.14 AS Numeric(10, 2)), NULL)
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (121, 929075, N'JADELLE                                         ', N'75 MG 2 IMPLANTES SUBCUTANEOS                   ', N'BAYER HISPANIA S.L.                               ', CAST(159.06 AS Numeric(10, 2)), CAST(0.08 AS Numeric(10, 2)))
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (122, 662086, N'JALRA                                           ', N'50 MG 28 COMPRIMIDOS                            ', N'ESTEVE                                            ', CAST(34.97 AS Numeric(10, 2)), CAST(0.08 AS Numeric(10, 2)))
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (123, 662087, N'JALRA                                           ', N'50 MG 56 COMPRIMIDOS                            ', N'ESTEVE                                            ', CAST(55.95 AS Numeric(10, 2)), CAST(0.08 AS Numeric(10, 2)))
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (124, 661196, N'JANUMET                                         ', N'50/1000 MG 56 COMPRIMIDOS RECUBIERTOS           ', N'MERCK SHARP DOHME                                 ', CAST(61.19 AS Numeric(10, 2)), CAST(0.08 AS Numeric(10, 2)))
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (125, 673180, N'KETOCONAZOL ABAMED EFG                          ', N'2% GEL 100 ML                                   ', N'ABAMED PHARMA                                     ', CAST(2.98 AS Numeric(10, 2)), NULL)
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (126, 735191, N'KETOCONAZOL ABAMED EFG                          ', N'2% GEL 100 ML                                   ', N'ABAMED PHARMA                                     ', CAST(3.15 AS Numeric(10, 2)), NULL)
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (127, 810416, N'KETOCONAZOL BEXAL EFG                           ', N'2% GEL 100 ML                                   ', N'BEXAL FARMACEUTICA                                ', CAST(2.98 AS Numeric(10, 2)), NULL)
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (128, 767467, N'KETOCONAZOL CINFA EFG                           ', N'2% GEL 100 ML                                   ', N'CINFA                                             ', CAST(2.98 AS Numeric(10, 2)), NULL)
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (129, 895342, N'KETOCONAZOL CUVE EFG                            ', N'2% GEL 100 ML                                   ', N'PEREZ GIMENEZ                                     ', CAST(3.15 AS Numeric(10, 2)), NULL)
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (130, 757211, N'LACTULOSA LEVEL                                 ', N'3.33 G/5 ML SOLUCION 800 ML                     ', N'ERN                                               ', CAST(5.09 AS Numeric(10, 2)), CAST(0.08 AS Numeric(10, 2)))
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (131, 977538, N'LAGARMICIN                                      ', N'250 MG 24 CAPSULAS                              ', N'MEDICALIA                                         ', CAST(2.93 AS Numeric(10, 2)), CAST(0.15 AS Numeric(10, 2)))
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (132, 660933, N'LAMBDALINA                                      ', N'4% CREMA 5 G                                    ', N'ISDIN                                             ', CAST(3.78 AS Numeric(10, 2)), CAST(0.08 AS Numeric(10, 2)))
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (133, 848358, N'LANSOPRAZOL WINTHROP EFG                        ', N'30 MG 28 CAPSULAS GASTRORRESISTENTES            ', N'SANOFI AVENTIS S.A.                               ', CAST(16.63 AS Numeric(10, 2)), NULL)
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (134, 896886, N'LANTANON                                        ', N'10 MG 50 COMPR REC                              ', N'MERCK SHARP DOHME                                 ', CAST(4.01 AS Numeric(10, 2)), CAST(0.15 AS Numeric(10, 2)))
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (135, 951277, N'LANTANON                                        ', N'30 MG 30 COMPR REC                              ', N'MERCK SHARP DOHME                                 ', CAST(5.64 AS Numeric(10, 2)), NULL)
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (136, 831453, N'LANTUS                                          ', N'100 U/ML 1 VIAL 10 ML                           ', N'SANOFI AVENTIS S.A.                               ', CAST(51.30 AS Numeric(10, 2)), CAST(0.08 AS Numeric(10, 2)))
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (137, 650691, N'OXYNORM                                         ', N'20 MG (EQ 18 MG BASE) 28 CAPSULAS               ', N'MUNDIPHARMA PHARMACEUTICALS                       ', CAST(23.39 AS Numeric(10, 2)), CAST(0.08 AS Numeric(10, 2)))
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (138, 663684, N'OXYNORM AMPOLLAS                                ', N'10 MG/ML (EQ 9 MG BASE) 5 AMPOLLAS 1 ML         ', N'MUNDIPHARMA PHARMACEUTICALS                       ', CAST(7.68 AS Numeric(10, 2)), CAST(0.08 AS Numeric(10, 2)))
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (139, 650823, N'OXYNORM CONCENTRADO                             ', N'10 MG/ML (EQ 9 MG BASE) SOLUCION ORAL 30 ML     ', N'MUNDIPHARMA PHARMACEUTICALS                       ', CAST(17.86 AS Numeric(10, 2)), CAST(0.08 AS Numeric(10, 2)))
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (140, 895771, N'PACIUM                                          ', N'5/10 MG 20 CAPSULAS                             ', N'BIOMED SL                                         ', CAST(1.26 AS Numeric(10, 2)), CAST(0.15 AS Numeric(10, 2)))
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (141, 800797, N'PACIUM                                          ', N'5/10 MG 40 CAPSULAS                             ', N'BIOMED SL                                         ', CAST(1.89 AS Numeric(10, 2)), CAST(0.15 AS Numeric(10, 2)))
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (142, 835413, N'PAIDOFEBRIL                                     ', N'2% 100 MG/5 ML SUSPENSION ORAL 200 ML           ', N'ALDO UNION                                        ', CAST(2.50 AS Numeric(10, 2)), NULL)
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (143, 652250, N'PALACIMOL                                       ', N'6.25 MG 28 COMPRIMIDOS                          ', N'SPYFARMA                                          ', CAST(3.00 AS Numeric(10, 2)), NULL)
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (144, 673640, N'SALONGO VAGINAL                                 ', N'600 MG 1 COMPRIMIDO VAGINAL                     ', N'BIOSARTO                                          ', CAST(5.68 AS Numeric(10, 2)), CAST(0.08 AS Numeric(10, 2)))
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (145, 996629, N'SALVACAM                                        ', N'20 MG 20 CAPSULAS                               ', N'SALVAT                                            ', CAST(4.40 AS Numeric(10, 2)), NULL)
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (146, 999441, N'SALVACAM TOPICO                                 ', N'0.5% GEL 60 G                                   ', N'SALVAT                                            ', CAST(4.15 AS Numeric(10, 2)), CAST(0.08 AS Numeric(10, 2)))
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (147, 856807, N'SALVAPEN                                        ', N'250 MG 12 SOBRES                                ', N'SALVAT                                            ', CAST(2.29 AS Numeric(10, 2)), NULL)
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (148, 820738, N'SALVAPEN                                        ', N'500 MG 12 CAPSULAS                              ', N'SALVAT                                            ', CAST(2.40 AS Numeric(10, 2)), NULL)
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (149, 684159, N'SALVAPEN                                        ', N'1 G 12 SOBRES                                   ', N'SALVAT                                            ', CAST(3.36 AS Numeric(10, 2)), NULL)
INSERT [dbo].[Farmacia] ([idFarmacia], [CodigoArticulo], [NombreArticulo], [Descripcion], [Proveedor], [PrecioVenta], [DescuentoAplicado]) VALUES (150, 888875, N'SANAMIDOL                                       ', N'20 MG 14 CAPSULAS                               ', N'PHARMINICIO                                       ', CAST(3.12 AS Numeric(10, 2)), NULL)
SET IDENTITY_INSERT [dbo].[Farmacia] OFF
GO
ALTER TABLE [dbo].[Citas]  WITH CHECK ADD  CONSTRAINT [FK_CitaXCliente] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Clientes] ([IdCliente])
GO
ALTER TABLE [dbo].[Citas] CHECK CONSTRAINT [FK_CitaXCliente]
GO
ALTER TABLE [dbo].[Citas]  WITH CHECK ADD  CONSTRAINT [FK_CitaXDoctor] FOREIGN KEY([IdDoctor])
REFERENCES [dbo].[DirectorioMedico] ([IdDoctor])
GO
ALTER TABLE [dbo].[Citas] CHECK CONSTRAINT [FK_CitaXDoctor]
GO
ALTER TABLE [dbo].[ComentariosFarmacia]  WITH CHECK ADD  CONSTRAINT [FK_ComentariosProductoFarmacia] FOREIGN KEY([idFarmacia])
REFERENCES [dbo].[Farmacia] ([idFarmacia])
GO
ALTER TABLE [dbo].[ComentariosFarmacia] CHECK CONSTRAINT [FK_ComentariosProductoFarmacia]
GO
USE [master]
GO
ALTER DATABASE [GRUPO3] SET  READ_WRITE 
GO
