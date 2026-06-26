CREATE SCHEMA IF NOT EXISTS normalizacion_ventas;


DROP TABLE IF EXISTS normalizacion_ventas.detalle_venta   CASCADE;
DROP TABLE IF EXISTS normalizacion_ventas.ventas           CASCADE;
DROP TABLE IF EXISTS normalizacion_ventas.productos        CASCADE;
DROP TABLE IF EXISTS normalizacion_ventas.categorias       CASCADE;
DROP TABLE IF EXISTS normalizacion_ventas.metodos_pago     CASCADE;
DROP TABLE IF EXISTS normalizacion_ventas.vendedores       CASCADE;
DROP TABLE IF EXISTS normalizacion_ventas.clientes         CASCADE;


CREATE TABLE normalizacion_ventas.clientes (
    cliente_doc       VARCHAR(20)  PRIMARY KEY,
    cliente_nombre    VARCHAR(100) NOT NULL,
    cliente_email     VARCHAR(120) UNIQUE,
    cliente_telefono  VARCHAR(30),
    cliente_direccion VARCHAR(150),
    cliente_ciudad    VARCHAR(80)
);


CREATE TABLE normalizacion_ventas.vendedores (
    vendedor_id     VARCHAR(10)  PRIMARY KEY,
    vendedor_nombre VARCHAR(100) NOT NULL,
    vendedor_zona   VARCHAR(80)
);


CREATE TABLE normalizacion_ventas.categorias (
    categoria_id     SERIAL       PRIMARY KEY,
    categoria_nombre VARCHAR(80)  NOT NULL UNIQUE
);


CREATE TABLE normalizacion_ventas.productos (
    producto_codigo  VARCHAR(10)    PRIMARY KEY,
    producto_nombre  VARCHAR(100)   NOT NULL,
    precio_catalogo  NUMERIC(12,2)  NOT NULL CHECK (precio_catalogo >= 0),
    categoria_id     INT            NOT NULL REFERENCES normalizacion_ventas.categorias(categoria_id)
);


CREATE TABLE normalizacion_ventas.metodos_pago (
    metodo_id      SERIAL       PRIMARY KEY,
    metodo_nombre  VARCHAR(80)  NOT NULL UNIQUE,
    entidad_pago   VARCHAR(80)
);


CREATE TABLE normalizacion_ventas.ventas (
    venta_id     VARCHAR(10)  PRIMARY KEY,
    fecha_venta  DATE         NOT NULL,
    cliente_doc  VARCHAR(20)  NOT NULL REFERENCES normalizacion_ventas.clientes(cliente_doc),
    vendedor_id  VARCHAR(10)  NOT NULL REFERENCES normalizacion_ventas.vendedores(vendedor_id),
    metodo_id    INT          NOT NULL REFERENCES normalizacion_ventas.metodos_pago(metodo_id)
);


CREATE TABLE normalizacion_ventas.detalle_venta (
    venta_id        VARCHAR(10)   NOT NULL REFERENCES normalizacion_ventas.ventas(venta_id),
    producto_codigo VARCHAR(10)   NOT NULL REFERENCES normalizacion_ventas.productos(producto_codigo),
    cantidad        INT           NOT NULL CHECK (cantidad > 0),
    precio_unitario NUMERIC(12,2) NOT NULL CHECK (precio_unitario >= 0),
    descuento       NUMERIC(12,2) NOT NULL DEFAULT 0 CHECK (descuento >= 0),
    PRIMARY KEY (venta_id, producto_codigo)
);
