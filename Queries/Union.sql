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