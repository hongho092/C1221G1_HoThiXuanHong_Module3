create database quan_li_ban_hang;

use quan_li_ban_hang;

create table customer(
cID int auto_increment primary key,
cName varchar(30),
cAge int
);

create table product(
pID int auto_increment primary key,
pName varchar(30),
pPrice float not null
);

create table `order`(
oID int auto_increment primary key,
cID int,
oDate datetime,
oTotalPrice float,
foreign key (cID) references customer(cID)
);

create table order_detail(
oID int,
pID int,
odQTY int not null,
primary key (oID, pID),
foreign key (oID) references `order`(oID),
foreign key (pID) references product(pID)
);

