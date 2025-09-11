USE bd_logistic_kpi;
GO

--Tipos de movimiento
SELECT*FROM tipo_movimiento;

INSERT INTO tipo_movimiento VALUES ('Entrada', 'Movimientos de entrada');
INSERT INTO tipo_movimiento VALUES ('Salida', 'Movimientos de salida');