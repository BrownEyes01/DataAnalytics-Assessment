# DataAnalytics-Assessment

## Assessment 1: High-Value Customers with Multiple Products
This particular query was target to get top customers which had dual plans (Savings and Investment).
<br> The script was written with an initial CTE that was using to get the customers that had both Savings and Investment plans on the platform and their deposits. Since the target of this is to get high-value customers, entries where confirmed amount was **NULL** were filtered out as they would be redundant and this also reduces the query output and the runtime overall. Then the final output of the query takes into consideration all required fields with the Total deposits sorted in descending order so the top-performing customers can be seen at a glance.

## Assessment 2: Transaction Frequency Analysis
The finance team wants to understand how often customers transact and to categorize the customers by their transaction frequency.
<br> This script has two parts with the first part (CTE) giving us the avg monthly transaction for each customer. i.e Customer A could have 3.16 transactions over a period of 5months. Then the outer query gives a overall average transactions for all customers, and also implementing a category bucket that groups these customers into HIGH, MEDIUM, LOW depnding on the number of customers that fall into them.

## Assessment 3: Account Inactivity Alert
Operational Team needs to flag non-transacting/inactive accounts over a period of 1 year.
<br> This was done by getting the last/max transaction date for each user/customers and then a filter was applied to select account that fall into the bucket of inactivity for the last 365 days.

## Assessment 4: Customer Lifetime Value (CLV) Estimation
This simple model find the summarized lifecycle of a customer, and also their Customer Lifetime Value (CLV).
<br> The script gives an initial calculation of the tenure days (gotten from the joined_date column), the total transactions carried out for this period and the profit which is the sum of their deposits multiplied by 0.1%. The outer result then uses this information to get the CLVs for each customer, with the customers having the highest CLVs topping the charts.

### This brings me to the end of my assessment. Thank you.
