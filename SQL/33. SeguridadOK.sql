/*SeguridadOK*/

/*PA_PATROCINADOR*/

SELECT PA_PATROCINADOR.consultar_ofrece FROM DUAL;

/*PA_USUARIO*/

EXECUTE PA_USUARIO.adicionar_condicion_fisica('2384951', 'SEDENTARIO', 70, 170);

/*PA_GERENTE*/

SELECT PA_GERENTE.consultar_plan_entrenamiento FROM DUAL;