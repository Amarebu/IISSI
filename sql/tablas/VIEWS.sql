CREATE OR REPLACE VIEW consulta_grupo AS
  SELECT * FROM GRUPO;

CREATE OR REPLACE VIEW consulta_tour AS
  SELECT * FROM TOUR;

CREATE OR REPLACE VIEW consulta_lista_guia AS
  SELECT NOMBRE,APELLIDO, ID_TOUR, MAX_PLAZAS FROM GUIA NATURAL JOIN GRUPO;

CREATE OR REPLACE VIEW consulta_usuario AS
  SELECT * FROM USUARIO;