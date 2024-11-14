CREATE OR REPLACE PACKAGE BODY PC_USUARIO AS
    PROCEDURE adicionar_usuario(p_nid IN VARCHAR2, p_tipoid IN VARCHAR2, p_nombre IN VARCHAR2, p_correo_electronico IN VARCHAR2, p_telefono IN NUMBER, p_id_condicion IN VARCHAR2, p_idtiporutina IN VARCHAR2, p_paquete_nombre IN VARCHAR2) AS
    BEGIN
        INSERT INTO usuario (nid, tipoid, nombre, correo_electronico, telefono, id_condicion, idtiporutina, paquete_nombre)
        VALUES (p_nid, p_tipoid, p_nombre, p_correo_electronico, p_telefono, p_id_condicion, p_idtiporutina, p_paquete_nombre);
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('El usuario con nid y tipoid '|| p_nid ||','|| p_tipoid || ' ha sido agregado exitosamente.');
    EXCEPTION
        WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al agregar el usuario: '|| SQLERRM);
    END adicionar_usuario;

    
    PROCEDURE modificar_usuario(p_nid in VARCHAR2,p_tipoid in VARCHAR2 ,p_nombre IN VARCHAR2, p_correo_electronico IN VARCHAR2, p_telefono IN NUMBER) AS
    BEGIN
        UPDATE usuario
        SET nombre = p_nombre, correo_electronico = p_correo_electronico, telefono = p_telefono
        WHERE tipoid = p_tipoid and nid=p_nid;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('El usuario con nid y tipoid '|| p_nid ||','|| p_tipoid || ' ha sido modificado exitosamente.');
    EXCEPTION
        WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al modificar el usuario: '|| SQLERRM);
    END modificar_usuario;
    
    
    PROCEDURE eliminar_usuario(p_nid IN VARCHAR2, p_tipoid IN VARCHAR2) AS
    BEGIN
        DELETE FROM usuario
        WHERE nid = p_nid AND tipoid = p_tipoid;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('El usuario con nid y tipoid '|| p_nid ||','|| p_tipoid || ' ha sido eliminado exitosamente.');
    EXCEPTION
        WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al eliminar el usuario: '|| SQLERRM);
    END eliminar_usuario;
    
    
    PROCEDURE adicionar_cliente(p_nid IN VARCHAR2, p_tipoid IN VARCHAR2, p_genero IN VARCHAR2, p_fecha_nacimiento IN DATE, p_fecha_registro IN DATE) AS
    BEGIN
        INSERT INTO cliente (nid, tipoid, genero, fecha_nacimiento, fecha_registro)
        VALUES (p_nid, p_tipoid, p_genero, p_fecha_nacimiento, p_fecha_registro);
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('El cliente con nid y tipoid '|| p_nid ||','|| p_tipoid || ' ha sido agregado exitosamente.');
    EXCEPTION
        WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al agregar el cliente: '|| SQLERRM);
    END adicionar_cliente;
    
    
    PROCEDURE eliminar_cliente(p_nid IN VARCHAR2, p_tipoid IN VARCHAR2) AS
    BEGIN
        DELETE FROM cliente
        WHERE nid = p_nid AND tipoid = p_tipoid;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('El cliente con nid y tipoid '|| p_nid ||','|| p_tipoid || ' ha sido eliminado exitosamente.');
    EXCEPTION
        WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al eliminar el cliente: '|| SQLERRM);  
    END eliminar_cliente;
    
    
    PROCEDURE adicionar_patrocinador(p_nid IN VARCHAR2, p_tipoid IN VARCHAR2, p_empresa IN VARCHAR2, p_sitio_web IN VARCHAR2, p_tipo_empresa IN VARCHAR2) AS
    BEGIN
        INSERT INTO patrocinador (nid, tipoid, empresa, sitio_web, tipo_empresa)
        VALUES (p_nid, p_tipoid, p_empresa, p_sitio_web, p_tipo_empresa);
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('El patrocinador con nid y tipoid '|| p_nid ||','|| p_tipoid || ' ha sido agregado exitosamente.');
    EXCEPTION
        WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al agregar el patrocinador: '|| SQLERRM);
    END adicionar_patrocinador;
    
    
    PROCEDURE eliminar_patrocinador(p_nid IN VARCHAR2, p_tipoid IN VARCHAR2) AS
    BEGIN
        DELETE FROM patrocinador
        WHERE nid = p_nid AND tipoid = p_tipoid;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('El patrocinador con nid y tipoid '|| p_nid ||','|| p_tipoid || ' ha sido eliminado exitosamente.');
    EXCEPTION
        WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al eliminar el patrocinador: '|| SQLERRM);
    END eliminar_patrocinador;

    FUNCTION consultar_cliente_dias RETURN SYS_REFCURSOR AS
        cur SYS_REFCURSOR;
    BEGIN
        OPEN cur FOR
            SELECT nid, tipoid, genero, fecha_registro
            FROM cliente
            WHERE fecha_registro <= SYSDATE - 30;
        RETURN cur;
    END consultar_cliente_dias;


    FUNCTION consultar_genero RETURN SYS_REFCURSOR AS
        cur SYS_REFCURSOR;
    BEGIN
        OPEN cur FOR
            SELECT genero, COUNT(*) AS cantidad_usuarios
            FROM cliente
            GROUP BY genero;
        RETURN cur;
    END consultar_genero;


    FUNCTION consultar_usuario(p_nid IN VARCHAR2, p_tipoid IN VARCHAR2) RETURN SYS_REFCURSOR AS
        cur SYS_REFCURSOR;
    BEGIN
        OPEN cur FOR
            SELECT *
            FROM usuario where nid=p_nid and tipoid=p_tipoid;
        RETURN cur;
    END consultar_usuario;


    FUNCTION consultar_cliente(p_nid IN VARCHAR2, p_tipoid IN VARCHAR2) RETURN SYS_REFCURSOR AS
        cur SYS_REFCURSOR;
    BEGIN
        OPEN cur FOR
            SELECT *
            FROM cliente where nid=p_nid and tipoid=p_tipoid;
        RETURN cur;
    END consultar_cliente;


    FUNCTION consultar_patrocinador(p_nid IN VARCHAR2, p_tipoid IN VARCHAR2) RETURN SYS_REFCURSOR AS
        cur SYS_REFCURSOR;
    BEGIN
        OPEN cur FOR
            SELECT *
            FROM patrocinador where nid=p_nid and tipoid=p_tipoid;
        RETURN cur;
    END consultar_patrocinador;
END;
/

CREATE OR REPLACE PACKAGE BODY PC_OFRECE AS
    PROCEDURE adicionar_ofrece(p_cliente_nid IN VARCHAR2, p_cliente_tipoid IN VARCHAR2, p_patrocinador_nid IN VARCHAR2, p_patrocinador_tipoid IN VARCHAR2, p_producto IN VARCHAR2, p_tipo_producto IN VARCHAR2) AS
    BEGIN
        INSERT INTO ofrece (cliente_nid, cliente_tipoid, patrocinador_nid, patrocinador_tipoid, producto, tipo_producto)
        VALUES (p_cliente_nid, p_cliente_tipoid, p_patrocinador_nid, p_patrocinador_tipoid, p_producto, p_tipo_producto);
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('La informacion de la tabla ofrece ha sido agregada exitosamente.');
    EXCEPTION
        WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al agregar la informacion de la tabla ofrece: ' || SQLERRM);
    END adicionar_ofrece;
    
    
    PROCEDURE modificar_ofrece(p_cliente_nid IN VARCHAR2, p_cliente_tipoid IN VARCHAR2, p_patrocinador_nid IN VARCHAR2, p_patrocinador_tipoid IN VARCHAR2, p_producto IN VARCHAR2, p_tipo_producto IN VARCHAR2) AS
    BEGIN
        UPDATE ofrece
        SET tipo_producto = p_tipo_producto, producto = p_producto 
        WHERE cliente_nid = p_cliente_nid AND cliente_tipoid = p_cliente_tipoid
        AND patrocinador_nid = p_patrocinador_nid AND patrocinador_tipoid = p_patrocinador_tipoid;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('La informacion de la tabla ofrece ha sido modificada exitosamente.');
    EXCEPTION
        WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al modificar la informacion de la tabla ofrece: ' || SQLERRM);
    END modificar_ofrece;
    
    
    PROCEDURE eliminar_ofrece(p_cliente_nid IN VARCHAR2, p_cliente_tipoid IN VARCHAR2, p_patrocinador_nid IN VARCHAR2, p_patrocinador_tipoid IN VARCHAR2) AS
    BEGIN
        DELETE FROM ofrece
        WHERE cliente_nid = p_cliente_nid AND cliente_tipoid = p_cliente_tipoid
        AND patrocinador_nid = p_patrocinador_nid AND patrocinador_tipoid = p_patrocinador_tipoid;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('La informacion de la tabla ofrece ha sido eliminada exitosamente.');
    EXCEPTION
        WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al eliminar la informacion de la tabla ofrece: ' || SQLERRM);
    END eliminar_ofrece;
    
    
    FUNCTION consultar_ofrece(p_cliente_nid IN VARCHAR2, p_cliente_tipoid IN VARCHAR2, p_patrocinador_nid IN VARCHAR2, p_patrocinador_tipoid IN VARCHAR2) RETURN SYS_REFCURSOR AS
        cur SYS_REFCURSOR;
    BEGIN
        OPEN cur FOR
            SELECT * FROM ofrece WHERE cliente_nid = p_cliente_nid AND cliente_tipoid = p_cliente_tipoid AND patrocinador_nid = p_patrocinador_nid AND patrocinador_tipoid = p_patrocinador_tipoid;
        RETURN cur;
    END consultar_ofrece;     
END;
/

CREATE OR REPLACE PACKAGE BODY PC_CONDICION_FISICA AS
    PROCEDURE adicionar_condicion_fisica(p_id_condicion IN VARCHAR2, p_condicionactual IN VARCHAR2, p_peso IN NUMBER, p_altura IN NUMBER) AS
    BEGIN
        INSERT INTO condicion_fisica (id_condicion, condicionactual, peso, altura)
        VALUES (p_id_condicion, p_condicionactual, p_peso, p_altura);
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Se ha adicionado la condicion fisica correctamente');
    EXCEPTION
        WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al adicionar la condicion fisica: '|| SQLERRM);
    END adicionar_condicion_fisica;
    
    
    PROCEDURE modificar_condicion_fisica(p_id_condicion IN VARCHAR2, p_condicionactual IN VARCHAR2, p_peso IN NUMBER, p_altura IN NUMBER) AS
    BEGIN
        UPDATE condicion_fisica
        SET condicionactual = p_condicionactual, peso=p_peso, altura=p_altura
        WHERE id_condicion = p_id_condicion;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Se ha modificado la condicion fisica correctamente');
    EXCEPTION
        WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al modificar la condicion fisica: '|| SQLERRM);
    END modificar_condicion_fisica;
    
    
    PROCEDURE adicionar_enfermedades(p_id_condicion IN VARCHAR2, p_descripcion IN VARCHAR2, p_id_enfermedad IN VARCHAR2) AS
    BEGIN
        INSERT INTO enfermedades (id_condicion, descripcion, id_enfermedad)
        VALUES (p_id_condicion, p_descripcion, p_id_enfermedad);
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Se ha adicionado la enfermedad correctamente');
    EXCEPTION
        WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al adicionar la enfermedad: '|| SQLERRM);
    END adicionar_enfermedades;
    
    
    PROCEDURE eliminar_enfermedades(p_id_enfermedad IN VARCHAR2) AS
    BEGIN
        DELETE FROM enfermedades
        WHERE id_enfermedad = p_id_enfermedad;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Se ha eliminado la enfermedad correctamente');
    EXCEPTION
        WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al eliminar la enfermedad: '|| SQLERRM);
    END eliminar_enfermedades;
    
    
    PROCEDURE modificar_enfermedades(p_id_enfermedad IN VARCHAR2, p_descripcion IN VARCHAR2) AS
    BEGIN
        UPDATE enfermedades
        SET descripcion = p_descripcion
        WHERE id_enfermedad = p_id_enfermedad;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Se ha modificado la enfermedad correctamente');
    EXCEPTION
        WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al modificar la enfermedad: '|| SQLERRM);
    END modificar_enfermedades;
    
    
    FUNCTION consultar_condicion_fisica(p_id_condicion IN VARCHAR2) return SYS_REFCURSOR AS
        cur SYS_REFCURSOR;
    BEGIN
        OPEN cur FOR
            SELECT * FROM condicion_fisica where id_condicion=p_id_condicion;
        RETURN cur;
    END consultar_condicion_fisica;
    
    FUNCTION consultar_enfermedades(p_id_enfermedad IN VARCHAR2) return SYS_REFCURSOR AS
        cur SYS_REFCURSOR;
    BEGIN
        OPEN cur FOR
            SELECT * FROM enfermedades where id_enfermedad=p_id_enfermedad;
        RETURN cur;
    END consultar_enfermedades;    
END;
/


CREATE OR REPLACE PACKAGE BODY PC_TIPO_RUTINA AS
    PROCEDURE adicionar_tipo_rutina(p_idtiporutina IN VARCHAR2, p_dificultad IN VARCHAR2, p_duracion IN VARCHAR2, p_objetivo IN VARCHAR2) AS
    BEGIN
        INSERT INTO tipo_rutina (idtiporutina, dificultad, duracion, objetivo)
        VALUES (p_idtiporutina, p_dificultad, p_duracion, p_objetivo);
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Se ha adicionado el tipo de rutina correctamente');
    EXCEPTION
        WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al adicionar el tipo de rutina: '|| SQLERRM);
    END adicionar_tipo_rutina;

    PROCEDURE modificar_tipo_rutina(p_idtiporutina IN VARCHAR2, p_dificultad IN VARCHAR2, p_duracion IN VARCHAR2, p_objetivo IN VARCHAR2) AS
    BEGIN
        UPDATE tipo_rutina
        SET dificultad = p_dificultad, duracion = p_duracion, objetivo = p_objetivo
        WHERE idtiporutina = p_idtiporutina;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Se ha modificado el tipo de rutina correctamente');
    EXCEPTION
        WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al modificar el tipo de rutina: '|| SQLERRM);
    END modificar_tipo_rutina;

    PROCEDURE adicionar_implementos(p_implementos IN VARCHAR2, p_idtiporutina IN VARCHAR2, p_ejercicio_nombre IN VARCHAR2) AS
    BEGIN
        INSERT INTO implementos (implementos, idtiporutina, ejercicio_nombre)
        VALUES (p_implementos, p_idtiporutina, p_ejercicio_nombre);
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Se ha adicionado el implemento correctamente');
    EXCEPTION
        WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al adicionar el implemento: '|| SQLERRM);
    END adicionar_implementos;

    PROCEDURE modificar_implementos(p_implementos IN VARCHAR2, p_idtiporutina IN VARCHAR2, p_ejercicio_nombre IN VARCHAR2) AS
    BEGIN
        UPDATE implementos
        SET implementos = p_implementos
        WHERE idtiporutina = p_idtiporutina AND ejercicio_nombre = p_ejercicio_nombre;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Se ha modificado el implemento correctamente');
    EXCEPTION
        WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al modificar el implemento'|| SQLERRM);
    END modificar_implementos;


    PROCEDURE eliminar_implementos(p_ejercicio_nombre IN VARCHAR2, p_idtiporutina IN VARCHAR2) AS
    BEGIN
        DELETE FROM implementos
        WHERE ejercicio_nombre = p_ejercicio_nombre AND idtiporutina = p_idtiporutina;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Se ha eliminado el implemento correctamente');
    EXCEPTION
        WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al eliminar el implemento'|| SQLERRM);
    END eliminar_implementos;
    
    FUNCTION consultar_tipo_rutina(p_idtiporutina in VARCHAR2) return SYS_REFCURSOR
    as cur SYS_REFCURSOR;
    BEGIN 
        OPEN cur FOR
            select * from tipo_rutina where idtiporutina=p_idtiporutina;
        RETURN cur;
    END consultar_tipo_rutina;
    
    
    FUNCTION consultar_implementos(p_ejercicio_nombre IN VARCHAR2, p_idtiporutina IN VARCHAR2) return SYS_REFCURSOR
    as cur SYS_REFCURSOR;
    BEGIN
        OPEN cur FOR
            select * from implementos WHERE ejercicio_nombre = p_ejercicio_nombre AND idtiporutina = p_idtiporutina;
        RETURN cur;
    END consultar_implementos;
END;
/

CREATE OR REPLACE PACKAGE BODY PC_PAQUETE AS
    PROCEDURE adicionar_paquete(p_nombre IN VARCHAR2, p_precio IN NUMBER, p_duracion IN NUMBER, p_descripcion IN VARCHAR2, p_descuento IN VARCHAR2, p_idtiporutina IN VARCHAR2) AS
    BEGIN
        INSERT INTO paquete (nombre, precio, duracion, descripcion, descuento, idtiporutina)
        VALUES (p_nombre, p_precio, p_duracion, p_descripcion, p_descuento, p_idtiporutina);
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Se ha adicionado el paquete correctamente');
    EXCEPTION
        WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al adicionar el paquete'|| SQLERRM);
    END adicionar_paquete;


    PROCEDURE eliminar_paquete(p_nombre IN VARCHAR2) AS
    BEGIN
        DELETE FROM paquete
        WHERE nombre = p_nombre;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Se ha eliminado el paquete correctamente');
    EXCEPTION
        WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al eliminar el paquete'|| SQLERRM);
    END eliminar_paquete;


    FUNCTION consultar_padescuento RETURN SYS_REFCURSOR AS
        cur SYS_REFCURSOR;
    BEGIN
        OPEN cur FOR
            SELECT nombre,precio,duracion,descripcion,descuento FROM paquete WHERE descuento = 'TRUE';
        RETURN cur;
    END consultar_padescuento;
    
    
    FUNCTION consultar_paquete(p_nombre IN VARCHAR2) return SYS_REFCURSOR
    as cur SYS_REFCURSOR;
    BEGIN
        OPEN cur FOR
            select * from paquete WHERE nombre = p_nombre;
        RETURN cur;
    END consultar_paquete;   
END PC_PAQUETE;
/


CREATE OR REPLACE PACKAGE BODY PC_PLAN_ENTRENAMIENTO AS
    PROCEDURE adicionar_plan_entrenamiento(p_codigo IN VARCHAR2, p_nombre IN VARCHAR2, p_dificultad IN VARCHAR2, p_descripcion IN VARCHAR2, p_objetivo IN VARCHAR2) AS
    BEGIN
        INSERT INTO plan_entrenamiento (codigo, nombre, dificultad, descripcion, objetivo)
        VALUES (p_codigo, p_nombre, p_dificultad, p_descripcion, p_objetivo);
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Se ha adicionado el plan de entrenamiento correctamente');
    EXCEPTION
        WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al adicionar el plan de entrenamiento'|| SQLERRM);
    END adicionar_plan_entrenamiento;


    PROCEDURE eliminar_plan_entrenamiento(p_codigo IN VARCHAR2) AS
    BEGIN
        DELETE FROM plan_entrenamiento
        WHERE codigo = p_codigo;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Se ha eliminado el plan de entrenamiento correctamente');
    EXCEPTION
        WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al eliminar el plan de entrenamiento'|| SQLERRM);
    END eliminar_plan_entrenamiento;
    
    
    FUNCTION consultar_dificultad RETURN SYS_REFCURSOR AS
    cur SYS_REFCURSOR;
    BEGIN
        OPEN cur FOR
            Select codigo,nombre,dificultad,descripcion,objetivo from PLAN_ENTRENAMIENTO where dificultad='ALTA';
        RETURN cur;
    END consultar_dificultad;
    
    
    FUNCTION consultar_plan_entrenamiento(p_codigo IN VARCHAR2) return SYS_REFCURSOR
    as cur SYS_REFCURSOR;
    BEGIN
        OPEN cur FOR
            Select * from plan_entrenamiento where codigo=p_codigo;
        RETURN cur;
    END consultar_plan_entrenamiento;
    
END PC_PLAN_ENTRENAMIENTO;
/