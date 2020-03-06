create database cs35_insurance;
show databases;
use cs35_insurance;
create table person(
driver_id varchar(255),
name varchar(255),
address varchar(255),
);

select * from person;
drop table person;
create table person(
driver_id varchar(255),
name varchar(255),
address varchar(255),
primary key(driver_id));
create table car(
reg_num varchar(255),
model varchar(255),
years int,
primary key(reg_num));
create table accident(
report_num int,
accident_date date,
location varchar(255));
alter table accident 
add primary key(report_num);
drop table owns;
create table owns(
driver_id varchar(255),
reg_num varchar(255),
primary key(driver_id,reg_num),
foreign key(driver_id) references person(driver_id),
foreign key(reg_num) references car(reg_num));
create table participated(
driver_id varchar(255),
reg_num varchar(255),
report_num int,
damage_amount int,
primary key(driver_id,reg_num,report_num),
foreign key(driver_id) references person(driver_id),
foreign key(reg_num) references car(reg_num),
foreign key(report_num) references accident(report_num));
show tables;
insert into person
values("A01","Richard","Srinivas Nagar"),("A02","Pradeep","Rajaji Nagar"),("A03","Smith","Ashok Nagar"),("A04","venu","N R colony"),("A05","Jhon","Hanumanth Nagar");
select * from person;
insert into car 
values("KA031181","Lancer",1957);















