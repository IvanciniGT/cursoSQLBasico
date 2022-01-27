-- Quiero un listado de las empresas de larga duración
-- Los clientes con los que hemos trabajado muchos años
-- Que nos han sido fieles
SELECT
  Empresas.Nombre AS Empresa,
  DATEDIFF( MAX(Inscripciones.Fecha), MIN(Inscripciones.Fecha)) AS TiempoContratando
FROM
  Empresas,
  Personas,
  Inscripciones
WHERE 
  Empresas.Id = Personas.EmpresaId AND
  Personas.Id = Inscripciones.PersonaId
GROUP BY 
  Empresa
ORDER BY 
  TiempoContratando DESC
;

-- Última vez que nos contrató cada empresa
-- DE DONDE SACO DATOS? Empresas, Inscripciones
-- ESAS DOS TABLAS SE LIGAN ENTRE SI? NO
-- EMPRESAS - Personas - INSCRIPCIONES - Cursos

-- TENGO QUE TOMAR LAS INTERMEDIAS: Personas
-- TABLAS 3: EMPRESAS, PERSONAS, INSCRIPCIONES

-- TIPO DE JOIN? INNER: No quiero empresas sin inscripcion
--                      Ni quiero inscripciones sin empresas
SELECT
  Empresas.Nombre as Empresa,
  MAX(Inscripciones.Fecha) as UltimoContrato
FROM
  Empresas
  INNER JOIN Personas ON Empresas.Id = Personas.EmpresaId
  INNER JOIN Inscripciones ON Personas.Id = Inscripciones.PersonaId
GROUP BY 
  Empresa
ORDER BY 
  UltimoContrato DESC
;

-- Nombre la gente de cada empresa 
-- El numero de cursos que han hecho
-- COLUMNAS: EMPRESA      PERSONA     NUMERO DE CURSOS

-- REGLA DE ORO: En este tipo de informes (CUANDO USO UN GROUPBY)
-- Todas las columnas que muestre en el select, que no sean 
-- columnas de agrupacion (COUNT, MAX, MIN, AVG, SUM), 
-- tienen que aparecer en el group by.

SELECT 
  Empresa,
  Persona,
  COUNT(Curso) AS NumeroCursos
FROM 
  TABLA_PARA_INFORMES
GROUP BY 
  Empresa,
  Persona
;

