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
  
  /* query 1 */
  select pname
  from parts 
  where pid in (
  select distinct pid 
  from catalog);
  
  /* query 2 */
  select sname 
  from supplier
  where sid in(
  select sid 
  from catalog 
  group by sid 
  having count(*) = 5 );
  
  /* query 3 */
  select distinct sname 
  from supplier s,parts p,catalog c 
  where s.sid = c.sid and c.pid = p.pid and p.color= "red";
  
  /* query 3 */
select distinct pname 
from parts p ,supplier s ,catalog c 
where s.sname = "Acme Widget " and p.pid not in 
(select distinct c.pid 
from supplier s , catalog c 
where s.sid = c.sid and s.sname not in ("Acme Widget"));

/* query 4 */
select sid 
from catalog c
where c.cost >  
(select avg(c1.cost)
from catalog c1
where c.pid = c1.pid  );

/* query 5 */
select distinct p.pid,s.sname
from supplier s,catalog c ,parts p
where s.sid = c.sid and c.pid = p.pid
and c.cost =(select max(c1.cost )
             from catalog c1
             where c1.pid = c.pid );

	  
       
  
  

