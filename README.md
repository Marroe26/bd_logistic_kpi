# bd_logistic_kpi: Caso BD transaccional

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

__________________________________________________________________________________________________________________________________________________

📊 Caso de Inteligencia de Negocios:

“Análisis logístico y de consumo en obras – LOGISTIC PROYECTOS S.R.L.”
🏗️ Contexto general
LOGISTIC PROYECTOS S.R.L. ha implementado recientemente una base de datos que registra productos, movimientos de inventario (entradas/salidas), consumos por proyecto, niveles de stock y alertas por quiebre.

Ahora la gerencia logística y el área de operaciones desean visualizar y analizar los datos históricos y en tiempo real, para mejorar la toma de decisiones estratégicas y operativas. Para ello, han decidido implementar una solución de inteligencia de negocios que permita centralizar, visualizar y analizar sus indicadores clave.

🎯 Objetivo del proyecto de BI
Diseñar e implementar una solución de inteligencia de negocios que permita monitorear en tiempo real el comportamiento del inventario, los consumos por proyecto, el nivel de cumplimiento logístico, y anticipar riesgos de desabastecimiento.

🎯 Objetivos específicos
Integrar los datos operativos del sistema de inventario en una plataforma BI.

Crear dashboards interactivos con filtros por proyecto, tipo de producto y empresa.

Visualizar indicadores clave de gestión (KPIs) relacionados a consumo, rotación, cobertura y quiebres de stock.

Identificar patrones de sobreconsumo o subutilización por obra.

Mejorar la planificación de compras y logística de abastecimiento.

🧱 Fuentes de datos
Tabla Producto

Tabla Movimiento

Tabla Proyecto

Tabla Empresa

Tabla Alerta

(Opcional) Excel externo con metas de consumo por obra

📈 Indicadores a implementar en el dashboard
Indicador	Descripción
Stock actual vs. stock mínimo	Resalta productos con riesgo de quiebre
Total consumido por proyecto	Muestra cuánto se ha consumido por cada obra
Top 10 productos más utilizados	Lista de los productos con mayor salida
Días de cobertura por producto	Cuántos días durará el stock al ritmo de consumo actual
Rotación de inventario mensual	Frecuencia con que un producto entra y sale del almacén
Tasa de quiebres de stock	Proporción de productos que han llegado a cero en determinado periodo
Costo total del inventario	(Si hay precios): stock actual × precio unitario
Historial de alertas por proyecto	Ver qué obras han tenido más alertas de stock bajo o quiebre

📊 Dashboards sugeridos
1. Panel de inventario general
Stock actual por producto

Alertas activas

Productos en stock mínimo

Días de cobertura

2. Panel de consumo por proyecto
Total consumido vs. planificado

Materiales más usados por obra

Comparativo entre obras

Línea de tiempo del consumo

3. Panel de rendimiento logístico
Frecuencia de movimientos

Rotación de productos

Tiempos promedio entre pedidos y reposición

Tendencias mensuales

🔍 Análisis esperados con la solución BI
Identificar obras que generan sobreconsumo de materiales o mal uso del inventario.

Detectar qué productos están constantemente en quiebre y necesitan ajuste de stock mínimo.

Anticipar desabastecimientos según ritmo de consumo.

Optimizar las compras centralizadas según la demanda real por proyecto.

Informar a dirección sobre obras que necesitan intervención logística urgente.

💡 Tecnologías recomendadas para la solución BI
Power BI (visualización, alertas, conexión directa con SQL)

SQL Server + Integration Services (ETL)

Excel Power Pivot + Power Query (solución más ligera y accesible)

Tablas con actualización programada o API de integración

🧩 Desafíos del proyecto BI
Unificación y limpieza de datos históricos de diferentes fuentes.

Automatización de cálculos de KPIs.

Capacitación al equipo logístico para interpretar visualizaciones.

Establecimiento de alertas visuales o correos cuando haya stock crítico.
