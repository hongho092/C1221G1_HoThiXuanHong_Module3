create database demo;

use demo;

create table products (
id int,
product_code int,
product_name varchar(20),
product_price double,
product_amount int,
product_description varchar(100),
product_status bit(1)
);

insert into products value 
(1, 123, "fan", 500000, 100, "color: blue", 1),
(2, 234, "notebook", 50000, 40, "color: red", 0),
(3, 345, "computer", 2500000, 10, "color: yellow", 0),
(4, 456, "mouse", 40000, 60, "color: green", 1),
(5, 567, "phone", 2000000, 50, "color: white", 1);

create unique index product_code_idx on products(product_code);

create unique index product_idx on products (product_name, product_price);

explain select product_name from products where product_code = 123;

explain select product_code from products where product_name = "fan" and product_price = 500000;

create view product_view as
select product_code, product_name, product_price, product_status
from products; 

insert into product_view value (789, "laptop", 8000000, 0);

drop view product_view;

delimiter //
create procedure produces_sp () 
begin
select * from products;
end //
delimiter ;

call produces_sp();

delimiter //
create procedure add_product_sp(in `code` int, in `name` varchar(20))
begin
insert into products(product_code, product_name) 
value (`code`, `name`);
end //
delimiter ;

call add_product_sp(891, "keyboard");

delimiter //
create procedure edit_product_sp(in old_id int, in new_id int)
begin
set sql_safe_updates = 0;
update products p
set p.id = new_id
where p.id = old_id;
set sql_safe_updates = 0;
end //
delimiter ;

call edit_product_sp(7, 8);

delimiter //
create procedure delete_product_sp(in id int)
begin
delete from products p
where p.id = id;
end //
delimiter ;

call delete_product_sp(8);















