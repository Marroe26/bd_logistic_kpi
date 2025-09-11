USE bd_logistic_kpi;
GO

--Tipos de movimiento
SELECT*FROM tipo_movimiento;

INSERT INTO tipo_movimiento VALUES ('Entrada', 'Movimientos de entrada');
INSERT INTO tipo_movimiento VALUES ('Salida', 'Movimientos de salida');


--Tipos de alerta
SELECT*FROM tipo_alerta;

INSERT INTO tipo_alerta VALUES ('Stock m�nimo', 'Producto ha alcanzado o bajado el stock min.');
INSERT INTO tipo_alerta VALUES ('Stock agotado', 'Producto sin unidades disponibles');
INSERT INTO tipo_alerta VALUES ('Vencimiento pr�ximo', 'Producto con fecha de vencimiento cercana');
INSERT INTO tipo_alerta VALUES ('Sobre stock', 'Exceso de unidades en inventario');

--Estado de alerta
SELECT*FROM estado_alerta;

INSERT INTO estado_alerta VALUES ('Activa', 'La alerta est� vigente y requiere atenci�n');
INSERT INTO estado_alerta VALUES ('En proceso', 'Se est� gestionando la alerta');
INSERT INTO estado_alerta VALUES ('Resuelta', 'Ya se tom� acci�n correctiva');
INSERT INTO estado_alerta VALUES ('Cerrada', 'La alerta fue revisada y archivada');