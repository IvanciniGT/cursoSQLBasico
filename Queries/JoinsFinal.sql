-- Queremos los nombre de las personas, y sus empresas y 
-- los titulos de los cursos que han hecho.
-- NOTA: Si una persona no tiene empresa, 
--      pues que no salga la empresa, pero si la persona
-- pero si la persona y el curso

--  Empresas -O* Personas -I- Inscripciones -I- Cursos

SELECT
  CONCAT(Personas.Nombre, " " ,Personas.Apellidos) as Persona,
  Cursos.Titulo,
  CASE 
    WHEN Empresas.Nombre IS NULL THEN "Autónomo"
    ELSE Empresas.Nombre
  END as Empresa
  --IFNULL(Empresas.Nombre,"Autónomo") as Empresa
FROM
  Cursos 
  INNER JOIN Inscripciones 
    ON Cursos.Id=Inscripciones.CursoId
  INNER JOIN Personas
    ON Personas.Id = Inscripciones.PersonaID
  LEFT OUTER JOIN Empresas
    ON Empresas.ID = Personas.EmpresaId
ORDER BY
  Empresa DESC, Titulo ASC , Persona 
;