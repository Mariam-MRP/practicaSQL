
WITH Calls AS (
    SELECT 
        ivr_detail.calls_ivr_id,
        ivr_detail.calls_phone_number,
        ivr_detail.calls_start_date,
        ivr_detail.calls_end_date,
        
        MAX(CASE 
            WHEN ivr_detail.calls_start_date BETWEEN TIMESTAMP_SUB(ivr_detail.calls_start_date, INTERVAL 24 HOUR) 
                 AND ivr_detail.calls_start_date THEN 1 
            ELSE 0 
        END) AS repeated_phone_24H,
        
        MAX(CASE 
            WHEN ivr_detail.calls_start_date BETWEEN ivr_detail.calls_start_date 
                 AND TIMESTAMP_ADD(ivr_detail.calls_start_date, INTERVAL 24 HOUR) THEN 1 
            ELSE 0 
        END) AS cause_recall_phone_24H
    FROM 
        keepcoding.ivr_detail
    GROUP BY 
        ivr_detail.calls_ivr_id, ivr_detail.calls_phone_number, ivr_detail.calls_start_date, ivr_detail.calls_end_date
)

SELECT 
   *
FROM 
    keepcoding.ivr_detail
LEFT JOIN 
    Calls ON ivr_detail.calls_ivr_id = Calls.calls_ivr_id;