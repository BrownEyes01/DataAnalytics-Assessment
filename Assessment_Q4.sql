--this CTE gets the tenure of the customer calculated from the date_joined, the total transactions and the profit
WITH CustomerStats AS (
    SELECT
        A.ID AS customer_id,
        A.NAME,
        DATEDIFF(MONTH, A.date_joined, CAST(GETDATE() AS DATE)) AS tenure_months,
        COUNT(B.ID) AS total_transactions,
        SUM(B.CONFIRMED_AMOUNT * 0.001) AS total_profit
    FROM 
        users_customuser A
        LEFT JOIN savings_savingsaccount B ON a.ID = b.OWNER_ID
    GROUP BY 
        a.ID, a.NAME, a.date_joined
)
SELECT
    customer_id,
    name,
    tenure_months,
    total_transactions,
    ROUND(
        (CAST(total_transactions AS FLOAT) / NULLIF(tenure_months, 0)) * 12 * (total_profit / NULLIF(total_transactions, 0))
    , 2) AS estimated_clv
FROM
    CustomerStats
WHERE tenure_months > 0 AND total_transactions > 0-- to avoid division by zero
ORDER BY
    estimated_clv DESC;

