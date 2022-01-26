-- MODELO DE DATOS:
--   Empresas -* Personas -* Inscripciones *- Cursos

-- QUERY:
--     Listado de personas que han hecho cursos y no 
--     están en empresa.
--     TABLAS:
--       - Inscripciones y personas
--     TIPO DE JOIN? Ya os engañé!!!! Ya os la he liao!!!!
--        INNER JOIN ¿?
--        Un inner join no sacaba los datos de TODAS las tablas???


SELECT DISTINCT
  Personas.Nombre AS NombrePersona,
  Personas.Apellidos AS ApellidosPersona
FROM
  Personas 
WHERE 
  Personas.EmpresaId IS NULL
  AND Personas.Id IN 
    (SELECT Inscripciones.PersonaId FROM Inscripciones)
;

SELECT DISTINCT
  Personas.Nombre AS NombrePersona,
  Personas.Apellidos AS ApellidosPersona
FROM
  Personas INNER JOIN Inscripciones 
          ON Personas.Id = Inscripciones.PersonaId
WHERE 
  Personas.EmpresaId IS NULL
;

SELECT DISTINCT
  Personas.Nombre AS NombrePersona,
  Personas.Apellidos AS ApellidosPersona
FROM
  Personas,
  Inscripciones
WHERE 
  Personas.EmpresaId IS NULL AND
  Personas.Id = Inscripciones.PersonaId
;
-- 
-- QUERY:
--     Listado de las personas y sus empresas
--     (solo de personas que trabajen en una empresa)
--     Pero que hayan hecho cursos, el que sea.
-- TABLAS:
--    - Personas
--    - Empresas
--    - Inscripciones
-- TIPO DE JOIN:
--    INNER JOIN: solo las personas que tengan 
--                tanto inscripciones como empresa
-- SUBQUERY
-- MUCHO CUIDADO !!!

SELECT DISTINCT
  Personas.Nombre AS NombrePersona,
  Personas.Apellidos AS ApellidosPersona,
  Empresas.Nombre AS Empresa
FROM
  Personas 
  INNER JOIN Empresas ON Personas.EmpresaId = Empresas.Id
WHERE 
  Personas.Id IN -- que esté entre
--  Personas.Id = ANY -- que sea igual a uno de ellos al menos
    (SELECT Inscripciones.PersonaId FROM Inscripciones)
--  Personas.Id != ALL -- que sea distinto a todos ellos
;
-- Si la subquery depende de la query de fuera:
--    OJO... seguramente tengo una forma de escribir la query
--    usando JOINS
-- Si no lo hago con JOINS... el rendimiento decae... muchisimo


-- Cuantas queries estamos lanzando aquí?
-- Gorda + Pequeña tantas veces como resultados tenga la gorda
--    En este caso, como la query siempre es la misma (la pequeña)




SELECT DISTINCT
  Personas.Nombre AS NombrePersona,
  Personas.Apellidos AS ApellidosPersona,
  Empresas.Nombre AS Empresa
FROM
  Personas 
  INNER JOIN Empresas ON Personas.EmpresaId = Empresas.Id
  INNER JOIN Inscripciones ON Personas.Id = Inscripciones.PersonaId
;


SELECT DISTINCT
  Personas.Nombre AS NombrePersona,
  Personas.Apellidos AS ApellidosPersona,
  Empresas.Nombre AS Empresa
FROM
  Personas,
  Empresas,
  Inscripciones
WHERE 
  Personas.EmpresaId = Empresas.Id AND
  Personas.Id = Inscripciones.PersonaId
;
-- NOTA: Distinct MUCHO CUIDADO CON ELLA
-- La palabra está ahí para usarla... cuando debemos usarla
--  La BBDD siempre que ve un DISTINCT, ordena los datos, para luego 
--  eliminar duplicados.
--    UNA ORDENACION POR TODOS LOS CAMPOS
--  Puede destrozar el rendimiento de la query... 
--  Y comerse memoria RAM del servidor de BBDD a KILOS

-- Qué es lo peor que le puedo pedir a la BBDD en una QUERY:
--  Like ES LO PEOR DE LO PEOR!!!!!
-- Lo segundo peor... más o menos comparable con el like...
--  ORDENAR... que mal lo llevan las BBDD lo de ordenar...