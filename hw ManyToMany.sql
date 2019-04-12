//מצא את הלקוח עם הכי הרבה הזמנות
select name from (select name, max(noc) from (select c.name, count(o.CUSTOMER_ID) as noc from Customer c join ORDERS o on c.ID = o.CUSTOMER_ID GROUP by o.CUSTOMER_ID))

//מצא את הלקוח עם סכום הזמנה הגבוה ביותר
select name from (select name, max(sop) from (SELECT c.name, sum(price) as sop from ORDERS o join Customer c  on c.id = o.CUSTOMER_ID join Products p on p.id=o.PRODUCT_ID GROUP by c.id))

//מצא את הלקוחות שלא הזמינו כלל
