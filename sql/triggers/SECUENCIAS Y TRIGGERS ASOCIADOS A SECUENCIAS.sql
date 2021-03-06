DROP SEQUENCE SEC_GRUPO;
CREATE SEQUENCE SEC_GRUPO
INCREMENT BY 1
START WITH 1
MAXVALUE 999999;

DROP SEQUENCE SEC_GUIA;
CREATE SEQUENCE SEC_GUIA
INCREMENT BY 1
START WITH 1
MAXVALUE 999999;

DROP SEQUENCE SEC_ADQUIERE;
CREATE SEQUENCE SEC_ADQUIERE
INCREMENT BY 1
START WITH 1
MAXVALUE 999999;

DROP SEQUENCE SEC_BONUS;
CREATE SEQUENCE SEC_BONUS
INCREMENT BY 1
START WITH 1
MAXVALUE 999999;

DROP SEQUENCE SEC_COMENTARIO;
CREATE SEQUENCE SEC_COMENTARIO
INCREMENT BY 1
START WITH 1
MAXVALUE 999999;

DROP SEQUENCE SEC_ENTRADA;
CREATE SEQUENCE SEC_ENTRADA
INCREMENT BY 1
START WITH 1
MAXVALUE 999999;

DROP SEQUENCE SEC_FOTO;
CREATE SEQUENCE SEC_FOTO
INCREMENT BY 1
START WITH 1
MAXVALUE 999999;

DROP SEQUENCE SEC_INCIDENCIA;
CREATE SEQUENCE SEC_INCIDENCIA
INCREMENT BY 1
START WITH 1
MAXVALUE 999999;

DROP SEQUENCE SEC_PAGO;
CREATE SEQUENCE SEC_PAGO
INCREMENT BY 1
START WITH 1
MAXVALUE 999999;

DROP SEQUENCE SEC_PARTICIPAEN;
CREATE SEQUENCE SEC_PARTICIPAEN
INCREMENT BY 1
START WITH 1
MAXVALUE 999999;

DROP SEQUENCE SEC_SEGURO;
CREATE SEQUENCE SEC_SEGURO
INCREMENT BY 1
START WITH 1
MAXVALUE 999999;

DROP SEQUENCE SEC_TOUR;
CREATE SEQUENCE SEC_TOUR
INCREMENT BY 1
START WITH 1
MAXVALUE 999999;

DROP SEQUENCE SEC_USUARIO;
CREATE SEQUENCE SEC_USUARIO
INCREMENT BY 1
START WITH 1
MAXVALUE 999999;

CREATE OR REPLACE TRIGGER TR_SEC_GRUPO
BEFORE INSERT ON GRUPO
FOR EACH ROW
DECLARE 
	VALORSEC NUMBER := 0;
BEGIN
	SELECT SEC_GRUPO.NEXTVAL INTO VALORSEC FROM DUAL;
	:NEW.ID_GRUPO := VALORSEC;
END;
/

CREATE OR REPLACE TRIGGER TR_SEC_GUIA
BEFORE INSERT ON GUIA
FOR EACH ROW
DECLARE 
	VALORSEC NUMBER := 0;
BEGIN
	SELECT SEC_GUIA.NEXTVAL INTO VALORSEC FROM DUAL;
	:NEW.ID_GUIA := VALORSEC;
END;
/

CREATE OR REPLACE TRIGGER TR_SEC_ADQUIERE
BEFORE INSERT ON ADQUIERE
FOR EACH ROW
DECLARE
	VALORSEC NUMBER := 0;
BEGIN
	SELECT SEC_ADQUIERE.NEXTVAL INTO VALORSEC FROM DUAL;
	:NEW.ID_ADQUIERE := VALORSEC;
END;
/

CREATE OR REPLACE TRIGGER TR_SEC_BONUS
BEFORE INSERT ON BONUS
FOR EACH ROW
DECLARE 
	VALORSEC NUMBER := 0;
BEGIN
	SELECT SEC_BONUS.NEXTVAL INTO VALORSEC FROM DUAL;
	:NEW.ID_BONUS := VALORSEC;
END;
/

CREATE OR REPLACE TRIGGER TR_SEC_COMENTARIO
BEFORE INSERT ON COMENTARIO
FOR EACH ROW
DECLARE 
	VALORSEC NUMBER := 0;
BEGIN
	SELECT SEC_COMENTARIO.NEXTVAL INTO VALORSEC FROM DUAL;
	:NEW.ID_COMENTARIO := VALORSEC;
END;
/

CREATE OR REPLACE TRIGGER TR_SEC_ENTRADA
BEFORE INSERT ON ENTRADA
FOR EACH ROW
DECLARE 
	VALORSEC NUMBER := 0;
BEGIN
	SELECT SEC_ENTRADA.NEXTVAL INTO VALORSEC FROM DUAL;
	:NEW.ID_ENTRADA := VALORSEC;
END;
/

CREATE OR REPLACE TRIGGER TR_SEC_FOTO
BEFORE INSERT ON FOTO
FOR EACH ROW
DECLARE 
	VALORSEC NUMBER := 0;
BEGIN
	SELECT SEC_FOTO.NEXTVAL INTO VALORSEC FROM DUAL;
	:NEW.ID_FOTO := VALORSEC;
END;
/

CREATE OR REPLACE TRIGGER TR_SEC_INCIDENCIA
BEFORE INSERT ON INCIDENCIA
FOR EACH ROW
DECLARE 
	VALORSEC NUMBER := 0;
BEGIN
	SELECT SEC_INCIDENCIA.NEXTVAL INTO VALORSEC FROM DUAL;
	:NEW.ID_INCIDENCIA := VALORSEC;
END;
/

CREATE OR REPLACE TRIGGER TR_SEC_PAGO
BEFORE INSERT ON PAGO
FOR EACH ROW
DECLARE 
	VALORSEC NUMBER := 0;
BEGIN
	SELECT SEC_PAGO.NEXTVAL INTO VALORSEC FROM DUAL;
	:NEW.ID_PAGO := VALORSEC;
END;
/

CREATE OR REPLACE TRIGGER TR_SEC_PARTICIPAEN
BEFORE INSERT ON PARTICIPAEN
FOR EACH ROW
DECLARE 
	VALORSEC NUMBER := 0;
BEGIN
	SELECT SEC_PARTICIPAEN.NEXTVAL INTO VALORSEC FROM DUAL;
	:NEW.ID_PARTICIPAEN := VALORSEC;
END;
/

CREATE OR REPLACE TRIGGER TR_SEC_SEGURO
BEFORE INSERT ON SEGURO
FOR EACH ROW
DECLARE 
	VALORSEC NUMBER := 0;
BEGIN
	SELECT SEC_SEGURO.NEXTVAL INTO VALORSEC FROM DUAL;
	:NEW.ID_SEGURO := VALORSEC;
END;
/

CREATE OR REPLACE TRIGGER TR_SEC_TOUR
BEFORE INSERT ON TOUR
FOR EACH ROW
DECLARE 
	VALORSEC NUMBER := 0;
BEGIN
	SELECT SEC_TOUR.NEXTVAL INTO VALORSEC FROM DUAL;
	:NEW.ID_TOUR := VALORSEC;
END;
/

CREATE OR REPLACE TRIGGER TR_SEC_USUARIO
BEFORE INSERT ON USUARIO
FOR EACH ROW
DECLARE 
	VALORSEC NUMBER := 0;
BEGIN
	SELECT SEC_USUARIO.NEXTVAL INTO VALORSEC FROM DUAL;
	:NEW.ID_USUARIO := VALORSEC;
END;
/