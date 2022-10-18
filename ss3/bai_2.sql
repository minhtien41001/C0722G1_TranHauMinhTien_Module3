use quan_ly_ban_hang;

insert into Customer(cID,cName,cAge)
values
(1,"Minh Quan",10),
(2,"Ngoc Oanh",20);

insert into `order` 
values (1,1,'2006-3-21',null),
(2,2,'2006-3-23',null),
(3,1,'2006-3-16',null);

insert into Product 
values (1, 'May Giat', 3),
(2, 'Tu Lanh', 5),
(3, 'Dieu Hoa', 7),
(4, 'Quat', 1),
(5, 'Bep Dien', 2);

insert into OrderDetail 
values(1, 1, 3),
(1, 3, 7),
(1, 4, 2),
(2, 1, 1), 
(3, 1, 8),
(2, 5, 4),
(2, 3, 3);

-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select oID, oDate, oTotalPrice from `order`;

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select  Customer.cName, Product.pName
from Customer
inner join `order` on Customer.cID = `order`.cID
inner join OrderDetail  on `order`.oID= OrderDetail.oID
inner join Product on OrderDetail.pID = Product.pID;

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select *from Customer where Customer.cID not in (select cID from `order`);

-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)
select `order`.oID,`order`.oDate,SUM(OrderDetail.odQTY*Product.pPrice) as oTotalPrice
from `order`
inner join OrderDetail on `order`.oID = OrderDetail.oID
inner join Product on OrderDetail.pID = Product.pID
group by `order`.oID;