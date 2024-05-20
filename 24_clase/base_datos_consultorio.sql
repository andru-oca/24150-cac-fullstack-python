-- BORRAME ESTA BASE DE DATOS SI EXISTE
DROP DATABASE IF EXISTS consultorio_adriana;
-- CREAR UNA BASE DATOS
CREATE DATABASE consultorio_adriana;

USE consultorio_adriana;

CREATE TABLE medico(
    medico_cuit     VARCHAR(11) NOT NULL
,   nombre          VARCHAR(200)
,   especialidad    VARCHAR(200)
,   PRIMARY KEY (medico_cuit)
);


CREATE TABLE paciente(
    paciente_dni    VARCHAR(8) NOT NULL
,   email           VARCHAR(200)
,   edad            INT
,   PRIMARY KEY (paciente_dni)
);



CREATE TABLE link_paciente_medico(
    medico_cuit  VARCHAR(11)    -- FK
,   paciente_dni VARCHAR(8)     -- FK
,   med_cabecera BOOL DEFAULT TRUE
,   PRIMARY KEY(medico_cuit, paciente_dni)
);


-- ADD FOREIGN KEY
ALTER TABLE link_paciente_medico
    ADD CONSTRAINT fk_medico_link
    FOREIGN KEY (medico_cuit) REFERENCES medico(medico_cuit);

ALTER TABLE link_paciente_medico
    ADD CONSTRAINT fk_paciente_link
    FOREIGN KEY (paciente_dni) REFERENCES paciente(paciente_dni);


CREATE TABLE obra_social(
    obra_social_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT
,   nombre  VARCHAR(200)
,   plan    VARCHAR(100)
);

CREATE TABLE facturacion(
    id_factura      INT PRIMARY KEY NOT NULL AUTO_INCREMENT
,   medico_cuit     VARCHAR(11)
,   paciente_dni    VARCHAR(8)
,   obra_social_id  INT
,   precio          DECIMAL(12,2)
,   fecha           DATE DEFAULT (CURRENT_DATE)  -- "YYYY-MM-DD"
);


ALTER TABLE facturacion
    ADD CONSTRAINT fk_medico_fact
    FOREIGN KEY (medico_cuit) REFERENCES medico(medico_cuit);


ALTER TABLE facturacion
    ADD CONSTRAINT fk_paciente_fact
    FOREIGN KEY (paciente_dni) REFERENCES paciente(paciente_dni);


ALTER TABLE facturacion
    ADD CONSTRAINT fk_obra_social_fact
    FOREIGN KEY (obra_social_id) REFERENCES obra_social(obra_social_id);



USE consultorio_adriana;
-- INGRESAR DATOS
INSERT INTO
    medico
VALUES
(9999999990,"marcelo","cardiologo intervencionista");

SELECT
medico_cuit
,nombre
,especialidad

FROM medico;


INSERT INTO
    paciente
VALUES
("86876876","emma", 56);


INSERT INTO link_paciente_medico
VALUES
("9999999990", "86876876", FALSE);


INSERT INTO obra_social
(nombre, plan)
VALUES
("OSDE","501"),
("GALENO","ORO"),
("SANCOR","310");


INSERT INTO facturacion
VALUES
(NULL,"9999999990","86876876",3,40000,DEFAULT);


DELETE FROM facturacion
WHERE id_factura = 2;



INSERT INTO facturacion
VALUES
(NULL,"9999999990","86876876",3,50000,"2023-10-10");


INSERT INTO facturacion
VALUES
(2,"9999999990","86876876",3,1000,DEFAULT);


UPDATE facturacion
SET obra_social_id = 2
WHERE id_factura = 4;