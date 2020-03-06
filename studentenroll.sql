create database students;
use students;
create  table faculty(
fid integer,
fname varchar(255),
deptid int,
primary key(fid));
create table class(
cname varchar(255),
meets_at time,
room varchar(255),
fid int,
primary key(cname,fid),
foreign key(fid) references faculty(fid) on delete cascade);
create table student(
snum int,
sname varchar(255),
major varchar(255),
lvl varchar(255),
age int,
primary key(snum));
create table enrolled(
snum int,
cname varchar(255),
foreign key(snum) references student(snum) on delete cascade,
foreign key(cname) references class(cname) on delete cascade);

