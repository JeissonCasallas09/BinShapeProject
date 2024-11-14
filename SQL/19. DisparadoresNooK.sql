/*DisparadoresNOOK*/

/*Se debe validar que el cliente sea mayor de 16 años*/

INSERT INTO CLIENTE(nid,tipoid,genero,fecha_nacimiento,fecha_registro) VALUES('1001297634','TI','M',TO_DATE('2010-01-01', 'YYYY-MM-DD'),TO_DATE('2022-04-09','YYYY-MM-DD'));

/*valida la duracion del paquete al momento de insertar un nuevo registro que esta no sobrepase el año*/

INSERT INTO PAQUETE(nombre,precio,duracion,descripcion,descuento,idtiporutina) VALUES('PaqueteCompleto','105','18','Entrenamiento todos los musculos de la parte superior del cuerpo','TRUE','36');