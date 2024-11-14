/*Vistas*/

CREATE VIEW dias_clientes as (SELECT * FROM cliente WHERE fecha_registro <= SYSDATE - 30);
CREATE VIEW genero_clientes as(SELECT genero, COUNT(*) AS cantidad_usuarios FROM cliente GROUP BY genero);
CREATE VIEW paquetes_descuento as(Select * from PAQUETE where descuento='TRUE');
CREATE VIEW dificultad_plan as(Select * from PLAN_ENTRENAMIENTO where dificultad='ALTA');