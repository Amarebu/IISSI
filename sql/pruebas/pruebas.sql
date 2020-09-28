SET SERVEROUTPUT ON;

--GUIA
BEGIN
PK_GUIA.Inicializar;
PK_GUIA.Insertar('Insertar un guia','PEDRO','SANCHEZ PEREZ-CASTEJON', '26432436W','143785127657', TRUE);
PK_GUIA.Insertar('Insertar un guia','SARA','ROMERO DIAZ', '23452436Y','143783953657', TRUE);
PK_GUIA.Insertar('Insertar un guia','MARIA','AVENTURERA','12345678A','143783953345', TRUE);
PK_GUIA.Insertar('Insertar un guia','JORGE','GERSHON', '12345753D','143455127657', TRUE);
PK_GUIA.Insertar('Insertar un guia','CLEO','PATRA', '23345436Y','143783953657', TRUE);
PK_GUIA.Insertar('Insertar un guia','CARLO','MAGNO','12345258A','143783953345', TRUE);
PK_GUIA.Insertar('Insertar un guia','GOYA','DENISSE', '26432746W','143785127657', TRUE);
PK_GUIA.Insertar('Insertar un guia con un dni ya registrado','MAXIMA','AURELIA', '23345436Y','145743953657', FALSE);
PK_GUIA.Insertar('Insertar un guia con dni NULL','FEDERICO','RUBENS', NULL,'143542127657', FALSE);
PK_GUIA.Insertar('Insertar un guia con nombre NULL','NULL','DONADIE','5748392F','053542127657', FALSE);
PK_GUIA.Insertar('Insertar un guia con apellido NULL','SULTAN',NULL, '26284436W','105945127657', FALSE);
PK_GUIA.Insertar('Insertar un guia con número de acreditación NULL','AMNISTIA','GOMEZ','26493856W',NULL, FALSE);
PK_GUIA.Insertar('Insertar un guia con dni inválido','TERESA','LIBRE','125671I','105945195437', FALSE);
PK_GUIA.Insertar('Insertar un guia con dni inválido','CATALINA','RUI','12345F262671I','105945110437', FALSE);
PK_GUIA.ACTUALIZAR('Cambio en el número de acreditación','26432436W','143729543345', TRUE);
PK_GUIA.ACTUALIZAR('Cambio en el número de acreditación','23452436Y','143739284345', TRUE);
PK_GUIA.ACTUALIZAR('Cambio en el número de acreditación','12345678A','143787327445', TRUE);
PK_GUIA.ACTUALIZAR('Cambio en el número de acreditación','12345753D','143783090035', TRUE);
PK_GUIA.ACTUALIZAR('Cambio en el número de acreditación','23345436Y','143104837345', TRUE);
PK_GUIA.ACTUALIZAR('Cambio en el número de acreditación','12345258A','894604837345', TRUE);
PK_GUIA.Eliminar('Eliminar un guia', '12345753D', TRUE);
PK_GUIA.Consultar;

END;
/

--TOUR
BEGIN
PK_TOUR.Inicializar;
PK_TOUR.Insertar('Insertar un tour','HISTORICO', '2','COMBINE LA CULTURA Y LA COCINA EN UN TOUR GUIADO A PIE DE COMIDAS EN GRUPOS PEQUEÑOS, IDEAL PARA LOS AMANTES DE LA COMIDA', '25','5', TRUE);
PK_TOUR.Insertar('Insertar un tour','GASTRONOMICO', '2','RECORRIDO POR LA CIUDAD PROBANDO LOS PLATOS MAS TIPICOS', '20','10', TRUE);
PK_TOUR.Insertar('Insertar un tour','ENTRETENIMIENTO', '2','SESION DE NOCHE CREATIVA + TOUR UNICO', '95','3', FALSE);
PK_TOUR.Insertar('Insertar un tour','GASTRONOMICO', '1','SUBETE EN BARCO CON MUY BUEN ROLLO (COMIDA Y BEBIDA INCLUIDA)', '25','15', TRUE);
Pk_TOUR.Insertar('Insertar un tour','HISTORICO', '2','RUTA HISTORICA DE LOS EDIFICIOS MAS EMBLEMATICOS', '18','20', TRUE);
PK_TOUR.Insertar('Insertar un tour','CULTURAL', '2','VISITAREMOS LOS MUSEOS MAS IMPORTANTES DE LA CIUDAD', '5','10', FALSE);
PK_TOUR.Insertar('Insertar un tour','GASTRONOMICO', '15','VISITA EL VIÑEDO LOS ROBLES', '25','5', TRUE);
Pk_TOUR.Insertar('Insertar un tour','NATURALEZA', '3','APRENDE A SUSURRAR A LOS CABALLOS', '79','8', FALSE);
PK_TOUR.Insertar('Insertar un tour','MONUMENTAL', '2','VISITA LOS MONUMENTOS ESTRELLAS DE LA CIUDAD', '5','10', TRUE);
PK_TOUR.Insertar('Insertar un tour','CULTURAL', '2','RECORRIDO POR LAS IGLESIAS GOTICAS Y ROMÁNICAS', '5','10', FALSE);
PK_TOUR.Insertar('Insertar un tour','RELIGIOSO', '2','VISITA A LA CATEDRAL Y MISA CON EL OBISPO', '5','5', TRUE);
PK_TOUR.Insertar('Insertar un tour','ENTRETENIMIENTO', '2','VISITA EL ZOOLOGICO', '15','10', FALSE);
PK_TOUR.ACTUALIZAR('Cambio en el tour','2','10', TRUE);
PK_TOUR.ACTUALIZAR('Cambio en el tour','4','8', TRUE);
PK_TOUR.ACTUALIZAR('Cambio en el tour','5','15', TRUE);
PK_TOUR.ACTUALIZAR('Cambio en el tour','7','5', TRUE);
PK_TOUR.ACTUALIZAR('Cambio en el tour','11','10', TRUE);
PK_TOUR.ACTUALIZAR('Cambio en el tour','2','12', TRUE);
PK_TOUR.Eliminar('Eliminar un tour', '11', TRUE);
PK_TOUR.Consultar;

END;
/

--GRUPO
BEGIN
PK_GRUPO.Inicializar;
PK_GRUPO.Insertar('Insertar un GRUPO','1',TO_DATE('25/02/2020'), '18',NULL, TRUE);
PK_GRUPO.Insertar('Insertar un GRUPO','2',TO_DATE('28/02/2020'), '08',NULL, TRUE);
PK_GRUPO.Insertar('Insertar un GRUPO','1',TO_DATE('30/03/2020'), '12',NULL, TRUE);
PK_GRUPO.Insertar('Insertar un GRUPO','2',TO_DATE('01/01/2021'), '18',NULL, TRUE);
PK_GRUPO.Insertar('Insertar un GRUPO','1',TO_DATE('19/05/2020'), '20',NULL, TRUE);
PK_GRUPO.Insertar('Insertar un GRUPO','2',TO_DATE('11/03/2020'), '14',NULL, TRUE);
PK_GRUPO.Insertar('Insertar un GRUPO','4',TO_DATE('09/04/2020'), '18',NULL, TRUE);
PK_GRUPO.Insertar('Insertar un GRUPO con una fecha NULL','2',NULL, '15',NULL, FALSE);
PK_GRUPO.ACTUALIZAR('Cambio en la hora del grupo','1','1',TO_DATE('25/02/2020'), '12',NULL, TRUE);
PK_GRUPO.ACTUALIZAR('Cambio en la fecha del grupo','1','1',TO_DATE('23/02/2020'), '18',NULL, TRUE);
PK_GRUPO.ACTUALIZAR('Cambio en el estado suficiente','5','1',TO_DATE('19/05/2020'), '20','1', TRUE);
PK_GRUPO.Eliminar('Eliminar un GRUPO', '7', TRUE);
PK_GRUPO.Consultar;

END;
/

--INCIDENCIA
BEGIN
PK_INCIDENCIA.Inicializar;
PK_INCIDENCIA.Insertar('Insertar una Incidencia','1','Nada va bien', TO_DATE('23/02/2020'),'18',TRUE);
PK_INCIDENCIA.Insertar('Insertar una Incidencia siendo el texto null','2',NULL, TO_DATE('28/02/2020'),'8',FALSE);
PK_INCIDENCIA.Insertar('Insertar una Incidencia','1','Alguiense ha roto la pierna',TO_DATE('23/02/2020'),'18',TRUE);
PK_INCIDENCIA.Insertar('Insertar una Incidencia','3','Se han intentado tirar desde la Girarlda', TO_DATE('30/03/2020'), '12',TRUE);
PK_INCIDENCIA.Insertar('Insertar una Incidencia','2','Se ha atragantado Pedro', TO_DATE('28/02/2020'),'8',TRUE);
PK_INCIDENCIA.Insertar('Insertar una Incidencia','4','Se han perdido 3 personas',TO_DATE('01/01/2021'),'18',TRUE);
PK_INCIDENCIA.Insertar('Insertar una Incidencia con fecha NULL','4','Han arrestado a un turista', NULL,'18', FALSE);
PK_INCIDENCIA.Insertar('Insertar una Incidencia con GRUPO NULL',NULL,'Ha pasado algo muy extraño',TO_DATE('23/02/2020'),'18',FALSE);
PK_INCIDENCIA.Insertar('Insertar una Incidencia con hora NULL','3','La comida venía en mal estado', TO_DATE('30/03/2020'), '12',TRUE);
PK_INCIDENCIA.ACTUALIZAR('Cambio de una fecha', '1','1','Nada va bien', TO_DATE('19/01/2020'),'18',TRUE);
PK_INCIDENCIA.ACTUALIZAR('Cambio de una hora', '1','1','Nada va bien', TO_DATE('19/01/2020'),'12',TRUE);
PK_INCIDENCIA.ACTUALIZAR('Cambio de un texto', '1','2','Me arrepiento', TO_DATE('19/01/2020'),'12',TRUE);
PK_INCIDENCIA.ACTUALIZAR('Cambio de un grupo', '1','2','Me arrepiento', TO_DATE('19/01/2020'),'12',TRUE);
PK_INCIDENCIA.ACTUALIZAR('Cambio de una fecha', '1','2','Me arrepiento', TO_DATE('19/01/2020'),'12',TRUE);
PK_INCIDENCIA.Eliminar('Eliminar una Incidencia', '7', TRUE);
PK_INCIDENCIA.Consultar;

END;
/

--USUARIO
BEGIN
PK_USUARIO.Inicializar;
PK_USUARIO.Insertar('Insertar un USUARIO','FERNANDO','BARRERA ALCORCON','49287698G','655558794', 'FERBARRERA@GMAIL.COM', TO_DATE('23/02/2020'),TRUE);
PK_USUARIO.Insertar('Insertar un USUARIO','SARA','VALVERDE GARCIA','56681823K','669748233', 'SARA_VG@GMAIL.COM', TO_DATE('23/02/2020'),TRUE);
PK_USUARIO.Insertar('Insertar un USUARIO', 'MARIA','GOMEZ GONZALEZ','R84597428','648963752', 'MARGONZ_89@GMAIL.COM', TO_DATE('23/02/2020'),TRUE);
PK_USUARIO.Insertar('Insertar un USUARIO', 'CELIA','DUARTE ROMERO','53264788L','657332624', 'CELIADUARTEGOMEZ8@GMAIL.COM',TO_DATE('23/02/2020'),TRUE);
PK_USUARIO.Insertar('Insertar un USUARIO', 'MARCOS','SEGURA RIOS','45678912R','678963412', 'MRSRIOS@HOTMAIL.COM', TO_DATE('23/02/2020'),TRUE);
PK_USUARIO.Insertar('Insertar un USUARIO con dni NULL', 'JULIA','BURGOS SIMON', NULL,'620768388', 'JULIA.BURGOS98@HOTMAIL.COM', TO_DATE('23/02/2020'),FALSE);
PK_USUARIO.Insertar('Insertar un USUARIO con telefono NULL', 'REBECA','BUENO POMBO','45697812S',NULL, 'REBECA.BG7@GMAIL.COM', TO_DATE('23/02/2020'),FALSE);
PK_USUARIO.Insertar('Insertar un USUARIO con fecha de nacimiento NULL', 'JOSE','VILLAR SANTOS','53264879R','683888952', 'JOSEVILLAR@HOTMAIL.COM', NULL,FALSE);
PK_USUARIO.ACTUALIZAR('Cambio en el nombre del usuario', '4', 'Maria', 'Fernandez', '45678915C', '657482529', 'MARIA15@GMAIL.COM', TO_DATE('23/02/2020'), TRUE);
PK_USUARIO.ACTUALIZAR('Cambio en el email del usuario', '1', 'FERNANDO','BARRERA ALCORCON','49287698G','655558794', 'FERNBARRERA@GMAIL.COM', TO_DATE('23/02/2020'),TRUE);
PK_USUARIO.ACTUALIZAR('Cambio en el telefono del usuario', '1', 'FERNANDO','BARRERA ALCORCON','49287698G','656558794', 'FERNBARRERA@GMAIL.COM', TO_DATE('23/02/2020'),TRUE);
PK_USUARIO.ELIMINAR('Eliminar un usuario', '5', TRUE);
PK_USUARIO.Consultar;

END;
/

--PARTICIPAEN
BEGIN
PK_PARTICIPAEN.Inicializar;
PK_PARTICIPAEN.Insertar('Insertar  PARTICIPA EN', '1', '1', TRUE);
PK_PARTICIPAEN.Insertar('Insertar  PARTICIPA EN','2', '1', TRUE);
PK_PARTICIPAEN.Insertar('Insertar  PARTICIPA EN', '2', '2', TRUE);
PK_PARTICIPAEN.Insertar('Insertar  PARTICIPA EN con ID USUARIO inexistente ', '23423423', '4', FALSE);
PK_PARTICIPAEN.Insertar('Insertar  PARTICIPA EN con ID GRUPO inexistente', '2', '345345', FALSE);
PK_PARTICIPAEN.ACTUALIZAR('Cambio en el ID GRUPO de PARTICIA EN', '1', '1', '4', TRUE);
PK_PARTICIPAEN.ACTUALIZAR('Cambio en el ID USUARIO de PARTICIPA EN', '2', '2', '3', TRUE);
PK_PARTICIPAEN.ELIMINAR('Eliminar un PARTICIPA EN', '2', TRUE);
PK_PARTICIPAEN.Consultar;

END;
/

--COMENTARIO
BEGIN
PK_COMENTARIO.Inicializar;
PK_COMENTARIO.Insertar('Insertar un COMENTARIO','1', '1', 'This was an excellent tour. Our guide was very informative', TRUE);
PK_COMENTARIO.Insertar('Insertar un COMENTARIO','2', '1', 'I ended up a little bit tired but it was fun and informative', TRUE);
PK_COMENTARIO.Insertar('Insertar un COMENTARIO','1', '2', 'Very Good', TRUE);
PK_COMENTARIO.Insertar('Insertar un COMENTARIO','2', '2', 'Average', TRUE);
PK_COMENTARIO.ACTUALIZAR('Cambio del texto de un COMENTARIO','1','1', '1', 'DELETED', TRUE);
PK_COMENTARIO.ACTUALIZAR('Cambio del de COMENTARIO a NULL','1','1', '1',NULL, FALSE);
PK_COMENTARIO.Eliminar('Eliminar un COMENTARIO', '2', TRUE);
PK_COMENTARIO.Consultar;

END;
/


--PAGO
BEGIN
PK_PAGO.Inicializar;
PK_PAGO.Insertar('Insertar un PAGO','1',TO_DATE('25/02/2020'), '18', TRUE);
PK_PAGO.Insertar('Insertar un PAGO','2',TO_DATE('25/02/2020'), '18', TRUE);
PK_PAGO.Insertar('Insertar un PAGO','3',TO_DATE('25/02/2020'), '18', TRUE);
PK_PAGO.Insertar('Insertar un PAGO','4',TO_DATE('25/02/2020'), '18', TRUE);
PK_PAGO.Insertar('Insertar un PAGO','6',TO_DATE('25/02/2020'), '18', TRUE);
PK_PAGO.Insertar('Insertar un PAGO','2',TO_DATE('25/02/2020'), '18', TRUE);
PK_PAGO.Insertar('Insertar un PAGO','1',TO_DATE('25/02/2020'), '18', TRUE);
PK_PAGO.Insertar('Insertar un PAGO con una fecha NULL','1',NULL, '18', FALSE);
PK_PAGO.ACTUALIZAR('Cambio en el usuario del PAGO','1','1',TO_DATE('25/02/2020'), '18', TRUE);
PK_PAGO.ACTUALIZAR('Cambio en la fecha del PAGO','1','1',TO_DATE('26/02/2020'), '18', TRUE);
PK_PAGO.ACTUALIZAR('Cambio en el importe suficiente','5','1',TO_DATE('26/02/2020'), '20', TRUE);
PK_PAGO.Eliminar('Eliminar un PAGO', '7', TRUE);
PK_PAGO.Consultar;

END;
/

--ADQUIERE
BEGIN
PK_ADQUIERE.Inicializar;
PK_ADQUIERE.Insertar('Insertar  ADQUIERE', '1', '1', TRUE);
PK_ADQUIERE.Insertar('Insertar  ADQUIERE','2', '1', TRUE);
PK_ADQUIERE.Insertar('Insertar ADQUIERE', '3', '2', TRUE);
PK_ADQUIERE.Insertar('Insertar ADQUIERE con ID TOUR NULL ', NULL, '4', FALSE);
PK_ADQUIERE.Insertar('Insertar  ADQUIERE con ID ENTRADA NULL', '5',NULL, FALSE);
PK_ADQUIERE.Insertar('Insertar  ADQUIERE', '6', '3', TRUE);
PK_ADQUIERE.Insertar('Insertar  ADQUIERE', '7', '2', TRUE);
PK_ADQUIERE.Insertar('Insertar  ADQUIERE', '4', '3', TRUE);
PK_ADQUIERE.Insertar('Insertar  ADQUIERE', '1', '5', TRUE);
PK_ADQUIERE.ACTUALIZAR('Cambio en el ID TOUR de ADQUIERE', '1', '1', '4', TRUE);
PK_ADQUIERE.ACTUALIZAR('Cambio en el ID ENTRADA de ADQUIERE', '2', '4', '3', TRUE);
PK_ADQUIERE.ELIMINAR('Eliminar un ADQUIERE', '2', TRUE);
PK_ADQUIERE.Consultar;

END;
/


--SEGURO
BEGIN
PK_SEGURO.Inicializar;
PK_SEGURO.Insertar('Insertar un SEGURO', '5', '2', 'CANCELACION',TRUE);
PK_SEGURO.Insertar('Insertar un SEGURO', '10', '6', 'ACCIDENTES', TRUE);
PK_SEGURO.Insertar('Insertar un SEGURO con TIPO SEGURO NULL', '5', '5', NULL, FALSE);
PK_SEGURO.ACTUALIZAR('Cambio el TIPO SEGURO en SEGURO', '4', '5', '3', 'CANCELACION', TRUE);
PK_SEGURO.ELIMINAR('Eliminar un SEGURO', '4', TRUE);
PK_SEGURO.Consultar;
END;
/

--FOTO
BEGIN
PK_FOTO.Inicializar;
PK_FOTO.Insertar('Insertar una FOTO','FOTO.JPG','1', TRUE);
PK_FOTO.Insertar('Insertar una FOTO','PIC.JPG','2', TRUE);
PK_FOTO.Insertar('Insertar una FOTO','IMAGEN.JPG','4', TRUE);
PK_FOTO.Insertar('Insertar una FOTO','VISTAS.JPG','5', TRUE);
PK_FOTO.Insertar('Insertar una FOTO','CASCADA.JPG','7', TRUE);
PK_FOTO.Insertar('Insertar una FOTO','MUSEO.JPG','1', TRUE);
PK_FOTO.Insertar('Insertar una FOTO','ARTE.JPG','2', TRUE);
PK_FOTO.Insertar('Insertar una FOTO con una URL NULL ya registrado',NULL, '1', FALSE);
PK_FOTO.ACTUALIZAR('Cambio en la URL de FOTO','1','FOTOMEJOR.JPG','1', TRUE);
PK_FOTO.ACTUALIZAR('Cambio en el Tour de FOTO','1','FOTO.JPG','2', TRUE);
PK_FOTO.Eliminar('Eliminar un FOTO', '7', TRUE);
PK_FOTO.Consultar;

END;
/
