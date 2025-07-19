# bd_logistic_kpi

🧾 Caso Propuesto: Control de Inventarios con Consumo por Obras – LOGISIMPLE PROYECTOS S.R.L.
🏗️ Contexto del Caso

LOGISTIC PROYECTOS S.R.L. brinda soporte logístico a empresas constructoras, centralizando el almacenamiento de materiales e insumos que luego son distribuidos y consumidos en diversas obras. Actualmente, los registros se llevan de forma manual, dificultando la trazabilidad del inventario, el control del stock y el análisis de consumos por proyecto.

🎯 Objetivo general
Diseñar una base de datos que permita controlar el inventario de productos almacenados, registrar los movimientos de entrada y salida, asociar los consumos a proyectos u obras específicas, y generar alertas ante posibles quiebres de stock.

🎯 Objetivos específicos
Registrar los productos almacenados con información detallada (unidad, tipo, empresa propietaria).

Mantener actualizado el stock disponible por producto.

Registrar movimientos de inventario: entradas y salidas.

Vincular las salidas de productos a obras o proyectos específicos.

Generar reportes de consumos por proyecto y producto.

Detectar y alertar automáticamente cuando un producto llega a su stock mínimo o se agota (quiebre de stock).

✅ Requisitos funcionales del sistema
Registro de productos, incluyendo un stock mínimo permitido (stock_minimo).

Registro de empresas clientes.

Registro de proyectos u obras.

Registro de movimientos de inventario (entradas y salidas).

Asociación de salidas con proyectos.

Visualización de stock actual.

Generación de reportes de historial de movimientos y consumos por proyecto.

Detección automática del quiebre de stock y emisión de alerta interna (visual o vía correo).

🧱 Entidades principales (con stock mínimo)
Producto
(producto_id, nombre, unidad_medida, tipo, empresa_id, stock_minimo)

Empresa
(empresa_id, nombre, ruc, correo_contacto)

Proyecto
(proyecto_id, nombre, ubicación, empresa_id, fecha_inicio, estado)

Movimiento
(movimiento_id, producto_id, tipo_movimiento, fecha, cantidad, proyecto_id NULLABLE)

(opcional) Alerta
(alerta_id, producto_id, fecha, mensaje, estado_alerta)

🔁 Relaciones
Una empresa tiene múltiples productos y proyectos.

Un producto puede tener muchos movimientos.

Los movimientos de salida pueden estar asociados a un proyecto.

El sistema genera una alerta cuando el stock de un producto baja del stock_minimo.

🚨 Alerta de quiebre de stock (Lógica funcional)
Cada vez que se registra una salida, el sistema recalcula el stock actual del producto.

Si el nuevo stock es menor o igual al stock_minimo, se genera una alerta con:

Producto afectado

Fecha y hora

Mensaje: “Alerta: Stock mínimo alcanzado” o “Quiebre de stock”

El área logística puede revisar las alertas pendientes y tomar acciones (reposición, redistribución, etc.).

📊 Consultas posibles
¿Qué productos han alcanzado su stock mínimo?

¿Qué productos han tenido quiebre de stock en la última semana?

¿Qué proyectos consumieron más materiales este mes?

¿Cuál es el historial de entradas/salidas de un producto determinado?

🧩 Extensiones opcionales
Automatización del envío de alertas por correo a almacén.

Agregado de campo responsable en movimientos.

Módulo de solicitud de reposición automática al proveedor.
