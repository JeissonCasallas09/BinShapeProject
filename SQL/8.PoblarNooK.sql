/*POBLARNOOK*/

/*No coincide con el formato para agregar los DATE*/
INSERT INTO CLIENTE(nid,tipoid,genero,fecha_nacimiento,fecha_registro) VALUES('1001297632','CC','M','1990-01-01','2022-04-09');

/*No cumple con la integridad del sitioweb debido a las minusculas*/
INSERT INTO PATROCINADOR(nid,tipoid,Empresa,sitio_web,Tipo_empresa) VALUES('1001297653','NIT','InfoShop','www.infoshop.com','Tecnologia');

/*el codigo de id_condicion no cumple con el maximo de caracteres, lo sobrepasa*/
INSERT INTO usuario (nid,tipoid,nombre,correo_electronico,telefono,id_condicion,idtiporutina,paquete_nombre) VALUES('1001297653','NIT','juan torres','juanT@gmail.com','3118516858','10000527','34','PaquetePremium');

/*llave primaria no puede ser nula*/

INSERT INTO CONDICION_FISICA(id_condicion,condicionactual,peso,altura) VALUES('','SEDENTARIO','72','170');

/*No corresponde al tipo de Id de una empresa*/

INSERT INTO PATROCINADOR(nid,tipoid,Empresa,sitio_web,Tipo_empresa) VALUES('1001297653','TI','InfoShop','WWW.infoshop.COM','Tecnologia');