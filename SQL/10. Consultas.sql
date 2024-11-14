/*CONSULTAS*/

/*Consultar los clientes que llevan mas de 30 dias haciendo uso de la aplicacion*/

SELECT * FROM cliente WHERE fecha_registro <= SYSDATE - 30;

/*Consultar cuantos usuarios son hombres y cuantos son mujeres dentro de la aplicacion*/

SELECT genero, COUNT(*) AS cantidad_usuarios FROM cliente GROUP BY genero;

/*Consultar los paquetes que se encuentran en descuento*/

Select * from PAQUETE where descuento='TRUE';

/*Consultar los planes de entrenamiento con dificultad alta*/

Select * from PLAN_ENTRENAMIENTO where dificultad='ALTA';
