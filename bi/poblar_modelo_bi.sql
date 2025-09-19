USE bd_logistic_kpi;
GO

--==========================================================================--
--                             CARGA DE DIMENSIONES                             --
--==========================================================================--


-- DIMENSION PRODUCTO
--INSERT INTO DimProducto (id_producto, nombre, unidad_medida, tipo, stock_minimo)
SELECT 
    p.id,
    p.nombre,
    u.abreviatura,
    p.tipo,
    p.stock_minimo
FROM productos p
INNER JOIN unidad_medida u ON p.unidad_medida_id = u.id;

-- DIMENSION EMPLEADO
--INSERT INTO DimEmpleado (id_empleado, nombres, apellidos, cargo, email, numero_registro)
SELECT 
    e.id,
    e.nombres,
    e.apellidos,
    e.cargo,
    e.email,
    e.numero_registro
FROM empleado e;

-- DIMENSION PROYECTO
--INSERT INTO DimProyecto (id_proyecto, nombre_proyecto, ubicacion, estado_proyecto, fecha_inicio)
SELECT 
    pr.id,
    pr.nombre_proyecto,
    pr.ubicacion,
    pr.estado_proyecto,
    pr.fecha_inicio
FROM proyectos pr;

-- DIMENSION TIPO MOVIMIENTO
--INSERT INTO DimTipoMovimiento (id_tipo_movimiento, nombre, descripcion)
SELECT 
    tm.id,
    tm.nombre,
    tm.descripcion
FROM tipo_movimiento tm;

-- DIMENSION TIPO ALERTA
--INSERT INTO DimTipoAlerta (id_tipo_alerta, nombre, descripcion)
SELECT 
    ta.id,
    ta.nombre,
    ta.descripcion
FROM tipo_alerta ta;

-- DIMENSION ESTADO ALERTA
--INSERT INTO DimEstadoAlerta (id_estado_alerta, nombre, descripcion)
SELECT 
    ea.id,
    ea.nombre,
    ea.descripcion
FROM estado_alerta ea;

-- DIMENSION TIEMPO
--INSERT INTO DimTiempo (id_tiempo, fecha, dia, mes, trimestre, anio, dia_semana)
SELECT DISTINCT
    CONVERT(INT, FORMAT(m.fecha_movimiento, 'yyyyMMdd')) AS id_tiempo,
    m.fecha_movimiento AS fecha,
    DAY(m.fecha_movimiento) AS dia,
    MONTH(m.fecha_movimiento) AS mes,
    DATEPART(QUARTER, m.fecha_movimiento) AS trimestre,
    YEAR(m.fecha_movimiento) AS anio,
    DATENAME(WEEKDAY, m.fecha_movimiento)
FROM movimiento m
UNION
SELECT DISTINCT
    CONVERT(INT, FORMAT(a.fecha_alerta, 'yyyyMMdd')),
    a.fecha_alerta,
    DAY(a.fecha_alerta),
    MONTH(a.fecha_alerta),
    DATEPART(QUARTER, a.fecha_alerta),
    YEAR(a.fecha_alerta),
    DATENAME(WEEKDAY, a.fecha_alerta)
FROM alerta a;


--==========================================================================--
--                             CARGA DE HECHOS                             --
--==========================================================================--

--//////////////////////////////////////////////////////////////////////////--

--INSERT INTO HechoMovimientos (
    id_producto,
    id_empleado,
    id_proyecto,
    id_tipo_movimiento,
    id_tiempo,
    cantidad,
    stock_actual
)

SELECT 
    m.productos_id,
    m.empleado_id,
    m.proyectos_id,
    m.tipo_movimiento_id,
    CONVERT(INT, FORMAT(m.fecha_movimiento, 'yyyyMMdd')) AS id_tiempo,
    m.cantidad,
    p.stock_actual
FROM movimiento m
INNER JOIN productos p ON m.productos_id = p.id;

--//////////////////////////////////////////////////////////////////////////--

--INSERT INTO HechoAlertas (
    id_producto,
    id_tipo_alerta,
    id_estado_alerta,
    id_tiempo,
    mensaje
)

SELECT 
    a.productos_id,
    a.tipo_alerta_id,
    a.estado_alerta_id,
    CONVERT(INT, FORMAT(a.fecha_alerta, 'yyyyMMdd')) AS id_tiempo,
    a.mensaje
FROM alerta a;
