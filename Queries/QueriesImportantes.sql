-- Listado de las personas inscritas en meses pasados,
SELECT 
  Inscripciones.PersonaId
  -- , COUNT(Inscripciones.CursoId)
  -- , Inscripciones.Fecha
FROM Inscripciones 
WHERE
  Inscripciones.Fecha < STR_TO_DATE(
    CONCAT("01-",MONTH(NOW()),"-",YEAR(NOW())),"%d-%m-%Y"
  )
-- GROUP BY
--  Inscripciones.PersonaId
;




-- Listado de cursos y personas que tiene una inscripcion este mes
-- y saber si son antiguos alumnos
-- OPCION 1 Facil de pensar... mas o menos Facil de hacer... mas o menos
-- VVV  SUBQUERY !
SELECT 
  Cursos.Titulo AS Curso,
  CONCAT(Personas.Nombre , " ", Personas.Apellidos) AS Persona,
  DATE_FORMAT(Inscripciones.Fecha,"%d/%m/%Y") AS Fecha,
  CASE 
    WHEN Personas.Id IN (
      SELECT 
        Inscripciones.PersonaId
      FROM Inscripciones 
      WHERE
        Inscripciones.Fecha < STR_TO_DATE(
          CONCAT("01-",MONTH(NOW()),"-",YEAR(NOW())),"%d-%m-%Y"
        )
    ) THEN "SI"
    ELSE "NO"
  END AS ANTIGUO
FROM
  Personas
  INNER JOIN Inscripciones ON Personas.Id = Inscripciones.PersonaId
  INNER JOIN Cursos ON Inscripciones.CursoId = Cursos.Id
WHERE
  MONTH(Inscripciones.Fecha) = MONTH(NOW()) AND
  YEAR(Inscripciones.Fecha)  = YEAR(NOW()) 
;

-- Igual que arri con VIEW

CREATE VIEW ANTIGUOS AS
SELECT 
   Inscripciones.PersonaId
FROM 
   Inscripciones 
WHERE
   Inscripciones.Fecha < STR_TO_DATE(
     CONCAT("01-",MONTH(NOW()),"-",YEAR(NOW())),"%d-%m-%Y"
   );

--

SELECT 
  Cursos.Titulo AS Curso,
  CONCAT(Personas.Nombre , " ", Personas.Apellidos) AS Persona,
  DATE_FORMAT(Inscripciones.Fecha,"%d/%m/%Y") AS Fecha,
  Personas.ID IN (SELECT PersonaId FROM Antiguos)
FROM
  Personas
  INNER JOIN Inscripciones ON Personas.Id = Inscripciones.PersonaId
  INNER JOIN Cursos ON Inscripciones.CursoId = Cursos.Id
WHERE
  MONTH(Inscripciones.Fecha) = MONTH(NOW()) AND
  YEAR(Inscripciones.Fecha)  = YEAR(NOW()) 
;
