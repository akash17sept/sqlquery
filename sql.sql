create database edyoda;
use edyoda;
create table SalesPeople(Snum integer primary key,Sname varchar(25) unique, City varchar(25), Comm integer)
insert into SalesPeople values(1001,'Peel','London',12)
insert into SalesPeople values(1002,'Serres','Sanjose',13)
insert into SalesPeople values(1004,'Motika','London',11)
insert into SalesPeople values(1007,'Rifkin','Barcelona',15)
insert into SalesPeople values(1003,'Axelrod','Newyork',10)

select * from SalesPeople

create table Customers (Cnum integer primary key,Cname varchar(25),City varchar(25) not null,
Snum integer, foreign key(Snum) references SalesPeople(Snum))

insert into Customers values (2001,'Hoffman','London',1001)
insert into Customers values (2002,'Giovanni','Rome',1003)
insert into Customers values (2003,'Liu','Sanjose',1002)
insert into Customers values (2004,'Grass','Berlin',1002)
insert into Customers values (2006,'Clemens','London',1001)
insert into Customers values (2008,'Cisneros','Sanjose',1004)
insert into Customers values (2007,'Pereira','Rome',1007)

select * from Customers

create table Orders (Onum integer primary key,Amt decimal(6,2),Odate varchar(25),Cnum integer,
foreign key(Cnum) references Customers(Cnum), Snum integer,foreign key(Snum) references SalesPeople(Snum))


insert into Orders values(3001,18.69,'3-10-1990',2008,1007)
update Orders set Amt=18.69 where Onum=3001
select * from Orders
insert into Orders values(3003,767.19,'3-10-1990',2001,1001)
insert into Orders values(3002,1900.10,'3-10-1990',2007,1004)
insert into Orders values(3005,5160.45,'3-10-1990',2003,1002)
insert into Orders values(3006,1098.16,'3-10-1990',2008,1007)
insert into Orders values(3009,1713.23,'4-10-1990',2002,1003)
insert into Orders values(3007,75.75,'4-10-1990',2004,1002)
insert into Orders values(3008,4373.00,'5-10-1990',2006,1001)
insert into Orders values(3010,1309.95,'6-10-1990',2004,1002)
insert into Orders values(3011,9891.88,'6-10-1990',2006,1001)


-- Count the number of Salesperson whose name begin with ‘a’/’A’.
select count(*) from SalesPeople where Sname like 'a%' or Sname like 'A%' 

-- Display all the Salesperson whose all orders worth is more than Rs. 2000. 
select s.Snum,Sname,City,Comm from SalesPeople as s inner join Orders as o on s.Snum=o.Snum where Amt>2000 

-- Count the number of Salesperson belonging to Newyork. 
select count(*) from SalesPeople where City='Newyork'

-- Display the number of Salespeople belonging to London and belonging to Paris. 
select count(*) from SalesPeople where City='London' and City='Paris' 


-- Display the number of orders taken by each Salesperson and their date of orders. 
select count(*),Snum,Odate from Orders group by Snum,Odate