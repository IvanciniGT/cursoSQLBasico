-- MUCHO OJO CON LOS UNION !!!!!
-- Haré un UNION cuando lo necesite.
-- Listado de personas sin empresa   
SELECT 
  Personas.Id,
  Personas.Nombre,
  Personas.Apellidos
FROM 
  Personas
WHERE 
  Personas.EmpresaID IS NULL
;
-- Listado de personas con empresa y nombre de empresa
SELECT 
  Personas.Id,
  Personas.Nombre,
  Personas.Apellidos,
  Empresas.Nombre
FROM 
  Personas
  INNER JOIN Empresas ON Empresas.Id = Personas.EmpresaId
;
-- JUNTO LOS DOS CON UN UNION
SELECT 
  Personas.Id,
  Personas.Nombre,
  Personas.Apellidos,
  Empresas.Nombre as Empresa
FROM 
  Personas
  INNER JOIN Empresas ON Empresas.Id = Personas.EmpresaId
UNION -- Implican un DISTINCT -> ORDER BY -- En su lugar , 
-- UNION ALL no hace un DISTINCT es decir NO ELIMINA DUPLICADOS
-- UN UNION ALL ES MUY RAPIDO, a diferencia de un UNION
-- De hecho en todos los ejemplos e este fichero podriamos haber utilizado un UNION ALL
SELECT 
  Personas.Id,
  Personas.Nombre,
  Personas.Apellidos,
  null AS EMPRESA
FROM 
  Personas
WHERE 
  Personas.EmpresaID IS NULL
;
-- Listado de personas con empresa y nombre de empresa si las tiene
SELECT 
  Personas.Id,
  Personas.Nombre,
  Personas.Apellidos,
  Empresas.Nombre
FROM 
  Personas
  LEFT JOIN Empresas ON Empresas.Id = Personas.EmpresaId
;







-- Nombre y DNI de las personas que no están en empresas... 
-- y el importe total a facturar el año pasado
SELECT
  CONCAT(Personas.Nombre," ",Personas.Apellidos) as Nombre,
  Personas.DNI as NIF,
  Sum(Cursos.Importe) as Total
FROM
  Personas
  INNER JOIN Inscripciones ON Personas.Id = Inscripciones.PersonaId
  INNER JOIN Cursos ON Cursos.Id = Inscripciones.CursoId
WHERE
  -- la fecha de la inscripcion... SU AÑO sea igual al año pasado
  YEAR(Inscripciones.Fecha) = YEAR(NOW())-1
  AND Personas.EmpresaId IS NULL
GROUP BY
  Nombre,
  NIF
UNION
-- EMPRESA (NOMBRE Y CIF) Y EL IMPORTE TOTAL EN EL AÑO PASADO
-- Empresa -I- Personas -I- Inscripciones -I- Cursos
SELECT
  Empresas.Nombre,
  Empresas.CIF as NIF,
  Sum(Cursos.Importe) as Total
FROM
  Empresas
  INNER JOIN Personas ON Empresas.Id = Personas.EmpresaId
  INNER JOIN Inscripciones ON Personas.Id = Inscripciones.PersonaId
  INNER JOIN Cursos ON Cursos.Id = Inscripciones.CursoId
WHERE
  -- la fecha de la inscripcion... SU AÑO sea igual al año pasado
  YEAR(Inscripciones.Fecha) = YEAR(NOW())-1
GROUP BY
  Nombre,
  NIF
;