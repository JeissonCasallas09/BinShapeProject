/*DisparadoresOK*/

/*Se debe validar que el cliente sea mayor de 16 años*/
INSERT INTO usuario (nid,tipoid,nombre,correo_electronico,telefono,id_condicion,idtiporutina,paquete_nombre) VALUES('1001297634','TI','juan perez','juanq@gmail.com','3118516856','1000054','36','PaquetePausasActivas');
INSERT INTO CLIENTE(nid,tipoid,genero,fecha_nacimiento,fecha_registro) VALUES('1001297634','TI','M',TO_DATE('2003-01-01', 'YYYY-MM-DD'),TO_DATE('2022-04-09','YYYY-MM-DD'));

/*valida la duracion del paquete al momento de insertar un nuevo registro que esta no sobrepase el año*/

INSERT INTO PAQUETE(nombre,precio,duracion,descripcion,descuento,idtiporutina) VALUES('PaqueteCompleto','100','10','Entrenamiento todos los musculos de la parte superior del cuerpo','FALSE','36');

/*Se debe actualizar el precio en caso de que se le agregue un descuento*/

INSERT INTO PAQUETE(nombre,precio,duracion,descripcion,descuento,idtiporutina) VALUES('EntrenoGeneral','100','11','Entrenamiento todos los musculos de la parte superior del cuerpo','TRUE','36');


/*La fecha de registro de la tabla cliente se autogenera*/
INSERT INTO usuario (nid,tipoid,nombre,correo_electronico,telefono,id_condicion,idtiporutina,paquete_nombre) VALUES('1001297488','CC','juan perez','juanq@gmail.com','3118516856','1000054','36','PaqueteTrenSuperior');
INSERT INTO CLIENTE(nid,tipoid,genero,fecha_nacimiento,fecha_registro) VALUES('1001297488','CC','M',TO_DATE('1990-01-01', 'YYYY-MM-DD'),'');

/*Se autogenera un id para la tabla condicion_fisica*/

INSERT INTO CONDICION_FISICA(id_condicion,condicionactual,peso,altura) VALUES('','BAJA ACTIVIDAD','120','165');

/*Se autogenera un id para la tabla plan_entrenamiento*/

INSERT INTO PLAN_ENTRENAMIENTO(codigo,nombre,dificultad,descripcion,objetivo) VALUES('','Pausas activa','ALTA','Rutina para entrenar los diferentes musculos del cuerpo dividido por dias','Rutina General');

/*se autogenera un id para la tabla tipo_rutina*/

INSERT INTO TIPO_RUTINA(idtiporutina,dificultad,duracion,objetivo) VALUES('','BAJA','15','MANTENERSE EN FORMA');


/*se restringe la eliminacion de condicion_fisica*/

DELETE FROM condicion_fisica where id_condicion='1000054';

/*se restringe la eliminacion de tipo_rutina*/

DELETE FROM tipo_rutina where idtiporutina='34';


/*restringe la modificacion de la tabla paquetes*/


UPDATE PAQUETE SET duracion='1' where nombre='PaqueteTrenSuperior';


/*restringe la modificacion de la tabla plan de entrenamiento*/

UPDATE PLAN_ENTRENAMIENTO SET dificultad='ALTA' where codigo='1234';


