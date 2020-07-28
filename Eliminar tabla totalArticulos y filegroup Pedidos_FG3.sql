USE Produccion_Pedidos
GO

DROP TABLE Articulos.totalArticulos
GO

ALTER DATABASE Produccion_Pedidos
REMOVE FILE Pedidos_Terciario
GO

ALTER DATABASE Produccion_Pedidos
REMOVE FILEGROUP Pedidos_FG3
GO