/*poblarOk*/

/*condicion_fisica*/
INSERT INTO CONDICION_FISICA(id_condicion,condicionactual,peso,altura) VALUES('1000054','SEDENTARIO','72','170');
INSERT INTO CONDICION_FISICA(id_condicion,condicionactual,peso,altura) VALUES('1000053','DEPORTISTA','80','190');
INSERT INTO CONDICION_FISICA(id_condicion,condicionactual,peso,altura) VALUES('1000052','BAJA ACTIVIDAD','120','165');

/*Enfermedades*/
INSERT INTO ENFERMEDADES(id_enfermedad,descripcion,id_condicion) VALUES('2983475829','Diabetes','1000054');
INSERT INTO ENFERMEDADES(id_enfermedad,descripcion,id_condicion) VALUES('2983475828','Hipotiroidismo','1000053');
INSERT INTO ENFERMEDADES(id_enfermedad,descripcion,id_condicion) VALUES('2983475827','Problemas Cardiacos','1000052');

/*Tipo_rutina*/
INSERT INTO TIPO_RUTINA(idtiporutina,dificultad,duracion,objetivo) VALUES('36','BAJA','15','MANTENERSE EN FORMA');
INSERT INTO TIPO_RUTINA(idtiporutina,dificultad,duracion,objetivo) VALUES('35','MEDIA','60','GANAR MUSCULO'); 
INSERT INTO TIPO_RUTINA(idtiporutina,dificultad,duracion,objetivo) VALUES('34','ALTA','90','PERDER PESO');

/*Implementos*/
INSERT INTO IMPLEMENTOS(implementos,idtiporutina,ejercicio_nombre) VALUES('Banda elastica','36','Tren superior biceps');
INSERT INTO IMPLEMENTOS(implementos,idtiporutina,ejercicio_nombre) VALUES('Mancuernas','35','Tren inferior Gemelos');
INSERT INTO IMPLEMENTOS(implementos,idtiporutina,ejercicio_nombre) VALUES('Mancuernas','34','Tren superior triceps');

/*Paquete*/
INSERT INTO PAQUETE(nombre,precio,duracion,descripcion,descuento,idtiporutina) VALUES('PaqueteTrenSuperior','100','1','Entrenamiento todos los musculos de la parte superior del cuerpo','TRUE','36');
INSERT INTO PAQUETE(nombre,precio,duracion,descripcion,descuento,idtiporutina) VALUES('PaqueteTrenInferior','100','1','Entrenamiento todos los musculos de la parte inferior del cuerpo','FALSE','35');
INSERT INTO PAQUETE(nombre,precio,duracion,descripcion,descuento,idtiporutina) VALUES('PaquetePausasActivas','80','1','Pausas activar para matenerse saludable y estirar los musculos','TRUE','34');

/*plan_entrenamiento*/
INSERT INTO PLAN_ENTRENAMIENTO(codigo,nombre,dificultad,descripcion,objetivo) VALUES('1234','Pausas Sanas','BAJA','Entrenamiento de 15 minutos diarios para estirar los musculos','Pausas Activas');
INSERT INTO PLAN_ENTRENAMIENTO(codigo,nombre,dificultad,descripcion,objetivo) VALUES('1235','Calorias al cero','MEDIA','Rutina para bajar de peso ciclos 4x4 de 1 hora','Bajar de peso');
INSERT INTO PLAN_ENTRENAMIENTO(codigo,nombre,dificultad,descripcion,objetivo) VALUES('1236','Cuerpo ideal','ALTA','Rutina para entrenar los diferentes musculos del cuerpo dividido por dias','Rutina General');

/*Paquete_planentrenamiento*/
INSERT INTO PAQUETE_PLANENTRENAMIENTO(nombre,codigo) VALUES ('PaqueteTrenSuperior','1234');
INSERT INTO PAQUETE_PLANENTRENAMIENTO(nombre,codigo) VALUES ('PaqueteTrenInferior','1235');
INSERT INTO PAQUETE_PLANENTRENAMIENTO(nombre,codigo) VALUES ('PaquetePausasActivas','1236');

/*Usuario*/

--Para paquetes y clientes
INSERT INTO usuario (nid,tipoid,nombre,correo_electronico,telefono,id_condicion,idtiporutina,paquete_nombre) VALUES('1001297634','CC','juan perez','juanP@gmail.com','3118516856','1000054','36','PaqueteTrenSuperior');
INSERT INTO usuario (nid,tipoid,nombre,correo_electronico,telefono,id_condicion,idtiporutina,paquete_nombre) VALUES('1001297633','CC','juan gomez','juanG@gmail.com','3118516857','1000053','35','PaquetePausasActivas');
INSERT INTO usuario (nid,tipoid,nombre,correo_electronico,telefono,id_condicion,idtiporutina,paquete_nombre) VALUES('1001297632','CC','juan torres','juanT@gmail.com','3118516858','1000052','34','PaqueteTrenInferior');

--para patrocinador
INSERT INTO usuario (nid,tipoid,nombre,correo_electronico,telefono,id_condicion,idtiporutina,paquete_nombre) VALUES('1001297655','NIT','juan perez','juanq@gmail.com','3118516856','1000054','36','PaqueteTrenSuperior');
INSERT INTO usuario (nid,tipoid,nombre,correo_electronico,telefono,id_condicion,idtiporutina,paquete_nombre) VALUES('1001297654','NIT','juan gomez','juanb@gmail.com','3118516857','1000053','35','PaquetePausasActivas');
INSERT INTO usuario (nid,tipoid,nombre,correo_electronico,telefono,id_condicion,idtiporutina,paquete_nombre) VALUES('1001297653','NIT','juan torres','juann@gmail.com','3118516858','1000052','34','PaqueteTrenInferior');


/*Patrocinador*/
INSERT INTO PATROCINADOR(nid,tipoid,Empresa,sitio_web,Tipo_empresa) VALUES('1001297655','NIT','Imperius','WWW.imperius.COM','Implemento');
INSERT INTO PATROCINADOR(nid,tipoid,Empresa,sitio_web,Tipo_empresa) VALUES('1001297654','NIT','SmartFit','WWW.smartfit.COM','Gimnasio');
INSERT INTO PATROCINADOR(nid,tipoid,Empresa,sitio_web,Tipo_empresa) VALUES('1001297653','NIT','InfoShop','WWW.infoshop.COM','Tecnologia');

/*Cliente*/
INSERT INTO CLIENTE(nid,tipoid,genero,fecha_nacimiento,fecha_registro) VALUES('1001297634','CC','M',TO_DATE('1990-01-01', 'YYYY-MM-DD'),TO_DATE('2022-04-09','YYYY-MM-DD'));
INSERT INTO CLIENTE(nid,tipoid,genero,fecha_nacimiento,fecha_registro) VALUES('1001297633','CC','M',TO_DATE('1990-01-01', 'YYYY-MM-DD'),TO_DATE('2022-04-09','YYYY-MM-DD'));
INSERT INTO CLIENTE(nid,tipoid,genero,fecha_nacimiento,fecha_registro) VALUES('1001297632','CC','M',TO_DATE('1990-01-01', 'YYYY-MM-DD'),TO_DATE('2022-04-09','YYYY-MM-DD'));

/*Ofrece*/
INSERT INTO OFRECE(cliente_nid,cliente_tipoid,patrocinador_nid,patrocinador_tipoid,producto,tipo_producto) VALUES('1001297634','CC','1001297655','NIT','Reloj deportivo','Tecnologia');
INSERT INTO OFRECE(cliente_nid,cliente_tipoid,patrocinador_nid,patrocinador_tipoid,producto,tipo_producto) VALUES('1001297633','CC','1001297654','NIT','Camiseta deportiva','Prendas');
INSERT INTO OFRECE(cliente_nid,cliente_tipoid,patrocinador_nid,patrocinador_tipoid,producto,tipo_producto) VALUES('1001297632','CC','1001297653','NIT','Banda elasctica','Entrenamiento');