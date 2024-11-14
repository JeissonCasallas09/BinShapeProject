/*TuplasOK*/

/*el nombre debe contener un espacio entre el primer nombre y el apellido*/

INSERT INTO usuario (nid,tipoid,nombre,correo_electronico,telefono,id_condicion,idtiporutina,paquete_nombre) VALUES('1001297586','CC','juan perez','juanP@gmail.com','3118516856','1000054','36','PaqueteTrenSuperior');


/*El tipoid del patrocinador debe ser NIT siempre*/
INSERT INTO usuario (nid,tipoid,nombre,correo_electronico,telefono,id_condicion,idtiporutina,paquete_nombre) VALUES('1001284878','NIT','juan torres','juano@gmail.com','3118516858','1000052','34','PaqueteTrenInferior');
INSERT INTO PATROCINADOR(nid,tipoid,Empresa,sitio_web,Tipo_empresa) VALUES('1001284878','NIT','Imperius','WWW.imperius.COM','Implemento');

/*El tipoid del cliente debe ser CC o TI*/
INSERT INTO usuario (nid,tipoid,nombre,correo_electronico,telefono,id_condicion,idtiporutina,paquete_nombre) VALUES('1001284888','TI','juana garcia','juana@gmail.com','3118516858','1000052','34','PaquetePausasActivas');
INSERT INTO CLIENTE(nid,tipoid,genero,fecha_nacimiento,fecha_registro) VALUES('1001284888','TI','M',TO_DATE('1990-01-01', 'YYYY-MM-DD'),TO_DATE('2022-04-09','YYYY-MM-DD'));

/*el peso debe ser mayor a 1*/

INSERT INTO CONDICION_FISICA(id_condicion,condicionactual,peso,altura) VALUES('1000052','BAJA ACTIVIDAD','120','165');


/*Altura debe ser mayor a 100 debido a que esta en CM y debe ser menos a 250*/

INSERT INTO CONDICION_FISICA(id_condicion,condicionactual,peso,altura) VALUES('1000052','BAJA ACTIVIDAD','120','165');
