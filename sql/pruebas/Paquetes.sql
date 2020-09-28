
    
    --ASSERT_EQUALS
CREATE OR REPLACE FUNCTION ASSERT_EQUALS (v_Salida BOOLEAN, salidaEsperada BOOLEAN)
RETURN VARCHAR2
IS
BEGIN
	IF v_Salida = salidaEsperada THEN
		RETURN 'EXITO';
	ELSE
		RETURN 'FALLO';
	END IF;
END;
/

--CABECERAS

--GUIA
CREATE OR REPLACE PACKAGE PK_GUIA
IS
PROCEDURE Inicializar;
PROCEDURE Consultar;
PROCEDURE Insertar(nombrePrueba VARCHAR2, v_NOMBRE IN GUIA.NOMBRE%TYPE, 
            v_APELLIDO IN GUIA.APELLIDO%TYPE, v_DNI IN GUIA.DNI%TYPE,
            v_NUM_ACREDITACION in GUIA.NUM_ACREDITACION%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_DNI IN GUIA.DNI%TYPE, v_NUM_ACREDITACION IN GUIA.NUM_ACREDITACION%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Eliminar(nombrePrueba VARCHAR2, v_DNI IN GUIA.DNI%TYPE, salidaEsperada BOOLEAN);
END;
/

--TOUR
CREATE OR REPLACE PACKAGE PK_TOUR
IS
PROCEDURE Inicializar;
PROCEDURE Consultar;
PROCEDURE Insertar(nombrePrueba VARCHAR2, v_TOUR IN TOUR.TOUR%TYPE, 
            v_DURACION IN TOUR.DURACION%TYPE, v_DESCRIPCION IN TOUR.DESCRIPCION%TYPE,
            v_COSTE in TOUR.IMPORTE%TYPE, v_MAX_PLAZAS in TOUR.MAX_PLAZAS%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_ID_TOUR IN TOUR.ID_TOUR%TYPE, v_MAX_PLAZAS IN TOUR.MAX_PLAZAS%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Eliminar(nombrePrueba VARCHAR2, v_ID_TOUR IN TOUR.ID_TOUR%TYPE, salidaEsperada BOOLEAN);
END;
/

--GRUPO
CREATE OR REPLACE PACKAGE PK_GRUPO
IS
PROCEDURE Inicializar;
PROCEDURE Consultar;
PROCEDURE Insertar(nombrePrueba VARCHAR2, v_ID_TOUR IN GRUPO.ID_TOUR%TYPE,v_FECHA IN GRUPO.FECHA%TYPE, 
            v_HORA IN GRUPO.HORA%TYPE, v_SUFICIENTE IN GRUPO.SUFICIENTE%TYPE,
             salidaEsperada BOOLEAN);
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_ID_GRUPO IN GRUPO.ID_GRUPO%TYPE, v_ID_TOUR IN GRUPO.ID_TOUR%TYPE, v_FECHA IN GRUPO.FECHA%TYPE, v_HORA IN GRUPO.HORA%TYPE, v_SUFICIENTE IN GRUPO.SUFICIENTE%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Eliminar(nombrePrueba VARCHAR2, v_ID_GRUPO IN GRUPO.ID_GRUPO%TYPE, salidaEsperada BOOLEAN);
END;
/
--INCIDENCIA
CREATE OR REPLACE PACKAGE PK_INCIDENCIA
IS
PROCEDURE Inicializar;
PROCEDURE Consultar;
PROCEDURE Insertar(nombrePrueba VARCHAR2,  v_ID_GRUPO IN INCIDENCIA.ID_GRUPO%TYPE,
                    v_TEXTO IN INCIDENCIA.TEXTO%TYPE,
                    v_FECHA IN INCIDENCIA.FECHA%TYPE,
                    v_HORA IN INCIDENCIA.HORA%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_ID_INCIDENCIA IN INCIDENCIA.ID_INCIDENCIA%TYPE, v_ID_GRUPO IN INCIDENCIA.ID_GRUPO%TYPE, v_TEXTO IN INCIDENCIA.TEXTO%TYPE, 
v_FECHA IN INCIDENCIA.FECHA%TYPE, v_HORA IN INCIDENCIA.HORA%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Eliminar(nombrePrueba VARCHAR2, v_ID_INCIDENCIA IN INCIDENCIA.ID_INCIDENCIA%TYPE, salidaEsperada BOOLEAN);
END;
/
--USUARIO
CREATE OR REPLACE PACKAGE PK_USUARIO
IS
PROCEDURE Inicializar;
PROCEDURE Consultar;
PROCEDURE Insertar(nombrePrueba VARCHAR2,
    v_NOMBRE IN USUARIO.NOMBRE%TYPE, 
    v_APELLIDOS IN USUARIO.APELLIDOS%TYPE,
    v_DNI IN USUARIO.DNI%TYPE, 
    v_TELEFONO IN USUARIO.TELEFONO%TYPE, 
    v_EMAIL IN USUARIO.EMAIL%TYPE,
    v_FNAC IN USUARIO.FECHA_NAC%TYPE,
    salidaEsperada BOOLEAN);
PROCEDURE Actualizar (nombrePrueba VARCHAR2,
    v_ID_USUARIO IN USUARIO.ID_USUARIO%TYPE,
    v_NOMBRE IN USUARIO.NOMBRE%TYPE, 
    v_APELLIDOS IN USUARIO.APELLIDOS%TYPE,
    v_DNI IN USUARIO.DNI%TYPE, 
    v_TELEFONO IN USUARIO.TELEFONO%TYPE, 
    v_EMAIL IN USUARIO.EMAIL%TYPE,
    v_FNAC IN USUARIO.FECHA_NAC%TYPE,
    salidaEsperada BOOLEAN);
PROCEDURE Eliminar(nombrePrueba VARCHAR2, v_ID_USUARIO IN USUARIO.ID_USUARIO%TYPE, salidaEsperada BOOLEAN);
END;
/
--PARTICIPAEN
CREATE OR REPLACE PACKAGE PK_PARTICIPAEN
IS
PROCEDURE Inicializar;
PROCEDURE Consultar;
PROCEDURE Insertar(nombrePrueba VARCHAR2, v_ID_USUARIO IN PARTICIPAEN.ID_USUARIO%TYPE, v_ID_GRUPO IN PARTICIPAEN.ID_GRUPO%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_ID_PARTICIPAEN IN PARTICIPAEN.ID_PARTICIPAEN%TYPE, v_ID_USUARIO IN PARTICIPAEN.ID_USUARIO%TYPE, v_ID_GRUPO IN PARTICIPAEN.ID_GRUPO%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Eliminar(nombrePrueba VARCHAR2, v_ID_PARTICIPAEN IN PARTICIPAEN.ID_PARTICIPAEN%TYPE, salidaEsperada BOOLEAN);
END;
/
--COMENTARIO
CREATE OR REPLACE PACKAGE PK_COMENTARIO
IS
PROCEDURE Inicializar;
PROCEDURE Consultar;
PROCEDURE Insertar(nombrePrueba VARCHAR2, 
                    v_ID_USUARIO IN COMENTARIO.ID_USUARIO%TYPE, v_ID_TOUR IN COMENTARIO.ID_TOUR%TYPE,v_TEXTO IN COMENTARIO.TEXTO%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Actualizar (nombrePrueba VARCHAR2,  v_ID_COMENTARIO IN COMENTARIO.ID_COMENTARIO%TYPE,
                    v_ID_USUARIO IN COMENTARIO.ID_USUARIO%TYPE, v_ID_TOUR IN COMENTARIO.ID_TOUR%TYPE,v_TEXTO IN COMENTARIO.TEXTO%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Eliminar(nombrePrueba VARCHAR2, v_ID_COMENTARIO IN COMENTARIO.ID_COMENTARIO%TYPE, salidaEsperada BOOLEAN);
END;
/
--PAGO
CREATE OR REPLACE PACKAGE PK_PAGO
IS
PROCEDURE Inicializar;
PROCEDURE Consultar;
PROCEDURE Insertar(nombrePrueba VARCHAR2, v_ID_USUARIO IN PAGO.ID_USUARIO%TYPE, v_FECHA_PAGO IN PAGO.FECHA_PAGO%TYPE, v_IMPORTE IN PAGO.IMPORTE%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_ID_PAGO IN PAGO.ID_PAGO%TYPE, v_ID_USUARIO IN PAGO.ID_USUARIO%TYPE, v_FECHA_PAGO IN PAGO.FECHA_PAGO%TYPE, v_IMPORTE IN PAGO.IMPORTE%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Eliminar(nombrePrueba VARCHAR2, v_ID_PAGO IN PAGO.ID_PAGO%TYPE, salidaEsperada BOOLEAN);
END;
/

--ENTRADA
CREATE OR REPLACE PACKAGE PK_ENTRADA
IS
PROCEDURE Inicializar;
PROCEDURE Consultar;
PROCEDURE Insertar(nombrePrueba VARCHAR2, 
                    v_ID_PAGO IN ENTRADA.ID_PAGO%TYPE, v_IMPORTE IN ENTRADA.IMPORTE%TYPE,v_TIPO_ENTRADA IN ENTRADA.TIPO_ENTRADA%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Actualizar (nombrePrueba VARCHAR2,  v_ID_ENTRADA IN ENTRADA.ID_ENTRADA%TYPE,
                    v_ID_PAGO IN ENTRADA.ID_PAGO%TYPE, v_IMPORTE IN ENTRADA.IMPORTE%TYPE,v_TIPO_ENTRADA IN ENTRADA.TIPO_ENTRADA%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Eliminar(nombrePrueba VARCHAR2, v_ID_ENTRADA IN ENTRADA.ID_ENTRADA%TYPE, salidaEsperada BOOLEAN);
END;
/

--ADQUIERE
CREATE OR REPLACE PACKAGE PK_ADQUIERE
IS
PROCEDURE Inicializar;
PROCEDURE Consultar;
PROCEDURE Insertar(nombrePrueba VARCHAR2, v_ID_TOUR IN ADQUIERE.ID_TOUR%TYPE, v_ID_ENTRADA IN ADQUIERE.ID_ENTRADA%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_ID_ADQUIERE IN ADQUIERE.ID_ADQUIERE%TYPE, v_ID_TOUR IN ADQUIERE.ID_TOUR%TYPE, v_ID_ENTRADA IN ADQUIERE.ID_ENTRADA%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Eliminar(nombrePrueba VARCHAR2, v_ID_ADQUIERE IN ADQUIERE.ID_ADQUIERE%TYPE, salidaEsperada BOOLEAN);
END;
/

--BONUS
CREATE OR REPLACE PACKAGE PK_BONUS
IS
PROCEDURE Inicializar;
PROCEDURE Consultar;
PROCEDURE Insertar(nombrePrueba VARCHAR2, v_ID_PAGO IN BONUS.ID_PAGO%TYPE, v_TIPO_TEMPORADA IN BONUS.TIPO_TEMPORADA%TYPE, v_IMPORTE IN BONUS.IMPORTE%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_ID_BONUS IN BONUS.ID_BONUS%TYPE, v_ID_PAGO IN BONUS.ID_PAGO%TYPE, v_TIPO_TEMPORADA IN BONUS.TIPO_TEMPORADA%TYPE, v_IMPORTE IN BONUS.IMPORTE%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Eliminar(nombrePrueba VARCHAR2, v_ID_BONUS IN BONUS.ID_BONUS%TYPE, salidaEsperada BOOLEAN);
END;
/
--SEGURO
CREATE OR REPLACE PACKAGE PK_SEGURO
IS
PROCEDURE Inicializar;
PROCEDURE Consultar;
PROCEDURE Insertar(nombrePrueba VARCHAR2, v_IMPORTE IN SEGURO.IMPORTE%TYPE, v_ID_PAGO IN SEGURO.ID_PAGO%TYPE, v_TIPO_SEGURO IN SEGURO.TIPO_SEGURO%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_ID_SEGURO IN SEGURO.ID_SEGURO%TYPE, v_IMPORTE IN SEGURO.IMPORTE%TYPE, v_ID_PAGO IN SEGURO.ID_PAGO%TYPE, v_TIPO_SEGURO IN SEGURO.TIPO_SEGURO%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Eliminar(nombrePrueba VARCHAR2, v_ID_SEGURO IN SEGURO.ID_SEGURO%TYPE, salidaEsperada BOOLEAN);
END;
/
--FOTO
CREATE OR REPLACE PACKAGE PK_FOTO
IS
PROCEDURE Inicializar;
PROCEDURE Consultar;
PROCEDURE Insertar(nombrePrueba VARCHAR2, v_URL_FOTO IN FOTO.URL_FOTO%TYPE, v_ID_TOUR IN FOTO.ID_TOUR%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_ID_FOTO IN FOTO.ID_FOTO%TYPE, v_URL_FOTO IN FOTO.URL_FOTO%TYPE, v_ID_TOUR IN FOTO.ID_TOUR%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Eliminar(nombrePrueba VARCHAR2, v_ID_FOTO IN FOTO.ID_FOTO%TYPE, salidaEsperada BOOLEAN);
END;
/

--********************************************************************************************************************************















--CUERPOS

--GUIA
CREATE OR REPLACE PACKAGE BODY PK_GUIA
IS
CURSOR C IS 
        SELECT * FROM GUIA;
    v_Salida BOOLEAN := TRUE;
    v_GUIA GUIA%ROWTYPE;

PROCEDURE Inicializar
    IS
    BEGIN
        DELETE FROM GUIA;
    END Inicializar;
    
PROCEDURE Consultar
    IS
    BEGIN
        OPEN C;
        FETCH C INTO v_GUIA;
        DBMS_OUTPUT.PUT_LINE(RPAD('ID:', 25) || RPAD('NOMBRE:', 25) || RPAD('APELLIDO:', 25)
                                    || RPAD('DNI:',25) || RPAD('ACREDITACI�N:',25));
        DBMS_OUTPUT.PUT_LINE(LPAD('-',120,'-'));
        WHILE C%FOUND LOOP
            DBMS_OUTPUT.PUT_LINE(RPAD(v_GUIA.ID_GUIA, 25) || RPAD(v_GUIA.NOMBRE, 25) || RPAD(v_GUIA.APELLIDO, 25)
                                    || RPAD(v_GUIA.DNI, 25) || RPAD(v_GUIA.NUM_ACREDITACION, 25));
        FETCH C INTO v_GUIA;
        END LOOP;
        CLOSE C;
    END Consultar;
    
PROCEDURE Insertar(nombrePrueba VARCHAR2, v_NOMBRE IN GUIA.NOMBRE%TYPE, v_APELLIDO IN GUIA.APELLIDO%TYPE, v_DNI in GUIA.DNI%TYPE, v_NUM_ACREDITACION in GUIA.NUM_ACREDITACION%TYPE, salidaEsperada BOOLEAN)
            IS
            BEGIN
                INSERT INTO GUIA (NOMBRE, APELLIDO, DNI, NUM_ACREDITACION) 
                VALUES (v_NOMBRE, v_APELLIDO, v_DNI, v_NUM_ACREDITACION);
                COMMIT;
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
                EXCEPTION
                	WHEN OTHERS THEN
            		DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
            		ROLLBACK;
        END Insertar;
        
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_DNI IN GUIA.DNI%TYPE, v_NUM_ACREDITACION IN GUIA.NUM_ACREDITACION%TYPE, salidaEsperada BOOLEAN)        
    IS
    BEGIN
        UPDATE GUIA SET NUM_ACREDITACION = v_NUM_ACREDITACION  WHERE DNI = v_DNI;
        SELECT * INTO v_GUIA FROM GUIA WHERE  DNI = v_DNI;
        IF v_GUIA.NUM_ACREDITACION != v_NUM_ACREDITACION THEN
            v_Salida := FALSE;
        END IF;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
                ROLLBACK;          
    END Actualizar;
        
PROCEDURE Eliminar(nombrePrueba VARCHAR2, v_DNI IN GUIA.DNI%TYPE, salidaEsperada BOOLEAN)
    IS
    v_numGUIA NUMBER := 0;
    BEGIN
        DELETE FROM GUIA WHERE (v_DNI = GUIA.DNI);
        SELECT COUNT(*) INTO v_numGUIA FROM GUIA WHERE  DNI = v_DNI;
        IF v_numGUIA != 0 THEN
			v_Salida := FALSE;
		END IF;
		COMMIT;
		DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
		EXCEPTION
			WHEN OTHERS THEN
				DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
				ROLLBACK;
        END Eliminar;
END;
/


--TOUR
CREATE OR REPLACE PACKAGE BODY PK_TOUR
IS
CURSOR C IS 
        SELECT * FROM TOUR;
    v_Salida BOOLEAN := TRUE;
    v_TOUR TOUR%ROWTYPE;

PROCEDURE Inicializar
    IS
    BEGIN
        DELETE FROM TOUR;
    END Inicializar;
    
PROCEDURE Consultar
    IS
    BEGIN
        OPEN C;
        FETCH C INTO v_TOUR;
        DBMS_OUTPUT.PUT_LINE(RPAD('ID:', 25) || RPAD('TOUR:', 25) || RPAD('DURACION:', 25)
                                    || RPAD('DESCRIPCION:',25) || RPAD('COSTE:',25)|| RPAD('M:',25)) ;
        DBMS_OUTPUT.PUT_LINE(LPAD('-',120,'-'));
        WHILE C%FOUND LOOP
            DBMS_OUTPUT.PUT_LINE(RPAD(v_TOUR.ID_TOUR, 25) || RPAD(v_TOUR.TOUR, 25) || RPAD(v_TOUR.DURACION, 25)
                                    || RPAD(v_TOUR.DESCRIPCION, 25) || RPAD(v_TOUR.COSTE, 25)|| RPAD(v_TOUR.MAX_PLAZAS, 25));
        FETCH C INTO v_TOUR;
        END LOOP;
        CLOSE C;
    END Consultar; 
    
PROCEDURE Insertar(nombrePrueba VARCHAR2, v_TOUR IN TOUR.TOUR%TYPE, v_DURACION IN TOUR.DURACION%TYPE, v_DESCRIPCION in TOUR.DESCRIPCION%TYPE, v_COSTE in TOUR.COSTE%TYPE,v_MAX_PLAZAS in TOUR.MAX_PLAZAS%TYPE, salidaEsperada BOOLEAN)
            IS
            BEGIN
                INSERT INTO TOUR (TOUR, DURACION,DESCRIPCION,COSTE, MAX_PLAZAS) 
                VALUES (v_TOUR, V_DURACION,V_DESCRIPCION, V_COSTE, V_MAX_PLAZAS);
                COMMIT;
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
                EXCEPTION
                	WHEN OTHERS THEN
            		DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
            		ROLLBACK;
        END Insertar;
        
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_ID_TOUR IN TOUR.ID_TOUR%TYPE, v_MAX_PLAZAS IN TOUR.MAX_PLAZAS%TYPE, salidaEsperada BOOLEAN)        
    IS
    BEGIN
        UPDATE TOUR SET MAX_PLAZAS = v_MAX_PLAZAS  WHERE ID_TOUR = v_ID_TOUR;
        SELECT * INTO v_TOUR FROM TOUR WHERE  ID_TOUR = v_ID_TOUR;
        IF v_TOUR.MAX_PLAZAS != v_MAX_PLAZAS THEN
            v_Salida := FALSE;
        END IF;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
                ROLLBACK;          
    END Actualizar;
        
PROCEDURE Eliminar(nombrePrueba VARCHAR2, v_ID_TOUR IN TOUR.ID_TOUR%TYPE, salidaEsperada BOOLEAN)
    IS
    v_numTOUR NUMBER := 0;
    BEGIN
        DELETE FROM TOUR WHERE (v_ID_TOUR = TOUR.ID_TOUR);
        SELECT COUNT(*) INTO v_numTOUR FROM TOUR WHERE  ID_TOUR = v_ID_TOUR;
        IF v_numTOUR != 0 THEN
			v_Salida := FALSE;
		END IF;
		COMMIT;
		DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
		EXCEPTION
			WHEN OTHERS THEN
				DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
				ROLLBACK;
        END Eliminar;
END;
/




--GRUPO
CREATE OR REPLACE PACKAGE BODY PK_GRUPO
IS
CURSOR C IS 
        SELECT * FROM GRUPO;
    v_Salida BOOLEAN := TRUE;
    v_GRUPO GRUPO%ROWTYPE;

PROCEDURE Inicializar
    IS
    BEGIN
        DELETE FROM GRUPO;
    END Inicializar;
    
PROCEDURE Consultar
    IS
    BEGIN
        OPEN C;
        FETCH C INTO v_GRUPO;
        DBMS_OUTPUT.PUT_LINE(RPAD('ID:', 25) || RPAD('FECHA:', 25) || RPAD('HORA:', 25)
                                    || RPAD('SUFICIENTE:',25)) ;
        DBMS_OUTPUT.PUT_LINE(LPAD('-',120,'-'));
        WHILE C%FOUND LOOP
            DBMS_OUTPUT.PUT_LINE(RPAD(v_GRUPO.ID_GRUPO, 25) || RPAD(v_GRUPO.FECHA, 25) || RPAD(v_GRUPO.HORA, 25)
                                    || RPAD(v_GRUPO.SUFICIENTE, 25));
        FETCH C INTO v_GRUPO;
        END LOOP;
        CLOSE C;
    END Consultar; 
    
PROCEDURE Insertar(nombrePrueba VARCHAR2, v_ID_TOUR IN GRUPO.ID_TOUR%TYPE, v_FECHA IN GRUPO.FECHA%TYPE, v_HORA in GRUPO.HORA%TYPE, v_SUFICIENTE in GRUPO.SUFICIENTE%TYPE, salidaEsperada BOOLEAN)
            IS
            BEGIN
                INSERT INTO GRUPO (ID_TOUR, FECHA,HORA,SUFICIENTE) 
                VALUES (v_ID_TOUR, v_FECHA, v_HORA, v_SUFICIENTE);
                COMMIT;
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
                EXCEPTION
                	WHEN OTHERS THEN
            		DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
            		ROLLBACK;
        END Insertar;
        
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_ID_GRUPO IN GRUPO.ID_GRUPO%TYPE, v_ID_TOUR IN GRUPO.ID_TOUR%TYPE,
v_FECHA IN GRUPO.FECHA%TYPE, v_HORA IN GRUPO.HORA%TYPE,v_SUFICIENTE IN GRUPO.SUFICIENTE%TYPE,salidaEsperada BOOLEAN)        
    IS
    BEGIN
        UPDATE GRUPO SET ID_TOUR = v_ID_TOUR, FECHA = v_FECHA, HORA = v_HORA, SUFICIENTE = v_SUFICIENTE WHERE ID_GRUPO = v_ID_GRUPO;
        SELECT * INTO v_GRUPO FROM GRUPO WHERE  ID_GRUPO = v_ID_GRUPO;
        IF v_ID_TOUR != v_ID_TOUR OR v_GRUPO.FECHA != v_FECHA OR v_GRUPO.HORA!=v_HORA OR v_SUFICIENTE != v_SUFICIENTE THEN
            v_Salida := FALSE;
        END IF;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
                ROLLBACK;   
         
    END Actualizar;
        
PROCEDURE Eliminar(nombrePrueba VARCHAR2, v_ID_GRUPO IN GRUPO.ID_GRUPO%TYPE, salidaEsperada BOOLEAN)
    IS
    v_numGRUPO NUMBER := 0;
    BEGIN
        DELETE FROM GRUPO WHERE (v_ID_GRUPO = ID_GRUPO);
        SELECT COUNT(*) INTO v_numGRUPO FROM GRUPO WHERE  ID_GRUPO = v_ID_GRUPO;
        IF v_numGRUPO != 0 THEN
			v_Salida := FALSE;
		END IF;
		COMMIT;
		DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
		EXCEPTION
			WHEN OTHERS THEN
				DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
				ROLLBACK;
        END Eliminar;
END;

/
--INCIDENCIA
CREATE OR REPLACE PACKAGE BODY PK_INCIDENCIA
IS
CURSOR C IS 
        SELECT * FROM INCIDENCIA;
    v_Salida BOOLEAN := TRUE;
    v_INCIDENCIA INCIDENCIA%ROWTYPE;

PROCEDURE Inicializar
    IS
    BEGIN
        DELETE FROM INCIDENCIA;
    END Inicializar;
    
PROCEDURE Consultar
    IS
    BEGIN
        OPEN C;
        FETCH C INTO v_INCIDENCIA;
        DBMS_OUTPUT.PUT_LINE(RPAD('ID:', 25) || RPAD('ID_GRUPO:', 25)|| RPAD('TEXTO:', 100) || RPAD('FECHA:', 25)
                                    || RPAD('HORA:', 25));
        DBMS_OUTPUT.PUT_LINE(LPAD('-',120,'-'));
        WHILE C%FOUND LOOP
            DBMS_OUTPUT.PUT_LINE(RPAD(v_INCIDENCIA.ID_INCIDENCIA, 25) || RPAD(v_INCIDENCIA.ID_GRUPO, 25) || RPAD(v_INCIDENCIA.TEXTO, 100)
                                    || RPAD(v_INCIDENCIA.FECHA, 25) || RPAD(v_INCIDENCIA.HORA, 25));
        FETCH C INTO v_INCIDENCIA;
        END LOOP;
        CLOSE C;
    END Consultar;
    
PROCEDURE Insertar(nombrePrueba VARCHAR2, v_ID_GRUPO IN INCIDENCIA.ID_GRUPO%TYPE, v_TEXTO IN INCIDENCIA.TEXTO%TYPE, v_FECHA IN INCIDENCIA.FECHA%TYPE,v_HORA IN INCIDENCIA.HORA%TYPE, salidaEsperada BOOLEAN)
            IS
            BEGIN
                INSERT INTO INCIDENCIA (ID_GRUPO, TEXTO,FECHA, HORA) 
                VALUES (v_ID_GRUPO,v_TEXTO,v_FECHA,v_HORA);
                COMMIT;
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
                EXCEPTION
                	WHEN OTHERS THEN
            		DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
            		ROLLBACK;
        END Insertar;
        
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_ID_INCIDENCIA IN INCIDENCIA.ID_INCIDENCIA%TYPE, v_ID_GRUPO IN INCIDENCIA.ID_GRUPO%TYPE, v_TEXTO IN INCIDENCIA.TEXTO%TYPE, 
v_FECHA IN INCIDENCIA.FECHA%TYPE, v_HORA IN INCIDENCIA.HORA%TYPE, salidaEsperada BOOLEAN)        
    IS
    BEGIN
        UPDATE INCIDENCIA SET ID_GRUPO = v_ID_GRUPO, TEXTO = v_TEXTO, FECHA = v_FECHA, HORA = v_HORA  WHERE ID_INCIDENCIA = v_ID_INCIDENCIA;
        SELECT * INTO v_INCIDENCIA FROM INCIDENCIA WHERE  ID_INCIDENCIA = v_ID_INCIDENCIA;
        IF v_INCIDENCIA.ID_GRUPO != v_ID_GRUPO OR v_INCIDENCIA.TEXTO != v_TEXTO OR v_INCIDENCIA.FECHA != v_FECHA OR v_INCIDENCIA.HORA != v_HORA THEN
            v_Salida := FALSE;
        END IF;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
                ROLLBACK;          
    END Actualizar;
        
PROCEDURE Eliminar(nombrePrueba VARCHAR2, v_ID_INCIDENCIA IN INCIDENCIA.ID_INCIDENCIA%TYPE, salidaEsperada BOOLEAN)
    IS
    v_numINCIDENCIA NUMBER := 0;
    BEGIN
        DELETE FROM INCIDENCIA WHERE (v_ID_INCIDENCIA = INCIDENCIA.ID_INCIDENCIA);
        SELECT COUNT(*) INTO v_numINCIDENCIA FROM INCIDENCIA WHERE  ID_INCIDENCIA= v_ID_INCIDENCIA;
        IF v_numINCIDENCIA != 0 THEN
			v_Salida := FALSE;
		END IF;
		COMMIT;
		DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
		EXCEPTION
			WHEN OTHERS THEN
				DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
				ROLLBACK;
        END Eliminar;
END;
/
--USUARIO
CREATE OR REPLACE PACKAGE BODY PK_USUARIO
IS
CURSOR C IS 
        SELECT * FROM USUARIO;
    v_Salida BOOLEAN := TRUE;
    v_USUARIO USUARIO%ROWTYPE;

PROCEDURE Inicializar
    IS
    BEGIN
        DELETE FROM USUARIO;
    END Inicializar;
    
PROCEDURE Consultar
    IS
    BEGIN
        OPEN C;
        FETCH C INTO v_USUARIO;
        DBMS_OUTPUT.PUT_LINE(RPAD('ID:', 25) || RPAD('ID:', 25)|| RPAD('NOMBRE:', 25) || RPAD('APELLIDOS:', 25)
                                    || RPAD('DNI:', 25)  || RPAD('TELEFONO:',25) || RPAD('EMAIL:',25) || RPAD('FECHA_NAC:',25));
        DBMS_OUTPUT.PUT_LINE(LPAD('-',120,'-'));
        WHILE C%FOUND LOOP
            DBMS_OUTPUT.PUT_LINE(RPAD(v_USUARIO.ID_USUARIO, 25) || RPAD(v_USUARIO.NOMBRE, 25) || RPAD(v_USUARIO.APELLIDOS, 25)
                                    || RPAD(v_USUARIO.DNI, 25) || RPAD(v_USUARIO.TELEFONO, 25) || RPAD(v_USUARIO.EMAIL, 25) || RPAD(v_USUARIO.FECHA_NAC, 25));
        FETCH C INTO v_USUARIO;
        END LOOP;
        CLOSE C;
    END Consultar;
    
PROCEDURE Insertar(nombrePrueba VARCHAR2,
    v_NOMBRE IN USUARIO.NOMBRE%TYPE, 
    v_APELLIDOS IN USUARIO.APELLIDOS%TYPE,
    v_DNI IN USUARIO.DNI%TYPE, 
    v_TELEFONO IN USUARIO.TELEFONO%TYPE, 
    v_EMAIL IN USUARIO.EMAIL%TYPE,
    v_FNAC IN USUARIO.FECHA_NAC%TYPE,
    salidaEsperada BOOLEAN)
            IS
            BEGIN
                INSERT INTO USUARIO (NOMBRE, APELLIDOS, DNI, TELEFONO, EMAIL, FECHA_NAC) VALUES (v_NOMBRE, v_APELLIDOS, v_DNI, v_TELEFONO, v_EMAIL, v_FNAC);
                COMMIT;
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
                EXCEPTION
                	WHEN OTHERS THEN
            		DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
            		ROLLBACK;
        END Insertar;
        
PROCEDURE Actualizar (nombrePrueba VARCHAR2,
    v_ID_USUARIO IN USUARIO.ID_USUARIO%TYPE,
    v_NOMBRE IN USUARIO.NOMBRE%TYPE, 
    v_APELLIDOS IN USUARIO.APELLIDOS%TYPE,
    v_DNI IN USUARIO.DNI%TYPE, 
    v_TELEFONO IN USUARIO.TELEFONO%TYPE, 
    v_EMAIL IN USUARIO.EMAIL%TYPE,
    v_FNAC IN USUARIO.FECHA_NAC%TYPE,
    salidaEsperada BOOLEAN)
    IS
    BEGIN
        UPDATE USUARIO SET NOMBRE = v_NOMBRE, APELLIDOS = v_APELLIDOS, DNI = v_DNI, TELEFONO = v_TELEFONO, EMAIL = v_EMAIL, FECHA_NAC = v_FNAC  WHERE ID_USUARIO = v_ID_USUARIO;
        SELECT * INTO v_USUARIO FROM USUARIO WHERE ID_USUARIO = v_ID_USUARIO;
        IF v_USUARIO.ID_USUARIO != v_ID_USUARIO OR v_USUARIO.NOMBRE != v_NOMBRE OR v_USUARIO.APELLIDOS != v_APELLIDOS OR
        v_USUARIO.DNI != v_DNI OR v_USUARIO.TELEFONO != v_TELEFONO OR v_USUARIO.EMAIL != v_EMAIL OR v_USUARIO.FECHA_NAC != v_FNAC THEN
            v_Salida := FALSE;
        END IF;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
                ROLLBACK;          
    END Actualizar;
        
PROCEDURE Eliminar(nombrePrueba VARCHAR2, v_ID_USUARIO IN USUARIO.ID_USUARIO%TYPE, salidaEsperada BOOLEAN)
    IS
    v_numUSUARIO NUMBER := 0;
    BEGIN
        DELETE FROM USUARIO WHERE (v_ID_USUARIO = USUARIO.ID_USUARIO);
        SELECT COUNT(*) INTO v_numUSUARIO FROM USUARIO WHERE  ID_USUARIO= v_ID_USUARIO;
        IF v_numUSUARIO != 0 THEN
			v_Salida := FALSE;
		END IF;
		COMMIT;
		DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
		EXCEPTION
			WHEN OTHERS THEN
				DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
				ROLLBACK;
        END Eliminar;
END;
/
--PARTICIPAEN
CREATE OR REPLACE PACKAGE BODY PK_PARTICIPAEN
IS
CURSOR C IS 
        SELECT * FROM PARTICIPAEN;
    v_Salida BOOLEAN := TRUE;
    v_PARTICIPAEN PARTICIPAEN%ROWTYPE;

PROCEDURE Inicializar
    IS
    BEGIN
        DELETE FROM PARTICIPAEN;
    END Inicializar;
    
PROCEDURE Consultar
    IS
    BEGIN
        OPEN C;
        FETCH C INTO v_PARTICIPAEN;
        DBMS_OUTPUT.PUT_LINE(RPAD('ID:', 25) || RPAD('ID_GRUPO:', 25)|| RPAD('ID_USUARIO:', 25) || RPAD('ID_GRUPO:', 25));
        DBMS_OUTPUT.PUT_LINE(LPAD('-',120,'-'));
        WHILE C%FOUND LOOP
            DBMS_OUTPUT.PUT_LINE(RPAD(v_PARTICIPAEN.ID_PARTICIPAEN, 25) || RPAD(v_PARTICIPAEN.ID_USUARIO, 25) || RPAD(v_PARTICIPAEN.ID_GRUPO, 25));
        FETCH C INTO v_PARTICIPAEN;
        END LOOP;
        CLOSE C;
    END Consultar;
    
PROCEDURE Insertar(nombrePrueba VARCHAR2, v_ID_USUARIO IN PARTICIPAEN.ID_USUARIO%TYPE, v_ID_GRUPO IN PARTICIPAEN.ID_GRUPO%TYPE, salidaEsperada BOOLEAN)
            IS
            BEGIN
                INSERT INTO PARTICIPAEN (ID_USUARIO, ID_GRUPO) VALUES (v_ID_USUARIO, v_ID_GRUPO);
                COMMIT;
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
                EXCEPTION
                	WHEN OTHERS THEN
            		DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
            		ROLLBACK;
        END Insertar;
        
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_ID_PARTICIPAEN IN PARTICIPAEN.ID_PARTICIPAEN%TYPE, v_ID_USUARIO IN PARTICIPAEN.ID_USUARIO%TYPE, 
v_ID_GRUPO IN PARTICIPAEN.ID_GRUPO%TYPE, salidaEsperada BOOLEAN)        
    IS
    BEGIN
        UPDATE PARTICIPAEN SET ID_USUARIO = v_ID_USUARIO, ID_GRUPO = v_ID_GRUPO  WHERE ID_PARTICIPAEN = v_ID_PARTICIPAEN;
        SELECT * INTO v_PARTICIPAEN FROM PARTICIPAEN WHERE  ID_PARTICIPAEN = v_ID_PARTICIPAEN;
        IF v_PARTICIPAEN.ID_USUARIO != v_ID_USUARIO OR v_PARTICIPAEN.ID_GRUPO != v_ID_GRUPO THEN
            v_Salida := FALSE;
        END IF;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
                ROLLBACK;          
    END Actualizar;
        
PROCEDURE Eliminar(nombrePrueba VARCHAR2, v_ID_PARTICIPAEN IN PARTICIPAEN.ID_PARTICIPAEN%TYPE, salidaEsperada BOOLEAN)
    IS
    v_numPARTICIPAEN NUMBER := 0;
    BEGIN
        DELETE FROM PARTICIPAEN WHERE (v_ID_PARTICIPAEN = PARTICIPAEN.ID_PARTICIPAEN);
        SELECT COUNT(*) INTO v_numPARTICIPAEN FROM PARTICIPAEN WHERE  ID_PARTICIPAEN = v_ID_PARTICIPAEN;
        IF v_numPARTICIPAEN != 0 THEN
			v_Salida := FALSE;
		END IF;
		COMMIT;
		DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
		EXCEPTION
			WHEN OTHERS THEN
				DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
				ROLLBACK;
        END Eliminar;
END;
/
--COMENTARIO
CREATE OR REPLACE PACKAGE BODY PK_COMENTARIO
IS
CURSOR C IS 
        SELECT * FROM COMENTARIO;
    v_Salida BOOLEAN := TRUE;
    v_COMENTARIO COMENTARIO%ROWTYPE;

PROCEDURE Inicializar
    IS
    BEGIN
        DELETE FROM COMENTARIO;
    END Inicializar;
    
PROCEDURE Consultar
    IS
    BEGIN
        OPEN C;
        FETCH C INTO v_COMENTARIO;
        DBMS_OUTPUT.PUT_LINE(RPAD('ID:', 25) || RPAD('USUARIO', 25) || RPAD('TOUR:', 25)|| RPAD('TEXTO:', 25));
        DBMS_OUTPUT.PUT_LINE(LPAD('-',120,'-'));
        WHILE C%FOUND LOOP
            DBMS_OUTPUT.PUT_LINE(RPAD(v_COMENTARIO.ID_COMENTARIO, 25) || RPAD(v_COMENTARIO.ID_USUARIO, 25) || RPAD(v_COMENTARIO.ID_TOUR, 25)|| RPAD(v_COMENTARIO.TEXTO, 300));
        FETCH C INTO v_COMENTARIO;
        END LOOP;
        CLOSE C;
    END Consultar;
    
PROCEDURE Insertar(nombrePrueba VARCHAR2, v_ID_USUARIO IN COMENTARIO.ID_USUARIO%TYPE, v_ID_TOUR IN COMENTARIO.ID_TOUR%TYPE, v_TEXTO IN COMENTARIO.TEXTO%TYPE, salidaEsperada BOOLEAN)
            IS
            BEGIN
                INSERT INTO COMENTARIO (ID_USUARIO, ID_TOUR, TEXTO) 
                VALUES (v_ID_USUARIO, v_ID_TOUR, v_TEXTO);
                COMMIT;
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
                EXCEPTION
                	WHEN OTHERS THEN
            		DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
            		ROLLBACK;
        END Insertar;
        
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_ID_COMENTARIO IN COMENTARIO.ID_COMENTARIO%TYPE, v_ID_USUARIO IN COMENTARIO.ID_USUARIO%TYPE,
                        v_ID_TOUR IN COMENTARIO.ID_TOUR%TYPE,v_TEXTO IN COMENTARIO.TEXTO%TYPE, salidaEsperada BOOLEAN)        
    IS
    BEGIN
        UPDATE COMENTARIO SET ID_USUARIO = v_ID_USUARIO, ID_TOUR = v_ID_TOUR WHERE ID_COMENTARIO = v_ID_COMENTARIO;
        SELECT * INTO v_COMENTARIO FROM COMENTARIO WHERE  ID_COMENTARIO = v_ID_COMENTARIO;
        IF v_COMENTARIO.ID_USUARIO != v_ID_USUARIO OR v_COMENTARIO.ID_TOUR != v_ID_TOUR OR v_COMENTARIO.TEXTO != v_TEXTO THEN
            v_Salida := FALSE;
        END IF;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
                ROLLBACK;          
    END Actualizar;
        
PROCEDURE Eliminar(nombrePrueba VARCHAR2, v_ID_COMENTARIO IN COMENTARIO.ID_COMENTARIO%TYPE, salidaEsperada BOOLEAN)
    IS
    v_numCOMENTARIO NUMBER := 0;
    BEGIN
        DELETE FROM COMENTARIO WHERE (v_ID_COMENTARIO = COMENTARIO.ID_COMENTARIO);
        SELECT COUNT(*) INTO v_numCOMENTARIO FROM COMENTARIO WHERE  ID_COMENTARIO = v_ID_COMENTARIO;
        IF v_numCOMENTARIO != 0 THEN
			v_Salida := FALSE;
		END IF;
		COMMIT;
		DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
		EXCEPTION
			WHEN OTHERS THEN
				DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
				ROLLBACK;
        END Eliminar;
END;
/
--PAGO
CREATE OR REPLACE PACKAGE BODY PK_PAGO
IS
CURSOR C IS 
        SELECT * FROM PAGO;
    v_Salida BOOLEAN := TRUE;
    v_PAGO PAGO%ROWTYPE;

PROCEDURE Inicializar
    IS
    BEGIN
        DELETE FROM PAGO;
    END Inicializar;
    
PROCEDURE Consultar
    IS
    BEGIN
        OPEN C;
        FETCH C INTO v_PAGO;
        DBMS_OUTPUT.PUT_LINE(RPAD('ID:', 25) || RPAD('USUARIO:', 25) || RPAD('FECHA:', 25)
                                    || RPAD('IMPORTE:',25));
        DBMS_OUTPUT.PUT_LINE(LPAD('-',120,'-'));
        WHILE C%FOUND LOOP
            DBMS_OUTPUT.PUT_LINE(RPAD(v_PAGO.ID_PAGO, 25) || RPAD(v_PAGO.ID_USUARIO, 25) || RPAD(v_PAGO.FECHA_PAGO, 25)
                                    || RPAD(v_PAGO.IMPORTE, 25));
        FETCH C INTO v_PAGO;
        END LOOP;
        CLOSE C;
    END Consultar;
    
PROCEDURE Insertar(nombrePrueba VARCHAR2, v_ID_USUARIO IN PAGO.ID_USUARIO%TYPE, v_FECHA_PAGO IN PAGO.FECHA_PAGO%TYPE, v_IMPORTE IN PAGO.IMPORTE%TYPE, salidaEsperada BOOLEAN)
            IS
            BEGIN
                INSERT INTO PAGO (ID_USUARIO, FECHA_PAGO, IMPORTE) 
                VALUES (v_ID_USUARIO, v_FECHA_PAGO, v_IMPORTE);
                COMMIT;
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
                EXCEPTION
                	WHEN OTHERS THEN
            		DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
            		ROLLBACK;
        END Insertar;
        
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_ID_PAGO IN PAGO.ID_PAGO%TYPE, v_ID_USUARIO IN PAGO.ID_USUARIO%TYPE, v_FECHA_PAGO IN PAGO.FECHA_PAGO%TYPE, v_IMPORTE IN PAGO.IMPORTE%TYPE, salidaEsperada BOOLEAN)        
    IS
    BEGIN
        UPDATE PAGO SET ID_USUARIO = v_ID_USUARIO, FECHA_PAGO = v_FECHA_PAGO, IMPORTE = v_IMPORTE  WHERE ID_PAGO = v_ID_PAGO;
        SELECT * INTO v_PAGO FROM PAGO WHERE ID_PAGO = v_ID_PAGO;
        IF v_PAGO.ID_USUARIO != v_ID_USUARIO OR v_PAGO.FECHA_PAGO != v_FECHA_PAGO OR v_PAGO.IMPORTE != v_IMPORTE THEN
            v_Salida := FALSE;
        END IF;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
                ROLLBACK;          
    END Actualizar;
        
PROCEDURE Eliminar(nombrePrueba VARCHAR2, v_ID_PAGO IN PAGO.ID_PAGO%TYPE, salidaEsperada BOOLEAN)
    IS
    v_numPAGO NUMBER := 0;
    BEGIN
        DELETE FROM PAGO WHERE (v_ID_PAGO = PAGO.ID_PAGO);
        SELECT COUNT(*) INTO v_numPAGO FROM PAGO WHERE  ID_PAGO = v_ID_PAGO;
        IF v_numPAGO != 0 THEN
			v_Salida := FALSE;
		END IF;
		COMMIT;
		DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
		EXCEPTION
			WHEN OTHERS THEN
				DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
				ROLLBACK;
        END Eliminar;
END;
/


--ENTRADA
CREATE OR REPLACE PACKAGE BODY PK_ENTRADA
IS
CURSOR C IS 
        SELECT * FROM ENTRADA;
    v_Salida BOOLEAN := TRUE;
    v_ENTRADA ENTRADA%ROWTYPE;

PROCEDURE Inicializar
    IS
    BEGIN
        DELETE FROM ENTRADA;
    END Inicializar;
    
PROCEDURE Consultar
    IS
    BEGIN
        OPEN C;
        FETCH C INTO v_ENTRADA;
        DBMS_OUTPUT.PUT_LINE(RPAD('ID:', 25) || RPAD('PAGO', 25) || RPAD('IMPORTE:', 25)|| RPAD('TIPO:', 25));
        DBMS_OUTPUT.PUT_LINE(LPAD('-',120,'-'));
        WHILE C%FOUND LOOP
            DBMS_OUTPUT.PUT_LINE(RPAD(v_ENTRADA.ID_ENTRADA, 25) || RPAD(v_ENTRADA.ID_PAGO, 25) || RPAD(v_ENTRADA.IMPORTE, 25)|| RPAD(v_ENTRADA.TIPO_ENTRADA, 300));
        FETCH C INTO v_ENTRADA;
        END LOOP;
        CLOSE C;
    END Consultar;
    
PROCEDURE Insertar(nombrePrueba VARCHAR2, v_ID_PAGO IN ENTRADA.ID_PAGO%TYPE, v_IMPORTE IN ENTRADA.IMPORTE%TYPE, v_TIPO_ENTRADA IN ENTRADA.TIPO_ENTRADA%TYPE, salidaEsperada BOOLEAN)
            IS
            BEGIN
                INSERT INTO ENTRADA (ID_PAGO, IMPORTE, TIPO_ENTRADA) 
                VALUES (v_ID_PAGO, v_IMPORTE, v_TIPO_ENTRADA);
                COMMIT;
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
                EXCEPTION
                	WHEN OTHERS THEN
            		DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
            		ROLLBACK;
        END Insertar;
        
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_ID_ENTRADA IN ENTRADA.ID_ENTRADA%TYPE, v_ID_PAGO IN ENTRADA.ID_PAGO%TYPE,
                        v_IMPORTE IN ENTRADA.IMPORTE%TYPE,v_TIPO_ENTRADA IN ENTRADA.TIPO_ENTRADA%TYPE, salidaEsperada BOOLEAN)        
    IS
    BEGIN
        UPDATE ENTRADA SET ID_PAGO = v_ID_PAGO, IMPORTE = v_IMPORTE WHERE ID_ENTRADA = v_ID_ENTRADA;
        SELECT * INTO v_ENTRADA FROM ENTRADA WHERE  ID_ENTRADA = v_ID_ENTRADA;
        IF v_ENTRADA.ID_PAGO != v_ID_PAGO OR v_ENTRADA.IMPORTE != v_IMPORTE OR v_ENTRADA.TIPO_ENTRADA != v_TIPO_ENTRADA THEN
            v_Salida := FALSE;
        END IF;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
                ROLLBACK;          
    END Actualizar;
        
PROCEDURE Eliminar(nombrePrueba VARCHAR2, v_ID_ENTRADA IN ENTRADA.ID_ENTRADA%TYPE, salidaEsperada BOOLEAN)
    IS
    v_numENTRADA NUMBER := 0;
    BEGIN
        DELETE FROM ENTRADA WHERE (v_ID_ENTRADA = ENTRADA.ID_ENTRADA);
        SELECT COUNT(*) INTO v_numENTRADA FROM ENTRADA WHERE  ID_ENTRADA = v_ID_ENTRADA;
        IF v_numENTRADA != 0 THEN
			v_Salida := FALSE;
		END IF;
		COMMIT;
		DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
		EXCEPTION
			WHEN OTHERS THEN
				DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
				ROLLBACK;
        END Eliminar;
END;
/
--ADQUIERE

CREATE OR REPLACE PACKAGE BODY PK_ADQUIERE
IS
CURSOR C IS 
        SELECT * FROM ADQUIERE;
    v_Salida BOOLEAN := TRUE;
    v_ADQUIERE ADQUIERE%ROWTYPE;

PROCEDURE Inicializar
    IS
    BEGIN
        DELETE FROM ADQUIERE;
    END Inicializar;
    
PROCEDURE Consultar
    IS
    BEGIN
        OPEN C;
        FETCH C INTO v_ADQUIERE;
        DBMS_OUTPUT.PUT_LINE(RPAD('ID:', 25) || RPAD('TOUR:', 25) || RPAD('ENTRADA:', 25));
        DBMS_OUTPUT.PUT_LINE(LPAD('-',120,'-'));
        WHILE C%FOUND LOOP
            DBMS_OUTPUT.PUT_LINE(RPAD(v_ADQUIERE.ID_ADQUIERE, 25) || RPAD(v_ADQUIERE.ID_TOUR, 25) || RPAD(v_ADQUIERE.ID_ENTRADA, 25));
        FETCH C INTO v_ADQUIERE;
        END LOOP;
        CLOSE C;
    END Consultar;
    
PROCEDURE Insertar(nombrePrueba VARCHAR2, v_ID_TOUR IN ADQUIERE.ID_TOUR%TYPE, v_ID_ENTRADA IN ADQUIERE.ID_ENTRADA%TYPE, salidaEsperada BOOLEAN)
            IS
            BEGIN
                INSERT INTO ADQUIERE (ID_TOUR, ID_ENTRADA) 
                VALUES (v_ID_TOUR, v_ID_ENTRADA);
                COMMIT;
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
                EXCEPTION
                	WHEN OTHERS THEN
            		DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
            		ROLLBACK;
        END Insertar;
        
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_ID_ADQUIERE IN ADQUIERE.ID_ADQUIERE%TYPE, v_ID_TOUR IN ADQUIERE.ID_TOUR%TYPE, v_ID_ENTRADA IN ADQUIERE.ID_ENTRADA%TYPE, salidaEsperada BOOLEAN)        
    IS
    BEGIN
        UPDATE ADQUIERE SET ID_TOUR = v_ID_TOUR, ID_ENTRADA = v_ID_ENTRADA WHERE ID_ADQUIERE = v_ID_ADQUIERE;
        SELECT * INTO v_ADQUIERE FROM ADQUIERE WHERE ID_ADQUIERE = v_ID_ADQUIERE;
        IF v_ADQUIERE.ID_TOUR != v_ID_TOUR OR v_ADQUIERE.ID_ENTRADA != v_ID_ENTRADA THEN
            v_Salida := FALSE;
        END IF;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
                ROLLBACK;          
    END Actualizar;
        
PROCEDURE Eliminar(nombrePrueba VARCHAR2, v_ID_ADQUIERE IN ADQUIERE.ID_ADQUIERE%TYPE, salidaEsperada BOOLEAN)
    IS
    v_numADQUIERE NUMBER := 0;
    BEGIN
        DELETE FROM ADQUIERE WHERE (v_ID_ADQUIERE = ADQUIERE.ID_ADQUIERE);
        SELECT COUNT(*) INTO v_numADQUIERE FROM ADQUIERE WHERE  ID_ADQUIERE = v_ID_ADQUIERE;
        IF v_numADQUIERE != 0 THEN
			v_Salida := FALSE;
		END IF;
		COMMIT;
		DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
		EXCEPTION
			WHEN OTHERS THEN
				DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
				ROLLBACK;
        END Eliminar;
END;
/
--BONUS
CREATE OR REPLACE PACKAGE BODY PK_BONUS
IS
CURSOR C IS 
        SELECT * FROM BONUS;
    v_Salida BOOLEAN := TRUE;
    v_BONUS BONUS%ROWTYPE;

PROCEDURE Inicializar
    IS
    BEGIN
        DELETE FROM BONUS;
    END Inicializar;
    
PROCEDURE Consultar
    IS
    BEGIN
        OPEN C;
        FETCH C INTO v_BONUS;
        DBMS_OUTPUT.PUT_LINE(RPAD('ID:', 25) || RPAD('PAGO:', 25) || RPAD('TEMPORADA:', 25)
                                    || RPAD('IMPORTE:',25));
        DBMS_OUTPUT.PUT_LINE(LPAD('-',120,'-'));
        WHILE C%FOUND LOOP
            DBMS_OUTPUT.PUT_LINE(RPAD(v_BONUS.ID_BONUS, 25) || RPAD(v_BONUS.ID_PAGO, 25) || RPAD(v_BONUS.TIPO_TEMPORADA, 25)
                                    || RPAD(v_BONUS.IMPORTE, 25));
        FETCH C INTO v_BONUS;
        END LOOP;
        CLOSE C;
    END Consultar;
    
PROCEDURE Insertar(nombrePrueba VARCHAR2, v_ID_PAGO IN BONUS.ID_PAGO%TYPE, v_TIPO_TEMPORADA IN BONUS.TIPO_TEMPORADA%TYPE, v_IMPORTE IN BONUS.IMPORTE%TYPE, salidaEsperada BOOLEAN)
            IS
            BEGIN
                INSERT INTO BONUS (ID_PAGO, TIPO_TEMPORADA, IMPORTE) 
                VALUES (v_ID_PAGO, v_TIPO_TEMPORADA, v_IMPORTE);
                COMMIT;
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
                EXCEPTION
                	WHEN OTHERS THEN
            		DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
            		ROLLBACK;
        END Insertar;
        
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_ID_BONUS IN BONUS.ID_BONUS%TYPE, v_ID_PAGO IN BONUS.ID_PAGO%TYPE, v_TIPO_TEMPORADA IN BONUS.TIPO_TEMPORADA%TYPE, v_IMPORTE IN BONUS.IMPORTE%TYPE, salidaEsperada BOOLEAN)        
    IS
    BEGIN
        UPDATE BONUS SET ID_PAGO = v_ID_PAGO, TIPO_TEMPORADA = v_TIPO_TEMPORADA, IMPORTE = v_IMPORTE  WHERE ID_BONUS = v_ID_BONUS;
        SELECT * INTO v_BONUS FROM BONUS WHERE ID_BONUS = v_ID_BONUS;
        IF v_BONUS.ID_PAGO != v_ID_PAGO OR v_BONUS.TIPO_TEMPORADA != v_TIPO_TEMPORADA OR v_BONUS.IMPORTE != v_IMPORTE THEN
            v_Salida := FALSE;
        END IF;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
                ROLLBACK;          
    END Actualizar;
        
PROCEDURE Eliminar(nombrePrueba VARCHAR2, v_ID_BONUS IN BONUS.ID_BONUS%TYPE, salidaEsperada BOOLEAN)
    IS
    v_numBONUS NUMBER := 0;
    BEGIN
        DELETE FROM BONUS WHERE (v_ID_BONUS = BONUS.ID_BONUS);
        SELECT COUNT(*) INTO v_numBONUS FROM BONUS WHERE  ID_BONUS = v_ID_BONUS;
        IF v_numBONUS != 0 THEN
			v_Salida := FALSE;
		END IF;
		COMMIT;
		DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
		EXCEPTION
			WHEN OTHERS THEN
				DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
				ROLLBACK;
        END Eliminar;
END;
/



--SEGURO
CREATE OR REPLACE PACKAGE BODY PK_SEGURO
IS
CURSOR C IS 
        SELECT * FROM SEGURO;
    v_Salida BOOLEAN := TRUE;
    v_SEGURO SEGURO%ROWTYPE;

PROCEDURE Inicializar
    IS
    BEGIN
        DELETE FROM SEGURO;
    END Inicializar;
    
PROCEDURE Consultar
    IS
    BEGIN
        OPEN C;
        FETCH C INTO v_SEGURO;
        DBMS_OUTPUT.PUT_LINE(RPAD('ID:', 25) || RPAD('IMPORTE:', 25) || RPAD('PAGO:', 25)
                                    || RPAD('TIPO:',25));
        DBMS_OUTPUT.PUT_LINE(LPAD('-',120,'-'));
        WHILE C%FOUND LOOP
            DBMS_OUTPUT.PUT_LINE(RPAD(v_SEGURO.ID_SEGURO, 25) || RPAD(v_SEGURO.IMPORTE, 25) || RPAD(v_SEGURO.ID_PAGO, 25)
                                    || RPAD(v_SEGURO.TIPO_SEGURO, 25));
        FETCH C INTO v_SEGURO;
        END LOOP;
        CLOSE C;
    END Consultar;
    
PROCEDURE Insertar(nombrePrueba VARCHAR2, v_IMPORTE IN SEGURO.IMPORTE%TYPE, v_ID_PAGO IN SEGURO.ID_PAGO%TYPE, v_TIPO_SEGURO IN SEGURO.TIPO_SEGURO%TYPE, salidaEsperada BOOLEAN)
            IS
            BEGIN
                INSERT INTO SEGURO (IMPORTE, ID_PAGO, TIPO_SEGURO) 
                VALUES (v_IMPORTE, v_ID_PAGO, v_TIPO_SEGURO);
                COMMIT;
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
                EXCEPTION
                	WHEN OTHERS THEN
            		DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
            		ROLLBACK;
        END Insertar;
        
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_ID_SEGURO IN SEGURO.ID_SEGURO%TYPE, v_IMPORTE IN SEGURO.IMPORTE%TYPE, 
v_ID_PAGO IN SEGURO.ID_PAGO%TYPE, v_TIPO_SEGURO IN SEGURO.TIPO_SEGURO%TYPE, salidaEsperada BOOLEAN)        
    IS
    BEGIN
        UPDATE SEGURO SET IMPORTE = v_IMPORTE, ID_PAGO = v_ID_PAGO, TIPO_SEGURO = v_TIPO_SEGURO  WHERE ID_SEGURO = v_ID_SEGURO;
        SELECT * INTO v_SEGURO FROM SEGURO WHERE  ID_SEGURO = v_ID_SEGURO;
        IF v_SEGURO.IMPORTE != v_IMPORTE OR v_SEGURO.ID_PAGO != v_ID_PAGO OR v_SEGURO.TIPO_SEGURO != v_TIPO_SEGURO THEN
            v_Salida := FALSE;
        END IF;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
                ROLLBACK;          
    END Actualizar;
        
PROCEDURE Eliminar(nombrePrueba VARCHAR2, v_ID_SEGURO IN SEGURO.ID_SEGURO%TYPE, salidaEsperada BOOLEAN)
    IS
    v_numSEGURO NUMBER := 0;
    BEGIN
        DELETE FROM SEGURO WHERE (v_ID_SEGURO = SEGURO.ID_SEGURO);
        SELECT COUNT(*) INTO v_numSEGURO FROM SEGURO WHERE  ID_SEGURO = v_ID_SEGURO;
        IF v_numSEGURO != 0 THEN
			v_Salida := FALSE;
		END IF;
		COMMIT;
		DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
		EXCEPTION
			WHEN OTHERS THEN
				DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
				ROLLBACK;
        END Eliminar;
END;
/




--FOTO
CREATE OR REPLACE PACKAGE BODY PK_FOTO
IS
CURSOR C IS 
        SELECT * FROM FOTO;
    v_Salida BOOLEAN := TRUE;
    v_FOTO FOTO%ROWTYPE;

PROCEDURE Inicializar
    IS
    BEGIN
        DELETE FROM FOTO;
    END Inicializar;
    
PROCEDURE Consultar
    IS
    BEGIN
        OPEN C;
        FETCH C INTO v_FOTO;
        DBMS_OUTPUT.PUT_LINE(RPAD('ID:', 25) || RPAD('URL:', 25) || RPAD('TOUR:', 25));
        DBMS_OUTPUT.PUT_LINE(LPAD('-',120,'-'));
        WHILE C%FOUND LOOP
            DBMS_OUTPUT.PUT_LINE(RPAD(v_FOTO.ID_FOTO, 25) || RPAD(v_FOTO.URL_FOTO, 25) || RPAD(v_FOTO.ID_TOUR, 25));
        FETCH C INTO v_FOTO;
        END LOOP;
        CLOSE C;
    END Consultar;
    
PROCEDURE Insertar(nombrePrueba VARCHAR2, v_URL_FOTO IN FOTO.URL_FOTO%TYPE, v_ID_TOUR IN FOTO.ID_TOUR%TYPE, salidaEsperada BOOLEAN)
            IS
            BEGIN
                INSERT INTO FOTO (URL_FOTO, ID_TOUR) 
                VALUES (v_URL_FOTO, v_ID_TOUR);
                COMMIT;
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
                EXCEPTION
                	WHEN OTHERS THEN
            		DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
            		ROLLBACK;
        END Insertar;
        
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_ID_FOTO IN FOTO.ID_FOTO%TYPE, v_URL_FOTO IN FOTO.URL_FOTO%TYPE, v_ID_TOUR IN FOTO.ID_TOUR%TYPE, salidaEsperada BOOLEAN)        
    IS
    BEGIN
        UPDATE FOTO SET URL_FOTO = v_URL_FOTO, ID_TOUR = v_ID_TOUR WHERE ID_FOTO = v_ID_FOTO;
        SELECT * INTO v_FOTO FROM FOTO WHERE  ID_FOTO = v_ID_FOTO;
        IF v_FOTO.URL_FOTO != v_URL_FOTO OR v_FOTO.ID_TOUR != v_ID_TOUR THEN
            v_Salida := FALSE;
        END IF;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
                ROLLBACK;          
    END Actualizar;
        
PROCEDURE Eliminar(nombrePrueba VARCHAR2, v_ID_FOTO IN FOTO.ID_FOTO%TYPE, salidaEsperada BOOLEAN)
    IS
    v_numFOTO NUMBER := 0;
    BEGIN
        DELETE FROM FOTO WHERE (v_ID_FOTO = FOTO.ID_FOTO);
        SELECT COUNT(*) INTO v_numFOTO FROM FOTO WHERE  ID_FOTO = v_ID_FOTO;
        IF v_numFOTO != 0 THEN
			v_Salida := FALSE;
		END IF;
		COMMIT;
		DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
		EXCEPTION
			WHEN OTHERS THEN
				DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
				ROLLBACK;
        END Eliminar;
END;
/