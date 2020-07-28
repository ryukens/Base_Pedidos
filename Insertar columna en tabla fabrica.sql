



ALTER TABLE movimientos.Fabrica_distribuye_producto
DROP CONSTRAINT distribuye
go

DROP TABLE catalogo.Fabrica
GO



CREATE TABLE [catalogo].[Fabrica]
(
 [numero_fabrica] Int IDENTITY(1,1) NOT NULL,
 [contacto] Varchar(256) NOT NULL,
 [nombre_fabrica] Varchar(60) NOT NULL,
 [telefono1] Varchar(10) NOT NULL,
 [telefono2] Varchar(10) NOT NULL
)
ON [Secundario]
go

ALTER TABLE [catalogo].[Fabrica] ADD CONSTRAINT [Unique_Identifier3] PRIMARY KEY ([numero_fabrica])
go

ALTER TABLE [catalogo].[Fabrica] ADD CONSTRAINT [telefono1] UNIQUE ([telefono1])
go

ALTER TABLE [catalogo].[Fabrica] ADD CONSTRAINT [telefono2] UNIQUE ([telefono2])
go

ALTER TABLE [movimientos].[Fabrica_distribuye_producto] ADD CONSTRAINT [distribuye] FOREIGN KEY ([numero_fabrica]) REFERENCES [catalogo].[Fabrica] ([numero_fabrica]) ON UPDATE CASCADE ON DELETE NO ACTION
go