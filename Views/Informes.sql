-- Esto va más rápido
-- Plan de ejecución es el mismo
-- En este caso, el SQL ya está parseado, analizado, validado y 
-- el plan de ejecución calculado de antemano
SELECT 
  *
FROM 
  TABLA_PARA_INFORMES
;
SELECT 
  Empresa, 
  SUM(Importe) AS FACTURADO
FROM 
  TABLA_PARA_INFORMES
GROUP BY 
  Empresa;

SELECT 
  Curso, 
  SUM(Importe) AS FACTURADO
FROM 
  TABLA_PARA_INFORMES
GROUP BY 
  Curso;

-- Plan de ejecución es el mismo que arriba
CREATE VIEW TABLA_PARA_INFORMES AS
SELECT 
  CONCAT(Personas.Nombre," ",Personas.Apellidos) AS Persona,
  Empresas.Nombre AS Empresa,
  Cursos.Titulo AS Curso,
  Cursos.Duracion,
  Cursos.Importe
FROM
  Cursos,
  Inscripciones,
  Personas LEFT JOIN Empresas
           ON Empresas.ID = Personas.EmpresaId
WHERE 
  Cursos.Id=Inscripciones.CursoId AND
  Personas.Id = Inscripciones.PersonaID
;
