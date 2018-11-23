-- Administrador inicial con login "admin" y contraseña "admin"
INSERT INTO `ADMINISTRADOR` (`ID`,`FECHAALTA`,`LOGIN`,`NOMBRE`,
                             `PASSWORD`,`TIPO_USUARIO`,`ULTIMOACCESO`)
   VALUES (1,'2017-11-11 01:04:42','admin','Administrador inicial',
           'ggm44T97GWJ6Rryx3do4yvl1bZ+gmUfG','ADMINISTRADOR','2017-11-11 01:04:42');

-- Medico con dni "11111111A", num. colegiado "11111" y contraseña "11111"
INSERT INTO `CENTROSALUD` (`ID`,`NOMBRE`,`TELEFONO`,`CODIGOPOSTAL`,
                           `DOMICILIO`,`LOCALIDAD`,`PROVINCIA`)
   VALUES (1,'Centro salud pepe','988888888','12345',
           'C/. Pepe, nº 3','Ourense','Ourense');
INSERT INTO `MEDICO` (`ID`,`APELLIDOS`,`DNI`,`EMAIL`,`FECHAALTA`,`NOMBRE`,
                      `NUMEROCOLEGIADO`,`PASSWORD`,`TELEFONO`,`TIPO_USUARIO`,
                      `ULTIMOACCESO`,`CENTROSALUD_ID`)
   VALUES (2,'Gomez Gomez','11111111A','a@a.com','2017-11-11 01:04:42','Antonio',
           '11111','lUTQ2zg2voe4Z5OqpITFIjcBziNH10d6','988123456','MEDICO',
           '2017-11-11 01:04:42',1);

-- Paciente con dni "22222222B", num. tarjeta sanitaria "2222222222", num seg. social "2222222222222" y contraseña "22222"
INSERT INTO `PACIENTE` (`ID`,`APELLIDOS`,`DNI`,`EMAIL`,`FECHAALTA`,
                        `NOMBRE`,`NUMEROSEGURIDADSOCIAL`,`NUMEROTARJETASANITARIA`,
                        `PASSWORD`,`TELEFONO`,`TIPO_USUARIO`,`ULTIMOACCESO`,
                        `CODIGOPOSTAL`,`DOMICILIO`,`LOCALIDAD`,`PROVINCIA`,`MEDICO_ID`)
   VALUES (3,'Benito Carmona','22222222B','b@b.com','2017-11-11 01:04:42',
           'Ana','2222222222222','2222222222',
           'auJIfVxFAN0IKkDVovGmzfUENiABIC5g','981123456','PACIENTE','2017-11-11 01:04:42',
           '12345','C/. Benito, nº 2, 4º N','Coruña','Coruña',2);

-- Cita con fecha "2017-11-23" y hora "09:00:00"
INSERT INTO `CITA`(`ID`,`DURACION`,`ESTADO`,`FECHA`,`HORA`,`MEDICO_ID`,`PACIENTE_ID`)
   VALUES (1, 15, 'PLANIFICADA', '2017-11-23', '09:00:00', '2', '3');

-- Farmacia con nif "33333333C" y contraseña "33333"
INSERT INTO `FARMACIA`(`ID`,`FECHAALTA`,`NIF`,`NOMBREFARMACIA`,
                       `PASSWORD`,`TIPO_USUARIO`,`ULTIMOACCESO`,
                       `CODIGOPOSTAL`,`DOMICILIO`,`LOCALIDAD`,`PROVINCIA`)
   VALUES (4,'2017-11-11 01:04:42','33333333C','Farmacia de prueba',
           '/QpUw+ZRH3ndoNb3N4gRpT5cz0C7pT9v','FARMACIA','2017-11-11 01:04:42',
           '12345','C/. Farmacia, nº 2, 4º N','Coruña','Coruña');


/*
--******************** MEDICAMENTOS ----------------------
*/

INSERT INTO `medicamento` (`FABRICANTE`, `FAMILIA`, `NOMBRE`, `NUMERODOSIS`, `PRINCIPIOACTIVO`) 
VALUES ('Monsanto', 'NSA', 'LSD', '2', 'principio1');
INSERT INTO `medicamento` (`FABRICANTE`, `FAMILIA`, `NOMBRE`, `NUMERODOSIS`, `PRINCIPIOACTIVO`) 
VALUES ('Monsanto', 'NSA', 'AntiComunismo', '2', 'principio1');
INSERT INTO `medicamento` (`FABRICANTE`, `FAMILIA`, `NOMBRE`, `NUMERODOSIS`, `PRINCIPIOACTIVO`) 
VALUES ('Monsanto', 'NSA', 'Invasor', '2', 'principio1');
INSERT INTO `medicamento` (`FABRICANTE`, `FAMILIA`, `NOMBRE`, `NUMERODOSIS`, `PRINCIPIOACTIVO`) 
VALUES ('Monsanto', 'NSA', 'Invasor2.0', '2', 'principio1');
INSERT INTO `medicamento` (`FABRICANTE`, `FAMILIA`, `NOMBRE`, `NUMERODOSIS`, `PRINCIPIOACTIVO`) 
VALUES ('Monsanto', 'NSA', 'Apache', '2', 'principio1');
INSERT INTO `medicamento` (`FABRICANTE`, `FAMILIA`, `NOMBRE`, `NUMERODOSIS`, `PRINCIPIOACTIVO`) 
VALUES ('Monsanto', 'NSA', 'Arroz', '2', 'principio1');
INSERT INTO `medicamento` (`FABRICANTE`, `FAMILIA`, `NOMBRE`, `NUMERODOSIS`, `PRINCIPIOACTIVO`) 
VALUES ('Monsanto', 'NSA', 'VotaTrump', '2', 'principio1');
INSERT INTO `medicamento` (`FABRICANTE`, `FAMILIA`, `NOMBRE`, `NUMERODOSIS`, `PRINCIPIOACTIVO`) 
VALUES ('FranRibadas', 'MafiaRusa', 'Capitalismo', '2', 'principio1');
INSERT INTO `medicamento` (`FABRICANTE`, `FAMILIA`, `NOMBRE`, `NUMERODOSIS`, `PRINCIPIOACTIVO`) 
VALUES ('FranRibadas', 'MafiaRusa', 'Capitalismo2.0', '2', 'principio1');
INSERT INTO `medicamento` (`FABRICANTE`, `FAMILIA`, `NOMBRE`, `NUMERODOSIS`, `PRINCIPIOACTIVO`) 
VALUES ('FranRibadas', 'MafiaRusa', 'Putin', '2', 'principio1');
INSERT INTO `medicamento` (`FABRICANTE`, `FAMILIA`, `NOMBRE`, `NUMERODOSIS`, `PRINCIPIOACTIVO`) 
VALUES ('FranRibadas', 'MafiaRusa', 'PutinEnUnOso', '2', 'principio1');
INSERT INTO `medicamento` (`FABRICANTE`, `FAMILIA`, `NOMBRE`, `NUMERODOSIS`, `PRINCIPIOACTIVO`) 
VALUES ('FranRibadas', 'LosChinos', 'Flamenco', '2', 'principio1');
INSERT INTO `medicamento` (`FABRICANTE`, `FAMILIA`, `NOMBRE`, `NUMERODOSIS`, `PRINCIPIOACTIVO`) 
VALUES ('FranRibadas', 'LosChinos', 'Mao', '2', 'principio1');
INSERT INTO `medicamento` (`FABRICANTE`, `FAMILIA`, `NOMBRE`, `NUMERODOSIS`, `PRINCIPIOACTIVO`) 
VALUES ('Vilares', 'LosKoreanosFrescos', 'MisilNuclear1', '2', 'principio1');
INSERT INTO `medicamento` (`FABRICANTE`, `FAMILIA`, `NOMBRE`, `NUMERODOSIS`, `PRINCIPIOACTIVO`) 
VALUES ('Vilares', 'LosKoreanosFrescos', 'MisilNuclear2', '2', 'principio1');
INSERT INTO `medicamento` (`FABRICANTE`, `FAMILIA`, `NOMBRE`, `NUMERODOSIS`, `PRINCIPIOACTIVO`) 
VALUES ('Vilares', 'LosKoreanosFrescos', 'MisilNuclear3', '2', 'principio1');
INSERT INTO `medicamento` (`FABRICANTE`, `FAMILIA`, `NOMBRE`, `NUMERODOSIS`, `PRINCIPIOACTIVO`) 
VALUES ('Vilares', 'LosKoreanosFrescos', 'MisilNuclearFunciona', '2', 'principio1');
INSERT INTO `medicamento` (`FABRICANTE`, `FAMILIA`, `NOMBRE`, `NUMERODOSIS`, `PRINCIPIOACTIVO`) 
VALUES ('Vilares', 'Espanhita', 'LeticiaSabater', '2', 'principio1');
INSERT INTO `medicamento` (`FABRICANTE`, `FAMILIA`, `NOMBRE`, `NUMERODOSIS`, `PRINCIPIOACTIVO`) 
VALUES ('Juancho', 'Espanhita', 'Arribita', '2', 'principio1');

/*
--********************-- CENTROS DE LA BUENA SALUD ----------------------
*/
		   
INSERT INTO `CENTROSALUD` (`ID`,`NOMBRE`,`TELEFONO`,`CODIGOPOSTAL`,
                           `DOMICILIO`,`LOCALIDAD`,`PROVINCIA`)
   VALUES (2,'Centro salud Novoa','988888888','12345',
           'C/. Novoa, nº 3','Abajo','Ourense');
INSERT INTO `CENTROSALUD` (`ID`,`NOMBRE`,`TELEFONO`,`CODIGOPOSTAL`,
                           `DOMICILIO`,`LOCALIDAD`,`PROVINCIA`)
   VALUES (3,'Centro salud Felspo','988888888','23456',
           'C/. Felspo, nº 3','Arriba','Pontepedra');
INSERT INTO `CENTROSALUD` (`ID`,`NOMBRE`,`TELEFONO`,`CODIGOPOSTAL`,
                           `DOMICILIO`,`LOCALIDAD`,`PROVINCIA`)
   VALUES (4,'Centro salud Fran','988888888','34567',
           'C/. Fran, nº 3','Nosabe','Pontepedra');
INSERT INTO `CENTROSALUD` (`ID`,`NOMBRE`,`TELEFONO`,`CODIGOPOSTAL`,
                           `DOMICILIO`,`LOCALIDAD`,`PROVINCIA`)
   VALUES (5,'Centro salud Ribera','988888888','45678',
           'C/. Ribera, nº 3','Co','Pontepedra');
INSERT INTO `CENTROSALUD` (`ID`,`NOMBRE`,`TELEFONO`,`CODIGOPOSTAL`,
                           `DOMICILIO`,`LOCALIDAD`,`PROVINCIA`)
   VALUES (6,'Centro salud Catedrale','988888888','56789',
           'C/. Catedrale, nº 3','Francis','Pontepedra');
INSERT INTO `CENTROSALUD` (`ID`,`NOMBRE`,`TELEFONO`,`CODIGOPOSTAL`,
                           `DOMICILIO`,`LOCALIDAD`,`PROVINCIA`)
   VALUES (7,'Centro salud Forno','988888888','67890',
           'C/. Forno, nº 3','As Lagoas','Ourense');


/*
--********************-- MEDICOS ----------------------
*/
		   
INSERT INTO `MEDICO` (`ID`,`APELLIDOS`,`DNI`,`EMAIL`,`FECHAALTA`,`NOMBRE`,
                      `NUMEROCOLEGIADO`,`PASSWORD`,`TELEFONO`,`TIPO_USUARIO`,
                      `ULTIMOACCESO`,`CENTROSALUD_ID`)
   VALUES (1,'Ribadas Leopoldo','22222222B','a@a.com','2017-11-11 01:04:42','Fran',
           '22222','lUTQ2zg2voe4Z5OqpITFIjcBziNH10d6','988123456','MEDICO',
           '2017-11-11 01:04:42',2);
		   
INSERT INTO `MEDICO` (`ID`,`APELLIDOS`,`DNI`,`EMAIL`,`FECHAALTA`,`NOMBRE`,
                      `NUMEROCOLEGIADO`,`PASSWORD`,`TELEFONO`,`TIPO_USUARIO`,
                      `ULTIMOACCESO`,`CENTROSALUD_ID`)
   VALUES (3,'Peña Peña','33333333B','b@b.com','2017-11-11 01:04:42','Daniel',
           '33333','lUTQ2zg2voe4Z5OqpITFIjcBziNH10d6','988123457','MEDICO',
           '2017-11-11 01:04:42',3);
		   
INSERT INTO `MEDICO` (`ID`,`APELLIDOS`,`DNI`,`EMAIL`,`FECHAALTA`,`NOMBRE`,
                      `NUMEROCOLEGIADO`,`PASSWORD`,`TELEFONO`,`TIPO_USUARIO`,
                      `ULTIMOACCESO`,`CENTROSALUD_ID`)
   VALUES (4,'Cuesta Mogollon','44444444C','c@c.com','2017-11-11 01:04:42','Pedro',
           '44444','lUTQ2zg2voe4Z5OqpITFIjcBziNH10d6','988123458','MEDICO',
           '2017-11-11 01:04:42',4);
		   
INSERT INTO `MEDICO` (`ID`,`APELLIDOS`,`DNI`,`EMAIL`,`FECHAALTA`,`NOMBRE`,
                      `NUMEROCOLEGIADO`,`PASSWORD`,`TELEFONO`,`TIPO_USUARIO`,
                      `ULTIMOACCESO`,`CENTROSALUD_ID`)
   VALUES (5,'Rajoy Brey','5555555D','d@d.com','2017-11-11 01:04:42','Mariano',
           '55555','lUTQ2zg2voe4Z5OqpITFIjcBziNH10d6','983123456','MEDICO',
           '2017-11-11 01:04:42',5);
		   
INSERT INTO `MEDICO` (`ID`,`APELLIDOS`,`DNI`,`EMAIL`,`FECHAALTA`,`NOMBRE`,
                      `NUMEROCOLEGIADO`,`PASSWORD`,`TELEFONO`,`TIPO_USUARIO`,
                      `ULTIMOACCESO`,`CENTROSALUD_ID`)
   VALUES (6,'Vilares Ribadas','6666666F','f@f.com','2017-11-11 01:04:42','Victor',
           '66666','lUTQ2zg2voe4Z5OqpITFIjcBziNH10d6','928123456','MEDICO',
           '2017-11-11 01:04:42',6);
		   
INSERT INTO `MEDICO` (`ID`,`APELLIDOS`,`DNI`,`EMAIL`,`FECHAALTA`,`NOMBRE`,
                      `NUMEROCOLEGIADO`,`PASSWORD`,`TELEFONO`,`TIPO_USUARIO`,
                      `ULTIMOACCESO`,`CENTROSALUD_ID`)
   VALUES (7,'El Cunetero','77777777G','g@g.com','2017-11-11 01:04:42','Francisco',
           '77777','lUTQ2zg2voe4Z5OqpITFIjcBziNH10d6','928123456','MEDICO',
           '2017-11-11 01:04:42',7);

/*
--********************-- FARMACIAS ----------------------
*/
		   
INSERT INTO `FARMACIA`(`ID`,`FECHAALTA`,`NIF`,`NOMBREFARMACIA`,
                       `PASSWORD`,`TIPO_USUARIO`,`ULTIMOACCESO`,
                       `CODIGOPOSTAL`,`DOMICILIO`,`LOCALIDAD`,`PROVINCIA`)
   VALUES (1,'2017-11-11 01:04:42','11111111C','Monsanto',
           '/QpUw+ZRH3ndoNb3N4gRpT5cz0C7pT9v','FARMACIA','2017-11-11 01:04:42',
           '12345','C/. Luluru, nº 2, 4º N','Coruña','Coruña');

INSERT INTO `FARMACIA`(`ID`,`FECHAALTA`,`NIF`,`NOMBREFARMACIA`,
                       `PASSWORD`,`TIPO_USUARIO`,`ULTIMOACCESO`,
                       `CODIGOPOSTAL`,`DOMICILIO`,`LOCALIDAD`,`PROVINCIA`)
   VALUES (2,'2017-11-11 01:04:42','22222222C','Farmacias Pepe',
           '/QpUw+ZRH3ndoNb3N4gRpT5cz0C7pT9v','FARMACIA','2017-11-11 01:04:42',
           '34556','C/. Lazaro, nº 2, 4º N','Ourense','Ourense');

INSERT INTO `FARMACIA`(`ID`,`FECHAALTA`,`NIF`,`NOMBREFARMACIA`,
                       `PASSWORD`,`TIPO_USUARIO`,`ULTIMOACCESO`,
                       `CODIGOPOSTAL`,`DOMICILIO`,`LOCALIDAD`,`PROVINCIA`)
   VALUES (3,'2017-11-11 01:04:42','44444444C','Farmacia Homeopática',
           '/QpUw+ZRH3ndoNb3N4gRpT5cz0C7pT9v','FARMACIA','2017-11-11 01:04:42',
           '65655','C/. AzucarConAguita, nº 2, 4º N','Ourense','Ourense');

INSERT INTO `FARMACIA`(`ID`,`FECHAALTA`,`NIF`,`NOMBREFARMACIA`,
                       `PASSWORD`,`TIPO_USUARIO`,`ULTIMOACCESO`,
                       `CODIGOPOSTAL`,`DOMICILIO`,`LOCALIDAD`,`PROVINCIA`)
   VALUES (5,'2017-11-11 01:04:42','55555555C','La farmacia de arriba es una mierda',
           '/QpUw+ZRH3ndoNb3N4gRpT5cz0C7pT9v','FARMACIA','2017-11-11 01:04:42',
           '66666','C/. Formol, nº 2, 4º N','Pontepedra','Ourense');


/*
--********************-- PACIENTES ----------------------
*/
		   
INSERT INTO `PACIENTE` (`ID`,`APELLIDOS`,`DNI`,`EMAIL`,`FECHAALTA`,
                        `NOMBRE`,`NUMEROSEGURIDADSOCIAL`,`NUMEROTARJETASANITARIA`,
                        `PASSWORD`,`TELEFONO`,`TIPO_USUARIO`,`ULTIMOACCESO`,
                        `CODIGOPOSTAL`,`DOMICILIO`,`LOCALIDAD`,`PROVINCIA`,`MEDICO_ID`)
   VALUES (4,'Sobred Oasis','33333333C','hono@pepsi.com','2017-11-11 01:04:42',
           'Restin','3333333333333','3333333333',
           'auJIfVxFAN0IKkDVovGmzfUENiABIC5g','981123456','PACIENTE','2017-11-11 01:04:42',
           '12345','C/. Benito, nº 2, 4º N','Coruña','Coruña',3);
		   
INSERT INTO `PACIENTE` (`ID`,`APELLIDOS`,`DNI`,`EMAIL`,`FECHAALTA`,
                        `NOMBRE`,`NUMEROSEGURIDADSOCIAL`,`NUMEROTARJETASANITARIA`,
                        `PASSWORD`,`TELEFONO`,`TIPO_USUARIO`,`ULTIMOACCESO`,
                        `CODIGOPOSTAL`,`DOMICILIO`,`LOCALIDAD`,`PROVINCIA`,`MEDICO_ID`)
   VALUES (5,'Hisler Marron','44444444D','abajo@arriba.derecha','2017-11-11 01:04:42',
           'Adolfo','4444444444444','4444444444',
           'auJIfVxFAN0IKkDVovGmzfUENiABIC5g','981123456','PACIENTE','2017-11-11 01:04:42',
           '12345','C/. Benito, nº 2, 4º N','Coruña','Coruña',4);
		   
INSERT INTO `PACIENTE` (`ID`,`APELLIDOS`,`DNI`,`EMAIL`,`FECHAALTA`,
                        `NOMBRE`,`NUMEROSEGURIDADSOCIAL`,`NUMEROTARJETASANITARIA`,
                        `PASSWORD`,`TELEFONO`,`TIPO_USUARIO`,`ULTIMOACCESO`,
                        `CODIGOPOSTAL`,`DOMICILIO`,`LOCALIDAD`,`PROVINCIA`,`MEDICO_ID`)
   VALUES (6,'Brey Marron','55555555E','n@n.com','2017-11-11 01:04:42',
           'Marianin','5555555555555','5555555555',
           'auJIfVxFAN0IKkDVovGmzfUENiABIC5g','981123456','PACIENTE','2017-11-11 01:04:42',
           '12345','C/. Benito, nº 2, 4º N','Coruña','Coruña',5);
		   
INSERT INTO `PACIENTE` (`ID`,`APELLIDOS`,`DNI`,`EMAIL`,`FECHAALTA`,
                        `NOMBRE`,`NUMEROSEGURIDADSOCIAL`,`NUMEROTARJETASANITARIA`,
                        `PASSWORD`,`TELEFONO`,`TIPO_USUARIO`,`ULTIMOACCESO`,
                        `CODIGOPOSTAL`,`DOMICILIO`,`LOCALIDAD`,`PROVINCIA`,`MEDICO_ID`)
   VALUES (2,'Calvo Calvo','66666666F','s@s.es','2017-11-11 01:04:42',
           'Carmen','6666666666666','6666666666',
           'auJIfVxFAN0IKkDVovGmzfUENiABIC5g','981123456','PACIENTE','2017-11-11 01:04:42',
           '12345','C/. Benito, nº 2, 4º N','Coruña','Coruña',6);
		   
INSERT INTO `PACIENTE` (`ID`,`APELLIDOS`,`DNI`,`EMAIL`,`FECHAALTA`,
                        `NOMBRE`,`NUMEROSEGURIDADSOCIAL`,`NUMEROTARJETASANITARIA`,
                        `PASSWORD`,`TELEFONO`,`TIPO_USUARIO`,`ULTIMOACCESO`,
                        `CODIGOPOSTAL`,`DOMICILIO`,`LOCALIDAD`,`PROVINCIA`,`MEDICO_ID`)
   VALUES (1,'Benito Camelas','77777777G','k@k.k','2017-11-11 01:04:42',
           'Manolo','7777777777777','7777777777',
           'auJIfVxFAN0IKkDVovGmzfUENiABIC5g','981123456','PACIENTE','2017-11-11 01:04:42',
           '12345','C/. Benito, nº 2, 4º N','Coruña','Coruña',7);
		   
		   
/*
----********************-- PRESCRIPCIONES ----------------------
*/
INSERT INTO `prescripcion` (`ID`, `DOSIS`, `FECHAFIN`, `FECHAINICIO`, `INDICACIONES`, `MEDICAMENTO_ID`, `MEDICO_ID`, `PACIENTE_ID`) 
VALUES (1, 22, '2018-11-21', '2018-11-13', 'indicaciones1', 11, 2, 2);

INSERT INTO `prescripcion` (`ID`, `DOSIS`, `FECHAFIN`, `FECHAINICIO`, `INDICACIONES`, `MEDICAMENTO_ID`, `MEDICO_ID`, `PACIENTE_ID`) 
VALUES (2, 22, '2018-11-21', '2018-11-13', 'indicaciones1', 7, 6, 4);

INSERT INTO `prescripcion` (`ID`, `DOSIS`, `FECHAFIN`, `FECHAINICIO`, `INDICACIONES`, `MEDICAMENTO_ID`, `MEDICO_ID`, `PACIENTE_ID`) 
VALUES (3, 22, '2018-11-21', '2018-11-13', 'indicaciones1', 5, 5, 5);

INSERT INTO `prescripcion` (`DOSIS`, `FECHAFIN`, `FECHAINICIO`, `INDICACIONES`, `MEDICAMENTO_ID`, `MEDICO_ID`, `PACIENTE_ID`) 
VALUES (22, '2018-11-21', '2018-11-13', 'indicaciones1', 1, 1, 2);

INSERT INTO `prescripcion` (`DOSIS`, `FECHAFIN`, `FECHAINICIO`, `INDICACIONES`, `MEDICAMENTO_ID`, `MEDICO_ID`, `PACIENTE_ID`) 
VALUES (1, '2018-11-21', '2018-11-13', 'indicaciones1', 1, 3, 2);

INSERT INTO `prescripcion` (`DOSIS`, `FECHAFIN`, `FECHAINICIO`, `INDICACIONES`, `MEDICAMENTO_ID`, `MEDICO_ID`, `PACIENTE_ID`) 
VALUES (2, '2018-11-21', '2018-11-13', 'indicaciones1', 1, 4, 2);

INSERT INTO `prescripcion` (`DOSIS`, `FECHAFIN`, `FECHAINICIO`, `INDICACIONES`, `MEDICAMENTO_ID`, `MEDICO_ID`, `PACIENTE_ID`) 
VALUES (3, '2018-11-21', '2018-11-13', 'indicaciones1', 1, 2, 2);

INSERT INTO `prescripcion` (`DOSIS`, `FECHAFIN`, `FECHAINICIO`, `INDICACIONES`, `MEDICAMENTO_ID`, `MEDICO_ID`, `PACIENTE_ID`) 
VALUES (4, '2018-11-21', '2018-11-13', 'indicaciones1', 1, 1, 3);

INSERT INTO `prescripcion` (`DOSIS`, `FECHAFIN`, `FECHAINICIO`, `INDICACIONES`, `MEDICAMENTO_ID`, `MEDICO_ID`, `PACIENTE_ID`) 
VALUES (5, '2018-11-21', '2018-11-13', 'indicaciones1', 1, 1, 3);

INSERT INTO `prescripcion` (`DOSIS`, `FECHAFIN`, `FECHAINICIO`, `INDICACIONES`, `MEDICAMENTO_ID`, `MEDICO_ID`, `PACIENTE_ID`) 
VALUES (6, '2018-11-21', '2018-11-13', 'indicaciones1', 4, 3, 2);

INSERT INTO `prescripcion` (`DOSIS`, `FECHAFIN`, `FECHAINICIO`, `INDICACIONES`, `MEDICAMENTO_ID`, `MEDICO_ID`, `PACIENTE_ID`) 
VALUES (7, '2018-11-21', '2018-11-13', 'indicaciones1', 5, 3, 2);

INSERT INTO `prescripcion` (`DOSIS`, `FECHAFIN`, `FECHAINICIO`, `INDICACIONES`, `MEDICAMENTO_ID`, `MEDICO_ID`, `PACIENTE_ID`) 
VALUES (8, '2018-11-21', '2018-11-13', 'indicaciones1', 6, 3, 2);

INSERT INTO `prescripcion` (`DOSIS`, `FECHAFIN`, `FECHAINICIO`, `INDICACIONES`, `MEDICAMENTO_ID`, `MEDICO_ID`, `PACIENTE_ID`) 
VALUES (9, '2018-11-21', '2018-11-13', 'indicaciones1', 7, 3, 2);

INSERT INTO `prescripcion` (`DOSIS`, `FECHAFIN`, `FECHAINICIO`, `INDICACIONES`, `MEDICAMENTO_ID`, `MEDICO_ID`, `PACIENTE_ID`) 
VALUES (110, '2018-11-21', '2018-11-13', 'indicaciones1', 8, 3, 2);

INSERT INTO `prescripcion` (`DOSIS`, `FECHAFIN`, `FECHAINICIO`, `INDICACIONES`, `MEDICAMENTO_ID`, `MEDICO_ID`, `PACIENTE_ID`) 
VALUES (10, '2018-11-21', '2018-11-13', 'indicaciones1', 9, 3, 4);

INSERT INTO `prescripcion` (`DOSIS`, `FECHAFIN`, `FECHAINICIO`, `INDICACIONES`, `MEDICAMENTO_ID`, `MEDICO_ID`, `PACIENTE_ID`) 
VALUES (2, '2018-11-21', '2018-11-13', 'indicaciones1', 10, 4, 4);

INSERT INTO `prescripcion` (`DOSIS`, `FECHAFIN`, `FECHAINICIO`, `INDICACIONES`, `MEDICAMENTO_ID`, `MEDICO_ID`, `PACIENTE_ID`) 
VALUES (11, '2018-11-21', '2018-11-13', 'indicaciones1', 11, 4, 4);

INSERT INTO `prescripcion` (`DOSIS`, `FECHAFIN`, `FECHAINICIO`, `INDICACIONES`, `MEDICAMENTO_ID`, `MEDICO_ID`, `PACIENTE_ID`) 
VALUES (1, '2018-11-21', '2018-11-13', 'indicaciones1', 12, 4, 4);

INSERT INTO `prescripcion` (`DOSIS`, `FECHAFIN`, `FECHAINICIO`, `INDICACIONES`, `MEDICAMENTO_ID`, `MEDICO_ID`, `PACIENTE_ID`) 
VALUES (1, '2018-11-21', '2018-11-13', 'indicaciones1', 13, 4, 5);

INSERT INTO `prescripcion` (`DOSIS`, `FECHAFIN`, `FECHAINICIO`, `INDICACIONES`, `MEDICAMENTO_ID`, `MEDICO_ID`, `PACIENTE_ID`) 
VALUES (1, '2018-11-21', '2018-11-13', 'indicaciones1', 15, 5, 5);

INSERT INTO `prescripcion` (`DOSIS`, `FECHAFIN`, `FECHAINICIO`, `INDICACIONES`, `MEDICAMENTO_ID`, `MEDICO_ID`, `PACIENTE_ID`) 
VALUES (1, '2018-11-21', '2018-11-13', 'indicaciones1', 15, 5, 5);

INSERT INTO `prescripcion` (`DOSIS`, `FECHAFIN`, `FECHAINICIO`, `INDICACIONES`, `MEDICAMENTO_ID`, `MEDICO_ID`, `PACIENTE_ID`) 
VALUES (1, '2018-11-21', '2018-11-13', 'indicaciones1', 16, 5, 5);

INSERT INTO `prescripcion` (`DOSIS`, `FECHAFIN`, `FECHAINICIO`, `INDICACIONES`, `MEDICAMENTO_ID`, `MEDICO_ID`, `PACIENTE_ID`) 
VALUES (1, '2018-11-21', '2018-11-13', 'indicaciones1', 17, 6, 5);

INSERT INTO `prescripcion` (`DOSIS`, `FECHAFIN`, `FECHAINICIO`, `INDICACIONES`, `MEDICAMENTO_ID`, `MEDICO_ID`, `PACIENTE_ID`) 
VALUES (1, '2018-11-21', '2018-11-13', 'indicaciones1', 18, 6, 6);

INSERT INTO `prescripcion` (`DOSIS`, `FECHAFIN`, `FECHAINICIO`, `INDICACIONES`, `MEDICAMENTO_ID`, `MEDICO_ID`, `PACIENTE_ID`) 
VALUES (1, '2018-11-21', '2018-11-13', 'indicaciones1', 19, 6, 6);

INSERT INTO `prescripcion` (`DOSIS`, `FECHAFIN`, `FECHAINICIO`, `INDICACIONES`, `MEDICAMENTO_ID`, `MEDICO_ID`, `PACIENTE_ID`) 
VALUES (1, '2018-11-21', '2018-11-13', 'indicaciones1', 12, 7, 6);

INSERT INTO `prescripcion` (`DOSIS`, `FECHAFIN`, `FECHAINICIO`, `INDICACIONES`, `MEDICAMENTO_ID`, `MEDICO_ID`, `PACIENTE_ID`) 
VALUES (1, '2018-11-21', '2018-11-13', 'indicaciones1', 11, 7, 3);

INSERT INTO `prescripcion` (`DOSIS`, `FECHAFIN`, `FECHAINICIO`, `INDICACIONES`, `MEDICAMENTO_ID`, `MEDICO_ID`, `PACIENTE_ID`) 
VALUES (1, '2018-11-21', '2018-11-13', 'indicaciones1', 10, 7, 3);

INSERT INTO `prescripcion` (`DOSIS`, `FECHAFIN`, `FECHAINICIO`, `INDICACIONES`, `MEDICAMENTO_ID`, `MEDICO_ID`, `PACIENTE_ID`) 
VALUES (1, '2018-11-21', '2018-11-13', 'indicaciones1', 9, 7, 3);

INSERT INTO `prescripcion` (`DOSIS`, `FECHAFIN`, `FECHAINICIO`, `INDICACIONES`, `MEDICAMENTO_ID`, `MEDICO_ID`, `PACIENTE_ID`) 
VALUES (1, '2018-11-21', '2018-11-13', 'indicaciones1', 8, 7, 2);

INSERT INTO `prescripcion` (`DOSIS`, `FECHAFIN`, `FECHAINICIO`, `INDICACIONES`, `MEDICAMENTO_ID`, `MEDICO_ID`, `PACIENTE_ID`) 
VALUES (1, '2018-11-21', '2018-11-13', 'indicaciones1', 7, 1, 2);


/*
--********************-- RECETAS ----------------------
*/

INSERT INTO `receta` (`CANTIDAD`, `ESTADORECETA`, `FINVALIDEZ`, `INICIOVALIDEZ`, `FARMACIADISPENSADORA_ID`, `PRESCRIPCION_ID`) 
VALUES (11, 'generada', '2018-11-28', '2018-11-12', 1, 1);

INSERT INTO `receta` (`CANTIDAD`, `ESTADORECETA`, `FINVALIDEZ`, `INICIOVALIDEZ`, `FARMACIADISPENSADORA_ID`, `PRESCRIPCION_ID`) 
VALUES (2, 'generada', '2018-11-28', '2018-11-12', 4, 2);

INSERT INTO `receta` (`CANTIDAD`, `ESTADORECETA`, `FINVALIDEZ`, `INICIOVALIDEZ`, `FARMACIADISPENSADORA_ID`, `PRESCRIPCION_ID`) 
VALUES (3, 'generada', '2018-11-28', '2018-11-12', 4, 3);

INSERT INTO `receta` (`CANTIDAD`, `ESTADORECETA`, `FINVALIDEZ`, `INICIOVALIDEZ`, `FARMACIADISPENSADORA_ID`, `PRESCRIPCION_ID`) 
VALUES (4, 'generada', '2018-11-28', '2018-11-12', 4, 4);

INSERT INTO `receta` (`CANTIDAD`, `ESTADORECETA`, `FINVALIDEZ`, `INICIOVALIDEZ`, `FARMACIADISPENSADORA_ID`, `PRESCRIPCION_ID`) 
VALUES (5, 'generada', '2018-11-28', '2018-11-12', 4, 5);

INSERT INTO `receta` (`CANTIDAD`, `ESTADORECETA`, `FINVALIDEZ`, `INICIOVALIDEZ`, `FARMACIADISPENSADORA_ID`, `PRESCRIPCION_ID`) 
VALUES (6, 'generada', '2018-11-28', '2018-11-12', 4, 6);

INSERT INTO `receta` (`CANTIDAD`, `ESTADORECETA`, `FINVALIDEZ`, `INICIOVALIDEZ`, `FARMACIADISPENSADORA_ID`, `PRESCRIPCION_ID`) 
VALUES (7, 'generada', '2018-11-28', '2018-11-12', 3, 7);

INSERT INTO `receta` (`CANTIDAD`, `ESTADORECETA`, `FINVALIDEZ`, `INICIOVALIDEZ`, `FARMACIADISPENSADORA_ID`, `PRESCRIPCION_ID`) 
VALUES (8, 'generada', '2018-11-28', '2018-11-12', 3, 8);

INSERT INTO `receta` (`CANTIDAD`, `ESTADORECETA`, `FINVALIDEZ`, `INICIOVALIDEZ`, `FARMACIADISPENSADORA_ID`, `PRESCRIPCION_ID`) 
VALUES (9, 'generada', '2018-11-28', '2018-11-12', 3, 8);

INSERT INTO `receta` (`CANTIDAD`, `ESTADORECETA`, `FINVALIDEZ`, `INICIOVALIDEZ`, `FARMACIADISPENSADORA_ID`, `PRESCRIPCION_ID`) 
VALUES (10, 'generada', '2018-11-28', '2018-11-12', 2, 7);

INSERT INTO `receta` (`CANTIDAD`, `ESTADORECETA`, `FINVALIDEZ`, `INICIOVALIDEZ`, `FARMACIADISPENSADORA_ID`, `PRESCRIPCION_ID`) 
VALUES (11, 'generada', '2018-11-28', '2018-11-12', 2, 6);

INSERT INTO `receta` (`CANTIDAD`, `ESTADORECETA`, `FINVALIDEZ`, `INICIOVALIDEZ`, `FARMACIADISPENSADORA_ID`, `PRESCRIPCION_ID`) 
VALUES (12, 'generada', '2018-11-28', '2018-11-12', 2, 5);

INSERT INTO `receta` (`CANTIDAD`, `ESTADORECETA`, `FINVALIDEZ`, `INICIOVALIDEZ`, `FARMACIADISPENSADORA_ID`, `PRESCRIPCION_ID`) 
VALUES (13, 'generada', '2018-11-28', '2018-11-12', 1, 4);

INSERT INTO `receta` (`CANTIDAD`, `ESTADORECETA`, `FINVALIDEZ`, `INICIOVALIDEZ`, `FARMACIADISPENSADORA_ID`, `PRESCRIPCION_ID`) 
VALUES (14, 'generada', '2018-11-28', '2018-11-12', 1, 3);

INSERT INTO `receta` (`CANTIDAD`, `ESTADORECETA`, `FINVALIDEZ`, `INICIOVALIDEZ`, `FARMACIADISPENSADORA_ID`, `PRESCRIPCION_ID`) 
VALUES (4, 'generada', '2018-11-28', '2018-11-12', 1, 2);

INSERT INTO `receta` (`CANTIDAD`, `ESTADORECETA`, `FINVALIDEZ`, `INICIOVALIDEZ`, `FARMACIADISPENSADORA_ID`, `PRESCRIPCION_ID`) 
VALUES (5, 'generada', '2018-11-28', '2018-11-12', 1, 1);


