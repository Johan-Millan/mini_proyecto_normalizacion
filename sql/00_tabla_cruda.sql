CREATE SCHEMA IF NOT EXISTS normalizacion_ventas;

DROP TABLE IF EXISTS normalizacion_ventas.ventas_crudas;

CREATE TABLE normalizacion_ventas.ventas_crudas (
    venta_id          VARCHAR(10),
    fecha_venta       DATE,
    cliente_doc       VARCHAR(20),
    cliente_nombre    VARCHAR(100),
    cliente_email     VARCHAR(120),
    cliente_telefono  VARCHAR(30),
    cliente_direccion VARCHAR(150),
    cliente_ciudad    VARCHAR(80),
    vendedor_id       VARCHAR(10),
    vendedor_nombre   VARCHAR(100),
    vendedor_zona     VARCHAR(80),
    productos_codigos TEXT,  
    productos_nombres TEXT,  
    categorias        TEXT,   
    cantidades        TEXT,  
    precios_unitarios TEXT,   
    descuentos        TEXT,   
    metodo_pago       VARCHAR(80),
    entidad_pago      VARCHAR(80),
    total_venta       NUMERIC(12,2)
);

INSERT INTO normalizacion_ventas.ventas_crudas VALUES
('V1001','2026-04-01','CC101','Maria Gomez','maria.gomez@mail.com','3101112233',
 'Calle 10 # 5-20','Bogota','VEN01','Ana Torres','Norte',
 'P001,P002','Mouse USB,Teclado mecanico','Perifericos,Perifericos',
 '2,1','45000,180000','0,0','Transferencia','Bancolombia',270000),

('V1002','2026-04-02','CC102','Juan Carlos','juan.perez@mail.com','3155558899',
 'Carrera 8 # 20-15','Bogota','VEN02','Carlos Ruiz','Centro',
 'P003,P001','Monitor 24,Mouse USB','Pantallas,Perifericos',
 '1,1','720000,45000','20000,0','Tarjeta credito','Visa',745000),

('V1003','2026-04-03','CC101','Maria Gomez','maria.gomez@mail.com','3101112233',
 'Calle 10 # 5-20','Bogota','VEN01','Ana Torres','Norte',
 'P004,P002,P005','Portatil 14,Teclado mecanico,Base refrigerante',
 'Computadores,Perifericos,Accesorios','1,2,1','2450000,180000,95000',
 '50000,0,0','Transferencia','Bancolombia',2855000),

('V1004','2026-04-04','CC103','Laura Rojas','laura.rojas@mail.com','3209994455',
 'Av. 68 # 45-30','Medellin','VEN03','Diana Mora','Occidente',
 'P003,P006','Monitor 24,Webcam HD','Pantallas,Perifericos',
 '2,1','720000,150000','0,10000','Efectivo','Caja principal',1580000);
 
