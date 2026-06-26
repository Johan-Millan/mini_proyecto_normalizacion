SELECT
    v.venta_id,
    v.fecha_venta,
    SUM(dv.cantidad * dv.precio_unitario - dv.descuento) AS total_calculado
FROM normalizacion_ventas.ventas v
JOIN normalizacion_ventas.detalle_venta dv ON v.venta_id = dv.venta_id
GROUP BY v.venta_id, v.fecha_venta
ORDER BY v.venta_id;


SELECT
    p.producto_codigo,
    p.producto_nombre,
    SUM(dv.cantidad) AS unidades_vendidas
FROM normalizacion_ventas.detalle_venta dv
JOIN normalizacion_ventas.productos p ON dv.producto_codigo = p.producto_codigo
GROUP BY p.producto_codigo, p.producto_nombre
ORDER BY unidades_vendidas DESC;



SELECT
    ve.vendedor_id,
    ve.vendedor_nombre,
    COUNT(DISTINCT v.venta_id)                              AS cantidad_ventas,
    SUM(dv.cantidad * dv.precio_unitario - dv.descuento)   AS valor_total
FROM normalizacion_ventas.vendedores ve
JOIN normalizacion_ventas.ventas v     ON ve.vendedor_id   = v.vendedor_id
JOIN normalizacion_ventas.detalle_venta dv ON v.venta_id   = dv.venta_id
GROUP BY ve.vendedor_id, ve.vendedor_nombre
ORDER BY valor_total DESC;


SELECT
    c.cliente_doc,
    c.cliente_nombre,
    v.venta_id,
    v.fecha_venta,
    p.producto_nombre     AS producto,
    dv.cantidad
FROM normalizacion_ventas.clientes c
JOIN normalizacion_ventas.ventas v        ON c.cliente_doc      = v.cliente_doc
JOIN normalizacion_ventas.detalle_venta dv ON v.venta_id         = dv.venta_id
JOIN normalizacion_ventas.productos p      ON dv.producto_codigo  = p.producto_codigo
WHERE c.cliente_doc = 'CC101'
ORDER BY v.fecha_venta, v.venta_id;


SELECT dv.*
FROM normalizacion_ventas.detalle_venta dv
LEFT JOIN normalizacion_ventas.ventas v ON dv.venta_id = v.venta_id
WHERE v.venta_id IS NULL;


SELECT dv.*
FROM normalizacion_ventas.detalle_venta dv
LEFT JOIN normalizacion_ventas.productos p ON dv.producto_codigo = p.producto_codigo
WHERE p.producto_codigo IS NULL;

