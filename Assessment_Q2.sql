--The avg monthly transactions per customers with be computed first in CTE
WITH MonthlyTxn
     AS (  SELECT A.ID,
                    COUNT (B.*)
                  * 1.0
                  / COUNT (DISTINCT FORMAT (B.transaction_date, 'yyyy-MM'))
                     AS MonthlyTransactions
             FROM USERS_CUSTOMUSER A
                  LEFT JOIN savings_savingsaccount B ON A.ID = B.OWNER_ID
         GROUP BY A.ID)
SELECT CASE
          WHEN AVG (MonthlyTransactions) >= 10
          THEN
             'High Frequency'
          WHEN AVG (MonthlyTransactions) BETWEEN 3 AND 9
          THEN
             'Medium Frequency'
          ELSE
             'Low Frequency'
       END
          AS Frequency_Category,
       COUNT (DISTINCT ID) customer_count,
       CAST (AVG (MonthlyTransactions) AS DECIMAL (10, 2))
          AS Avg_TXNS_Per_Month
  FROM MonthlyTxn
