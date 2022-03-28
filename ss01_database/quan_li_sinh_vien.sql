create database student_management;

create table student_management.class(
id int,
name varchar(50),
primary key(id)
);

create table student_management.teacher(
id int,
name varchar(50),
age int,
country varchar(100),
primary key (id)
);