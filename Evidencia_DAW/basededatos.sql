drop database if exists bookstore;
create database bookstore;

use bookstore;

create table usuarios(
	id int auto_increment,
    username varchar(25) not null,
    email varchar(250) not null,
    pass varchar(100) not null,
    rol varchar(10) not null,
    primary key(id)
);

insert into usuarios(username,email,pass,rol) values ('admin','admin@admin.com','admin','admin');

select * from bookstore.usuarios;

select * from bookstore.usuarios where username = 'admin';