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

   -- 3. Empleado
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

  -- 6. Alerta
CREATE TABLE alerta (
id INT IDENTITY (1,1) PRIMARY KEY,
productos_id INT FOREIGN KEY REFERENCES productos (id),
fecha_alerta DATE,
tipo_alerta VARCHAR (50) NOT NULL, --(Stock bajo/ Quiebre total)
mensaje VARCHAR (50) NULL,
estado_alerta VARCHAR (50) NOT NULL --(Pendiente/ Atendida)
);

  -- 7. Movimiento
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

  -- 8. Tipos de alerta
CREATE TABLE tipo_alerta (
id INT IDENTITY (1,1) PRIMARY KEY,
nombre VARCHAR (20) UNIQUE NOT NULL,
descripcion VARCHAR (MAX) NULL
);

  -- 9. Estado de alerta
CREATE TABLE estado_alerta (
id INT IDENTITY (1,1) PRIMARY KEY,
nombre VARCHAR (20) UNIQUE NOT NULL,
descripcion VARCHAR (MAX) NULL
);

-- Modificaciones después de feedback ChatGPT

USE bd_logistic_kpi;
GO

 ALTER TABLE movimiento
 DROP COLUMN tipo_movimiento;

 ALTER TABLE productos
 ADD stock_actual INT NOT NULL;

 ALTER TABLE alerta
 DROP COLUMN tipo_alerta;

 ALTER TABLE alerta
 DROP COLUMN estado_alerta;

 ALTER TABLE alerta ADD tipo_alerta_id INT NULL;
 ALTER TABLE alerta ADD estado_alerta_id INT NULL;

 ALTER TABLE alerta
 ADD CONSTRAINT FK_alerta_tipo 
 FOREIGN KEY (tipo_alerta_id) 
 REFERENCES tipo_alerta(id);

 ALTER TABLE alerta
 ADD CONSTRAINT FK_alerta_estado 
 FOREIGN KEY (estado_alerta_id) 
 REFERENCES estado_alerta(id);

 ALTER TABLE alerta
 ALTER COLUMN mensaje VARCHAR(255);



 --ALTER TABLE alerta ALTER COLUMN tipo_alerta_id INT NOT NULL;
--ALTER TABLE alerta ALTER COLUMN estado_alerta_id INT NOT NULL;

 --ALTER TABLE nombre_tabla_hija
 --ADD CONSTRAINT fk_nombre_restriccion
 --FOREIGN KEY (nombre_columna_hija)
 --REFERENCES nombre_tabla_padre (nombre_columna_padre);


-- Para verificar los detalles de las tablas
EXEC sp_help tipo_movimiento
EXEC sp_help unidad_medida
EXEC sp_help empresa
EXEC sp_help proyectos
EXEC sp_help productos
EXEC sp_help movimiento
EXEC sp_help alerta
EXEC sp_help tipo_alerta
EXEC sp_help estado_alerta
