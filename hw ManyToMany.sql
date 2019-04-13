//מצא את הלקוח עם הכי הרבה הזמנות
select name from (select name, max(noc) from (select c.name, count(o.CUSTOMER_ID) as noc from Customer c join ORDERS o on c.ID = o.CUSTOMER_ID GROUP by o.CUSTOMER_ID))

//מצא את הלקוח עם סכום הזמנה הגבוה ביותר
select name from (select name, max(sop) from (SELECT c.name, sum(price) as sop from ORDERS o join Customer c  on c.id = o.CUSTOMER_ID join Products p on p.id=o.PRODUCT_ID GROUP by c.id))

//מצא את הלקוחות שלא הזמינו כלל
select name from (SELECT c.name, count(*) as counter from Customer c JOIN ORDERS o on c.id!=o.CUSTOMER_ID  GROUP by c.id having counter= (select count(*) from ORDERS))
                                                                                                                                          
                                                                                                                                          
//מצא הזמנות שגויות
                                                                                                                                          
                                                                                                                                          
 //מצא סכום כולל של הזמנות לפי לקוח
select c.name as CusName, sum(price) as PRICE from ORDERS o join Customer c on c.id=o.CUSTOMER_ID join Products p on o.PRODUCT_ID=p.id group by cusname
                                                                                                                                          
//ממוצע ההזמנות של כל לקוח
select  c.name as cusName, avg(price) as avger from ORDERS o join Customer c on c.id=o.CUSTOMER_ID join Products p on o.PRODUCT_ID=p.id group by c.name
                                                                                                                                          
/לקוחות עם מעל הממוצע של ההזמנות
