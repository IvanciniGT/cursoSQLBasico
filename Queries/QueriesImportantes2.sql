
-- Listado de cursos y personas que tiene una inscripcion este mes
-- y saber si son antiguos alumnos
-- OPCION 2: Sin subquery con JOIN
-- Compleja de pensar 
SELECT 
  Cursos.Titulo AS Curso,
  CONCAT(Personas.Nombre , " ", Personas.Apellidos) AS Persona,
  DATE_FORMAT(Inscripciones.Fecha,"%d/%m/%Y") AS Fecha,
  CASE
    WHEN Antiguos.PersonaId IS NULL THEN "NUEVO"
    ELSE "ANTIGUO"
  END AS Antiguo
FROM
  Personas
  INNER JOIN Inscripciones ON Personas.Id = Inscripciones.PersonaId
  INNER JOIN Cursos ON Inscripciones.CursoId = Cursos.Id
  LEFT OUTER JOIN ANTIGUOS ON Personas.Id = Antiguos.PersonaId
WHERE
--  Inscripciones.PersonaId IN 
--    (SELECT Antiguos.PersonaId FROM Antiguos) AND 
  MONTH(Inscripciones.Fecha) = MONTH(NOW()) AND
  YEAR(Inscripciones.Fecha)  = YEAR(NOW()) 
;
