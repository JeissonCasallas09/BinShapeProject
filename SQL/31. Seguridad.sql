/*Seguridad*/
CREATE ROLE ROLE_PATROCINADOR;
GRANT EXECUTE ON PA_PATROCINADOR TO ROLE_PATROCINADOR;

CREATE ROLE ROLE_USUARIO;
GRANT EXECUTE ON PA_USUARIO TO ROLE_USUARIO;

CREATE ROLE ROLE_GERENTE;
GRANT EXECUTE ON PA_GERENTE TO ROLE_GERENTE;

