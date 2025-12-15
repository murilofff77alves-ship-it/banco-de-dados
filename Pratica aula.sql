create database Sys_vendas;

use sys_vendas;

create table cliente (
id int, 
nome Varchar(100),
email varchar(150),
data_nascimento date,
ativo boolean
);

alter table cliente
add column telefone varchar(20);

alter table cliente
modify column email varchar(200);

alter table cliente
drop column ativo;

create table produto (
id int primary key,
nome varchar(100) not null,
preco decimal(10,2) check (preco > 0),
codigo_baras varchar(13) unique,
estoque int not null default 0
);

create table pedidos (
id int primary key,
nome varchar(100) not null,
produto_id int not null,
quantidade int check (quantidade > 0),
data_pedido date not null,
foreign key (produto_id)
references produto(id)
);
