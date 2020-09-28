--INFO EJEMPLOS
EXECUTE inserta_guia('123abc','PEDRO','SANCHEZ PEREZ-CASTEJON', '26432436W','pedro@hotmail.com','143785127657');
EXECUTE inserta_guia('123abc','SARA','ROMERO DIAZ', '23452436Y','sara@hotmail.com','143783953657');

EXECUTE inserta_tour('1','HISTORICO', '2','COMBINE LA CULTURA Y LA COCINA EN UN TOUR GUIADO A PIE DE COMIDAS EN GRUPOS PEQUEÑOS, IDEAL PARA LOS AMANTES DE LA COMIDA', '25','5');
EXECUTE inserta_tour('2','GASTRONOMICO', '2','RECORRIDO POR LA CIUDAD PROBANDO LOS PLATOS MAS TIPICOS','20','10');

EXECUTE inserta_grupo('2',to_date('23/12/20','DD/MM/RR'),'16');
EXECUTE inserta_grupo('2',to_date('29/12/20','DD/MM/RR'),'18');
EXECUTE inserta_grupo('1',to_date('26/12/20','DD/MM/RR'),'16');
EXECUTE inserta_grupo('1',to_date('26/12/20','DD/MM/RR'),'19');

EXECUTE inserta_incidencia('1','UN CLIENTE SE HA LESIONADO',to_date('23/12/20','DD/MM/RR'),'16');
EXECUTE inserta_incidencia('3','UN CLIENTE SE HA PERDIDO',to_date('26/12/20','DD/MM/RR'),'16');

EXECUTE inserta_usuario('123abc','SERGIO','AQUINO BLANCO','93652821E','492557843','serg@gmail.com',to_date('23/06/97','DD/MM/RR'));
EXECUTE inserta_usuario('123abc','ENRIQUE','AQUINO BLANCO','35752821E','192157848','enraqubl@gmail.com',to_date('23/06/97','DD/MM/RR'));

EXECUTE inserta_participa_en('1','1');
EXECUTE inserta_participa_en('2','2');
EXECUTE inserta_participa_en('1','3');
EXECUTE inserta_participa_en('2','4');

EXECUTE inserta_comentario('This was an excellent tour. Our guide was very informative, knowledgeable and thoroughly enjoyed the time spent walking around, hearing stores and eating!','1','2');
EXECUTE inserta_comentario('I ended up a little bit tired but it was fun and informative','2','1');

EXECUTE inserta_pago('1',to_date('23/12/20','DD/MM/RR'),'47');
EXECUTE inserta_pago('2',to_date('24/12/20','DD/MM/RR'),'42');

EXECUTE inserta_entrada('1','2','MUSEO');
EXECUTE inserta_entrada('2','2','PALACIOS');

EXECUTE inserta_adquiere('2','1');
EXECUTE inserta_adquiere('1','2');

EXECUTE inserta_bonus('1','ALTA','17');
EXECUTE inserta_bonus('2','ALTA','17');

EXECUTE inserta_seguro('3','1','CANCELACION');
EXECUTE inserta_seguro('3','2','ACCIDENTES');

EXECUTE inserta_foto('FOTO.JPG','1');
EXECUTE inserta_foto('PIC.JPG','2');

--EXECUTE modificar_tour('1','MONUMENTAL');

--Ver una lista de grupos con su informacion
SELECT * FROM GRUPO;
--Ver una lista de los tours y sus características
SELECT * FROM TOUR;
--Ver una lista de guías con sus capacidades
SELECT NOMBRE,APELLIDO, ID_TOUR, MAX_PLAZAS FROM GUIA NATURAL JOIN TOUR;
--Ver info de usuarios registrados
SELECT * FROM USUARIO;
--Ver detalles de las incidencias de un periodo de tiempO
SELECT * FROM INCIDENCIA WHERE FECHA BETWEEN  TO_DATE(SYSDATE) AND TO_DATE('26/12/20','DD/MM/RR');
-- Ver comentarios de un tour
SELECT ID_COMENTARIO, TEXTO, ID_TOUR, ID_USUARIO, ID_GUIA, TOUR FROM COMENTARIO NATURAL JOIN TOUR WHERE ID_TOUR=1;
--Ver datos de pago de un periodo de tiempo
SELECT * FROM PAGO WHERE FECHA_PAGO BETWEEN  TO_DATE(SYSDATE) AND TO_DATE('26/12/20','DD/MM/RR');
--

