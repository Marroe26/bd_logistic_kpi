

-- //////////////////////////////  COMPLETAR DATOS EN TABLAS  //////////////////////////////  --

USE bd_logistic_kpi;
GO

-- ================================================================================================
--Tipos de movimiento
SELECT*FROM tipo_movimiento;

INSERT INTO tipo_movimiento VALUES ('Entrada', 'Movimientos de entrada');
INSERT INTO tipo_movimiento VALUES ('Salida', 'Movimientos de salida');

-- ================================================================================================
--Tipos de alerta
SELECT*FROM tipo_alerta;

INSERT INTO tipo_alerta VALUES ('Stock mínimo', 'Producto ha alcanzado o bajado el stock min.');
INSERT INTO tipo_alerta VALUES ('Stock agotado', 'Producto sin unidades disponibles');
INSERT INTO tipo_alerta VALUES ('Vencimiento próximo', 'Producto con fecha de vencimiento cercana');
INSERT INTO tipo_alerta VALUES ('Sobre stock', 'Exceso de unidades en inventario');

-- ================================================================================================
--Estado de alerta
SELECT*FROM estado_alerta;

INSERT INTO estado_alerta VALUES ('Activa', 'La alerta está vigente y requiere atención');
INSERT INTO estado_alerta VALUES ('En proceso', 'Se está gestionando la alerta');
INSERT INTO estado_alerta VALUES ('Resuelta', 'Ya se tomó acción correctiva');
INSERT INTO estado_alerta VALUES ('Cerrada', 'La alerta fue revisada y archivada');

-- ================================================================================================
--Empleados
SELECT*FROM empleado;

DELETE FROM empleado;
DBCC CHECKIDENT ('empleado', RESEED, 0);

INSERT INTO empleado (nombres, apellidos, numero_registro, cargo, email) VALUES
('Carlos', 'Ramírez', '100001', 'Jefe de Logística', 'carlos.ramirez@empresa.com'),
('María', 'Torres', '100002', 'Asistente de Logística', 'maria.torres@empresa.com'),
('Luis', 'Fernández', '100003', 'Coordinador de Compras', 'luis.fernandez@empresa.com'),
('Ana', 'Gonzales', '100004', 'Analista de Compras', 'ana.gonzales@empresa.com'),
('Jorge', 'Pérez', '100005', 'Supervisor de Almacén', 'jorge.perez@empresa.com'),
('Elena', 'Castillo', '100006', 'Auxiliar de Almacén', 'elena.castillo@empresa.com'),
('Ricardo', 'Díaz', '100007', 'Operador de Montacargas', 'ricardo.diaz@empresa.com'),
('Sofía', 'Morales', '100008', 'Encargada de Inventarios', 'sofia.morales@empresa.com'),
('Andrés', 'Sánchez', '100009', 'Jefe de Proyectos', 'andres.sanchez@empresa.com'),
('Lucía', 'Herrera', '100010', 'Coordinadora de Proyectos', 'lucia.herrera@empresa.com'),
('Pedro', 'Cruz', '100011', 'Supervisor de Obra', 'pedro.cruz@empresa.com'),
('Gabriela', 'Mendoza', '100012', 'Ingeniera de Obra', 'gabriela.mendoza@empresa.com'),
('Raúl', 'Chávez', '100013', 'Técnico Electricista', 'raul.chavez@empresa.com'),
('Carmen', 'Vega', '100014', 'Técnica Electricista', 'carmen.vega@empresa.com'),
('Héctor', 'López', '100015', 'Jefe de Seguridad', 'hector.lopez@empresa.com'),
('Paola', 'Jiménez', '100016', 'Supervisora de Seguridad', 'paola.jimenez@empresa.com'),
('Felipe', 'Gutiérrez', '100017', 'Inspector de Seguridad', 'felipe.gutierrez@empresa.com'),
('Mónica', 'Rojas', '100018', 'Encargada de EPP', 'monica.rojas@empresa.com'),
('Diego', 'Ortega', '100019', 'Jefe de Sistemas', 'diego.ortega@empresa.com'),
('Valeria', 'Flores', '100020', 'Administradora de Redes', 'valeria.flores@empresa.com'),
('Álvaro', 'Paredes', '100021', 'Soporte Técnico', 'alvaro.paredes@empresa.com'),
('Natalia', 'Aguilar', '100022', 'Analista de Datos', 'natalia.aguilar@empresa.com'),
('José', 'Silva', '100023', 'Gerente General', 'jose.silva@empresa.com'),
('Rosa', 'Cárdenas', '100024', 'Asistente de Gerencia', 'rosa.cardenas@empresa.com'),
('Víctor', 'Martínez', '100025', 'Jefe de Finanzas', 'victor.martinez@empresa.com'),
('Claudia', 'Reyes', '100026', 'Contadora', 'claudia.reyes@empresa.com'),
('Tomás', 'Suárez', '100027', 'Analista de Costos', 'tomas.suarez@empresa.com'),
('Isabel', 'Quispe', '100028', 'Asistente Contable', 'isabel.quispe@empresa.com'),
('Francisco', 'Delgado', '100029', 'Jefe de Recursos Humanos', 'francisco.delgado@empresa.com'),
('Daniela', 'Mejía', '100030', 'Analista de RRHH', 'daniela.mejia@empresa.com');

UPDATE empleado set email='j.silva@empresa.com'
WHERE id=23;

-- ================================================================================================
--Unidad de medida
SELECT*FROM unidad_medida;

DELETE FROM unidad_medida;
DBCC CHECKIDENT ('unidad_medida', RESEED, 0);

INSERT INTO unidad_medida (nombre, abreviatura) VALUES 
('Unidad', 'UNID'),
('Metro', 'M'),
('Kilogramo', 'KG'),
('Litro', 'L'),
('Caja', 'CJ'),
('Pieza', 'PZ'),
('Paquete', 'PAQ'),
('Docena', 'DOC'),
('Tonelada', 'TN'),
('Galón', 'GAL'),
('Mililitro', 'ML'),
('Gramo', 'GR'),
('Rollo', 'ROLL'),
('Bolsa', 'BLS'),
('Juego', 'JG');

-- ================================================================================================
--Productos
SELECT*FROM productos;

DELETE FROM productos;
DBCC CHECKIDENT ('productos', RESEED, 0);

INSERT INTO productos (unidad_medida_id, nombre, stock_minimo, tipo, stock_actual) VALUES
-- ==============================
-- MATERIAL ELÉCTRICO (50)
-- ==============================
(4, 'Cable de cobre 25mm²', 100, 'Material Eléctrico', 250),
(4, 'Cable de cobre 35mm²', 100, 'Material Eléctrico', 220),
(4, 'Cable de aluminio 50mm²', 80, 'Material Eléctrico', 200),
(4, 'Cable de aluminio 70mm²', 60, 'Material Eléctrico', 150),
(5, 'Rollo de cable THHN 12 AWG', 50, 'Material Eléctrico', 120),
(5, 'Rollo de cable THHN 10 AWG', 50, 'Material Eléctrico', 110),
(5, 'Rollo de cable THHN 8 AWG', 40, 'Material Eléctrico', 100),
(6, 'Conector bimetálico 25-50mm²', 30, 'Material Eléctrico', 90),
(6, 'Conector bimetálico 70-120mm²', 20, 'Material Eléctrico', 70),
(6, 'Empalme termocontraíble 15kV', 20, 'Material Eléctrico', 60),
(6, 'Empalme termocontraíble 24kV', 15, 'Material Eléctrico', 55),
(6, 'Aislador polimérico 15kV', 40, 'Material Eléctrico', 150),
(6, 'Aislador polimérico 24kV', 30, 'Material Eléctrico', 130),
(6, 'Corta corriente fusible 15kV', 10, 'Material Eléctrico', 35),
(6, 'Corta corriente fusible 27kV', 10, 'Material Eléctrico', 30),
(6, 'Pararrayos polimérico 15kV', 10, 'Material Eléctrico', 28),
(6, 'Pararrayos polimérico 27kV', 10, 'Material Eléctrico', 25),
(1, 'Transformador monofásico 25kVA', 2, 'Material Eléctrico', 5),
(1, 'Transformador monofásico 50kVA', 2, 'Material Eléctrico', 4),
(1, 'Transformador trifásico 75kVA', 1, 'Material Eléctrico', 3),
(1, 'Transformador trifásico 150kVA', 1, 'Material Eléctrico', 2),
(1, 'Interruptor termomagnético 20A', 20, 'Material Eléctrico', 50),
(1, 'Interruptor termomagnético 63A', 15, 'Material Eléctrico', 40),
(1, 'Interruptor termomagnético 100A', 10, 'Material Eléctrico', 30),
(1, 'Interruptor en caja moldeada 250A', 5, 'Material Eléctrico', 12),
(1, 'Seccionador bajo carga 15kV', 5, 'Material Eléctrico', 10),
(1, 'Seccionador bajo carga 27kV', 3, 'Material Eléctrico', 8),
(1, 'Tablero de distribución 12 circuitos', 5, 'Material Eléctrico', 15),
(1, 'Tablero de distribución 24 circuitos', 5, 'Material Eléctrico', 12),
(1, 'Celdas de media tensión 15kV', 2, 'Material Eléctrico', 6),
(1, 'Celdas de media tensión 24kV', 2, 'Material Eléctrico', 5),
(6, 'Fusible tipo K 10A', 20, 'Material Eléctrico', 60),
(6, 'Fusible tipo K 20A', 20, 'Material Eléctrico', 55),
(6, 'Fusible tipo K 40A', 20, 'Material Eléctrico', 50),
(6, 'Fusible limitador 27kV', 10, 'Material Eléctrico', 25),
(6, 'Soporte para fusible tipo K', 10, 'Material Eléctrico', 30),
(6, 'Terminal preaislado 25mm²', 50, 'Material Eléctrico', 150),
(6, 'Terminal preaislado 35mm²', 50, 'Material Eléctrico', 140),
(6, 'Terminal preaislado 50mm²', 40, 'Material Eléctrico', 120),
(6, 'Terminal preaislado 70mm²', 30, 'Material Eléctrico', 100),
(6, 'Terminal bimetálico 120mm²', 20, 'Material Eléctrico', 60),
(6, 'Abrazadera de suspensión 25mm²', 30, 'Material Eléctrico', 90),
(6, 'Abrazadera de suspensión 50mm²', 20, 'Material Eléctrico', 80),
(6, 'Abrazadera de suspensión 70mm²', 15, 'Material Eléctrico', 70),
(6, 'Abrazadera de suspensión 120mm²', 10, 'Material Eléctrico', 50),
(6, 'Conector tipo pin 25mm²', 20, 'Material Eléctrico', 60),
(6, 'Conector tipo pin 35mm²', 20, 'Material Eléctrico', 55),
(6, 'Conector tipo pin 50mm²', 20, 'Material Eléctrico', 50),
(6, 'Conector tipo pin 70mm²', 15, 'Material Eléctrico', 45),
(6, 'Conector tipo pin 120mm²', 10, 'Material Eléctrico', 30),

-- ==============================
-- EPP (20)
-- ==============================
(6, 'Guantes dieléctricos clase 0', 10, 'EPP', 25),
(6, 'Guantes dieléctricos clase 2', 10, 'EPP', 20),
(6, 'Casco dieléctrico tipo II', 15, 'EPP', 40),
(6, 'Casco con barbiquejo', 15, 'EPP', 35),
(8, 'Botas dieléctricas caña alta', 10, 'EPP', 20),
(8, 'Botas de seguridad con puntera de acero', 10, 'EPP', 25),
(1, 'Arnés de seguridad con doble línea de vida', 5, 'EPP', 12),
(1, 'Arnés de seguridad con absorbedor de energía', 5, 'EPP', 10),
(1, 'Línea de vida retráctil 6m', 5, 'EPP', 10),
(1, 'Línea de vida retráctil 12m', 3, 'EPP', 8),
(6, 'Protector facial dieléctrico', 5, 'EPP', 15),
(6, 'Gafas de seguridad UV', 10, 'EPP', 20),
(6, 'Tapones auditivos de espuma', 20, 'EPP', 100),
(7, 'Caja de mascarillas N95', 5, 'EPP', 25),
(7, 'Caja de mascarillas con filtro carbón', 5, 'EPP', 15),
(6, 'Chaleco reflectivo naranja', 10, 'EPP', 30),
(6, 'Chaleco reflectivo amarillo', 10, 'EPP', 25),
(6, 'Camisa manga larga ignífuga', 10, 'EPP', 20),
(6, 'Pantalón ignífugo', 10, 'EPP', 20),
(6, 'Overol ignífugo', 5, 'EPP', 12),

-- ==============================
-- HERRAMIENTAS (20)
-- ==============================
(1, 'Multímetro digital True RMS', 3, 'Herramientas', 8),
(1, 'Pinza amperimétrica 600A', 3, 'Herramientas', 7),
(1, 'Telurómetro digital', 2, 'Herramientas', 5),
(1, 'Megóhmetro 5kV', 2, 'Herramientas', 5),
(1, 'Detector de tensión 15kV', 5, 'Herramientas', 10),
(1, 'Detector de tensión 30kV', 3, 'Herramientas', 8),
(1, 'Taladro percutor 1/2" 220V', 5, 'Herramientas', 10),
(1, 'Amoladora angular 9"', 5, 'Herramientas', 12),
(1, 'Cortadora de pernos', 5, 'Herramientas', 15),
(1, 'Llave dinamométrica 300Nm', 5, 'Herramientas', 8),
(9, 'Juego de llaves combinadas 6-24mm', 5, 'Herramientas', 15),
(9, 'Juego de destornilladores aislados 1000V', 5, 'Herramientas', 12),
(9, 'Juego de dados 1/2"', 5, 'Herramientas', 10),
(9, 'Juego de alicates dieléctricos', 5, 'Herramientas', 10),
(1, 'Escalera dieléctrica 3m', 2, 'Herramientas', 6),
(1, 'Escalera dieléctrica 6m', 2, 'Herramientas', 5),
(1, 'Equipo de izaje manual 1Tn', 2, 'Herramientas', 4),
(1, 'Equipo de izaje manual 3Tn', 1, 'Herramientas', 3),
(1, 'Carrete de extensión eléctrica 30m', 5, 'Herramientas', 10),
(1, 'Carrete de extensión eléctrica 50m', 5, 'Herramientas', 8),

-- ==============================
-- CONSUMIBLES Y ACCESORIOS (10)
-- ==============================
(2, 'Grasa dieléctrica', 10, 'Consumibles', 30),
(3, 'Aceite para transformador 20L', 5, 'Consumibles', 15),
(3, 'Aceite lubricante 5L', 10, 'Consumibles', 20),
(6, 'Pernos galvanizados 1/2"x4"', 50, 'Consumibles', 200),
(6, 'Tuercas galvanizadas 1/2"', 50, 'Consumibles', 180),
(6, 'Arandelas planas 1/2"', 50, 'Consumibles', 160),
(6, 'Abrazadera metálica 2"', 20, 'Consumibles', 80),
(6, 'Abrazadera metálica 3"', 20, 'Consumibles', 70),
(7, 'Caja de electrodos 6011 1/8"', 10, 'Consumibles', 25),
(7, 'Caja de electrodos 7018 1/8"', 10, 'Consumibles', 20);


-- ///// VALIDACION CARGA ///// 

SELECT 
    p.nombre AS producto,
    u.abreviatura AS unidad_medida,
    p.stock_minimo,
    p.stock_actual,
    p.tipo
FROM productos p
INNER JOIN unidad_medida u 
    ON p.unidad_medida_id = u.id
ORDER BY p.tipo, p.nombre;


-- ================================================================================================
--Proyectos
SELECT*FROM proyectos;

DELETE FROM proyectos;
DBCC CHECKIDENT ('proyectos', RESEED, 0);

INSERT INTO proyectos (nombre_proyecto, ubicacion, fecha_inicio, estado_proyecto)
VALUES 
('Instalación de Subestación Eléctrica 60kV - Piura', 'Piura - Zona Industrial', '2025-01-15', 'En ejecución'),
('Tendido de Línea de Media Tensión 22.9kV - Talara', 'Talara - Vía Costanera', '2025-02-10', 'En ejecución'),
('Mantenimiento Preventivo de Transformadores 33kV', 'Sechura - Parque Industrial', '2025-03-05', 'Planificado'),
('Alumbrado Público en Av. Grau', 'Piura - Castilla', '2025-01-20', 'Finalizado'),
('Instalación de Tableros de Distribución en Planta Pesquera', 'Paita - Zona Portuaria', '2025-04-12', 'En ejecución'),
('Expansión de Red de Baja Tensión en Nuevo Horizonte', 'Piura - Veintiséis de Octubre', '2025-02-28', 'En ejecución'),
('Supervisión de Obras Eléctricas en Subestación Bayóvar', 'Bayóvar - Sechura', '2025-05-01', 'Planificado'),
('Reparación de Sistema de Puesta a Tierra', 'Piura - Universidad Nacional', '2025-03-25', 'Finalizado'),
('Construcción de Red Primaria y Secundaria', 'Sullana - Proyecto Urbano', '2025-06-10', 'Planificado'),
('Mantenimiento Correctivo de Interruptores de Potencia', 'Talara - Refinería', '2025-07-15', 'Planificado');


-- ================================================================================================
--Movimiento
SELECT*FROM movimiento;

DELETE FROM movimiento;
DBCC CHECKIDENT ('movimiento', RESEED, 0);

SELECT * FROM productos WHERE stock_actual < 0; --Verificar si existe stock actual <0


-- ///// CORRECCION STOCK NEGATIVO EN TABLA PRODUCTOS ///// 
USE bd_logistic_kpi;
GO

-- 1. Corregir valores negativos
UPDATE productos
SET stock_actual = 0
WHERE stock_actual < 0;

-- 2. Agregar restricción para proteger el stock
ALTER TABLE productos
ADD CONSTRAINT chk_stock_no_negativo
CHECK (stock_actual >= 0);


-- ///// GENERACION REGISTROS ALEATORIOS EN TABLA MOVIMIENTO ///// 

USE bd_logistic_kpi;
GO

-- Cantidad de movimientos a generar
DECLARE @contador INT = 1;
DECLARE @maxMovimientos INT = 100;

-- Variables auxiliares
DECLARE @productoId INT;
DECLARE @empleadoId INT;
DECLARE @proyectoId INT;
DECLARE @tipoMovId INT;
DECLARE @cantidad INT;
DECLARE @stockActual INT;

WHILE @contador <= @maxMovimientos
BEGIN
    -- Seleccionar un producto aleatorio
    SELECT TOP 1 @productoId = id
    FROM productos
    ORDER BY NEWID();

    -- Seleccionar un empleado aleatorio (solo logística o almacén)
    SELECT TOP 1 @empleadoId = id
    FROM empleado
    WHERE cargo LIKE '%Logística%' OR cargo LIKE '%Almacén%'
    ORDER BY NEWID();

    -- Seleccionar un proyecto aleatorio
    SELECT TOP 1 @proyectoId = id
    FROM proyectos
    ORDER BY NEWID();

    -- Releer el stock actual del producto
    SELECT @stockActual = stock_actual
    FROM productos
    WHERE id = @productoId;

    -- Decidir si es entrada o salida
    IF @stockActual = 0 
    BEGIN
        SET @tipoMovId = 1; -- Entrada obligatoria si no hay stock
    END
    ELSE
    BEGIN
        SET @tipoMovId = CASE WHEN RAND() < 0.6 THEN 2 ELSE 1 END; -- 60% salida, 40% entrada
    END

    -- Definir una cantidad aleatoria
    SET @cantidad = CAST((RAND() * 20) + 1 AS INT); -- entre 1 y 20

    -- Si es salida y no hay stock suficiente → saltamos iteración
    IF @tipoMovId = 2
    BEGIN
        SELECT @stockActual = stock_actual
        FROM productos
        WHERE id = @productoId;

        IF @cantidad > @stockActual
            CONTINUE; -- Evita el negativo
    END

    BEGIN TRANSACTION;
        -- Insertar movimiento
        INSERT INTO movimiento (productos_id, empleado_id, proyectos_id, tipo_movimiento_id, cantidad, fecha_movimiento)
        VALUES (
            @productoId,
            @empleadoId,
            @proyectoId,
            @tipoMovId,
            @cantidad,
            DATEADD(DAY, -ABS(CHECKSUM(NEWID())) % 30, GETDATE())
        );

        -- Actualizar stock en productos
        IF @tipoMovId = 1
            UPDATE productos SET stock_actual = stock_actual + @cantidad WHERE id = @productoId;
        ELSE
            UPDATE productos SET stock_actual = stock_actual - @cantidad WHERE id = @productoId;
    COMMIT TRANSACTION;

    -- Incrementar contador
    SET @contador = @contador + 1;
END;



-- =======================================================================================================================
-- VALIDACION MOVIMIENTOS

USE bd_logistic_kpi;
GO

SELECT 
    m.id AS movimiento_id,
    p.nombre AS producto,
    m.cantidad,
    tm.nombre AS tipo_movimiento,
    pr.nombre_proyecto,
    e.nombres + ' ' + e.apellidos AS empleado,
    e.cargo,
    m.fecha_movimiento,
    p.stock_actual  -- 👈 Aquí mostramos el stock actualizado del producto
FROM dbo.movimiento m
INNER JOIN dbo.productos p        ON m.productos_id = p.id
INNER JOIN dbo.empleado e         ON m.empleado_id = e.id
INNER JOIN dbo.proyectos pr       ON m.proyectos_id = pr.id
INNER JOIN dbo.tipo_movimiento tm ON m.tipo_movimiento_id = tm.id
ORDER BY m.fecha_movimiento, empleado;



--  //////////////////////////////////////////////////////////////////////////////////////////////////
USE bd_logistic_kpi;
GO

SELECT 
    p.id,
    p.nombre,
    u.abreviatura AS unidad,
    p.stock_minimo,
    p.stock_actual,
    CASE 
        WHEN p.stock_actual < 0 THEN '❌ ERROR: STOCK NEGATIVO'
        WHEN p.stock_actual = 0 THEN '⚠️ STOCK AGOTADO'
        WHEN p.stock_actual < p.stock_minimo THEN '🔻 BAJO STOCK'
        ELSE '✅ STOCK OK'
    END AS estado_stock
FROM productos p
INNER JOIN unidad_medida u ON p.unidad_medida_id = u.id
ORDER BY p.stock_actual ASC, p.nombre;



-- ================================================================================================
-- Alertas
SELECT*FROM alerta;

DELETE FROM alerta;
DBCC CHECKIDENT ('alerta', RESEED, 0);


USE bd_logistic_kpi;
GO

-- Insertar alertas para productos con stock crítico, mínimo o sobre stock
INSERT INTO alerta (productos_id, estado_alerta_id, tipo_alerta_id, mensaje, fecha_alerta)
SELECT 
    p.id AS productos_id,
    (SELECT TOP 1 id FROM estado_alerta ORDER BY NEWID()) AS estado_alerta_id, -- estado aleatorio
    CASE 
        WHEN p.stock_actual = 0 
            THEN (SELECT id FROM tipo_alerta WHERE nombre = 'Stock agotado')
        WHEN p.stock_actual <= p.stock_minimo 
            THEN (SELECT id FROM tipo_alerta WHERE nombre = 'Stock mínimo')
        WHEN p.stock_actual > p.stock_minimo * 2 
            THEN (SELECT id FROM tipo_alerta WHERE nombre = 'Sobre stock')
        ELSE (SELECT id FROM tipo_alerta WHERE nombre = 'Vencimiento próximo')
    END AS tipo_alerta_id,
    CASE 
        WHEN p.stock_actual = 0 
            THEN CONCAT('Stock agotado en producto: ', p.nombre)
        WHEN p.stock_actual <= p.stock_minimo 
            THEN CONCAT('Stock en nivel mínimo de producto: ', p.nombre)
        WHEN p.stock_actual > p.stock_minimo * 2 
            THEN CONCAT('Exceso de stock en producto: ', p.nombre)
        ELSE CONCAT('Producto con vencimiento próximo: ', p.nombre)
    END AS mensaje,
    GETDATE() AS fecha_alerta
FROM productos p
WHERE p.stock_actual <= p.stock_minimo 
   OR p.stock_actual = 0
   OR p.stock_actual > p.stock_minimo * 2;

