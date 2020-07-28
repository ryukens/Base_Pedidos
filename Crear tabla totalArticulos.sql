use Produccion_Pedidos
go

CREATE SCHEMA Articulos
GO

CREATE TABLE Articulos.totalArticulos(
	 [idArticulo] Int NOT NULL PRIMARY KEY,
	 [total_pedidos] Int NOT NULL
)
ON[Test_Pedidos_FG3]
GO	

CREATE TRIGGER movimientos.gestionar_total_articulos
ON movimientos.Cuerpo_pedido
AFTER INSERT, UPDATE, DELETE
AS
	BEGIN
		IF EXISTS (SELECT * FROM inserted inner join deleted on inserted.numero_producto = deleted.numero_producto)
			UPDATE Articulos.totalArticulos SET
			total_pedidos = total_pedidos + ((select cantidad from inserted) - (select cantidad from deleted))
			where idArticulo = (select numero_producto from inserted)
		ELSE 
			IF EXISTS(SELECT * FROM inserted)
				IF EXISTS (SELECT * FROM Articulos.totalArticulos WHERE idArticulo = (SELECT numero_producto FROM inserted))
					UPDATE Articulos.totalArticulos SET
					total_pedidos = total_pedidos + (select cantidad from inserted)
					WHERE idArticulo = (select numero_producto from inserted)
				ELSE
					INSERT INTO Articulos.totalArticulos VALUES ((select numero_producto from inserted), (select cantidad from inserted))
			ELSE
				UPDATE Articulos.totalArticulos SET
				total_pedidos = total_pedidos - (select cantidad from deleted)
				WHERE idArticulo = (select numero_producto from deleted)
	END
GO