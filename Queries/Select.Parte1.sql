-- FILTROS
SELECT 
  PersonaId,
  Aprobado
FROM 
  Inscripciones
WHERE 
  -- Aprobado IS TRUE -- Los aprobados
  -- Aprobado IS NOT TRUE -- Los suspensos
  Aprobado IS FALSE -- Los suspensos
;

SELECT 
  Id, 
  Nombre,
  Apellidos, 
  EmpresaId
FROM 
  Personas
WHERE
  EmpresaId IS NOT NULL -- Que un valor no sea nulo, que esté definido
  -- LAS CONDICIONES CON ANDs y ORS se pueden agrupar con PARENTESIS para establecer prioridades
  -- OR Nombre IN ("Ivan", "Manuel") -- Añadir una condicion alternativa
  -- AND Nombre IN ("Ivan", "Manuel") -- Añadir una condicion que también debe cumplirse
  -- EmpresaId IS NULL -- Que un valor sea nulo, no esté definido
  -- Email = "mateusz.aleksander@gmail.com"  -- Igual
  -- Email != "mateusz.aleksander@gmail.com" -- Distinto
  -- Email <> "mateusz.aleksander@gmail.com" -- Distinto
  -- Nombre > "Ivan" -- Orden alfabetico > < >= <=
  -- AND Nombre IN ("Ivan", "Manuel") -- Uno cualquiera de ellos
                                  -- Este operador es potente pero PELIGROSO
                                  -- INTENTAR EVITAR SU USO CON SUBQUERIES, A TODA COSTA !!!!!!
  -- Nombre NOT IN ("Ivan", "Manuel") -- Ninguno de ellos       
  -- ID > 7 -- En campos numéricos, tambien funcionan todos los anteriores
  -- ID BETWEEN 3 AND 9 -- Entre el 3 y el 9 incluidos
  -- ID NOT BETWEEN 3 AND 9 -- Que no estén entre el 3 y el 9
;
-- -------------------------------------------------
-- Alias PARTE II
-- Igual que podemos poner un alias a una columna,
-- Se lo podemos poner a una tabla
SELECT 
  Alumnos.Nombre
FROM
  Personas AS Alumnos
;
-- Cualificar nombres de columnas
-- con el nombre de su correspondiente tabla
SELECT 
  Personas.Nombre
FROM
  Personas
;

-- Alias PARTE 1: Un nombre alternativo: APODO !
SELECT 
  Nombre AS Empresa,
  CIF AS Identificador
FROM 
  Empresas;

-- Se puede utilizar un caracter comodín: *
-- * indica todos los campos. PROHIBIDO !!!!
SELECT * FROM Empresas;

-- Nombre y apellidos de nuestros alumnos
SELECT Nombre, Apellidos FROM Personas;

-- Obtener el listado de cursos disponibles
SELECT Titulo FROM Cursos;