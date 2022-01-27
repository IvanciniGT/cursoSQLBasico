SELECT 
  TRIM(Personas.Nombre), -- Elima espacios en blanco por delante y detras
  LTRIM(Personas.Nombre), -- Elima espacios en blanco por delante
  RTRIM(Personas.Nombre), -- Elima espacios en blanco por detras
  LENGTH(Personas.Nombre),
  SUBSTRING(Personas.Nombre,2,4),
  CONCAT("HOLA ", Personas.Nombre) as CONCATENADO
FROM 
  Personas
WHERE
  -- UPPER(Personas.Nombre) LIKE UPPER('I%')
  -- LOWER(Personas.Nombre) LIKE LOWER('I%')
  Personas.Nombre LIKE "I_a%" 
    -- Para escapar carcteres especiales una contrabarra \_ \%
;
