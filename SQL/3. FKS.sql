/*FK*/
ALTER TABLE PATROCINADOR ADD CONSTRAINT FK_USUARIO_PATROCINADOR FOREIGN KEY (nid,tipoid) REFERENCES USUARIO(nid,tipoid);
ALTER TABLE CLIENTE ADD CONSTRAINT FK_USUARIO_CLIENTE FOREIGN KEY (nid,tipoid) REFERENCES USUARIO(nid,tipoid);
ALTER TABLE OFRECE ADD CONSTRAINT FK_OFRECE_PATROCINADOR FOREIGN KEY(patrocinador_nid,patrocinador_tipoid) REFERENCES PATROCINADOR(nid,tipoid);
ALTER TABLE OFRECE ADD CONSTRAINT FK_OFRECE_CLIENTE FOREIGN KEY (cliente_nid,cliente_tipoid) REFERENCES CLIENTE(nid,tipoid);
ALTER TABLE USUARIO ADD CONSTRAINT FK_USUARIO_CONDICION FOREIGN KEY (id_condicion) REFERENCES CONDICION_FISICA(id_condicion);
ALTER TABLE ENFERMEDADES ADD CONSTRAINT FK_CONDICION_ENFERMEDADES FOREIGN KEY (id_condicion) REFERENCES CONDICION_FISICA(id_condicion);
ALTER TABLE USUARIO ADD CONSTRAINT FK_USUARIO_TIPO_RUTINA FOREIGN KEY (idtiporutina) REFERENCES TIPO_RUTINA(idtiporutina);
ALTER TABLE PAQUETE ADD CONSTRAINT FK_PAQUETE_TIPO_RUTINA FOREIGN KEY (idtiporutina) REFERENCES TIPO_RUTINA(idtiporutina);
ALTER TABLE IMPLEMENTOS ADD CONSTRAINT FK_IMPLEMENTO_TIPO_RUTINA FOREIGN KEY (idtiporutina) REFERENCES TIPO_RUTINA(idtiporutina);
ALTER TABLE PAQUETE_PLANENTRENAMIENTO ADD CONSTRAINT FK_PAQUETEPLANENTRENAMINETO_PAQUETE FOREIGN KEY (nombre) REFERENCES PAQUETE(nombre);
ALTER TABLE PAQUETE_PLANENTRENAMIENTO ADD CONSTRAINT FK_PAQUETE_PLANENTRENAMIENTO_PLAN_ENTRENAMIENTO FOREIGN KEY (codigo) REFERENCES PLAN_ENTRENAMIENTO(codigo);
ALTER TABLE USUARIO ADD CONSTRAINT FK_USUARIO_PAQUETE FOREIGN KEY(paquete_nombre) REFERENCES PAQUETE(nombre);