use classicmodels;

delimiter //
create procedure fillAllCustomers()
begin
select * from customers;
end //

call fillAllCustomers();

delimiter // 
drop procedure if exists fillAllCustomers //
create procedure findAllCustomers()
begin
select * from customers 
where customerNumber = 175;
end //

call findAllCustomers();