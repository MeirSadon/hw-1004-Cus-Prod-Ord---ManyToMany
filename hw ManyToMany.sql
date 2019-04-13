*******************************************************************************************************************************
1.
מצא את הלקוח עם הכי הרבה הזמנות
select name from (
select name, max(noc) from (
select c.name, count(o.CUSTOMER_ID) as noc 
from Customer c join ORDERS o on c.ID = o.CUSTOMER_ID GROUP by o.CUSTOMER_ID
))

*******************************************************************************************************************************
 2. 
//מצא את הלקוח עם סכום הזמנה הגבוה ביותר
select name from (
select name, max(sop) from (
SELECT c.name, sum(price) as sop from 
ORDERS o join Customer c  on c.id = o.CUSTOMER_ID join Products p on p.id=o.PRODUCT_ID GROUP by c.id
))

*******************************************************************************************************************************
 3. 
//מצא את הלקוחות שלא הזמינו כלל
select name from (
SELECT c.name, count(*) as counter from 
Customer c JOIN ORDERS o on c.id!=o.CUSTOMER_ID  GROUP by c.id having counter= (select count(*) from ORDERS))

*******************************************************************************************************************************
 4.                                                                               
//מצא הזמנות שגויות
 
*******************************************************************************************************************************
 5.                                                                               
 //מצא סכום כולל של הזמנות לפי לקוח
select c.name as CusName, sum(price) as PRICE from
ORDERS o join Customer c on c.id=o.CUSTOMER_ID join Products p on o.PRODUCT_ID=p.id group by cusname  
                                                                                
*******************************************************************************************************************************
6.                                                                                
//ממוצע ההזמנות של כל לקוח
select  c.name as cusName, avg(price) as avger from
ORDERS o join Customer c on c.id=o.CUSTOMER_ID join Products p on o.PRODUCT_ID=p.id group by c.name
 
*******************************************************************************************************************************
7.                                                                                
/לקוחות עם מעל הממוצע של ההזמנות
select  c.name as cusName, avg(price) as avger from                                                                                     
ORDERS o join Customer c on c.id=o.CUSTOMER_ID join Products p on o.PRODUCT_ID=p.id group by c.name having avger>(
select avg(price) from ORDERS o join products p on o.PRODUCT_ID=p.id join customer c on o.CUSTOMER_ID=c.id
)
                                                                                
*******************************************************************************************************************************
8.                                                                                
// מצא את סכום כל ההזמנות
select sum(price) from ORDERS o join Customer c on c.id=o.CUSTOMER_ID join Products p on o.PRODUCT_ID=p.id
                                                                                
*******************************************************************************************************************************
9.                                                                                
//מצא את הפריט שהוזמן הכי הרבה פעמים.
select proName from(
select ProName, max(maxofproduct) from(
select p.name as ProName, o.PRODUCT_ID ,count(o.PRODUCT_ID) as MaxOfProduct from
ORDERS o join Customer c on c.id=o.CUSTOMER_ID join Products p on o.PRODUCT_ID=p.id group by o.PRODUCT_ID
))   
  
*******************************************************************************************************************************
10.
 //מצא את הפריטים שלא נקנו בכלל
select proName from(
select p.name as ProName, count(name) from 
Products p join ORDERS o on p.id!=o.PRODUCT_ID group by proName having count(name)=(
select count(*) from ORDERS
))

******************************************************************************************************************************* 
