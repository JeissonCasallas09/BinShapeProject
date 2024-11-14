/*CRUDOK*/

/*PC_USUARIO*/

-- Comprobacion del procedimiento adicionar_usuario
INSERT INTO PAQUETE(nombre,precio,duracion,descripcion,descuento,idtiporutina) VALUES('PaqueteTrenSuperior','100','1','Entrenamiento todos los musculos de la parte superior del cuerpo','TRUE','36');
INSERT INTO PAQUETE(nombre,precio,duracion,descripcion,descuento,idtiporutina) VALUES('PaqueteTrenInferior','100','1','Entrenamiento todos los musculos de la parte inferior del cuerpo','FALSE','35');
INSERT INTO PAQUETE(nombre,precio,duracion,descripcion,descuento,idtiporutina) VALUES('PaquetePausasActivas','80','1','Pausas activar para matenerse saludable y estirar los musculos','TRUE','34');
BEGIN
    PC_USUARIO.adicionar_usuario('123456788', 'TI', 'Juan Perez', 'juan@example.com', 3118516856, '1000052','34','PaqueteTrenInferior');
END;
/
-- Comprobacion del procedimiento modificar_usuario
BEGIN
    PC_USUARIO.modificar_usuario('123456788', 'TI', 'Juan Perez', 'juan@example.com', 3118516856);
END;
/
-- Comprobacion del procedimiento eliminar_usuario
BEGIN
    PC_USUARIO.eliminar_usuario('123456788', 'TI');
END;
/
-- Comprobacion del procedimiento adicionar_cliente

BEGIN
    PC_USUARIO.adicionar_cliente('1001000000', 'CC', 'M', TO_DATE('1990-01-01', 'YYYY-MM-DD'), SYSDATE);
END;
/
-- Comprobacion del procedimiento eliminar_cliente
BEGIN
    PC_USUARIO.eliminar_cliente('1001000000', 'CC');
END;
/
-- Comprobacion del procedimiento adicionar_patrocinador
INSERT INTO usuario (nid,tipoid,nombre,correo_electronico,telefono,id_condicion,idtiporutina,paquete_nombre) VALUES('1001000001', 'NIT','juan torres','juanT@gmail.com','3118516858','1000052','34','PaqueteTrenInferior');
/
BEGIN
    PC_USUARIO.adicionar_patrocinador('1001000001', 'NIT', 'Empresa', 'WWW.empresa1.COM', 'Empresa');
END;
/
select * from patrocinador;
-- Comprobacion del procedimiento eliminar_patrocinador
BEGIN
    PC_USUARIO.eliminar_patrocinador('1001000001', 'NIT');
END;
/

--comprobacion consultar_cliente_dias
CREATE OR REPLACE PROCEDURE obtener_clientes_dias AS
    v_cursor SYS_REFCURSOR;
    v_cliente_nid cliente.nid%TYPE;
    v_cliente_tipoid cliente.tipoid%TYPE;
    v_cliente_genero cliente.genero%TYPE;
    v_cliente_fecha_nacimiento cliente.fecha_nacimiento%TYPE;
    v_cliente_fecha_registro cliente.fecha_registro%TYPE;
BEGIN
    v_cursor := PC_USUARIO.consultar_cliente_dias;
    LOOP
        FETCH v_cursor INTO v_cliente_nid, v_cliente_tipoid, v_cliente_genero, v_cliente_fecha_registro;
        EXIT WHEN v_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Cliente: nid ' || v_cliente_nid || ', ' || v_cliente_tipoid || ' - genero ' || v_cliente_genero || ' - fecha registro: ' || v_cliente_fecha_registro);
    END LOOP;
    CLOSE v_cursor;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al consultar los clientes que llevan más de 30 días: '|| SQLERRM);
END;
/

begin
obtener_clientes_dias;
end;
/
--comprobacion consultar_genero

CREATE OR REPLACE PROCEDURE obtener_consulta_genero IS
    v_cursor SYS_REFCURSOR;
    v_genero cliente.genero%TYPE;
    v_cantidad_usuarios NUMBER;
BEGIN
    v_cursor := PC_USUARIO.consultar_genero;

    LOOP
        FETCH v_cursor INTO v_genero, v_cantidad_usuarios;
        EXIT WHEN v_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Género: ' || v_genero || ', Cantidad de Usuarios: ' || v_cantidad_usuarios);
    END LOOP;

    CLOSE v_cursor;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al ejecutar la consulta de género: ' || SQLERRM);
END;
/

begin
    obtener_consulta_genero;
end;
/

--comprobacion consultar usuario

CREATE OR REPLACE PROCEDURE ejecutar_consulta_usuario(p_nid in VARCHAR2, p_tipoid in VARCHAR2) IS
    v_cursor SYS_REFCURSOR;
    v_usuario_id usuario.nid%TYPE;
    v_usuario_nid usuario.nid%TYPE;
    v_usuario_tipoid usuario.tipoid%TYPE;
    v_usuario_nombre usuario.nombre%TYPE;
    v_usuario_correo_electronico usuario.correo_electronico%TYPE;
    v_usuario_telefono usuario.telefono%TYPE;
    v_usuario_id_condicion usuario.id_condicion%TYPE;
    v_usuario_idtiporutina usuario.idtiporutina%TYPE;
    v_usuario_paquete_nombre usuario.paquete_nombre%TYPE;
BEGIN
    v_cursor := PC_USUARIO.consultar_usuario(p_nid,p_tipoid);

    LOOP
        FETCH v_cursor INTO v_usuario_nid, v_usuario_tipoid, v_usuario_nombre, v_usuario_correo_electronico, v_usuario_telefono, v_usuario_id_condicion, v_usuario_idtiporutina, v_usuario_paquete_nombre;
        EXIT WHEN v_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Usuario: ID ' || v_usuario_id || ', NID ' || v_usuario_nid || ', TipoID ' || v_usuario_tipoid || ', Nombre ' || v_usuario_nombre || ', Correo Electrónico ' || v_usuario_correo_electronico || ', Teléfono ' || v_usuario_telefono || ', ID Condición ' || v_usuario_id_condicion || ', ID Tipo Rutina ' || v_usuario_idtiporutina || ', Paquete Nombre ' || v_usuario_paquete_nombre);
    END LOOP;

    CLOSE v_cursor;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al ejecutar la consulta de usuarios: ' || SQLERRM);
END;
/
BEGIN
    ejecutar_consulta_usuario('1001297634','CC');
END;
/

--comprobacion consultar cliente
CREATE OR REPLACE PROCEDURE ejecutar_consulta_cliente(p_nid in VARCHAR2, p_tipoid in VARCHAR2) IS
    v_cursor SYS_REFCURSOR;
    v_cliente_nid cliente.nid%TYPE;
    v_cliente_tipoid cliente.tipoid%TYPE;
    v_cliente_genero cliente.genero%TYPE;
    v_cliente_fecha_nacimiento cliente.fecha_nacimiento%TYPE;
    v_cliente_fecha_registro cliente.fecha_registro%TYPE;
BEGIN
    v_cursor := PC_USUARIO.consultar_cliente(p_nid,p_tipoid);

    LOOP
        FETCH v_cursor INTO v_cliente_nid, v_cliente_tipoid, v_cliente_genero, v_cliente_fecha_nacimiento, v_cliente_fecha_registro;
        EXIT WHEN v_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Cliente: NID ' || v_cliente_nid || ', TipoID ' || v_cliente_tipoid || ', Género ' || v_cliente_genero || ', Fecha de Nacimiento ' || v_cliente_fecha_nacimiento || ', Fecha de Registro ' || v_cliente_fecha_registro);
    END LOOP;

    CLOSE v_cursor;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al ejecutar la consulta de clientes: ' || SQLERRM);
END;
/

BEGIN
    ejecutar_consulta_cliente('1001297634','CC');
END;
/


--comprobacion consultar patrocinador

CREATE OR REPLACE PROCEDURE ejecutar_consulta_patrocinador(p_nid in VARCHAR2, p_tipoid in VARCHAR2) IS
    v_cursor SYS_REFCURSOR;
    v_patrocinador_nid patrocinador.nid%TYPE;
    v_patrocinador_tipoid patrocinador.tipoid%TYPE;
    v_patrocinador_empresa patrocinador.empresa%TYPE;
    v_patrocinador_sitio_web patrocinador.sitio_web%TYPE;
    v_patrocinador_tipo_empresa patrocinador.tipo_empresa%TYPE;
BEGIN
    v_cursor := PC_USUARIO.consultar_patrocinador(p_nid,p_tipoid);

    LOOP
        FETCH v_cursor INTO v_patrocinador_nid, v_patrocinador_tipoid, v_patrocinador_empresa, v_patrocinador_sitio_web, v_patrocinador_tipo_empresa;
        EXIT WHEN v_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Patrocinador: NID ' || v_patrocinador_nid || ', TipoID ' || v_patrocinador_tipoid || ', Empresa ' || v_patrocinador_empresa || ', Sitio Web ' || v_patrocinador_sitio_web || ', Tipo de Empresa ' || v_patrocinador_tipo_empresa);
    END LOOP;

    CLOSE v_cursor;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al ejecutar la consulta de patrocinadores: ' || SQLERRM);
END;
/

BEGIN
    ejecutar_consulta_patrocinador('1001297655','NIT');
END;
/

/*PC_OFRECE*/
INSERT INTO usuario (nid,tipoid,nombre,correo_electronico,telefono,id_condicion,idtiporutina,paquete_nombre) VALUES('1001297666','NIT','juan torres','juann@gmail.com','3118516858','1000052','34','PaqueteTrenInferior');
INSERT INTO usuario (nid,tipoid,nombre,correo_electronico,telefono,id_condicion,idtiporutina,paquete_nombre) VALUES('1001297666','CC','juan torres','juann@gmail.com','3118516858','1000052','34','PaqueteTrenInferior');
INSERT INTO PATROCINADOR(nid,tipoid,Empresa,sitio_web,Tipo_empresa) VALUES('1001297666','NIT','InfoShop','WWW.infoshop.COM','Tecnologia');
INSERT INTO CLIENTE(nid,tipoid,genero,fecha_nacimiento,fecha_registro) VALUES('1001297666','CC','M',TO_DATE('1990-01-01', 'YYYY-MM-DD'),TO_DATE('2022-04-09','YYYY-MM-DD'));

BEGIN
    PC_OFRECE.adicionar_ofrece('1001297666', 'CC', '1001297666', 'NIT', 'Producto A', 'Prendas');
END;
/
BEGIN
    PC_OFRECE.modificar_ofrece('1001297666', 'CC', '1001297666', 'NIT', 'Producto B', 'Prendas');
END;
/
BEGIN
    PC_OFRECE.eliminar_ofrece('1001297666', 'CC', '1001297666', 'NIT');
END;
/
--consultar_oferta

CREATE OR REPLACE PROCEDURE obtener_ofertas(p_cliente_nid in VarChar2, p_cliente_tipoid in VarChar2, p_patrocinador_nid in VarChar2, p_patrocinador_tipoid in VarChar2) IS
    v_cursor SYS_REFCURSOR;
    v_cliente_nid ofrece.cliente_nid%TYPE;
    v_cliente_tipoid ofrece.cliente_tipoid%TYPE;
    v_patrocinador_nid ofrece.patrocinador_nid%TYPE;
    v_patrocinador_tipoid ofrece.patrocinador_tipoid%TYPE;
    v_producto ofrece.producto%TYPE;
    v_tipo_producto ofrece.tipo_producto%TYPE;
BEGIN
    v_cursor := PC_OFRECE.consultar_ofrece(p_cliente_nid,p_cliente_tipoid,p_patrocinador_nid,p_patrocinador_tipoid);

    LOOP
        FETCH v_cursor INTO v_cliente_nid, v_cliente_tipoid, v_patrocinador_nid, v_patrocinador_tipoid, v_producto, v_tipo_producto;
        EXIT WHEN v_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Oferta: Cliente ' || v_cliente_nid || ', ' || v_cliente_tipoid || ' - Patrocinador ' || v_patrocinador_nid || ', ' || v_patrocinador_tipoid || ' - Producto: ' || v_producto || ' - Tipo de producto: ' || v_tipo_producto);
    END LOOP;
    CLOSE v_cursor;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al consultar las ofertas: '|| SQLERRM);
END;
/

BEGIN
    obtener_ofertas('1001297634','CC','1001297655','NIT');
END;
/

/*PC_CONDICION_FISICA*/

BEGIN
    PC_CONDICION_FISICA.adicionar_condicion_fisica('1012638', 'SEDENTARIO', 70, 170);
END;
/
BEGIN
    PC_CONDICION_FISICA.modificar_condicion_fisica('1012638', 'SEDENTARIO', 70, 170);
END;
/

BEGIN
    PC_CONDICION_FISICA.adicionar_enfermedades('1000054', 'CANCER', '2321348379');
END;
/
BEGIN
    PC_CONDICION_FISICA.modificar_enfermedades('2321348374', 'CANCER');
END;
/
BEGIN
    PC_CONDICION_FISICA.eliminar_enfermedades('2321348379');
END;
/
--consultar_condicion_fisica
CREATE OR REPLACE PROCEDURE obtener_consulta_condicion_fisica(p_id_condicion in VARCHAR2) IS
    v_cursor SYS_REFCURSOR;
    v_condicion_id condicion_fisica.id_condicion%TYPE;
    v_condicion_condicionactual condicion_fisica.condicionactual%TYPE;
    v_condicion_peso condicion_fisica.peso%TYPE;
    v_condicion_altura condicion_fisica.altura%TYPE;
BEGIN
    v_cursor := PC_CONDICION_FISICA.consultar_condicion_fisica(p_id_condicion);

    LOOP
        FETCH v_cursor INTO v_condicion_id, v_condicion_condicionactual, v_condicion_peso, v_condicion_altura;
        EXIT WHEN v_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Condición Física: id_condicion ' || v_condicion_id || ', condicion Actual ' || v_condicion_condicionactual || ', peso ' || v_condicion_peso || ', altura ' || v_condicion_altura);
    END LOOP;

    CLOSE v_cursor;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al ejecutar la consulta de condiciones físicas: ' || SQLERRM);
END;
/

begin
obtener_consulta_condicion_fisica(1000054);
end;
/
--consultar_enfermedades

CREATE OR REPLACE PROCEDURE obtener_consulta_enfermedades(p_id_enfermedad in VARCHAR2) IS
    v_cursor SYS_REFCURSOR;
    v_enfermedad_id enfermedades.id_enfermedad%TYPE;
    v_enfermedad_descripcion enfermedades.descripcion%TYPE;
    v_enfermedad_condicion_id enfermedades.id_condicion%TYPE;
BEGIN
    v_cursor := PC_CONDICION_FISICA.consultar_enfermedades(p_id_enfermedad);

    LOOP
        FETCH v_cursor INTO v_enfermedad_id, v_enfermedad_descripcion, v_enfermedad_condicion_id;
        EXIT WHEN v_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Enfermedad: id_enfermedad ' || v_enfermedad_id || ', descripcion ' || v_enfermedad_descripcion || ', id_condicion ' || v_enfermedad_condicion_id);
    END LOOP;

    CLOSE v_cursor;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al ejecutar la consulta de enfermedades: ' || SQLERRM);
END;
/

begin
obtener_consulta_enfermedades(2983475829);
end;
/
/*PC_TIPO_RUTINA*/

BEGIN
    PC_TIPO_RUTINA.adicionar_tipo_rutina('', 'ALTA', '60', 'PERDER PESO');
END;
/
select * from tipo_rutina;
BEGIN
    PC_TIPO_RUTINA.modificar_tipo_rutina('394194096', 'MEDIA', '45', 'GANAR MUSCULO');
END;
/
BEGIN
    PC_TIPO_RUTINA.adicionar_implementos('pelota de ejercicio', '34', 'Press de banca');
END;
/
BEGIN
    PC_TIPO_RUTINA.modificar_implementos('Banda el elastica', '34', 'Press de banca');    
END;
/
BEGIN
    PC_TIPO_RUTINA.eliminar_implementos('Press de banca', '34');
END;
/
--Consultar_tipo_rutina

CREATE OR REPLACE PROCEDURE obtener_consulta_tipo_rutina(p_idtiporutina in VARCHAR2) IS
    v_cursor SYS_REFCURSOR;
    v_tipo_rutina_id tipo_rutina.idtiporutina%TYPE;
    v_tipo_rutina_dificultad tipo_rutina.dificultad%TYPE;
    v_tipo_rutina_duracion tipo_rutina.duracion%TYPE;
    v_tipo_rutina_objetivo tipo_rutina.objetivo%TYPE;
BEGIN
    v_cursor := PC_TIPO_RUTINA.consultar_tipo_rutina(p_idtiporutina);

    LOOP
        FETCH v_cursor INTO v_tipo_rutina_id, v_tipo_rutina_dificultad, v_tipo_rutina_duracion, v_tipo_rutina_objetivo;
        EXIT WHEN v_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Tipo de Rutina: id tipo rutina ' || v_tipo_rutina_id || ', dificultad ' || v_tipo_rutina_dificultad || ', duracion ' || v_tipo_rutina_duracion || ', objetivo ' || v_tipo_rutina_objetivo);
    END LOOP;

    CLOSE v_cursor;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al ejecutar la consulta de tipos de rutina: ' || SQLERRM);
END;
/

begin
obtener_consulta_tipo_rutina(34);
end;
/
--Consultar_implementos
CREATE OR REPLACE PROCEDURE obtener_consulta_implementos(p_ejercicio_nombre in VARCHAR2, p_idtiporutina in VARCHAR2) IS
    v_cursor SYS_REFCURSOR;
    v_implemento_id implementos.implementos%TYPE;
    v_implemento_idtiporutina implementos.idtiporutina%TYPE;
    v_implemento_ejercicio_nombre implementos.ejercicio_nombre%TYPE;
BEGIN
    v_cursor := PC_TIPO_RUTINA.consultar_implementos(p_ejercicio_nombre, p_idtiporutina);

    LOOP
        FETCH v_cursor INTO v_implemento_id, v_implemento_idtiporutina, v_implemento_ejercicio_nombre;
        EXIT WHEN v_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Implemento: id implemento ' || v_implemento_id || ', id tipo rutina ' || v_implemento_idtiporutina || ', ejercicio nombre ' || v_implemento_ejercicio_nombre);
    END LOOP;

    CLOSE v_cursor;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al ejecutar la consulta de implementos: ' || SQLERRM);
END;
/

begin
    obtener_consulta_implementos('Tren superior biceps','36');
end;
/

/*PC_PAQUETE*/
BEGIN
    PC_PAQUETE.adicionar_paquete('Paquete', 120, 2, 'Descripci n del paquete', 'FALSE', '36');
END;
/
BEGIN
    PC_PAQUETE.eliminar_paquete('Paquete');
END;
/
--consultar_padescuento

CREATE OR REPLACE PROCEDURE obtener_consulta_padescuento IS
    v_cursor SYS_REFCURSOR;
    v_nombre paquete.nombre%TYPE;
    v_precio paquete.precio%TYPE;
    v_duracion paquete.duracion%TYPE;
    v_descripcion paquete.descripcion%TYPE;
    v_descuento paquete.descuento%TYPE;
BEGIN
    v_cursor := PC_PAQUETE.consultar_padescuento;

    LOOP
        FETCH v_cursor INTO v_nombre, v_precio, v_duracion, v_descripcion, v_descuento;
        EXIT WHEN v_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Paquete con Descuento: nombre ' || v_nombre || ', precio ' || v_precio || ', duracion ' || v_duracion || ', descripcion ' || v_descripcion || ', descuento ' || v_descuento);
    END LOOP;

    CLOSE v_cursor;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al ejecutar la consulta de paquetes con descuento: ' || SQLERRM);
END;
/

begin
obtener_consulta_padescuento;
end;
/

--consultar_paquete
CREATE OR REPLACE PROCEDURE obtener_consulta_paquete(p_nombre in VARCHAR2) IS
    v_cursor SYS_REFCURSOR;
    v_nombre paquete.nombre%TYPE;
    v_precio paquete.precio%TYPE;
    v_duracion paquete.duracion%TYPE;
    v_descripcion paquete.descripcion%TYPE;
    v_descuento paquete.descuento%TYPE;
    v_tiporutina paquete.idtiporutina%TYPE;
BEGIN
    v_cursor := PC_PAQUETE.consultar_paquete(p_nombre);

    LOOP
        FETCH v_cursor INTO v_nombre, v_precio, v_duracion, v_descripcion, v_descuento,v_tiporutina;
        EXIT WHEN v_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Paquete: nombre ' || v_nombre || ', precio ' || v_precio || ', duracion ' || v_duracion || ', descripcion ' || v_descripcion || ', descuento ' || v_descuento||' ,idtiporutina'||v_tiporutina);
    END LOOP;

    CLOSE v_cursor;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al ejecutar la consulta de paquetes: ' || SQLERRM);
END;
/
begin
obtener_consulta_paquete('PaqueteTrenSuperior');
end;
/
/*PC_PLAN_ENTRENAMIENTO*/

BEGIN
        PC_PLAN_ENTRENAMIENTO.adicionar_plan_entrenamiento('1332','PlanNombre', 'ALTA', 'Descripcion del plan', 'Bajar de peso');
END;
/

BEGIN
        PC_PLAN_ENTRENAMIENTO.eliminar_plan_entrenamiento('1333');
END;
/
--consulta_dificultad
CREATE OR REPLACE PROCEDURE obtener_consulta_dificultad IS
    v_cursor SYS_REFCURSOR;
    v_codigo plan_entrenamiento.codigo%TYPE;
    v_nombre plan_entrenamiento.nombre%TYPE;
    v_dificultad plan_entrenamiento.dificultad%TYPE;
    v_descripcion plan_entrenamiento.descripcion%TYPE;
    v_objetivo plan_entrenamiento.objetivo%TYPE;
BEGIN
    v_cursor := PC_PLAN_ENTRENAMIENTO.consultar_dificultad;

    LOOP
        FETCH v_cursor INTO v_codigo, v_nombre, v_dificultad, v_descripcion, v_objetivo;
        EXIT WHEN v_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Plan de Entrenamiento: código ' || v_codigo || ', nombre ' || v_nombre || ', dificultad ' || v_dificultad || ', descripción ' || v_descripcion || ', objetivo ' || v_objetivo);
    END LOOP;

    CLOSE v_cursor;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al ejecutar la consulta de dificultades: ' || SQLERRM);
END;
/

begin
obtener_consulta_dificultad;
end;
/
--consulta_plan_entrenamiento

CREATE OR REPLACE PROCEDURE obtener_consulta_plan_entrenamiento(p_codigo in VARCHAR2) IS
    v_cursor SYS_REFCURSOR;
    v_codigo plan_entrenamiento.codigo%TYPE;
    v_nombre plan_entrenamiento.nombre%TYPE;
    v_dificultad plan_entrenamiento.dificultad%TYPE;
    v_descripcion plan_entrenamiento.descripcion%TYPE;
    v_objetivo plan_entrenamiento.objetivo%TYPE;
BEGIN
    v_cursor := PC_PLAN_ENTRENAMIENTO.consultar_plan_entrenamiento(p_codigo);

    LOOP
        FETCH v_cursor INTO v_codigo, v_nombre, v_dificultad, v_descripcion, v_objetivo;
        EXIT WHEN v_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Plan de Entrenamiento: código ' || v_codigo || ', nombre ' || v_nombre || ', dificultad ' || v_dificultad || ', descripción ' || v_descripcion || ', objetivo ' || v_objetivo);
    END LOOP;

    CLOSE v_cursor;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al ejecutar la consulta de planes de entrenamiento: ' || SQLERRM);
END;
/
begin
obtener_consulta_plan_entrenamiento(1234);
end;
/