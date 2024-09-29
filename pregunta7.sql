WITH CustomerBilling AS (
  SELECT * ,
  ROW_NUMBER() OVER (PARTITION BY CAST( calls_ivr_id AS STRING ) ORDER BY step_sequence,
  CASE 
  WHEN step_billing_account_id = 'UNKNOWN' THEN 1 
  ELSE 0 
  END
  ) AS row

  FROM 
    keepcoding.ivr_detail
  WHERE 
  step_billing_account_id IS NOT NULL
)

SELECT *

FROM 
    CustomerBilling
WHERE 
    row = 1;

