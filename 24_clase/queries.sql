USE consultorio_adriana;

-- que especialidades tiene el consultorio

SELECT DISTINCT
    especialidad
FROM medico;

-- quiero saber la facturacion total de adriana

SELECT 
    *
FROM facturacion
WHERE 
    medico_cuit = "23998877665";



-- subqueries
SELECT 
    medico.nombre
,   'adrian@mail.com' AS email_profesional
,   medico.especialidad
,   facturacion.medico_cuit
,   SUM(precio) AS facturacion_total
,   COUNT( DISTINCT paciente_dni) AS cantidad_pacientes
FROM facturacion
JOIN medico
    ON medico.medico_cuit = facturacion.medico_cuit

WHERE 
    facturacion.medico_cuit = (SELECT 
                        medico_cuit
                    FROM medico
                    WHERE 
                        nombre LIKE "%adri%")
GROUP BY medico_cuit;
                        