/*Disparadores*/

/*Se debe validar que el cliente sea mayor de 16 años*/
CREATE OR REPLACE TRIGGER ck_VALIDAR_FECHA_NACIMIENTO
BEFORE INSERT ON CLIENTE
FOR EACH ROW
DECLARE
EDAD NUMBER;
BEGIN

EDAD := TRUNC(MONTHS_BETWEEN(SYSDATE, :NEW.FECHA_NACIMIENTO)/12);
IF EDAD < 16 THEN
    RAISE_APPLICATION_ERROR(-20001, 'El cliente debe ser mayor de 16 años.');
END IF;
END;
/

/*valida la duracion del paquete al momento de insertar un nuevo registro que esta no sobrepase el año*/
CREATE OR REPLACE TRIGGER ck_VALIDAR_DURACION_PAQUETE
BEFORE INSERT ON PAQUETE
FOR EACH ROW
BEGIN
IF :NEW.DURACION < 1 OR :NEW.DURACION > 12 THEN
RAISE_APPLICATION_ERROR(-20002, 'La duracion del paquete debe ser de 1 a 12 meses.');
END IF;
END;
/

/*Se debe actualizar el precio en caso de que se le agregue un descuento*/
CREATE OR REPLACE TRIGGER CK_DESCUENTO_PAQUETE
BEFORE INSERT OR UPDATE OF descuento ON PAQUETE
FOR EACH ROW
DECLARE
  valor_descuento NUMBER(5,2);
BEGIN
  IF :new.descuento = 'TRUE' THEN
    valor_descuento := TRUNC(DBMS_RANDOM.VALUE(0.10, 0.50) * :new.precio, 2);
    :new.precio := :new.precio - valor_descuento;
  END IF;
END;
/


/*La fecha de registro de la tabla cliente se autogenera*/

CREATE OR REPLACE TRIGGER CK_FECHA_REGISTRO
BEFORE INSERT ON cliente
FOR EACH ROW
BEGIN
  :NEW.fecha_registro := SYSDATE;
END;
/

/*Se autogenera un id para la tabla condicion_fisica*/

CREATE OR REPLACE TRIGGER CK_CONDICION_FISICA
BEFORE INSERT ON CONDICION_FISICA
FOR EACH ROW
DECLARE
   id_secuencia NUMBER(7);
BEGIN
   SELECT FLOOR(DBMS_RANDOM.VALUE(1000000, 9999999)) INTO id_secuencia FROM DUAL;
   :NEW.ID_CONDICION := id_secuencia;
END;
/

/*se autogenera un id para la tabla tipo_rutina*/

CREATE OR REPLACE TRIGGER CK_TIPO_RUTINA
BEFORE INSERT ON TIPO_RUTINA
FOR EACH ROW
DECLARE
   id_secuenciaa NUMBER(9);
BEGIN
   SELECT FLOOR(DBMS_RANDOM.VALUE(0,999999999)) INTO id_secuenciaa FROM DUAL;
   :NEW.idtiporutina := id_secuenciaa;
END;
/

/*Se autogenera un id para la tabla plan_entrenamiento*/

CREATE OR REPLACE TRIGGER CK_PLAN_ENTRENAMIENTO
BEFORE INSERT ON PLAN_ENTRENAMIENTO
FOR EACH ROW
DECLARE
   id_secuenciaaa NUMBER(4);
BEGIN
   SELECT FLOOR(DBMS_RANDOM.VALUE(0000, 9999)) INTO id_secuenciaaa FROM DUAL;
   :NEW.codigo := id_secuenciaaa;
END;
/

/*se restringe la eliminacion de condicion_fisica*/
CREATE OR REPLACE TRIGGER CK_RESTRICCION_CONDICION_FISICA
BEFORE DELETE ON condicion_fisica
FOR EACH ROW
BEGIN
  IF :OLD.id_condicion IS NOT NULL THEN
    RAISE_APPLICATION_ERROR(-20001, 'No se permite eliminar registros de la tabla condicion fisica.');
  END IF;
END;
/
/*se restringe la eliminacion de tipo_rutina*/
CREATE OR REPLACE TRIGGER CK_RESTRICCION_TIPO_RUTINA
BEFORE DELETE ON tipo_rutina
FOR EACH ROW
BEGIN
  IF :OLD.idtiporutina IS NOT NULL THEN
    RAISE_APPLICATION_ERROR(-20001, 'No se permite eliminar registros de la tabla tipo rutina.');
  END IF;
END;
/

/*restringe la modificacion de la tabla paquetes*/
CREATE OR REPLACE TRIGGER CK_RESTRICCION_PAQUETE
BEFORE UPDATE ON PAQUETE
FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20001, 'No se permite modificar registros en la tabla PAQUETE.');
END;
/

/*restringe la modificacion de la tabla plan de entrenamiento*/

CREATE OR REPLACE TRIGGER CK_RESTRICCION_PLAN_ENTRENAMIENTO
BEFORE UPDATE ON PLAN_ENTRENAMIENTO
FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20001, 'No se permite modificar registros en la tabla Plan de entrenamiento.');
END;
/
