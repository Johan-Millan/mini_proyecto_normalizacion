INSERT INTO normalizacion_ventas.clientes VALUES
('CC101', 'Maria Gomez',  'maria.gomez@mail.com',  '3101112233', 'Calle 10 # 5-20',  'Bogota'),
('CC102', 'Juan Perez',   'juan.perez@mail.com',   '3155558899', 'Carrera 8 # 20-15','Bogota'),
('CC103', 'Laura Rojas',  'laura.rojas@mail.com',  '3209994455', 'Av. 68 # 45-30',   'Medellin');


INSERT INTO normalizacion_ventas.vendedores VALUES
('VEN01', 'Ana Torres',  'Norte'),
('VEN02', 'Carlos Ruiz', 'Centro'),
('VEN03', 'Diana Mora',  'Occidente');


INSERT INTO normalizacion_ventas.categorias (categoria_nombre) VALUES
('Perifericos'),
('Pantallas'),
('Computadores'),
('Accesorios');


INSERT INTO normalizacion_ventas.productos VALUES
('P001', 'Mouse USB',          45000,   (SELECT categoria_id FROM normalizacion_ventas.categorias WHERE categoria_nombre = 'Perifericos')),
('P002', 'Teclado mecanico',   180000,  (SELECT categoria_id FROM normalizacion_ventas.categorias WHERE categoria_nombre = 'Perifericos')),
('P003', 'Monitor 24',         720000,  (SELECT categoria_id FROM normalizacion_ventas.categorias WHERE categoria_nombre = 'Pantallas')),
('P004', 'Portatil 14',        2450000, (SELECT categoria_id FROM normalizacion_ventas.categorias WHERE categoria_nombre = 'Computadores')),
('P005', 'Base refrigerante',  95000,   (SELECT categoria_id FROM normalizacion_ventas.categorias WHERE categoria_nombre = 'Accesorios')),
('P006', 'Webcam HD',          150000,  (SELECT categoria_id FROM normalizacion_ventas.categorias WHERE categoria_nombre = 'Perifericos'));


INSERT INTO normalizacion_ventas.metodos_pago (metodo_nombre, entidad_pago) VALUES
('Transferencia',    'Bancolombia'),
('Tarjeta credito',  'Visa'),
('Efectivo',         'Caja principal');


INSERT INTO normalizacion_ventas.ventas VALUES
('V1001', '2026-04-01', 'CC101', 'VEN01', (SELECT metodo_id FROM normalizacion_ventas.metodos_pago WHERE metodo_nombre = 'Transferencia'  AND entidad_pago = 'Bancolombia')),
('V1002', '2026-04-02', 'CC102', 'VEN02', (SELECT metodo_id FROM normalizacion_ventas.metodos_pago WHERE metodo_nombre = 'Tarjeta credito' AND entidad_pago = 'Visa')),
('V1003', '2026-04-03', 'CC101', 'VEN01', (SELECT metodo_id FROM normalizacion_ventas.metodos_pago WHERE metodo_nombre = 'Transferencia'  AND entidad_pago = 'Bancolombia')),
('V1004', '2026-04-04', 'CC103', 'VEN03', (SELECT metodo_id FROM normalizacion_ventas.metodos_pago WHERE metodo_nombre = 'Efectivo'       AND entidad_pago = 'Caja principal'));



INSERT INTO normalizacion_ventas.detalle_venta VALUES
('V1001', 'P001', 2,  45000,  0),
('V1001', 'P002', 1, 180000,  0);


INSERT INTO normalizacion_ventas.detalle_venta VALUES
('V1002', 'P003', 1, 720000, 20000),
('V1002', 'P001', 1,  45000,     0);


INSERT INTO normalizacion_ventas.detalle_venta VALUES
('V1003', 'P004', 1, 2450000, 50000),
('V1003', 'P002', 2,  180000,     0),
('V1003', 'P005', 1,   95000,     0);


INSERT INTO normalizacion_ventas.detalle_venta VALUES
('V1004', 'P003', 2, 720000,     0),
('V1004', 'P006', 1, 150000, 10000);