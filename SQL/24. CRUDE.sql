/*CRUDE*/

CREATE OR REPLACE PACKAGE PC_USUARIO AS
PROCEDURE adicionar_usuario(p_nid in VARCHAR2, p_tipoid in VARCHAR2,p_nombre in VARCHAR2,p_correo_electronico in VARCHAR2,p_telefono in number,p_id_condicion in VARCHAR2,p_idtiporutina in VARCHAR2,p_paquete_nombre in VARCHAR2 );
PROCEDURE modificar_usuario(p_nid in VARCHAR2,p_tipoid in VARCHAR2,p_nombre in VARCHAR2,p_correo_electronico in VARCHAR2,p_telefono in number);
PROCEDURE eliminar_usuario(p_nid in VARCHAR2, p_tipoid in VARCHAR2);
PROCEDURE adicionar_cliente(p_nid in VARCHAR2,p_tipoid in VARCHAR2,p_genero in VARCHAR2,p_fecha_nacimiento in DATE, p_fecha_registro in DATE);
PROCEDURE eliminar_cliente(p_nid in VARCHAR2,p_tipoid in VARCHAR2);
PROCEDURE adicionar_patrocinador(p_nid in VARCHAR2,p_tipoid in VARCHAR2,p_empresa in VARCHAR2,p_sitio_web in VARCHAR2,p_tipo_empresa in VARCHAR2);
PROCEDURE eliminar_patrocinador(p_nid in VARCHAR2,p_tipoid in VARCHAR2);
FUNCTION consultar_cliente_dias return SYS_REFCURSOR;
FUNCTION consultar_genero return SYS_REFCURSOR;
FUNCTION consultar_usuario(p_nid in VARCHAR2, p_tipoid in VARCHAR2) return SYS_REFCURSOR;
FUNCTION consultar_cliente(p_nid in VARCHAR2, p_tipoid in VARCHAR2) return SYS_REFCURSOR;
FUNCTION consultar_patrocinador (p_nid in VARCHAR2, p_tipoid in VARCHAR2) return SYS_REFCURSOR;
END;
/

CREATE OR REPLACE PACKAGE PC_OFRECE AS
PROCEDURE adicionar_ofrece(p_cliente_nid in VarChar2, p_cliente_tipoid in VarChar2, p_patrocinador_nid in VarChar2, p_patrocinador_tipoid in VarChar2, p_producto in VarChar2, p_tipo_producto in VARCHAR2);
PROCEDURE modificar_ofrece(p_cliente_nid in VarChar2, p_cliente_tipoid in VarChar2, p_patrocinador_nid in VarChar2, p_patrocinador_tipoid in VarChar2, p_producto in VarChar2, p_tipo_producto in VARCHAR2);
PROCEDURE eliminar_ofrece(p_cliente_nid in VarChar2, p_cliente_tipoid in VarChar2, p_patrocinador_nid in VARCHAR2, p_patrocinador_tipoid in VarChar2);
FUNCTION consultar_ofrece(p_cliente_nid in VarChar2, p_cliente_tipoid in VarChar2, p_patrocinador_nid in VarChar2, p_patrocinador_tipoid in VarChar2) return SYS_REFCURSOR;
END;
/

CREATE OR REPLACE PACKAGE PC_CONDICION_FISICA AS
PROCEDURE adicionar_condicion_fisica(p_id_condicion in VARCHAR2, p_condicionactual in VARCHAR2, p_peso in Number, p_altura in Number);
PROCEDURE modificar_condicion_fisica(p_id_condicion in VARCHAR2, p_condicionactual in VARCHAR2, p_peso in Number, p_altura in Number);
PROCEDURE adicionar_enfermedades(p_id_condicion in VARCHAR2, p_descripcion in VARCHAR2, p_id_enfermedad in VARCHAR2);
PROCEDURE eliminar_enfermedades (p_id_enfermedad in VARCHAR2);
PROCEDURE modificar_enfermedades(p_id_enfermedad in VARCHAR2, p_descripcion in VARCHAR2);
FUNCTION consultar_condicion_fisica(p_id_condicion in VARCHAR2) return SYS_REFCURSOR;
FUNCTION consultar_enfermedades(p_id_enfermedad in VARCHAR2) return SYS_REFCURSOR;
END;
/

CREATE OR REPLACE PACKAGE PC_TIPO_RUTINA AS
PROCEDURE adicionar_tipo_rutina(p_idtiporutina in VARCHAR2, p_dificultad in VARCHAR2, p_duracion in VARCHAR2, p_objetivo in VARCHAR2);
PROCEDURE modificar_tipo_rutina(p_idtiporutina in VARCHAR2,p_dificultad in VARCHAR2, p_duracion in VARCHAR2, p_objetivo in VARCHAR2);
PROCEDURE adicionar_implementos(p_implementos in VARCHAR2, p_idtiporutina in VARCHAR2,p_ejercicio_nombre in VARCHAR2);
PROCEDURE modificar_implementos(p_implementos in VARCHAR2, p_idtiporutina in VARCHAR2,p_ejercicio_nombre in VARCHAR2);
PROCEDURE eliminar_implementos(p_ejercicio_nombre in VARCHAR2, p_idtiporutina in VARCHAR2);
FUNCTION consultar_tipo_rutina (p_idtiporutina in VARCHAR2) return SYS_REFCURSOR;
FUNCTION consultar_implementos (p_ejercicio_nombre in VARCHAR2, p_idtiporutina in VARCHAR2) return SYS_REFCURSOR;
END;
/

CREATE OR REPLACE PACKAGE PC_PAQUETE AS
PROCEDURE adicionar_paquete(p_nombre in VARCHAR2, p_precio in Number, p_duracion in Number, p_descripcion in VARCHAR2, p_descuento in VARCHAR2, p_idtiporutina in VARCHAR2);
PROCEDURE eliminar_paquete(p_nombre in VARCHAR2);
FUNCTION consultar_padescuento RETURN SYS_REFCURSOR;
FUNCTION consultar_paquete (p_nombre in VARCHAR2) return SYS_REFCURSOR;
END;
/

CREATE OR REPLACE PACKAGE PC_PLAN_ENTRENAMIENTO AS
PROCEDURE adicionar_plan_entrenamiento(p_codigo in VARCHAR2, p_nombre in VARCHAR2, p_dificultad in VARCHAR2, p_descripcion in VARCHAR2, p_objetivo in VARCHAR2);
PROCEDURE eliminar_plan_entrenamiento(p_codigo in VARCHAR2);
FUNCTION consultar_dificultad RETURN SYS_REFCURSOR;
FUNCTION consultar_plan_entrenamiento(p_codigo in VARCHAR2) return SYS_REFCURSOR;
END;
/
