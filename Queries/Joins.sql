-- FULL JOIN: NO ESTA SOPORTADA EN MYSQL

-- RIGHT JOIN
-- Sintaxis 1
SELECT
  Personas.Nombre AS Empleado,
  Empresas.Nombre AS Empresa
FROM 
  Personas RIGHT JOIN Empresas 
           ON Personas.EmpresaId = Empresas.Id;
           
-- LEFT JOIN
-- Sintaxis 1
SELECT
  Personas.Nombre AS Empleado,
  Empresas.Nombre AS Empresa
FROM 
  Personas LEFT JOIN Empresas 
           ON Personas.EmpresaId = Empresas.Id;

-- INNER JOIN
-- Sintaxis 1
SELECT
  Personas.Nombre AS Empleado,
  Empresas.Nombre AS Empresa
FROM 
  Personas INNER JOIN Empresas 
           ON Personas.EmpresaId = Empresas.Id;
  
-- Solo los datos que contienen 
-- tanto info de empresas como de personas
SELECT
  Personas.Nombre AS Empleado,
  Empresas.Nombre AS Empresa
FROM 
  Personas,
  Empresas
WHERE
  Personas.EmpresaId = Empresas.Id;
