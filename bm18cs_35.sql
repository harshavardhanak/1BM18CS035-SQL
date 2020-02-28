create database bm18cs_35;
use bm18cs_35;
create table supplier(
  sid int,
  snam varchar(255),
  city varchar(255),
  primary key(sid)
  );
  create table parts(
  pid int,
  pname varchar(255),
  color varchar(255),
  primary key(pid)
  );
  create table catalog(
  sid int,
  pid int,
  cost int,
  foreign key(sid) references supplier(sid) on delete cascade,
  foreign key(pid) references parts(pid) on delete cascade
  );
  insert into supplier
  values(10001,"Acme Widget","Banglore"),
        (10002,"Johns","Kolkata"),
        (10003,"Vimal","Mumbai"),
        (10004,"Reliance","Delhi");
 insert into parts
 values(20001,"Book","Red"),
       (20002,"Pen","Red"),
       (20003,"Pencil","Green"),
       (20004,"Mobile","Green"),
       (20005,"Charger","Black") ;
alter table catalog
add primary key(sid,pid);
insert into catalog
values(10001,20001,10),
      (10001,20002,10),
      (10001,20003,30),
      (10001,20004,10),
      (10001,20005,10),
      (10002,20001,10),
      (10002,20002,20),
      (10003,20003,30),
      (10004,20003,40);
select distinct sid
from catalog,parts
where parts.pid=catalog.pid and parts.color="Red" or parts.color="Green";
select catalog.sid 
from catalog,parts,supplier
where catalog.sid=supplier.sid and catalog.pid=parts.pid and (parts.color="Red" or supplier.city="Banglore");
select c1.sid,c2.sid,c1.pid
from catalog c1,catalog c2
where c1.cost>c2.cost and c1.pid=c2.pid;

	  
       
  
  

