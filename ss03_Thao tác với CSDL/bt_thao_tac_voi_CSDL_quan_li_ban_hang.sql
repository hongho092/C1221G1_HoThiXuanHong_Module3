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
      
select * from order_detail;

select customer.cName, 