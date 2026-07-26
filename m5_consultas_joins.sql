-- ══════════════════════════════════════════
-- Ventas_Tech — Creando la base de datos
-- Autor: Nelson Odriozola
-- Fecha: 26/07/2026
-- ══════════════════════════════════════════


/*
ACLARACIÓN

El modelo de datos utilizado corresponde al desarrollado en el M4 y está compuesto únicamente por las tablas Categorias, Clientes, Productos y Ventas.

En consecuencia, no se dispone de la tabla Territorios ni de atributos que identifiquen el segmento del cliente, la región o el canal de venta. Por este motivo, las consultas fueron adaptadas a la estructura del modelo implementado, utilizando únicamente la información disponible.
*/


-- Consulta 1 — Vista base del proyecto (INNER JOIN)
SELECT
    V.fecha_venta,
    C.nombre AS cliente,
    C.ciudad,
    P.nombre_producto,
    Cat.nombre_categoria AS categoria,
    V.cantidad,
    V.precio_unitario,
    (V.cantidad * V.precio_unitario) AS total_venta
FROM Ventas AS V
INNER JOIN Clientes AS C
    ON V.id_cliente = C.id_cliente
INNER JOIN Productos AS P
    ON V.id_producto = P.id_producto
INNER JOIN Categorias AS Cat
    ON P.id_categoria = Cat.id_categoria;

--Consulta 2 — Clientes sin ventas (LEFT JOIN)
SELECT
    C.nombre,
    C.email,
    C.fecha_registro
FROM Clientes AS C
LEFT JOIN Ventas AS V
    ON C.id_cliente = V.id_cliente
WHERE V.id_venta IS NULL;


-- Consulta 3 — Productos sin ventas (LEFT JOIN)
SELECT
    P.nombre_producto,
    Cat.nombre_categoria,
    P.precio
FROM Productos AS P
LEFT JOIN Ventas AS V
    ON P.id_producto = V.id_producto
INNER JOIN Categorias AS Cat
    ON P.id_categoria = Cat.id_categoria
WHERE V.id_venta IS NULL;

-- Consulta 4 — Consolidado por canal (UNION ALL)

-- Como el modelo no posee una columna que identifique el canal de venta (Online/Presencial), esta consulta no puede implementarse exactamente como solicita la consigna.