# DataAnalytics-Assessment

## Assessment 1: High-Value Customers with Multiple Products
This particular query was target to get top customers which had dual plans (Savings and Investment).
The script was written with an initial CTE that was using to get the customers that had both Savings and Investment plans on the platform and their deposits. Since the target of this is to get high-value customers, entries where confirmed amount was NULL were filtered out as they would be redundant and this also reduces the query output and the runtime overall. Then the final output of the query takes into consideration all required fields with the Total deposits sorted in descending order so the top-performing customers can be seen at a glance.

## Assessment 2: Transaction Frequency Analysis
The finance
