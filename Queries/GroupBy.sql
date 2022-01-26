-- Queremos los nombre de las personas, y sus empresas y 
-- los titulos de los cursos que han hecho.
-- NOTA: Si una persona no tiene empresa, 
--      pues que no salga la empresa, pero si la persona
-- pero si la persona y el curso

--  Empresas -O* Personas -I- Inscripciones -I- Cursos

SELECT
  -- CONCAT(Personas.Nombre, " " ,Personas.Apellidos) as Persona,
  Cursos.Titulo as Curso,
  -- Cursos.Importe
  COUNT(*) as Inscripciones,  -- El unico caso legítimo del *
  SUM(Cursos.Importe) AS Facturacion
FROM
  Cursos 
  INNER JOIN Inscripciones 
    ON Cursos.Id=Inscripciones.CursoId
  INNER JOIN Personas
    ON Personas.Id = Inscripciones.PersonaID
GROUP BY 
  Curso
ORDER BY 
  Facturacion DESC
  -- SUM(Cursos.Importe) DESC -- Esto también funcionaría
;

  