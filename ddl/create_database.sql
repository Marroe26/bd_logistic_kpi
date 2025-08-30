-- Creación base de datos
CREATE DATABASE bd_logistic_kpi;
-- DROP DATABASE bd_logistic_kpi;

USE bd_logistic_kpi;
 
-- Creación de tablas
	-- 1. Tipos de movimiento
CREATE TABLE tipo_movimiento (
id INT IDENTITY (1,1) PRIMARY KEY,
nombre VARCHAR (20) UNIQUE NOT NULL,
descripcion VARCHAR (MAX) NULL
);

   -- 2. Unidad de medida
CREATE TABLE unidad_medida (
id INT IDENTITY (1,1) PRIMARY KEY,
nombre VARCHAR (20) UNIQUE NOT NULL,
abreviatura VARCHAR (5) UNIQUE NOT NULL
);

   -- 3. Empleados
CREATE TABLE empleado (
id INT IDENTITY (1,1) PRIMARY KEY,
nombres VARCHAR (100) NOT NULL,
apellidos VARCHAR (100) NOT NULL,
numero_registro VARCHAR (6) UNIQUE NOT NULL,
cargo VARCHAR (100) NOT NULL,
email VARCHAR (100) UNIQUE NOT NULL
);

   -- 4. Proyectos 
CREATE TABLE proyectos (
id INT IDENTITY (1,1) PRIMARY KEY,
nombre_proyecto VARCHAR (255) UNIQUE NOT NULL,
ubicacion VARCHAR (255) NOT NULL,
fecha_inicio DATE,
estado_proyecto VARCHAR (255) NOT NULL
);

 -- 5. Productos
CREATE TABLE productos (
id INT IDENTITY (1,1) PRIMARY KEY,
unidad_medida_id INT FOREIGN KEY REFERENCES unidad_medida (id),
nombre VARCHAR (100) UNIQUE NOT NULL,
stock_minimo INT NOT NULL,
tipo VARCHAR (50) NOT NULL
);

 -- 6. Alertas
CREATE TABLE alerta (
id INT IDENTITY (1,1) PRIMARY KEY,
productos_id INT FOREIGN KEY REFERENCES productos (id),
fecha_alerta DATE,
tipo_alerta VARCHAR (50) NOT NULL, --(Stock bajo/ Quiebre total)
mensaje VARCHAR (50) NULL,
estado_alerta VARCHAR (50) NOT NULL --(Pendiente/ Atendida)
);

 -- 7. Movimientos
CREATE TABLE movimiento (
id INT IDENTITY (1,1) PRIMARY KEY,
productos_id INT FOREIGN KEY REFERENCES productos (id),
empleado_id INT FOREIGN KEY REFERENCES empleado (id),
proyectos_id INT FOREIGN KEY REFERENCES proyectos (id),
tipo_movimiento_id INT FOREIGN KEY REFERENCES tipo_movimiento (id),
tipo_movimiento VARCHAR (50) NOT NULL, --(Entrada/ Salida)
cantidad INT,
fecha_movimiento DATE,
);



-- Para verificar los detalles de las tablas
EXEC sp_help tipo_movimiento
EXEC sp_help unidad_medida
EXEC sp_help empresa
EXEC sp_help proyectos
EXEC sp_help productos
