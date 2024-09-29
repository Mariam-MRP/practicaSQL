WITH AveriaModule AS (
  SELECT calls_ivr_id,
  CASE 
      WHEN COUNT(CASE WHEN module_name = 'AVERIA_MASIVA' THEN 1 END) > 0 THEN 1 
      ELSE 0  
    END AS masiva_lg
  FROM 
    keepcoding.ivr_detail
  GROUP BY 
    calls_ivr_id  
)

SELECT *
FROM 
    AveriaModule;

