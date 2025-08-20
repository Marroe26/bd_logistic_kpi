-- Creación base de datos
CREATE DATABASE bd_logistic_kpi;
-- DROP DATABASE bd_logistic_kpi;

USE bd_logistic_kpi;

-- Creación de tablas
	-- Tipos de indicador
CREATE TABLE tipo_movimiento (
id INT IDENTITY (1,1) PRIMARY KEY,
nombre VARCHAR (20) UNIQUE NOT NULL,
descripcion VARCHAR (MAX) NULL
);


   -- Unidad de medida
CREATE TABLE unidad_medida (
id INT IDENTITY (1,1) PRIMARY KEY,
nombre VARCHAR (255) NOT NULL,
abreviatura VARCHAR (5) NULL
);


-- Para verificar los detalles de las tablas
EXEC sp_help tipo_movimiento
EXEC sp_help unidad_medida
