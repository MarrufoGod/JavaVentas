-- Creamos la base de datos
-- drop database ventas
CREATE DATABASE ventas;
USE ventas;

-- Tabla para las ciudades
CREATE TABLE tb_ciudad (
    id_ciudad VARCHAR(10) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

-- Tabla para los proveedores
CREATE TABLE tb_proveedor (
    id_proveedor VARCHAR(10) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido_paterno VARCHAR(100),
    apellido_materno VARCHAR(100),
    dni VARCHAR(10) UNIQUE,
    ruc VARCHAR(11) UNIQUE,
    id_ciudad VARCHAR(10),
    FOREIGN KEY (id_ciudad) REFERENCES tb_ciudad(id_ciudad)
);

-- Tabla para los clientes
CREATE TABLE tb_clientes (
    id_cliente VARCHAR(10) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    dni VARCHAR(10) UNIQUE NOT NULL,
    direccion VARCHAR(150),
    celular VARCHAR(15)
);

-- Tabla para los productos
CREATE TABLE tb_producto (
    id_producto VARCHAR(10) PRIMARY KEY,
    descripcion VARCHAR(100) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL,
    id_proveedor VARCHAR(10),
    FOREIGN KEY (id_proveedor) REFERENCES tb_proveedor(id_proveedor)
);

-- Tabla intermedia para las ventas
CREATE TABLE tb_venta (
    id_venta VARCHAR(10) PRIMARY KEY,
    id_cliente VARCHAR(10) NOT NULL,
    id_producto VARCHAR(10) NOT NULL,
    cantidad INT NOT NULL,
    fecha_venta TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_cliente) REFERENCES tb_clientes(id_cliente),
    FOREIGN KEY (id_producto) REFERENCES tb_producto(id_producto)
);

-- Tabla para los usuarios del sistema
CREATE TABLE tb_usuario (
    id_usuario VARCHAR(10) PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(150) NOT NULL
);

INSERT INTO tb_usuario (id_usuario, username, password) VALUES
('DC76654D1', 'juanito', 'hash1'),
('DC76654D2', 'pedrito', 'hash2'),
('DC76654D3', 'maria', 'hash3'),
('DC76654D4', 'carlitos', 'hash4'),
('DC76654D5', 'pepito', 'hash5');

select * from tb_usuario;