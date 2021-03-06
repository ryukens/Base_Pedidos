USE [Test_Pedidos]
GO
/****** Object:  Table [catalogo].[Fabrica]    Script Date: 27/07/2020 21:17:28 ******/
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
SET ANSI_PADDING ON
GO
/****** Object:  Index [telefono1]    Script Date: 27/07/2020 21:17:28 ******/
ALTER TABLE [catalogo].[Fabrica] ADD  CONSTRAINT [telefono1] UNIQUE NONCLUSTERED 
(
	[telefono1] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Secundario]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [telefono2]    Script Date: 27/07/2020 21:17:28 ******/
ALTER TABLE [catalogo].[Fabrica] ADD  CONSTRAINT [telefono2] UNIQUE NONCLUSTERED 
(
	[telefono2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Secundario]
GO
