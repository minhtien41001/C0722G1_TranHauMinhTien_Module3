drop database if exists demo;
create database demo;
use demo;

create table users (
 id  int(3) NOT NULL AUTO_INCREMENT,
 name varchar(120) NOT NULL,
 email varchar(220) NOT NULL,
 country varchar(120),
 PRIMARY KEY (id)
);

insert into users(name, email,country)
values('Minh Tien','minhtien2001@gmail.com','Ha Tinh'),
	  ('Hai Hoc','haihoc1995@gmail.com','Quang Nam');

DELIMITER $$
CREATE PROCEDURE find_all()
BEGIN
SELECT *
FROM users;
END$$
DELIMITER ;


DELIMITER $$
CREATE PROCEDURE update_user(user_name varchar(120), user_email varchar(120), user_country varchar(120), IN user_id INT)
BEGIN
update users 
set name = user_name, email = user_email, country = user_country
 where id = user_id;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE remove_user(IN user_id INT)
BEGIN
delete from users
where id = user_id;
END$$
DELIMITER ;
