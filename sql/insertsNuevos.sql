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


INSERT INTO `receta` (`ID`, `CANTIDAD`, `ESTADORECETA`, `FINVALIDEZ`, `INICIOVALIDEZ`, `FARMACIADISPENSADORA_ID`, `PRESCRIPCION_ID`) 
VALUES ('1', '1', 'generada', '2018-11-28', '2018-11-12', '4', '1');


INSERT INTO `prescripcion` (`ID`, `DOSIS`, `FECHAFIN`, `FECHAINICIO`, `INDICACIONES`, `MEDICAMENTO_ID`, `MEDICO_ID`, `PACIENTE_ID`) 
VALUES (NULL, '1', '2018-11-21', '2018-11-13', 'indicaciones1', '1', '2', '3');

