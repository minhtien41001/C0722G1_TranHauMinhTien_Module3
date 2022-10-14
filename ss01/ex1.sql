drop database if exists student;
create database student;
use student;

create table student(
id int not null primary key,
`name`  varchar(45),
age int,
country varchar(45)
);

create table class(
id int primary key not null,
`name` varchar(45)
);

create table teacher(
id int primary key not null,
`name` varchar(45),
age int,
country varchar(45)
);