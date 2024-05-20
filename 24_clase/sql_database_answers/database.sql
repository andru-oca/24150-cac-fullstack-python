DROP DATABASE IF EXISTS cac_database_test;

CREATE DATABASE cac_database_test;

USE cac_database_test;

-- 
CREATE TABLE
    categorias (
        categoria_id INT PRIMARY KEY,
        categoria_nombre VARCHAR(200),
        categoria_descripcion VARCHAR(200)
    );

--
CREATE TABLE
    region (
        region_id INT PRIMARY KEY,
        region_nombre VARCHAR(200)
    );

--
CREATE TABLE
    clientes_morosos (
        cliente_id INT PRIMARY KEY,
        cliente_nombre VARCHAR(200),
        mora DECIMAL(10, 2)
    );

--
CREATE TABLE
    productos (
        producto_id INT PRIMARY KEY,
        producto_nombre VARCHAR(200),
        proveedor_id INT, #
        categoria_id INT, #
        precio_unitario DECIMAL(6, 2), #
        unidades_stock SMALLINT,
        unidades_pedidas SMALLINT,
        nivel_reorden VARCHAR(200),
        KEY (precio_unitario)
    );

--
CREATE TABLE
    clientes (
        cliente_id INT PRIMARY KEY,
        cliente_compania_nombre VARCHAR(200),
        cliente_nombre VARCHAR(200),
        cliente_contacto VARCHAR(200),
        cliente_direccion VARCHAR(200),
        cliente_ciudad VARCHAR(200),
        cliente_region_alta INT, #1-5
        cliente_cod_postal VARCHAR(200),
        cliente_pais VARCHAR(200),
        KEY (cliente_nombre)
    );

--
CREATE TABLE
    proveedores (
        proveedor_id INT PRIMARY KEY,
        proveedor_nombre VARCHAR(200),
        proveedor_contacto VARCHAR(200),
        proveedor_region INT,
        proveedor_cod_postal VARCHAR(200),
        proveedor_origen VARCHAR(200)
    );

--
CREATE TABLE
    pedidos (
        pedido_id INT PRIMARY KEY,
        cliente_id INT,
        empleado_id INT, #1-10
        pedido_fecha DATE,
        pedido_envio_fecha DATE,
        pedido_envio_via DATE
    );

--
CREATE TABLE
    empleados (
        empleado_id INT PRIMARY KEY, #1-10
        empleado_apellido VARCHAR(200),
        empleado_nombre VARCHAR(200),
        empleado_nacimiento DATE,
        empleado_region INT,
        empleado_reporta_a VARCHAR(200) #su jefe
    );

--
CREATE TABLE
    pedidos_detalle (
        pedido_id INT, #1-20
        producto_id INT, #1-20
        precio_unitario DECIMAL(6, 2),
        cantidad INT,
        descuento INT,
        PRIMARY KEY (pedido_id, producto_id)
    );

