--for this, we find the last transaction date for each plan type per plan_id, then we filter out the plans that have no activity for 1 year

 WITH LastTxn AS (
    SELECT 
        A.ID AS plan_id,
        A.OWNER_ID,
        CASE 
            WHEN A.IS_REGULAR_SAVINGS = 1 THEN 'Savings Plan'
            WHEN A.IS_A_FUND = 1 THEN 'Investment Plan'
            ELSE 'Other'
        END AS type,
        MAX(B.transaction_date) AS last_transaction_date
    FROM 
        PLANS_PLAN A
        LEFT JOIN savings_savingsaccount B ON A.ID = B.PLAN_ID
    WHERE 
        A.IS_REGULAR_SAVINGS = 1 OR A.IS_A_FUND = 1
    GROUP BY 
        A.ID, A.OWNER_ID, 
        CASE 
            WHEN A.IS_REGULAR_SAVINGS = 1 THEN 'Savings Plan'
            WHEN A.IS_A_FUND = 1 THEN 'Investment Plan'
            ELSE 'Other'
        END
)
SELECT 
    plan_id,
    OWNER_ID AS owner_id,
    type,
    CONVERT(varchar, last_transaction_date, 23) AS last_transaction_date,
    DATEDIFF(day, last_transaction_date, CAST(GETDATE() AS DATE)) AS inactivity_days
FROM 
    LastTxn
WHERE
    last_transaction_date < DATEADD(day, -365, CAST(GETDATE() AS DATE))
ORDER BY 
    inactivity_days DESC;
