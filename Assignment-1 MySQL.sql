create database Sales;
create table SalesPeople(
	Snum int NOT NULL,
	Sname varchar(20) not null, 
	City varchar(20), 
	Comm varchar(20),
	primary key (Snum),
	UNIQUE (Sname)
);
insert into SalesPeople values(1001 ,'Peel' ,'London',12),(1002 ,'Serres', 'Sanjose ',13),(1004, 'Motika', 'London' ,11),
(1007, 'Rifkin', 'Barcelona ',15),(1003 ,'Axelrod ','Newyork',10)

create table Customers(
	Cnum int not null,
    Cname varchar(20) NOT NULL,	
	City varchar(20) not null,
	Snum int ,
	primary key (Cnum),
	foreign key (Snum) References SalesPeople(Snum)
);
insert into Customers values(2001,'Hoffman', 'London', 1001),(2002,  'Giovanni ','Rome', 1003),(2003,'Liu', 'Sanjose', 1002),
(2004 ,' Grass',' Berlin', 1002),(2006,' Clemens','London',1001),(2008,' Cisneros',' Sanjose',1007),(2007,'Pereira',' Rome ',1004)

create table Orders(
	Onum int not null, 
	Amt decimal(10, 2),
	Odate date,
	Cnum int,
	Snum int,
	primary key (Onum),
	foreign key (Cnum) references Customers(Cnum),
	foreign key (Snum) references SalesPeople(Snum)
);

insert into Orders values(3001, 18.69, '1990-10-03', 2008, 1007),
(3003, 767.19, '1990-10-03', 2001, 1001),
(3002, 1900.10, '1990-10-03', 2007, 1004),
(3005, 5160.45, '1990-10-03', 2003, 1002),
(3006, 1098.16, '1990-10-03', 2008, 1007),
(3009, 1713.23, '1990-10-04', 2002, 1003),
(3007, 75.75, '1990-10-04', 2004, 1002),
(3008, 4273.00, '1990-10-05', 2006, 1001),
(3010, 1309.95, '1990-10-06', 2004, 1002),
(3011, 9891.88, '1990-10-06', 2006, 1001);

-- Count the number of Salesperson whose name begin with ‘a’/’A’
Select count(*) as count
from SalesPeople 
where Sname like '%A' or Sname like '%a';

 -- Display all the Salesperson whose all orders worth is more than Rs. 2000.
SELECT SalesPeople.Snum, SalesPeople.Sname, SUM(Orders.Amt) AS TotalOrderWorth
FROM SalesPeople
JOIN Orders ON SalesPeople.Snum = Orders.Snum
GROUP BY SalesPeople.Snum, SalesPeople.Sname
HAVING SUM(Orders.Amt) > 2000;

-- Count the number of Salesperson belonging to Newyork.
select count(*) as count
from salespeople
where City='Newyork'

 -- Display the number of Salespeople belonging to London and belonging to Paris.
SELECT City, COUNT(*) AS Count
FROM SalesPeople
WHERE City='London' OR City='Paris'
GROUP BY City;

-- Display the number of orders taken by each Salesperson and their date of orders.
SELECT SalesPeople.Sname, COUNT(Orders.Onum) AS OrderCount, Orders.Odate
FROM SalesPeople
JOIN Orders ON SalesPeople.Snum = Orders.Snum
GROUP BY SalesPeople.Sname, Orders.Odate;


 