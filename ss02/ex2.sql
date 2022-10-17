drop database if exists quan_ly_ban_hang;
create database quan_ly_ban_hang;
use quan_ly_ban_hang;

create table Customer(
cID int primary key auto_increment,
cName varchar(45),
cAge int
);

create table `Order`(
oID int primary key auto_increment,
cID int,
oDate date,
oTotalPrice double,
foreign key(cID) references Customer(cId)
);

create table Product(
pID int primary key auto_increment,
pName varchar(45),
pPrice double
);

create table OrderDetail(
oID int,
pID int,
odQTY int,
primary key(oID,pID),
foreign key(oID) references `Order`(oID),
foreign key(pID) references Product(pID)
);