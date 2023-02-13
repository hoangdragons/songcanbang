
drop user dolphin;
flush privileges;
create database dolphin;
create user dolphin identified by '123456@123';
grant all privileges on dolphin.* to 'dolphin'@'localhost' identified by '123456@123';