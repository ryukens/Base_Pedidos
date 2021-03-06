USE [master]
GO
/****** Object:  Database [Pedidos]    Script Date: 7/18/2020 12:34:59 PM ******/
CREATE DATABASE [Pedidos]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Pedidos_Primario', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.DBMSG5\MSSQL\DATA\Pedidos_Primario.mdf' , SIZE = 8192KB , MAXSIZE = 10240KB , FILEGROWTH = 10%), 
 FILEGROUP [Secundario] 
( NAME = N'Pedidos_Secundario', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.DBMSG5\MSSQL\DATA\Pedidos_Secundario.ndf' , SIZE = 5120KB , MAXSIZE = 10240KB , FILEGROWTH = 10%)
 LOG ON 
( NAME = N'Pedidos_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.DBMSG5\MSSQL\Log\Pedidos_log.ldf' , SIZE = 2048KB , MAXSIZE = 8192KB , FILEGROWTH = 1024KB )
GO
ALTER DATABASE [Pedidos] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Pedidos].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Pedidos] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Pedidos] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Pedidos] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Pedidos] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Pedidos] SET ARITHABORT OFF 
GO
ALTER DATABASE [Pedidos] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Pedidos] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Pedidos] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Pedidos] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Pedidos] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Pedidos] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Pedidos] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Pedidos] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Pedidos] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Pedidos] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Pedidos] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Pedidos] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Pedidos] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Pedidos] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Pedidos] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Pedidos] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Pedidos] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Pedidos] SET RECOVERY FULL 
GO
ALTER DATABASE [Pedidos] SET  MULTI_USER 
GO
ALTER DATABASE [Pedidos] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Pedidos] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Pedidos] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Pedidos] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Pedidos] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Pedidos', N'ON'
GO
ALTER DATABASE [Pedidos] SET QUERY_STORE = OFF
GO
USE [Pedidos]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [Pedidos]
GO
/****** Object:  Schema [catalogo]    Script Date: 7/18/2020 12:35:00 PM ******/
CREATE SCHEMA [catalogo]
GO
/****** Object:  Schema [movimientos]    Script Date: 7/18/2020 12:35:00 PM ******/
CREATE SCHEMA [movimientos]
GO
/****** Object:  Table [catalogo].[Cliente]    Script Date: 7/18/2020 12:35:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [catalogo].[Cliente](
	[numero_cliente] [int] IDENTITY(1,1) NOT NULL,
	[limite_credito] [decimal](10, 2) NULL,
	[descuento] [decimal](5, 2) NOT NULL,
	[ciudad] [varchar](60) NOT NULL,
	[calle_principal] [varchar](60) NOT NULL,
	[calle_secundaria] [varchar](60) NULL,
	[numero_vivienda] [varchar](10) NOT NULL,
	[numero_garante] [int] NULL,
 CONSTRAINT [Unique_Identifier1] PRIMARY KEY CLUSTERED 
(
	[numero_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Secundario]
) ON [Secundario]
GO
/****** Object:  Table [catalogo].[Fabrica]    Script Date: 7/18/2020 12:35:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [catalogo].[Fabrica](
	[numero_fabrica] [int] IDENTITY(1,1) NOT NULL,
	[nombre_fabrica] [varchar](60) NOT NULL,
	[telefono1] [varchar](10) NOT NULL,
	[telefono2] [varchar](10) NOT NULL,
 CONSTRAINT [Unique_Identifier3] PRIMARY KEY CLUSTERED 
(
	[numero_fabrica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Secundario]
) ON [Secundario]
GO
/****** Object:  Table [catalogo].[Producto]    Script Date: 7/18/2020 12:35:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [catalogo].[Producto](
	[numero_producto] [int] IDENTITY(1,1) NOT NULL,
	[nombre_producto] [varchar](60) NOT NULL,
	[existencia_producto] [int] NOT NULL,
	[precio_unitario] [decimal](10, 2) NOT NULL,
 CONSTRAINT [Unique_Identifier2] PRIMARY KEY CLUSTERED 
(
	[numero_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Secundario]
) ON [Secundario]
GO
/****** Object:  Table [movimientos].[Cabecera_pedido]    Script Date: 7/18/2020 12:35:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [movimientos].[Cabecera_pedido](
	[numero_cabecera] [int] IDENTITY(1,1) NOT NULL,
	[fecha_pedido] [date] NOT NULL,
	[numero_cliente] [int] NOT NULL,
	[tipo_ped] [varchar](10) NULL,
	[monto_total] [decimal](12, 2) NULL,
 CONSTRAINT [Unique_Identifier4] PRIMARY KEY CLUSTERED 
(
	[numero_cabecera] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [movimientos].[cabezacuerpoP]    Script Date: 7/18/2020 12:35:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [movimientos].[cabezacuerpoP](
	[numero_cabecera] [int] NOT NULL,
	[fecha_pedido] [date] NOT NULL,
	[numero_cliente] [int] NOT NULL,
	[precio_unitario] [decimal](10, 2) NOT NULL,
	[cantidad] [int] NOT NULL,
	[linea_detalle] [int] NOT NULL,
	[numero_producto] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [movimientos].[Cuerpo_pedido]    Script Date: 7/18/2020 12:35:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [movimientos].[Cuerpo_pedido](
	[precio_unitario] [decimal](10, 2) NOT NULL,
	[cantidad] [int] NOT NULL,
	[linea_detalle] [int] IDENTITY(1,1) NOT NULL,
	[numero_cabecera] [int] NOT NULL,
	[numero_producto] [int] NOT NULL,
 CONSTRAINT [Unique_Identifier5] PRIMARY KEY CLUSTERED 
(
	[linea_detalle] ASC,
	[numero_cabecera] ASC,
	[numero_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [movimientos].[Deudor]    Script Date: 7/18/2020 12:35:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [movimientos].[Deudor](
	[numero_cliente] [int] NOT NULL,
	[numero_garante] [int] NOT NULL,
	[limite_credito] [decimal](10, 2) NOT NULL,
	[saldo_deudor] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_numero_cliente] PRIMARY KEY CLUSTERED 
(
	[numero_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [movimientos].[Fabrica_distribuye_producto]    Script Date: 7/18/2020 12:35:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [movimientos].[Fabrica_distribuye_producto](
	[cantidad] [int] NOT NULL,
	[fecha_distribucion] [date] NOT NULL,
	[numero_producto] [int] NOT NULL,
	[numero_fabrica] [int] NOT NULL,
	[linea_distribucion] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [Unique_Identifier6] PRIMARY KEY CLUSTERED 
(
	[linea_distribucion] ASC,
	[numero_producto] ASC,
	[numero_fabrica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [movimientos].[Pagos]    Script Date: 7/18/2020 12:35:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [movimientos].[Pagos](
	[numero_cliente] [int] NOT NULL,
	[fecha_pago] [date] NOT NULL,
	[valor_pago] [decimal](10, 2) NOT NULL,
	[numero_pago] [int] NOT NULL,
 CONSTRAINT [PK_numero_pago] PRIMARY KEY CLUSTERED 
(
	[numero_pago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [catalogo].[Cliente] ON 

INSERT [catalogo].[Cliente] ([numero_cliente], [limite_credito], [descuento], [ciudad], [calle_principal], [calle_secundaria], [numero_vivienda], [numero_garante]) VALUES (1, CAST(10000.00 AS Decimal(10, 2)), CAST(10.00 AS Decimal(5, 2)), N'Quito', N'Amazonas', NULL, N'Oe14-91', 1)
INSERT [catalogo].[Cliente] ([numero_cliente], [limite_credito], [descuento], [ciudad], [calle_principal], [calle_secundaria], [numero_vivienda], [numero_garante]) VALUES (2, CAST(20000.00 AS Decimal(10, 2)), CAST(20.00 AS Decimal(5, 2)), N'No Ambato', N'Cevallos', NULL, N'12', 1)
INSERT [catalogo].[Cliente] ([numero_cliente], [limite_credito], [descuento], [ciudad], [calle_principal], [calle_secundaria], [numero_vivienda], [numero_garante]) VALUES (3, CAST(10000.00 AS Decimal(10, 2)), CAST(5.00 AS Decimal(5, 2)), N'Guayaquil', N'Cevallos', NULL, N'12', 1)
INSERT [catalogo].[Cliente] ([numero_cliente], [limite_credito], [descuento], [ciudad], [calle_principal], [calle_secundaria], [numero_vivienda], [numero_garante]) VALUES (4, CAST(500.00 AS Decimal(10, 2)), CAST(15.00 AS Decimal(5, 2)), N'Guayas', N'Cevallos', NULL, N'12', 2)
SET IDENTITY_INSERT [catalogo].[Cliente] OFF
GO
SET IDENTITY_INSERT [catalogo].[Producto] ON 

INSERT [catalogo].[Producto] ([numero_producto], [nombre_producto], [existencia_producto], [precio_unitario]) VALUES (1, N'Celular', 10, CAST(200.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [catalogo].[Producto] OFF
GO
SET IDENTITY_INSERT [movimientos].[Cabecera_pedido] ON 

INSERT [movimientos].[Cabecera_pedido] ([numero_cabecera], [fecha_pedido], [numero_cliente], [tipo_ped], [monto_total]) VALUES (2, CAST(N'2020-01-01' AS Date), 1, N'credito', CAST(100.00 AS Decimal(12, 2)))
INSERT [movimientos].[Cabecera_pedido] ([numero_cabecera], [fecha_pedido], [numero_cliente], [tipo_ped], [monto_total]) VALUES (3, CAST(N'2020-05-07' AS Date), 2, N'credito', CAST(8500.00 AS Decimal(12, 2)))
INSERT [movimientos].[Cabecera_pedido] ([numero_cabecera], [fecha_pedido], [numero_cliente], [tipo_ped], [monto_total]) VALUES (5, CAST(N'2020-05-07' AS Date), 4, N'credito', CAST(0.00 AS Decimal(12, 2)))
INSERT [movimientos].[Cabecera_pedido] ([numero_cabecera], [fecha_pedido], [numero_cliente], [tipo_ped], [monto_total]) VALUES (6, CAST(N'2020-05-07' AS Date), 2, N'credito', CAST(1000.00 AS Decimal(12, 2)))
INSERT [movimientos].[Cabecera_pedido] ([numero_cabecera], [fecha_pedido], [numero_cliente], [tipo_ped], [monto_total]) VALUES (7, CAST(N'2020-05-07' AS Date), 2, N'credito', CAST(500.00 AS Decimal(12, 2)))
INSERT [movimientos].[Cabecera_pedido] ([numero_cabecera], [fecha_pedido], [numero_cliente], [tipo_ped], [monto_total]) VALUES (9, CAST(N'2020-07-18' AS Date), 2, N'credito', CAST(4000.00 AS Decimal(12, 2)))
SET IDENTITY_INSERT [movimientos].[Cabecera_pedido] OFF
GO
INSERT [movimientos].[cabezacuerpoP] ([numero_cabecera], [fecha_pedido], [numero_cliente], [precio_unitario], [cantidad], [linea_detalle], [numero_producto]) VALUES (2, CAST(N'2020-01-01' AS Date), 1, CAST(25.00 AS Decimal(10, 2)), 4, 1, 1)
INSERT [movimientos].[cabezacuerpoP] ([numero_cabecera], [fecha_pedido], [numero_cliente], [precio_unitario], [cantidad], [linea_detalle], [numero_producto]) VALUES (3, CAST(N'2020-05-07' AS Date), 2, CAST(500.00 AS Decimal(10, 2)), 2, 6, 1)
INSERT [movimientos].[cabezacuerpoP] ([numero_cabecera], [fecha_pedido], [numero_cliente], [precio_unitario], [cantidad], [linea_detalle], [numero_producto]) VALUES (3, CAST(N'2020-05-07' AS Date), 2, CAST(500.00 AS Decimal(10, 2)), 2, 7, 1)
INSERT [movimientos].[cabezacuerpoP] ([numero_cabecera], [fecha_pedido], [numero_cliente], [precio_unitario], [cantidad], [linea_detalle], [numero_producto]) VALUES (3, CAST(N'2020-05-07' AS Date), 2, CAST(500.00 AS Decimal(10, 2)), 2, 8, 1)
INSERT [movimientos].[cabezacuerpoP] ([numero_cabecera], [fecha_pedido], [numero_cliente], [precio_unitario], [cantidad], [linea_detalle], [numero_producto]) VALUES (3, CAST(N'2020-05-07' AS Date), 2, CAST(100.00 AS Decimal(10, 2)), 5, 11, 1)
INSERT [movimientos].[cabezacuerpoP] ([numero_cabecera], [fecha_pedido], [numero_cliente], [precio_unitario], [cantidad], [linea_detalle], [numero_producto]) VALUES (3, CAST(N'2020-05-07' AS Date), 2, CAST(1000.00 AS Decimal(10, 2)), 5, 12, 1)
INSERT [movimientos].[cabezacuerpoP] ([numero_cabecera], [fecha_pedido], [numero_cliente], [precio_unitario], [cantidad], [linea_detalle], [numero_producto]) VALUES (6, CAST(N'2020-05-07' AS Date), 2, CAST(100.00 AS Decimal(10, 2)), 5, 17, 1)
INSERT [movimientos].[cabezacuerpoP] ([numero_cabecera], [fecha_pedido], [numero_cliente], [precio_unitario], [cantidad], [linea_detalle], [numero_producto]) VALUES (6, CAST(N'2020-05-07' AS Date), 2, CAST(100.00 AS Decimal(10, 2)), 5, 18, 1)
INSERT [movimientos].[cabezacuerpoP] ([numero_cabecera], [fecha_pedido], [numero_cliente], [precio_unitario], [cantidad], [linea_detalle], [numero_producto]) VALUES (7, CAST(N'2020-05-07' AS Date), 2, CAST(100.00 AS Decimal(10, 2)), 5, 19, 1)
INSERT [movimientos].[cabezacuerpoP] ([numero_cabecera], [fecha_pedido], [numero_cliente], [precio_unitario], [cantidad], [linea_detalle], [numero_producto]) VALUES (9, CAST(N'2020-07-18' AS Date), 2, CAST(200.00 AS Decimal(10, 2)), 4, 20, 1)
INSERT [movimientos].[cabezacuerpoP] ([numero_cabecera], [fecha_pedido], [numero_cliente], [precio_unitario], [cantidad], [linea_detalle], [numero_producto]) VALUES (9, CAST(N'2020-07-18' AS Date), 2, CAST(800.00 AS Decimal(10, 2)), 4, 23, 1)
GO
SET IDENTITY_INSERT [movimientos].[Cuerpo_pedido] ON 

INSERT [movimientos].[Cuerpo_pedido] ([precio_unitario], [cantidad], [linea_detalle], [numero_cabecera], [numero_producto]) VALUES (CAST(25.00 AS Decimal(10, 2)), 4, 1, 2, 1)
INSERT [movimientos].[Cuerpo_pedido] ([precio_unitario], [cantidad], [linea_detalle], [numero_cabecera], [numero_producto]) VALUES (CAST(500.00 AS Decimal(10, 2)), 2, 6, 3, 1)
INSERT [movimientos].[Cuerpo_pedido] ([precio_unitario], [cantidad], [linea_detalle], [numero_cabecera], [numero_producto]) VALUES (CAST(500.00 AS Decimal(10, 2)), 2, 7, 3, 1)
INSERT [movimientos].[Cuerpo_pedido] ([precio_unitario], [cantidad], [linea_detalle], [numero_cabecera], [numero_producto]) VALUES (CAST(500.00 AS Decimal(10, 2)), 2, 8, 3, 1)
INSERT [movimientos].[Cuerpo_pedido] ([precio_unitario], [cantidad], [linea_detalle], [numero_cabecera], [numero_producto]) VALUES (CAST(100.00 AS Decimal(10, 2)), 5, 11, 3, 1)
INSERT [movimientos].[Cuerpo_pedido] ([precio_unitario], [cantidad], [linea_detalle], [numero_cabecera], [numero_producto]) VALUES (CAST(1000.00 AS Decimal(10, 2)), 5, 12, 3, 1)
INSERT [movimientos].[Cuerpo_pedido] ([precio_unitario], [cantidad], [linea_detalle], [numero_cabecera], [numero_producto]) VALUES (CAST(100.00 AS Decimal(10, 2)), 5, 17, 6, 1)
INSERT [movimientos].[Cuerpo_pedido] ([precio_unitario], [cantidad], [linea_detalle], [numero_cabecera], [numero_producto]) VALUES (CAST(100.00 AS Decimal(10, 2)), 5, 18, 6, 1)
INSERT [movimientos].[Cuerpo_pedido] ([precio_unitario], [cantidad], [linea_detalle], [numero_cabecera], [numero_producto]) VALUES (CAST(100.00 AS Decimal(10, 2)), 5, 19, 7, 1)
INSERT [movimientos].[Cuerpo_pedido] ([precio_unitario], [cantidad], [linea_detalle], [numero_cabecera], [numero_producto]) VALUES (CAST(200.00 AS Decimal(10, 2)), 4, 20, 9, 1)
INSERT [movimientos].[Cuerpo_pedido] ([precio_unitario], [cantidad], [linea_detalle], [numero_cabecera], [numero_producto]) VALUES (CAST(800.00 AS Decimal(10, 2)), 4, 23, 9, 1)
SET IDENTITY_INSERT [movimientos].[Cuerpo_pedido] OFF
GO
INSERT [movimientos].[Deudor] ([numero_cliente], [numero_garante], [limite_credito], [saldo_deudor]) VALUES (2, 1, CAST(20000.00 AS Decimal(10, 2)), CAST(4500.00 AS Decimal(10, 2)))
GO
INSERT [movimientos].[Pagos] ([numero_cliente], [fecha_pago], [valor_pago], [numero_pago]) VALUES (2, CAST(N'2020-02-02' AS Date), CAST(500.00 AS Decimal(10, 2)), 1)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [telefono1]    Script Date: 7/18/2020 12:35:00 PM ******/
ALTER TABLE [catalogo].[Fabrica] ADD  CONSTRAINT [telefono1] UNIQUE NONCLUSTERED 
(
	[telefono1] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Secundario]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [telefono2]    Script Date: 7/18/2020 12:35:00 PM ******/
ALTER TABLE [catalogo].[Fabrica] ADD  CONSTRAINT [telefono2] UNIQUE NONCLUSTERED 
(
	[telefono2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Secundario]
GO
ALTER TABLE [movimientos].[Cabecera_pedido] ADD  CONSTRAINT [DF_monto_total]  DEFAULT ((0)) FOR [monto_total]
GO
ALTER TABLE [catalogo].[Cliente]  WITH CHECK ADD  CONSTRAINT [FK_numero_garante] FOREIGN KEY([numero_garante])
REFERENCES [catalogo].[Cliente] ([numero_cliente])
GO
ALTER TABLE [catalogo].[Cliente] CHECK CONSTRAINT [FK_numero_garante]
GO
ALTER TABLE [movimientos].[Cabecera_pedido]  WITH CHECK ADD  CONSTRAINT [genera] FOREIGN KEY([numero_cliente])
REFERENCES [catalogo].[Cliente] ([numero_cliente])
ON UPDATE CASCADE
GO
ALTER TABLE [movimientos].[Cabecera_pedido] CHECK CONSTRAINT [genera]
GO
ALTER TABLE [movimientos].[Cuerpo_pedido]  WITH CHECK ADD  CONSTRAINT [consta] FOREIGN KEY([numero_producto])
REFERENCES [catalogo].[Producto] ([numero_producto])
ON UPDATE CASCADE
GO
ALTER TABLE [movimientos].[Cuerpo_pedido] CHECK CONSTRAINT [consta]
GO
ALTER TABLE [movimientos].[Cuerpo_pedido]  WITH CHECK ADD  CONSTRAINT [contiene] FOREIGN KEY([numero_cabecera])
REFERENCES [movimientos].[Cabecera_pedido] ([numero_cabecera])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [movimientos].[Cuerpo_pedido] CHECK CONSTRAINT [contiene]
GO
ALTER TABLE [movimientos].[Fabrica_distribuye_producto]  WITH CHECK ADD  CONSTRAINT [distribuye] FOREIGN KEY([numero_fabrica])
REFERENCES [catalogo].[Fabrica] ([numero_fabrica])
ON UPDATE CASCADE
GO
ALTER TABLE [movimientos].[Fabrica_distribuye_producto] CHECK CONSTRAINT [distribuye]
GO
ALTER TABLE [movimientos].[Fabrica_distribuye_producto]  WITH CHECK ADD  CONSTRAINT [es_agregado_de] FOREIGN KEY([numero_producto])
REFERENCES [catalogo].[Producto] ([numero_producto])
ON UPDATE CASCADE
GO
ALTER TABLE [movimientos].[Fabrica_distribuye_producto] CHECK CONSTRAINT [es_agregado_de]
GO
ALTER TABLE [movimientos].[Cabecera_pedido]  WITH CHECK ADD  CONSTRAINT [check_tipo_ped] CHECK  (([tipo_ped]='credito' OR [tipo_ped]='contado'))
GO
ALTER TABLE [movimientos].[Cabecera_pedido] CHECK CONSTRAINT [check_tipo_ped]
GO
/****** Object:  Trigger [movimientos].[actualizarCabecera]    Script Date: 7/18/2020 12:35:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE TRIGGER [movimientos].[actualizarCabecera] 
ON [movimientos].[Cabecera_pedido]
AFTER UPDATE
AS
	BEGIN
	DECLARE @nuevo_numero_cabecera int,
			@nuevo_numero_cliente int,
			@nuevo_fecha_pedido date

	SELECT 
	@nuevo_numero_cabecera = numero_cabecera,
	@nuevo_numero_cliente = numero_cliente,
	@nuevo_fecha_pedido = fecha_pedido
	FROM inserted


	UPDATE movimientos.cabezacuerpoP SET 
	numero_cabecera = @nuevo_numero_cabecera,
	numero_cliente = @nuevo_numero_cliente,
	fecha_pedido = @nuevo_fecha_pedido
	where numero_cabecera = (select del.numero_cabecera from deleted del)
	END
GO
ALTER TABLE [movimientos].[Cabecera_pedido] ENABLE TRIGGER [actualizarCabecera]
GO
/****** Object:  Trigger [movimientos].[crearCabecera]    Script Date: 7/18/2020 12:35:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [movimientos].[crearCabecera]
ON [movimientos].[Cabecera_pedido]
after INSERT
AS
	
	BEGIN 
		DECLARE @tipo_ped varchar(10),
				@numero_cliente int,
				@numero_garante int,
				@limite_credito decimal(10,2)
				

		SELECT
		@tipo_ped = tipo_ped,
		@numero_cliente = numero_cliente
		FROM inserted

		SELECT
		@numero_garante = numero_garante,
		@limite_credito = limite_credito
		FROM catalogo.cliente
		WHERE numero_cliente = @numero_cliente

				IF @tipo_ped = 'credito'
					BEGIN
					SELECT numero_cliente FROM movimientos.Deudor
					WHERE numero_cliente = @numero_garante
					IF @@ROWCOUNT = 0
						BEGIN
						SELECT numero_cliente FROM movimientos.Deudor
						WHERE numero_cliente = @numero_cliente
						IF @@ROWCOUNT = 0
							BEGIN
								INSERT INTO movimientos.Deudor values(@numero_cliente, @numero_garante, @limite_credito, 0)	
						END			
					END
					ELSE
						BEGIN
							ROLLBACK TRANSACTION;
							RAISERROR ('El garante es un deudor',1,1)
							RETURN
						END
				END			
	END
GO
ALTER TABLE [movimientos].[Cabecera_pedido] ENABLE TRIGGER [crearCabecera]
GO
/****** Object:  Trigger [movimientos].[actualizar_monto_total]    Script Date: 7/18/2020 12:35:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [movimientos].[actualizar_monto_total] 
ON [movimientos].[Cuerpo_pedido]
AFTER INSERT
AS
	BEGIN
	DECLARE @precio_unitario decimal(10,2),
			@cantidad int,
			@numero_cabecera int

	SELECT
	@precio_unitario = precio_unitario,
	@cantidad = cantidad,
	@numero_cabecera = numero_cabecera
	FROM inserted

	UPDATE movimientos.Cabecera_pedido
	SET monto_total = monto_total + (@precio_unitario * @cantidad)
	WHERE numero_cabecera =  @numero_cabecera

	END
GO
ALTER TABLE [movimientos].[Cuerpo_pedido] ENABLE TRIGGER [actualizar_monto_total]
GO
/****** Object:  Trigger [movimientos].[actualizar_saldo_monto]    Script Date: 7/18/2020 12:35:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [movimientos].[actualizar_saldo_monto]
ON [movimientos].[Cuerpo_pedido] 
FOR INSERT
AS
	DECLARE @precio_unitario decimal(10,2),
			@cantidad int,
			@saldo_deudor decimal(10,2),
			@numero_cliente int,
			@limite_credito decimal(10,2),
			@numero_cabecera int,
			@total decimal (10,2)

	SELECT
	@precio_unitario = precio_unitario,
	@cantidad = cantidad,
	@numero_cabecera = numero_cabecera
	FROM inserted

	SELECT
	@numero_cliente = numero_cliente
	FROM movimientos.Cabecera_pedido
	WHERE numero_cabecera = @numero_cabecera
		
	SELECT 
	@limite_credito = limite_credito,
	@saldo_deudor = saldo_deudor
	FROM movimientos.Deudor
	WHERE numero_cliente = @numero_cliente

	SET @total = ((@precio_unitario * @cantidad) + @saldo_deudor)

	BEGIN 
	IF (@total < @limite_credito)
		BEGIN
		UPDATE movimientos.Deudor
		SET saldo_deudor = (saldo_deudor + (@precio_unitario * @cantidad))
		WHERE numero_cliente = @numero_cliente
		END
	ELSE
		BEGIN
		ROLLBACK TRANSACTION
		RAISERROR ('El saldo excede el limite de crédito',1,1)
		RETURN
		END

	END
GO
ALTER TABLE [movimientos].[Cuerpo_pedido] ENABLE TRIGGER [actualizar_saldo_monto]
GO
/****** Object:  Trigger [movimientos].[actualizarCuerpo]    Script Date: 7/18/2020 12:35:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE TRIGGER [movimientos].[actualizarCuerpo] 
ON [movimientos].[Cuerpo_pedido]
AFTER UPDATE
AS
	BEGIN
	DECLARE @nuevo_numero_cabecera int,
			@nuevo_numero_cliente int,
			@nuevo_fecha_pedido date,
			@nuevo_linea_detalle int,
			@nuevo_precio_unitario decimal(10,2),
			@nuevo_cantidad int,
			@nuevo_numero_producto int

	SELECT 
	@nuevo_numero_cabecera = numero_cabecera,
	@nuevo_numero_cliente = numero_cliente,
	@nuevo_fecha_pedido = fecha_pedido
	FROM movimientos.Cabecera_pedido cab
	WHERE cab.numero_cabecera = (SELECT numero_cabecera FROM deleted)
	
	SELECT 
	@nuevo_linea_detalle = linea_detalle,
	@nuevo_precio_unitario = precio_unitario,
	@nuevo_cantidad = cantidad,
	@nuevo_numero_producto = numero_producto
	FROM inserted 
	


	UPDATE movimientos.cabezacuerpoP SET 
	numero_cabecera = @nuevo_numero_cabecera,
	numero_cliente = @nuevo_numero_cliente,
	fecha_pedido = @nuevo_fecha_pedido,
	linea_detalle = @nuevo_linea_detalle,
	precio_unitario = @nuevo_precio_unitario,
	cantidad = @nuevo_cantidad,
	numero_producto = @nuevo_numero_producto
	WHERE linea_detalle = (SELECT del.linea_detalle FROM deleted del)
	END

GO
ALTER TABLE [movimientos].[Cuerpo_pedido] ENABLE TRIGGER [actualizarCuerpo]
GO
/****** Object:  Trigger [movimientos].[insertarCuerpo]    Script Date: 7/18/2020 12:35:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE TRIGGER [movimientos].[insertarCuerpo] 
ON [movimientos].[Cuerpo_pedido]
AFTER INSERT
AS
	BEGIN
	INSERT INTO movimientos.cabezacuerpoP
	(precio_unitario,
	cantidad,
	linea_detalle,
	numero_producto,
	numero_cabecera,
	fecha_pedido,
	numero_cliente)
	SELECT
	ins.precio_unitario,
	ins.cantidad,
	ins.linea_detalle,
	ins.numero_producto,
	cab.numero_cabecera,
	cab.fecha_pedido,
	cab.numero_cliente
	FROM INSERTED ins
	JOIN movimientos.Cabecera_pedido cab
	ON ins.numero_cabecera = cab.numero_cabecera

	END

GO
ALTER TABLE [movimientos].[Cuerpo_pedido] ENABLE TRIGGER [insertarCuerpo]
GO
/****** Object:  Trigger [movimientos].[pago_realizado]    Script Date: 7/18/2020 12:35:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [movimientos].[pago_realizado]
ON [movimientos].[Pagos]
AFTER INSERT
AS
BEGIN
	DECLARE @numero_cliente int,
			@valor_pago decimal(10,2),
			@saldo_deudor decimal(10,2)
	SELECT
	@numero_cliente = numero_cliente,
	@valor_pago = valor_pago
	FROM inserted

	SELECT
	@saldo_deudor = saldo_deudor
	FROM movimientos.Deudor

	IF @saldo_deudor - @valor_pago = 0
		DELETE FROM movimientos.Deudor
		WHERE numero_cliente = @numero_cliente
	ELSE
		UPDATE movimientos.Deudor
		SET	saldo_deudor = saldo_deudor - @valor_pago
		WHERE numero_cliente = @numero_cliente

END
GO
ALTER TABLE [movimientos].[Pagos] ENABLE TRIGGER [pago_realizado]
GO
USE [master]
GO
ALTER DATABASE [Pedidos] SET  READ_WRITE 
GO
