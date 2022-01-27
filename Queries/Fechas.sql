SELECT 
  DATE_FORMAT(Inscripciones.Fecha ,"%d/%m/%Y"),
  DATE_FORMAT(Inscripciones.Fecha ,"%d"), -- TEXTO
  DAY(Inscripciones.Fecha), -- CAMPO NUMERICO
  MONTH(Inscripciones.Fecha),
  YEAR(Inscripciones.Fecha),
  HOUR(Inscripciones.Fecha),
  MINUTE(Inscripciones.Fecha),
  SECOND(Inscripciones.Fecha),
  NOW(),
  SYSDATE()
--  TODAY()
FROM 
  Inscripciones
WHERE 
  Inscripciones.Fecha >= STR_TO_DATE("01-01-2022","%d-%m-%Y")
;
-- %d dia del mes en numero
-- %m mes en numero
-- %y año con dos digitos
-- %Y año con 4 digitos
-- %h 0-12
-- %p AM PM
-- %H 0-23
-- %i minutos %M
-- %s segundos


--14   | 4
--12   ----
-- 2     3

-- División vale=3
-- Resto=2 < Operador MODULO de dividir 14 entre 4 => 2


-- Listado de cursos y personas que tiene una inscripcion este mes
-- y saber si son antiguos alumnos
-- OPCION 1 Facil de pensar... mas o menos Facil de hacer... mas o menos
-- VVV  SUBQUERY !
SELECT 
  Cursos.Titulo AS Curso,
  CONCAT(Personas.Nombre , " ", Personas.Apellidos) AS Persona,
  DATE_FORMAT(Inscripciones.Fecha,"%d/%m/%Y") AS Fecha
FROM
  Personas
  INNER JOIN Inscripciones ON Personas.Id = Inscripciones.PersonaId
  INNER JOIN Cursos ON Inscripciones.CursoId = Cursos.Id
WHERE
  MONTH(Inscripciones.Fecha) = MONTH(NOW()) AND
  YEAR(Inscripciones.Fecha)  = YEAR(NOW())
;

-- OPCION 2 Dificil de pensar y de hacer. MAS RAPIDA



-- Listado de cursos y 
-- personas que tiene una inscripcion este trimestre natural
-- T1, T2, T3 o T4
-- Febrero... Enero, Febrero, Marzo -> IVA
SELECT 
  Cursos.Titulo AS Curso,
  CONCAT(Personas.Nombre , " ", Personas.Apellidos) AS Persona,
  DATE_FORMAT(Inscripciones.Fecha,"%d/%m/%Y") AS Fecha
FROM
  Personas
  INNER JOIN Inscripciones ON Personas.Id = Inscripciones.PersonaId
  INNER JOIN Cursos ON Inscripciones.CursoId = Cursos.Id
-- WHERE
  -- Manera más natural mediante CASE
--  CASE 
--    WHEN MONTH(Inscripciones.Fecha) IN (1,2,3) THEN 1
--    WHEN MONTH(Inscripciones.Fecha) IN (4,5,6) THEN 2
--    WHEN MONTH(Inscripciones.Fecha) IN (7,8,9) THEN 3
--    ELSE 4
--  END =
--  CASE 
--    WHEN MONTH(NOW()) IN (1,2,3) THEN 1
--    WHEN MONTH(NOW()) IN (4,5,6) THEN 2
--    WHEN MONTH(NOW()) IN (7,8,9) THEN 3
--    ELSE 4
--  END
  -- Manera más inteligente: 
  -- MODULO: Resto de la division entera
--  CEIL(MONTH(Inscripciones.Fecha)/3) = CEIL(MONTH(NOW())/3) AND
--  YEAR(Inscripciones.Fecha)  = YEAR(NOW())
;
-- ROUND - Redondea al mas cercano
-- CEIL  - Redondea por arriba
-- FLOOR - Redondea por abajo

-- Listado de cursos y personas que tiene una inscripcion este mes
SELECT 
  Cursos.Titulo AS Curso,
  CONCAT(Personas.Nombre , " ", Personas.Apellidos) AS Persona,
  DATE_FORMAT(Inscripciones.Fecha,"%d/%m/%Y") AS Fecha
FROM
  Personas
  INNER JOIN Inscripciones ON Personas.Id = Inscripciones.PersonaId
  INNER JOIN Cursos ON Inscripciones.CursoId = Cursos.Id
WHERE
  MONTH(Inscripciones.Fecha) = MONTH(NOW()) AND
  YEAR(Inscripciones.Fecha)  = YEAR(NOW())
;

SELECT 
  DATE_FORMAT(Inscripciones.Fecha ,"%d/%m/%Y"),
  DATE_FORMAT(Inscripciones.Fecha ,"%m"), -- TEXTO
  DAY(Inscripciones.Fecha), -- CAMPO NUMERICO
  MONTH(Inscripciones.Fecha),
  YEAR(Inscripciones.Fecha),
  HOUR(Inscripciones.Fecha),
  MINUTE(Inscripciones.Fecha),
  SECOND(Inscripciones.Fecha),
  NOW(),
  SYSDATE()
--  TODAY()
FROM 
  Inscripciones
WHERE 
  Inscripciones.Fecha >= STR_TO_DATE("01-01-2022","%d-%m-%Y")
;
-- %d dia del mes en numero
-- %m mes en numero
-- %y año con dos digitos
-- %Y año con 4 digitos
-- %h 0-12
-- %p AM PM
-- %H 0-23
-- %i minutos %M
-- %s segundos