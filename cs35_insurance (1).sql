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

insert into person values('a01','richard','srinivas nagar'),
                         ('a02','pradeep','rajaji nagar'),
                         ('a03','smith','ashok nagar'),
                         ('a04','venu','n r colony'),
                         ('a05','jhon','hanumanth nagar'); 
                         
                         
insert into car values('ka052250','indica',1990),
                      ('ka031181','lancer',1957),
                      ('ka095477','toyota',1998),
                      ('ka053408','honda',2008),
                      ('ka041702','audi',2005);
					
insert into owns values('a01','ka052250'),
                       ('a02','ka053408'),
                       ('a03','ka031181'),
                       ('a04','ka095477'),
                       ('a05','ka041702');
					
insert into accident values(11,'2003-01-01','mysore road'),
						(12,'2004-02-02','south end circle'),
                        (13,'2003-01-21','bull temple road'),
                        (14,'2008-02-17','mysore road'),
                        (15,'2005-03-04','kanakapura road');
                        
insert into participated values('a01','ka052250',11,10000),
                               ('a02','ka053408',12,50000),
                               ('a03','ka095477',13,25000),
                               ('a04','ka031181',14,3000),
                               ('a05','ka041702',15,5000);
						
/* Query 1 */
select damount 
from participated 
where reportnumber= 12;
  
update  participated 
set damount= 2500 
where reportnumber = 12 ;

/* Query 2 */
select * 
from accident ;
 
insert into accident 
values (1234, "5-5-20","Bellary ");

/* query 3 */
select count(*)
from car , participated 
where car.regno = participated.regno and car.year = 2008 ;

/* query 4 */
select model,count(*) 
from car,participated 
where car.regno = participated.regno 
group by model ;















