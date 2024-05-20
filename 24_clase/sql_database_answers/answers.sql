USE cac_database_test;

/*
1) Obtener el listado de todos los productos ordenados por Nombre del Producto.
Mostrar: Nombre del Producto, Precio Unitario
 */
SELECT
    producto_nombre AS 'Nombre del Producto',
    precio_unitario AS 'Precio Unitario'
FROM
    Productos;


/*
2) Obtener el listado de la cantidad total de unidades para cada pedido  
Mostrar: Pedido, Cantidad
 */
SELECT
    pd.pedido_id AS 'Pedido',
    SUM(pd.cantidad) AS 'Cantidad'
FROM
    pedidos_detalle AS pd
GROUP BY
    pd.pedido_id;


/*
3) 	Obtener el listado de todos los productos cuyo precio unitario se encuentre entre 10 y 15
Mostrar: Nombre del Producto
 */
-- para no hacer hard coding
-- me he dado el atrevimiento de usar variables
SET
    @valor_inicial = 10;

SET
    @valor_final = 15;

SELECT
    producto_nombre AS 'Nombre del Producto'
FROM
    productos
WHERE
    precio_unitario BETWEEN @valor_inicial AND @valor_final;


/*
4) Obtener el mayor descuento realizado en algún pedido
Mostrar: Descuento
 */
SELECT
    MAX(Descuento) AS Descuento
FROM
    (
        SELECT
            SUM(descuento) AS descuento
        FROM
            pedidos_detalle
        GROUP BY
            pedido_id
    ) AS DATA;


/*
5) Obtener el listado de todos los pedidos realizados en el año 1998
Mostrar: Todos los campos de Pedido
 */
-- seteamos el año por el cual quiero buscar
SET
    @year = '1998';

SELECT
    pedido_id AS 'Id Pedido',
    cliente_id AS 'Id Cliente',
    empleado_id AS 'Id Empleado',
    pedido_fecha AS 'Fecha de Pedido',
    pedido_envio_fecha AS 'Fecha de Envio',
    pedido_envio_via AS 'Pedido Via'
FROM
    pedidos
WHERE
    YEAR(pedido_fecha) IN (@year);


/*
6) 	Obtener la cantidad de productos que tiene cada categoría. 
Mostrar: Descripción de la Categoría, Cantidad de Productos
 */
-- selecciono todas las categoria existentes,
-- no estaría tomando los productos que no cuenten con categoria
SELECT
    c.categoria_nombre AS 'Categoria',
    COUNT(p.producto_id) AS 'Cantidad de Productos'
FROM
    categorias AS c
    LEFT JOIN productos AS p USING (categoria_id)
GROUP BY
    (categoria_id);


/*
7) 	Obtener el listado  de todos los empleados cuyo nombre comienzan con 'M'.
Mostrar: Nombre y Apellido del Empleado (En la misma columna)
 */
SELECT
    CONCAT_WS(
        ' ',
        UCASE(empleado_nombre),
        UCASE(empleado_apellido)
    ) AS 'Nombre y Apellido del Empleado'
FROM
    empleados
WHERE
    empleado_nombre REGEXP '^[M]';


/*
8) 	Obtener el nombre del producto cuyo precio unitario sea el mayor
Mostrar: Nombre del Producto, Precio Unitario

 */
SELECT
    producto_nombre AS 'Nombre del Producto',
    precio_unitario AS 'Precio Unitario'
FROM
    productos
WHERE
    precio_unitario IN (
        SELECT
            MAX(precio_unitario)
        FROM
            productos
    );

/*
9)  Crear un Stored Procedure 'Actualiza_Precio’' que aumente en un 10% el valor de los precios unitarios
 */
DROP PROCEDURE IF EXISTS Actualiza_Precio;

DELIMITER $$
CREATE PROCEDURE Actualiza_Precio (IN aumento INT) BEGIN
/*	para este caso, estoy haciendo un cambio en masivo,
por lo tanto permito cambiar el safe mode a false.
Sin embargo como buena practica es recomendado hacer
por item. 
 */
SELECT
    *
FROM
    productos;

SET
    sql_safe_updates = 0;

UPDATE productos
SET
    precio_unitario = precio_unitario * (1 + aumento / 100);

-- volvemos a setear el valor inicial
SET
    sql_safe_updates = 1;

SELECT
    *
FROM
    productos;

END $$ DELIMITER;

-- Detalle a tener en cuenta, si el precio_unitario tiene un constraint (dado a que puede ser un KEY)
-- en la dd.bb el procedure no se ejecutará, dependerá de si esa constraint tiene la posibilidad de
-- su integridad referencial. 
-- Para este caso estoy usando el precepto de que no tiene un constraint
-- declaro @aumento como una variable
SET
    @aumento = 10;

CALL Actualiza_Precio (@aumento);

/*
10) Crear un Stored Procedure 'Actualiza_Descuento’' 
para que reciba por parámetro un valor de descuento a realizar y lo sume al ya existente,
sólo a los pedidos de los clientes de Alaska, Costa Dorada y California.
 */
DROP PROCEDURE IF EXISTS Actualiza_Descuento;

DELIMITER $$
CREATE PROCEDURE Actualiza_Descuento (IN descuento INT) MODIFIES SQL DATA BEGIN
-- -- genero una tabla sólo como ayuda pivote
DROP TEMPORARY TABLE IF EXISTS temp_data;

CREATE TEMPORARY TABLE
    temp_data (
        SELECT
            p.pedido_id AS id,
            pd.producto_id AS p_id
        FROM
            pedidos p
            INNER JOIN pedidos_detalle pd USING (pedido_id)
        WHERE
            EXISTS (
                SELECT
                    cliente_id
                FROM
                    clientes
                WHERE
                    cliente_ciudad IN ('Silver Spring', 'El Paso', 'Dallas')
                    AND cliente_id = p.cliente_id
            )
    );

-- dado a que es un bulk update decido cambiar su status default
SET
    sql_safe_updates = 0;

UPDATE pedidos_detalle AS p
SET
    p.descuento = p.descuento * (1 + descuento / 100)
WHERE
    EXISTS (
        SELECT
            *
        FROM
            temp_data
        WHERE
            p.pedido_id = id
    );

SET
    sql_safe_updates = 1;

DROP TEMPORARY TABLE IF EXISTS temp_data;

END $$ DELIMITER;

CALL Actualiza_Descuento (5);

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --  notcompleted
/*
11) Listar la cantidad de unidades en stock para cada uno de los productos que pertenecen a una categoría
Mostrar:  Descripción de la categoría, Cantidad de unidades en stock

 */
DROP PROCEDURE IF EXISTS Productos_stock;

DELIMITER $$
CREATE PROCEDURE Productos_Stock (IN categoria VARCHAR(200)) MODIFIES SQL DATA BEGIN DECLARE validan BOOLEAN;

SELECT
    categoria_id INTO validan
FROM
    categorias
WHERE
    categoria_nombre = categoria;

IF validan IS NOT NULL THEN
SELECT
    p.unidades_stock AS 'Cantidad de unidades en stock',
    c.categoria_descripcion AS 'Descripción de la categoría'
FROM
    categorias AS c
    LEFT JOIN productos AS p USING (categoria_id)
WHERE
    categoria_nombre = (categoria);

ELSE
SELECT
    'Not a valid category  -> Sorry' AS message;

END IF;

END $$ DELIMITER;

SET
    @categoria = 'categoria1';

CALL Productos_Stock (@categoria);

/*
12) Listar todos los productos y la categoría a la que pertenecen.
Para las categorías desconocidas informar 'Sin Categoría'
Mostrar: Nombre del Producto, Nombre de la Categoría
 */
SELECT
    tabla.producto_nombre AS 'Nombre del Producto',
    IF(
        tabla.categoria_id IS NULL,
        'Sin Categoria',
        tabla.categoria_nombre
    )
FROM
    (
        SELECT
            p.producto_nombre,
            c.categoria_id,
            c.categoria_nombre
        FROM
            categorias AS c
            RIGHT JOIN productos AS p USING (categoria_id)
    ) AS tabla;

/*
13) Listar las regiones que aún no cuenten con un proveedor
Mostrar : Nombre de la Región

 */
SELECT
    tabla.nombre AS 'Nombre de la Region'
FROM
    (
        -- subtabla donde me almaceno los datos relevantes de la condición
        SELECT
            r.region_id,
            COUNT(p.proveedor_id),
            r.region_nombre AS 'nombre'
        FROM
            proveedores AS p
            RIGHT JOIN region AS r ON r.region_id = p.proveedor_region
        GROUP BY
            r.region_id
        HAVING
            COUNT(p.proveedor_id) = 0
    ) AS tabla;

/*
14) Listar los clientes que no entraron en mora
Mostrar: Nombre del cliente, Contacto del cliente

 */
SELECT
    cliente_nombre AS 'Nombre del cliente',
    cliente_contacto AS 'Contacto del cliente'
FROM
    clientes AS c
WHERE
    NOT EXISTS (
        SELECT
            *
        FROM
            clientes_morosos AS cm
        WHERE
            cm.cliente_id = c.cliente_id
    );

/*
15) Listar el monto total de mora de los clientes Antonio Moreno y Maria Anders
Mostrar: Monto total de mora (De ambos clientes)

 */
SET
    @cliente1 = 'Antonio Mora';

SET
    @cliente2 = 'Maria Anders';

SELECT
    IF(SUM(cm.mora) IS NOT NULL, SUM(cm.mora), 0) AS 'Monto total de mora'
FROM
    clientes c
    JOIN clientes_morosos cm USING (cliente_id)
WHERE
    cm.cliente_nombre IN (@cliente1, @cliente2);

/*

16) Listar el monto total de descuento aplicado a los clientes no morosos.
Agrupar el listado por cada una de las categorías conocidas y no conocidas. 
En el último caso informar Sin Categoría.
Mostrar: Nombre de la Categoría, Descuento.

 */
SELECT
    IF(
        c.categoria_nombre IS NOT NULL,
        c.categoria_nombre,
        'Sin Categoria'
    ) AS 'Nombre de la Categoría',
    SUM(pd.descuento) AS 'Descuento'
FROM
    pedidos_detalle AS pd
    JOIN pedidos AS ped USING (pedido_id)
    LEFT JOIN productos AS p USING (producto_id)
    LEFT JOIN categorias AS c USING (categoria_id)
WHERE
    NOT EXISTS ( -- -- clientes no morosos
        SELECT
            *
        FROM
            clientes_morosos AS cm
        WHERE
            cm.cliente_id = ped.cliente_id
    )
GROUP BY
    c.categoria_nombre;

/*
17)Listar a todos los empleados y a su jefe (Según a quién reporta el empleado)
Mostrar : Nombre del Empleado, Nombre del Jefe
 */
SELECT
    empleado_nombre AS 'Nombre del Empleado',
    empleado_reporta_a AS 'Nombre del jefe'
FROM
    empleados
WHERE
    empleado_reporta_a IS NOT NULL;

/*
18) Listar a todos los empleados y a su jefe (Según a quién reporta el empleado).
Para el caso de los empleados que no reportan a nadie informar "Sin Jefe"
Mostrar : Nombre del Empleado, Nombre del Jefe

 */
SELECT
    empleado_nombre AS 'Nombre del Empleado',
    IF(
        empleado_reporta_a IS NULL,
        'Sin Jefe',
        empleado_reporta_a
    ) AS 'Nombre del jefe'
FROM
    empleados;

/*
19) Obtener el monto total al que ascienden todos los pedidos de los clientes 
cuyas regiones tienen proveedor, agrupado por producto y empleado
Mostrar: Nombre de Empleado, Nombre de Producto, Monto
 */
-- Con esto declaro las regiones que tienen proveedor
-- Me creo una view para apoyarme y conseguir la de proveedores y regiones
CREATE VIEW
    dataProv_region AS
SELECT
    r.region_id AS region
FROM
    proveedores AS p
    RIGHT JOIN region AS r ON r.region_id = p.proveedor_region
GROUP BY
    r.region_id
HAVING
    COUNT(p.proveedor_id) > 0;

-- --  Con esto busco que cumpla las condiciones de anidamiento
SELECT
    empleado_nombre AS 'Nombre de Empleado',
    producto_nombre AS 'Nombre de producto',
    -- sum(pd.cantidad) as cantidad,
    pro.precio_unitario * SUM(pd.cantidad) AS Monto
FROM
    pedidos AS p
    JOIN clientes AS c USING (cliente_id)
    JOIN pedidos_detalle AS pd USING (pedido_id)
    JOIN empleados AS e USING (empleado_id)
    JOIN productos AS pro USING (producto_id)
WHERE
    e.empleado_region IN (
        SELECT
            region
        FROM
            dataProv_region
    )
GROUP BY
    e.empleado_id,
    producto_id;

/*
20) Crear una tabla llamada Clientes_Inactivos 
Campos: Cliente_Id nchar(5) not null, Cliente_Nombre varchar(20) null
 */
DROP TABLE IF EXISTS Clientes_Inactivos;

CREATE TABLE IF NOT EXISTS
    Clientes_Inactivos (
        cliente_id VARCHAR(5) NOT NULL,
        cliente_nombre VARCHAR(20)
    );

/*
21) Insertar en la tabla Clientes_Inactivos a aquellos clientes que no hayan realizado pedidos
 */
DROP PROCEDURE IF EXISTS sp_Clientes_Inactivos;

DELIMITER $$
CREATE PROCEDURE sp_Clientes_Inactivos () MODIFIES SQL DATA BEGIN
INSERT INTO
    Clientes_inactivos
SELECT
    CAST(cliente_id AS CHAR(5)),
    CAST(cliente_nombre AS CHAR(50))
FROM
    clientes
WHERE
    NOT EXISTS (
        SELECT
            *
        FROM
            pedidos
        WHERE
            cliente_id = clientes.cliente_id
    );

END $$ DELIMITER;

CALL sp_Clientes_Inactivos ();