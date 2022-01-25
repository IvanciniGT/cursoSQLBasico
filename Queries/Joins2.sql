-- Quiero un listado de los cursos que tengo en venta,
-- junto con el nombre de los alumnos inscritos en ellos
-- Solo para cursos que tengan alumnos incritos

-- Cuantas tablas? 3
-- Tipo de Join?   Inner.
--                 Os pido cursos sin alumnos? NO
--                 Os pido alumnos sin cursos? NO

-- Que sintaxis podemos usar: 
--    - La que usa la palabra INNER JOIN
--    - O la de la palabra    WHERE    <<<<<

SELECT
  Cursos.Titulo,
  Personas.Nombre
FROM
  Cursos, 
  Personas, 
  Inscripciones
WHERE
  Inscripciones.CursoId = Cursos.Id 
  AND Inscripciones.PersonaId = Personas.Id
;

SELECT
  Cursos.Titulo,
  Personas.Nombre
FROM
  Cursos 
  INNER JOIN Inscripciones ON Inscripciones.CursoId = Cursos.Id
  INNER JOIN Personas ON Inscripciones.PersonaId = Personas.Id
;

-- Quiero en el listado también los cursos sin personas incritas
--     OUTER JOIN

SELECT
  Cursos.Titulo,
  Personas.Nombre
FROM
  Cursos LEFT OUTER JOIN Inscripciones 
      ON Inscripciones.CursoId = Cursos.Id
  LEFT JOIN Personas ON Inscripciones.PersonaId = Personas.Id
;

-- Cursos sin personas inscritas
SELECT
  Cursos.Titulo
FROM
  Cursos 
  LEFT OUTER JOIN Inscripciones 
      ON Inscripciones.CursoId = Cursos.Id
WHERE 
  Inscripciones.PersonaId IS NULL
;
-- Cursos sin personas inscritas
-- Inutil añadir también la tabla personas
SELECT
  Cursos.Titulo,
  Personas.Nombre
FROM
  Cursos 
  LEFT OUTER JOIN Inscripciones 
      ON Inscripciones.CursoId = Cursos.Id
  LEFT JOIN Personas 
      ON Inscripciones.PersonaId = Personas.Id
WHERE 
  Personas.Nombre IS NULL
;
