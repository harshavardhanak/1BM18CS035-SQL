create database banking;
drop database banking;
create database banking;
use banking;
create table branch(
branch_name varchar(255),
branch_city varchar(255),
assets int,
primary key(branch_name));
create table bankaccount(
accno int,
branch_name varchar(255),
balance float,
foreign key(branch_name) references branch(branch_name));
use banking;
create table bankcustomer(
customer_name varchar(255),
customer_street varchar(255),
customer_city varchar(255),
primary key(customer_name));
alter table bankaccount
add primary key(accno);
create table depositer(
customer_name varchar(255),
accno int,
primary key(customer_name,accno),
foreign key(accno) references bankaccount(accno),
foreign key(customer_name) references bankcustomer(customer_name));
create table loan(
loan_number int,
branch_name varchar(255),
amount float,
primary key(loan_number),
foreign key(branch_name) references branch(branch_name));
insert into branch
values("SBI_chamrajpet","Banglore",50000),
      ("SBI_ResidencyRoad","Banglore",10000),
      ("SBI_ShivajiRoad","Bombay",20000),
      ("SBI_ParlimentRoad","Delhi",10000),
      ("SBI_jantarmantar","Delhi",20000);
insert into bankaccount
values(1,"SBI_chamrajpet",2000),
	  (2,"SBI_ResidencyRoad",5000),
      (3,"SBI_ShivajiRoad",6000),
      (4,"SBI_ParlimentRoad",9000),
      (5,"SBI_jantarmantar",8000),
      (6,"SBI_ShivajiRoad",4000);
insert into bankaccount
values(8,"SBI_ResidencyRoad",4000),
	  (9,"SBI_ParlimentRoad",3000),
      (10,"SBI_ResidencyRoad",5000),
	  (11,"SBI_jantarmantar",2000);
insert into bankcustomer
values("Avinash","Bull_Temple_Road","Banglore"),
      ("Dinesh","Bannergatta_Road","Banglore"),
      ("Mohan","NationalCollege_Road","Banglore"),
      ("Nikil","Akbar_Road","Delhi"),
      ("Ravi","Prithviraj_Road","Delhi");
insert into depositer
values("Avinash",1),
	  ("Dinesh",2),
	  ("Nikil",4),
      ("Ravi",5);
insert into depositer
values("Avinash",8),
      ("Nikil",9),
	  ("Dinesh",10),
	  ("Nikil",11);
insert into loan
values(1,"SBI_chamrajpet",1000),
      (2,"SBI_ResidencyRoad",2000),
      (3,"SBI_ShivajiRoad",3000),
      (4,"SBI_ParlimentRoad",4000),
      (5,"SBI_jantarmantar",5000);
show tables;
      


      
      




