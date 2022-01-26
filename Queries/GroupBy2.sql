-- Listado de empresas con su facturación , 
-- pero solo empresas a las que al menos he impartido 2 cursos diferentes
SELECT 
  Empresa, Facturado 
FROM
  (SELECT
    Empresa,
    SUM(Importe) AS Facturado,
    COUNT(*) as NumeroDeCursos
  FROM 
    TABLA_PARA_INFORMES
  GROUP BY 
    Empresa) AS INFORME
WHERE NumeroDeCursos>=2;


SELECT
  Empresa,
  SUM(Importe)
FROM 
  TABLA_PARA_INFORMES
GROUP BY 
  Empresa
HAVING 
  COUNT(*) >= 2;