use Produccion_Pedidos
go

ALTER DATABASE Produccion_Pedidos
ADD FILEGROUP Pedidos_FG3
GO
ALTER DATABASE Produccion_Pedidos
ADD FILE
(
	NAME = Pedidos_Terciario,
	FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.DBMSG5\MSSQL\DATA\Pedidos_Terciario.ndf',
	SIZE = 5MB,
	MAXSIZE = 10MB,
	FILEGROWTH = 10%
)
TO FILEGROUP Pedidos_FG3;
GO
