/*Tablas*/

CREATE TABLE USUARIO(
    nid VARCHAR2(10) NOT NULL,
    tipoid VARCHAR2(3) NOT NULL,
    nombre VARCHAR2(20) NOT NULL,
    correo_electronico VARCHAR2(50) NOT NULL,
    telefono number(11) NOT NULL,
    id_condicion VARCHAR2(7) NOT NULL,
    idtiporutina VARCHAR2(2) NOT NULL,
    paquete_nombre VARCHAR2(20) NOT NULL
    );
CREATE TABLE PATROCINADOR(
    nid VARCHAR2(10) NOT NULL,
    tipoid VARCHAR(3) NOT NULL,
    Empresa VARCHAR2(20) NOT NULL,
    sitio_web VARCHAR2(50),
    Tipo_empresa VARCHAR2(10) NOT NULL
    );
CREATE TABLE CLIENTE(
    nid VARCHAR2(10) NOT NULL,
    tipoid VARCHAR(3) NOT NULL,
    genero VARCHAR2(1) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    fecha_registro DATE NOT NULL
    );
CREATE TABLE OFRECE(
    cliente_nid VARCHAR2(10) NOT NULL,
    cliente_tipoid VARCHAR(3) NOT NULL,
    patrocinador_nid VARCHAR2(10) NOT NULL,
    patrocinador_tipoid VARCHAR(3) NOT NULL,
    producto VARCHAR2(50) NOT NULL,
    tipo_producto VARCHAR2(50) NOT NULL
    );
CREATE TABLE CONDICION_FISICA(
    id_condicion VARCHAR2(7) NOT NULL,
    condicionactual VARCHAR2(50) NOT NULL,
    peso NUMBER(3) NOT NULL,
    altura NUMBER(3) NOT NULL
    );
CREATE TABLE ENFERMEDADES(
    id_enfermedad VARCHAR2(10) NOT NULL,
    descripcion VARCHAR2(100), 
    id_condicion VARCHAR2(7) NOT NULL
    );
CREATE TABLE TIPO_RUTINA(
    idtiporutina VARCHAR2(9) NOT NULL,
    dificultad VARCHAR2(20) NOT NULL,
    duracion INT NOT NULL,
    objetivo VARCHAR2(100) NOT NULL
    );
CREATE TABLE IMPLEMENTOS(
    implementos VARCHAR2(50) NOT NULL,
    idtiporutina VARCHAR2(2) NOT NULL,
    ejercicio_nombre VARCHAR2(50) NOT NULL
    );
CREATE TABLE PAQUETE(
    nombre VARCHAR2(20) NOT NULL,
    precio NUMBER(6,2) NOT NULL,
    duracion NUMBER(2) NOT NULL, 
    descripcion VARCHAR2(100) NOT NULL,
    descuento VARCHAR2(5) NOT NULL,
    idtiporutina VARCHAR2(2) NOT NULL
    );
CREATE TABLE PAQUETE_PLANENTRENAMIENTO(
    nombre VARCHAR2(20) NOT NULL,
    codigo VARCHAR2(4) NOT NULL
    );
CREATE TABLE PLAN_ENTRENAMIENTO(
    codigo VARCHAR2(4) NOT NULL,
    nombre VARCHAR2(20) NOT NULL,
    dificultad VARCHAR2(5) NOT NULL,
    descripcion VARCHAR2(100) NOT NULL,
    objetivo VARCHAR2(20) NOT NULL
    );