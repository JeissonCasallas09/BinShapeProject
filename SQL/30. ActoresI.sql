/*ActoresI*/
CREATE OR REPLACE PACKAGE BODY PA_PATROCINADOR AS
PROCEDURE adicionar_usuario(p_nid IN VARCHAR2, p_tipoid IN VARCHAR2, p_nombre IN VARCHAR2, p_correo_electronico IN VARCHAR2, p_telefono IN NUMBER, p_id_condicion IN VARCHAR2, p_idtiporutina IN VARCHAR2, p_paquete_nombre IN VARCHAR2) AS
    BEGIN
        PC_USUARIO.adicionar_usuario(p_nid, p_tipoid, p_nombre, p_correo_electronico, p_telefono, p_id_condicion, p_idtiporutina, p_paquete_nombre);
    END adicionar_usuario;

 PROCEDURE modificar_usuario(p_nid in VARCHAR2,p_tipoid in VARCHAR2 ,p_nombre IN VARCHAR2, p_correo_electronico IN VARCHAR2, p_telefono IN NUMBER) AS
    BEGIN
        PC_USUARIO.modificar_usuario(p_nid,p_tipoid,p_nombre, p_correo_electronico, p_telefono);
    END modificar_usuario;
    

 PROCEDURE adicionar_patrocinador(p_nid IN VARCHAR2, p_tipoid IN VARCHAR2, p_empresa IN VARCHAR2, p_sitio_web IN VARCHAR2, p_tipo_empresa IN VARCHAR2) AS
    BEGIN
        PC_USUARIO.adicionar_patrocinador(p_nid, p_tipoid, p_empresa, p_sitio_web, p_tipo_empresa);
    END adicionar_patrocinador;

PROCEDURE eliminar_patrocinador(p_nid IN VARCHAR2, p_tipoid IN VARCHAR2) AS
    BEGIN
	PC_USUARIO.eliminar_patrocinador(p_nid, p_tipoid);
    END eliminar_patrocinador;

PROCEDURE adicionar_ofrece(p_cliente_nid IN VARCHAR2, p_cliente_tipoid IN VARCHAR2, p_patrocinador_nid IN VARCHAR2, p_patrocinador_tipoid IN VARCHAR2, p_producto IN VARCHAR2, p_tipo_producto IN VARCHAR2) AS
    BEGIN
         PC_OFRECE.adicionar_ofrece(p_cliente_nid, p_cliente_tipoid, p_patrocinador_nid, p_patrocinador_tipoid, p_producto, p_tipo_producto);
    END adicionar_ofrece;
    
PROCEDURE modificar_ofrece(p_cliente_nid IN VARCHAR2, p_cliente_tipoid IN VARCHAR2, p_patrocinador_nid IN VARCHAR2, p_patrocinador_tipoid IN VARCHAR2, p_producto IN VARCHAR2, p_tipo_producto IN VARCHAR2) AS
    BEGIN
    PC_OFRECE.modificar_ofrece(p_cliente_nid, p_cliente_tipoid, p_patrocinador_nid, p_patrocinador_tipoid, p_producto, p_tipo_producto);
    END modificar_ofrece;
    
PROCEDURE eliminar_ofrece(p_cliente_nid IN VARCHAR2, p_cliente_tipoid IN VARCHAR2, p_patrocinador_nid IN VARCHAR2, p_patrocinador_tipoid IN VARCHAR2) AS
    BEGIN
	PC_OFRECE.eliminar_ofrece(p_cliente_nid, p_cliente_tipoid, p_patrocinador_nid, p_patrocinador_tipoid);
    END eliminar_ofrece;
    
    
    FUNCTION consultar_ofrece RETURN SYS_REFCURSOR AS
        cur SYS_REFCURSOR;
    BEGIN
        OPEN cur FOR
            SELECT * FROM ofrece;
        RETURN cur;
    END consultar_ofrece; 

FUNCTION consultar_usuario RETURN SYS_REFCURSOR AS
        cur SYS_REFCURSOR;
    BEGIN
        OPEN cur FOR
            SELECT *
            FROM usuario;
        RETURN cur;
    END consultar_usuario;


    FUNCTION consultar_cliente RETURN SYS_REFCURSOR AS
        cur SYS_REFCURSOR;
    BEGIN
        OPEN cur FOR
            SELECT *
            FROM cliente;
        RETURN cur;
    END consultar_cliente;


    FUNCTION consultar_patrocinador RETURN SYS_REFCURSOR AS
        cur SYS_REFCURSOR;
    BEGIN
        OPEN cur FOR
            SELECT *
            FROM patrocinador;
        RETURN cur;
    END consultar_patrocinador;
END PA_PATROCINADOR;
/

CREATE OR REPLACE PACKAGE BODY PA_USUARIO AS

PROCEDURE adicionar_usuario(p_nid IN VARCHAR2, p_tipoid IN VARCHAR2, p_nombre IN VARCHAR2, p_correo_electronico IN VARCHAR2, p_telefono IN NUMBER, p_id_condicion IN VARCHAR2, p_idtiporutina IN VARCHAR2, p_paquete_nombre IN VARCHAR2) AS
    BEGIN
        PC_USUARIO.adicionar_usuario(p_nid, p_tipoid, p_nombre, p_correo_electronico, p_telefono, p_id_condicion, p_idtiporutina, p_paquete_nombre);
    END adicionar_usuario;

 PROCEDURE modificar_usuario(p_nid in VARCHAR2,p_tipoid in VARCHAR2 ,p_nombre IN VARCHAR2, p_correo_electronico IN VARCHAR2, p_telefono IN NUMBER) AS
    BEGIN
	PC_USUARIO.modificar_usuario(p_nid,p_tipoid,p_nombre, p_correo_electronico, p_telefono);
    END modificar_usuario;
    
     PROCEDURE adicionar_cliente(p_nid IN VARCHAR2, p_tipoid IN VARCHAR2, p_genero IN VARCHAR2, p_fecha_nacimiento IN DATE, p_fecha_registro IN DATE) AS
    BEGIN
	PC_USUARIO.adicionar_cliente(p_nid, p_tipoid, p_genero, p_fecha_nacimiento, p_fecha_registro);
    END adicionar_cliente;   

FUNCTION consultar_usuario RETURN SYS_REFCURSOR AS
        cur SYS_REFCURSOR;
    BEGIN
        OPEN cur FOR
            SELECT *
            FROM usuario;
        RETURN cur;
    END consultar_usuario;


FUNCTION consultar_cliente RETURN SYS_REFCURSOR AS
        cur SYS_REFCURSOR;
    BEGIN
        OPEN cur FOR
            SELECT *
            FROM cliente;
        RETURN cur;
    END consultar_cliente;
    
 PROCEDURE adicionar_condicion_fisica(p_id_condicion IN VARCHAR2, p_condicionactual IN VARCHAR2, p_peso IN NUMBER, p_altura IN NUMBER) AS
    BEGIN
	PC_CONDICION_FISICA.adicionar_condicion_fisica(p_id_condicion, p_condicionactual, p_peso, p_altura);
    END adicionar_condicion_fisica;
    
    
    PROCEDURE modificar_condicion_fisica(p_id_condicion IN VARCHAR2, p_condicionactual IN VARCHAR2, p_peso IN NUMBER, p_altura IN NUMBER) AS
    BEGIN
PC_CONDICION_FISICA.modificar_condicion_fisica(p_id_condicion, p_condicionactual, p_peso, p_altura);
    END modificar_condicion_fisica;   
    
     FUNCTION consultar_condicion_fisica return SYS_REFCURSOR AS
        cur SYS_REFCURSOR;
    BEGIN
        OPEN cur FOR
            SELECT * FROM condicion_fisica;
        RETURN cur;
    END consultar_condicion_fisica;
    
PROCEDURE adicionar_enfermedades(p_id_condicion IN VARCHAR2, p_descripcion IN VARCHAR2, p_id_enfermedad IN VARCHAR2) AS
    BEGIN
	PC_CONDICION_FISICA.adicionar_enfermedades(p_id_condicion, p_descripcion, p_id_enfermedad);
    END adicionar_enfermedades;
    
    
    PROCEDURE eliminar_enfermedades(p_id_enfermedad IN VARCHAR2) AS
    BEGIN
  	PC_CONDICION_FISICA.eliminar_enfermedades(p_id_enfermedad);
    END eliminar_enfermedades;
    
    
    PROCEDURE modificar_enfermedades(p_id_enfermedad IN VARCHAR2, p_descripcion IN VARCHAR2) AS
    BEGIN
	PC_CONDICION_FISICA.modificar_enfermedades(p_id_enfermedad, p_descripcion);
    END modificar_enfermedades;

 FUNCTION consultar_enfermedades return SYS_REFCURSOR AS
        cur SYS_REFCURSOR;
    BEGIN
        OPEN cur FOR
            SELECT * FROM enfermedades;
        RETURN cur;
    END consultar_enfermedades;   
    
    
PROCEDURE adicionar_tipo_rutina(p_idtiporutina IN VARCHAR2, p_dificultad IN VARCHAR2, p_duracion IN VARCHAR2, p_objetivo IN VARCHAR2) AS
    BEGIN
	PC_TIPO_RUTINA.adicionar_tipo_rutina(p_idtiporutina, p_dificultad, p_duracion, p_objetivo);
    END adicionar_tipo_rutina;

    PROCEDURE modificar_tipo_rutina(p_idtiporutina IN VARCHAR2, p_dificultad IN VARCHAR2, p_duracion IN VARCHAR2, p_objetivo IN VARCHAR2) AS
    BEGIN
	PC_TIPO_RUTINA.modificar_tipo_rutina(p_idtiporutina, p_dificultad, p_duracion, p_objetivo);
    END modificar_tipo_rutina;

FUNCTION consultar_tipo_rutina return SYS_REFCURSOR
    as cur SYS_REFCURSOR;
    BEGIN 
        OPEN cur FOR
            select * from tipo_rutina;
        RETURN cur;
    END consultar_tipo_rutina;
 
 PROCEDURE adicionar_implementos(p_implementos IN VARCHAR2, p_idtiporutina IN VARCHAR2, p_ejercicio_nombre IN VARCHAR2) AS
    BEGIN
	PC_TIPO_RUTINA.adicionar_implementos(p_implementos, p_idtiporutina, p_ejercicio_nombre);
    END adicionar_implementos;

    PROCEDURE modificar_implementos(p_implementos IN VARCHAR2, p_idtiporutina IN VARCHAR2, p_ejercicio_nombre IN VARCHAR2) AS
    BEGIN
        PC_TIPO_RUTINA.modificar_implementos(p_implementos, p_idtiporutina, p_ejercicio_nombre);
    END modificar_implementos;


    PROCEDURE eliminar_implementos(p_ejercicio_nombre IN VARCHAR2, p_idtiporutina IN VARCHAR2) AS
    BEGIN
	PC_TIPO_RUTINA.eliminar_implementos(p_ejercicio_nombre, p_idtiporutina);
    END eliminar_implementos;
 
    FUNCTION consultar_implementos return SYS_REFCURSOR
    as cur SYS_REFCURSOR;
    BEGIN
        OPEN cur FOR
            select * from implementos;
        RETURN cur;
    END consultar_implementos;
 
    FUNCTION consultar_paquete return SYS_REFCURSOR
    as cur SYS_REFCURSOR;
    BEGIN
        OPEN cur FOR
            select * from paquete;
        RETURN cur;
    END consultar_paquete;
    
    FUNCTION consultar_dificultad RETURN SYS_REFCURSOR AS
    cur SYS_REFCURSOR;
    BEGIN
        OPEN cur FOR
            Select codigo,nombre,dificultad,descripcion,objetivo from PLAN_ENTRENAMIENTO where dificultad='ALTA';
        RETURN cur;
    END consultar_dificultad;
    
    
    FUNCTION consultar_plan_entrenamiento return SYS_REFCURSOR
    as cur SYS_REFCURSOR;
    BEGIN
        OPEN cur FOR
            Select * from plan_entrenamiento;
        RETURN cur;
    END consultar_plan_entrenamiento;
    
FUNCTION consultar_padescuento RETURN SYS_REFCURSOR AS
    cur SYS_REFCURSOR;
BEGIN
    OPEN cur FOR
        SELECT nombre, precio, duracion, descripcion, descuento FROM paquete WHERE descuento = 'TRUE';
    RETURN cur;
END consultar_padescuento;

END PA_USUARIO;
/

CREATE OR REPLACE PACKAGE BODY PA_GERENTE AS

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


    FUNCTION consultar_usuario RETURN SYS_REFCURSOR AS
        cur SYS_REFCURSOR;
    BEGIN
        OPEN cur FOR
            SELECT *
            FROM usuario;
        RETURN cur;
    END consultar_usuario;


    FUNCTION consultar_cliente RETURN SYS_REFCURSOR AS
        cur SYS_REFCURSOR;
    BEGIN
        OPEN cur FOR
            SELECT *
            FROM cliente;
        RETURN cur;
    END consultar_cliente;


    FUNCTION consultar_patrocinador RETURN SYS_REFCURSOR AS
        cur SYS_REFCURSOR;
    BEGIN
        OPEN cur FOR
            SELECT *
            FROM patrocinador;
        RETURN cur;
    END consultar_patrocinador;

FUNCTION consultar_ofrece RETURN SYS_REFCURSOR AS
        cur SYS_REFCURSOR;
    BEGIN
        OPEN cur FOR
            SELECT * FROM ofrece;
        RETURN cur;
    END consultar_ofrece;   


    FUNCTION consultar_condicion_fisica return SYS_REFCURSOR AS
        cur SYS_REFCURSOR;
    BEGIN
        OPEN cur FOR
            SELECT * FROM condicion_fisica;
        RETURN cur;
    END consultar_condicion_fisica;
    
    
    FUNCTION consultar_enfermedades return SYS_REFCURSOR AS
        cur SYS_REFCURSOR;
    BEGIN
        OPEN cur FOR
            SELECT * FROM enfermedades;
        RETURN cur;
    END consultar_enfermedades; 

    FUNCTION consultar_tipo_rutina return SYS_REFCURSOR
    as cur SYS_REFCURSOR;
    BEGIN 
        OPEN cur FOR
            select * from tipo_rutina;
        RETURN cur;
    END consultar_tipo_rutina;
    
    
    FUNCTION consultar_implementos return SYS_REFCURSOR
    as cur SYS_REFCURSOR;
    BEGIN
        OPEN cur FOR
            select * from implementos;
        RETURN cur;
    END consultar_implementos;

 FUNCTION consultar_padescuento RETURN SYS_REFCURSOR AS
        cur SYS_REFCURSOR;
    BEGIN
        OPEN cur FOR
            SELECT nombre,precio,duracion,descripcion,descuento FROM paquete WHERE descuento = 'TRUE';
        RETURN cur;
    END consultar_padescuento;
    
    
    FUNCTION consultar_paquete return SYS_REFCURSOR
    as cur SYS_REFCURSOR;
    BEGIN
        OPEN cur FOR
            select * from paquete;
        RETURN cur;
    END consultar_paquete;

    PROCEDURE adicionar_paquete(p_nombre IN VARCHAR2, p_precio IN NUMBER, p_duracion IN NUMBER, p_descripcion IN VARCHAR2, p_descuento IN VARCHAR2, p_idtiporutina IN VARCHAR2) AS
    BEGIN
	PC_PAQUETE.adicionar_paquete(p_nombre, p_precio, p_duracion, p_descripcion, p_descuento, p_idtiporutina);
    END adicionar_paquete;


    PROCEDURE eliminar_paquete(p_nombre IN VARCHAR2) AS
    BEGIN
        PC_PAQUETE.eliminar_paquete(p_nombre);
    END eliminar_paquete;

PROCEDURE adicionar_plan_entrenamiento(p_codigo IN VARCHAR2, p_nombre IN VARCHAR2, p_dificultad IN VARCHAR2, p_descripcion IN VARCHAR2, p_objetivo IN VARCHAR2) AS
    BEGIN
	PC_PLAN_ENTRENAMIENTO.adicionar_plan_entrenamiento(p_codigo, p_nombre, p_dificultad, 	p_descripcion, p_objetivo);
    END adicionar_plan_entrenamiento;


    PROCEDURE eliminar_plan_entrenamiento(p_codigo IN VARCHAR2) AS
    BEGIN
	PC_PLAN_ENTRENAMIENTO.eliminar_plan_entrenamiento(p_codigo);
    END eliminar_plan_entrenamiento;

FUNCTION consultar_dificultad RETURN SYS_REFCURSOR AS
    cur SYS_REFCURSOR;
    BEGIN
        OPEN cur FOR
            Select codigo,nombre,dificultad,descripcion,objetivo from PLAN_ENTRENAMIENTO where dificultad='ALTA';
        RETURN cur;
    END consultar_dificultad;
    
    
    FUNCTION consultar_plan_entrenamiento return SYS_REFCURSOR
    as cur SYS_REFCURSOR;
    BEGIN
        OPEN cur FOR
            Select * from plan_entrenamiento;
        RETURN cur;
    END consultar_plan_entrenamiento;
END PA_GERENTE;
/