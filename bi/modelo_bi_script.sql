
CREATE DATABASE dw_bd_logistic_kpi;
GO

USE dw_bd_logistic_kpi;

/* ============================================================
   TABLAS DIMENSIONES
   ============================================================ */

-- DimProducto
CREATE TABLE DimProducto (
    id_producto INT IDENTITY (1,1) PRIMARY KEY,
    nombre NVARCHAR(100),
    unidad_medida NVARCHAR(50),
    tipo NVARCHAR(50),
    stock_minimo INT
);

-- DimEmpleado
CREATE TABLE DimEmpleado (
    id_empleado INT IDENTITY (1,1) PRIMARY KEY,
    nombres NVARCHAR(100),
    apellidos NVARCHAR(100),
    cargo NVARCHAR(50),
    email NVARCHAR(100),
    numero_registro NVARCHAR(50)
);

-- DimProyecto
CREATE TABLE DimProyecto (
    id_proyecto INT IDENTITY (1,1) PRIMARY KEY,
    nombre_proyecto NVARCHAR(100),
    ubicacion NVARCHAR(100),
    estado_proyecto NVARCHAR(50),
    fecha_inicio DATE
);

-- DimTipoMovimiento
CREATE TABLE DimTipoMovimiento (
    id_tipo_movimiento INT IDENTITY (1,1) PRIMARY KEY,
    nombre NVARCHAR(50),
    descripcion NVARCHAR(200)
);

-- DimTipoAlerta
CREATE TABLE DimTipoAlerta (
    id_tipo_alerta INT IDENTITY (1,1) PRIMARY KEY,
    nombre NVARCHAR(50),
    descripcion NVARCHAR(200)
);

-- DimEstadoAlerta
CREATE TABLE DimEstadoAlerta (
    id_estado_alerta INT IDENTITY (1,1) PRIMARY KEY,
    nombre NVARCHAR(50),
    descripcion NVARCHAR(200)
);

-- DimTiempo
CREATE TABLE DimTiempo (
    id_tiempo INT IDENTITY (1,1) PRIMARY KEY, -- formato AAAAMMDD
    fecha DATE,
    dia INT,
    mes INT,
    trimestre INT,
    anio INT,
    dia_semana NVARCHAR(20)
);

/* ============================================================
   TABLAS DE HECHOS
   ============================================================ */

-- HechoMovimientos
CREATE TABLE HechoMovimientos (
    id_hecho_movimiento INT IDENTITY(1,1) PRIMARY KEY,
    id_producto INT,
    id_empleado INT,
    id_proyecto INT,
    id_tipo_movimiento INT,
    id_tiempo INT,
    cantidad INT,
    stock_actual INT,
    FOREIGN KEY (id_producto) REFERENCES DimProducto(id_producto),
    FOREIGN KEY (id_empleado) REFERENCES DimEmpleado(id_empleado),
    FOREIGN KEY (id_proyecto) REFERENCES DimProyecto(id_proyecto),
    FOREIGN KEY (id_tipo_movimiento) REFERENCES DimTipoMovimiento(id_tipo_movimiento),
    FOREIGN KEY (id_tiempo) REFERENCES DimTiempo(id_tiempo)
);

-- HechoAlertas
CREATE TABLE HechoAlertas (
    id_hecho_alerta INT IDENTITY(1,1) PRIMARY KEY,
    id_producto INT,
    id_tipo_alerta INT,
    id_estado_alerta INT,
    id_tiempo INT,
    mensaje NVARCHAR(255),
    FOREIGN KEY (id_producto) REFERENCES DimProducto(id_producto),
    FOREIGN KEY (id_tipo_alerta) REFERENCES DimTipoAlerta(id_tipo_alerta),
    FOREIGN KEY (id_estado_alerta) REFERENCES DimEstadoAlerta(id_estado_alerta),
    FOREIGN KEY (id_tiempo) REFERENCES DimTiempo(id_tiempo)
);
