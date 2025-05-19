/* Formatted on 5/19/2025 7:06:05 PM (QP5 v5.256.13226.35510) */
WITH CUSTOMERS
     AS (  SELECT A.ID OWNER_ID,
                  A.NAME,
                  COUNT (CASE WHEN B.IS_REGULAR_SAVINGS = 1 THEN B.ID END)
                     AS SAVINGS_COUNT,
                  COUNT (CASE WHEN B.is_a_fund = 1 THEN B.ID END)
                     AS investment_count,
                  SUM (C.CONFIRMED_AMOUNT) TOTAL_DEPOSITS
             FROM users_customuser A
                  JOIN PLANS_PLAN B ON A.ID = B.OWNER_ID
                  LEFT JOIN savings_savingsaccount C ON C.PLAN_ID = B.ID
            WHERE     (B.IS_REGULAR_SAVINGS = 1 OR B.IS_A_FUND = 1) --to pick customers that have both Savings and Investment plans
                  AND C.CONFIRMED_AMOUNT IS NOT NULL
         GROUP BY A.ID, A.NAME)
  SELECT OWNER_ID,
         NAME,
         SAVINGS_COUNT,
         INVESTMENT_COUNT,
         TOTAL_DEPOSITS
    FROM CUSTOMERS
   WHERE SAVINGS_COUNT >= 1 AND INVESTMENT_COUNT >= 1
ORDER BY TOTAL_DEPOSITS DESC
