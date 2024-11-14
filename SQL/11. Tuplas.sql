/*Tuplas*/

/*el nombre debe contener un espacio entre el primer nombre y el apellido*/
ALTER TABLE USUARIO ADD CONSTRAINT ESPACIO_NOMBRE CHECK(nombre like '% %');

/*El tipoid del patrocinador debe ser NIT siempre*/
ALTER TABLE PATROCINADOR ADD CONSTRAINT TIPOID_PATROCINADOR CHECK(tipoid='NIT');

/*El tipoid del cliente debe ser CC o TI*/

ALTER TABLE CLIENTE ADD CONSTRAINT TIPOID_CLIENTE CHECK(tipoid in('CC','TI'));

/*el peso debe ser mayor a 1*/

ALTER TABLE CONDICION_FISICA ADD CONSTRAINT PESO_CONDICION CHECK(peso>=1);

/*Altura debe ser mayor a 100 debido a que esta en CM y debe ser menos a 250*/

ALTER TABLE CONDICION_FISICA ADD CONSTRAINT ALTURA_CONDICION CHECK(altura>=100 and altura <=250);