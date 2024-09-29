WITH CustomerID AS (
  SELECT * ,
  ROW_NUMBER() OVER (PARTITION BY CAST( calls_ivr_id AS STRING ) ORDER BY step_sequence,
  CASE 
  WHEN step_document_type = 'UNKNOWN' THEN 1 
  ELSE 0 
  END
  ) AS row
  FROM 
    keepcoding.ivr_detail
  WHERE 
 step_document_type IS NOT NULL
    AND step_document_identification IS NOT NULL
)

SELECT *
FROM 
    CustomerID
WHERE 
    row = 1;
