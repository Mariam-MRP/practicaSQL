WITH CustomerInfo AS (
  SELECT calls_ivr_id,
  CASE 
      WHEN COUNT(CASE WHEN step_name='CUSTOMERINFOBYPHONE.TX' AND step_result = 'OK' THEN 1 END) > 0 THEN 1 
      ELSE 0  
    END AS info_by_phone_lg
  FROM 
    keepcoding.ivr_detail
  GROUP BY 
    calls_ivr_id  
)

SELECT *
FROM 
    CustomerInfo;