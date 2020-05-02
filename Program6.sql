create database order_processing;
use order_processing;
create table customer(
    cid int,
    cname varchar(255),
    city varchar(255),
    primary key(cid));