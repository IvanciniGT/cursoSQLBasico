-- Yo tengo una empresa de formación... y tengo que facturar
-- A principio de mes cobro el 40% de los cursos que vaya a dar ese mes
-- El 60% al empezar el curso
-- Fecha para la que se ha inscrito.. No cuando se ha inscrito
-- 15 de mayo. El dia 1 pago el 40% y el 15 el 60%
-- Dado un mes... Este mes.
-- Cuanto voy a cobrar en cada momento... por dias... 
-- Planificar mi flujo de caja
-- COLUMNAS: Fecha , PASTA !!!!
-- TABLAS: Cursos e Inscripciones

-- Importe de las inscripciones a cursos que empiezan este mes
CREATE VIEW FacturacionEsteMes AS
SELECT 
  Inscripciones.Fecha,
  Cursos.Importe
FROM
  Inscripciones
  INNER JOIN Cursos ON Cursos.Id = Inscripciones.CursoId
WHERE
  MONTH(Inscripciones.Fecha)=MONTH(NOW())
  AND YEAR(Inscripciones.Fecha)=YEAR(NOW())
;
-- Lo que cobro a principio de mes (dia 1) por cada curso (40%)
SELECT 
  TABLA_COMPLETA.FECHA, SUM(TABLA_COMPLETA.INGRESO) as TOTAL
FROM
  (
    SELECT
      STR_TO_DATE(
          CONCAT("01-",MONTH(Fecha),"-",YEAR(Fecha)), "%d-%m-%Y"
      ) as Fecha,
      Importe * 0.4 as Ingreso
    FROM 
      FacturacionEsteMes
    -- Lo que cobro a fecha de inicio de cada curso (60%)
    UNION ALL
    SELECT 
      Fecha,
      Importe * 0.6 as Ingreso
    FROM 
      FacturacionEsteMes
  ) as TABLA_COMPLETA
GROUP BY 
  TABLA_COMPLETA.Fecha;
ORDER BY 
  TABLA_COMPLETA.Fecha;