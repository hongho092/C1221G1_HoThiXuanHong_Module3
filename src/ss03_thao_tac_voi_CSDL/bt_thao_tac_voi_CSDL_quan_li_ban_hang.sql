use quan_li_ban_hang;

insert into customer (cName, cAge) 
value ("Minh Quan", 10),
	  ("Ngoc Oanh", 20),
      ("Hong Ha", 50); 
      
insert into `order` (cID, oDate, oTotalPrice) 
value (1, "2006-3-21", null),
      (2, "2006-3-23", null),
      (1, "2006-3-16", null);
      
insert into product (pName, pPrice)
value ("May Giat", 3),
	  ("Tu Lanh", 5),
      ("Dieu Hoa", 7),
      ("Quat", 1),
      ("Bep Dien", 2);
      
insert into order_detail
value (1, 1, 3),
	  (1, 3, 7),
      (1, 4, 2),
      (2, 1, 1),
      (3, 1, 8),
      (2, 5, 4),
      (2, 3, 3);  
      
select oID, oDate, oTotalPrice from `order`;

select customer.cID, customer.cName, `order`.cID, product.pName
from customer 
join `order` on customer.cID = `order`.cID
join order_detail on `order`.oID = order_detail.oID
join product on order_detail.pID = product.pID;

select customer.cName 
from customer
where customer.cName not in (select customer.cName from customer join `order` on customer.cID = `order`.cID group by customer.cName);

select order_detail.oID, `order`.oDate, sum(order_detail.odQTY * product.pPrice) as price_order
from `order`
join order_detail on `order`.oID = order_detail.oID
join product on order_detail. pID = product.pID
group by oDate;
