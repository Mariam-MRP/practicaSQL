WITH CustomerPhone AS (
  SELECT * ,
  ROW_NUMBER() OVER (PARTITION BY CAST( calls_ivr_id AS STRING ) ORDER BY step_sequence,
  CASE 
  WHEN step_customer_phone = 'UNKNOWN' THEN 1 
  ELSE 0 
  END
  ) AS row

  FROM 
    keepcoding.ivr_detail
  WHERE 
  step_customer_phone IS NOT NULL
)

SELECT *
FROM 
    CustomerPhone
WHERE 
    row = 1;

   




    