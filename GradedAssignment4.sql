create database TravelOnTheGo;
use TravelOnTheGo;
show databases;
/*1) You are required to create two tables PASSENGER and PRICE with the following
attributes and properties */
/*passenger*/
create table PASSENGER (Passenger_name varchar(50),Category varchar(50),Gender varchar(50), Boarding_City varchar(50),Destination_City varchar(50),Distance int ,Bus_Type varchar(50) );
show tables;
desc PASSENGER;

/*PRICE*/

create table PRICE( Bus_Type varchar(50),Distance int,Price int);
show tables;
desc PRICE;

/*drop table PASSENGER;
drop table PRICE;*/

show databases;

/*2) Insert the following data in the tables*/

insert into PASSENGER(Passenger_name ,Category,Gender ,Boarding_City,Destination_City , Distance ,Bus_Type) values('Sejal', 'AC', 'F', 'Bengaluru' ,'Chennai' ,350, 'Sleeper');
insert into PASSENGER(Passenger_name ,Category,Gender ,Boarding_City,Destination_City , Distance ,Bus_Type) values('Anmol',' Non-AC', 'M',' Mumbai', 'Hyderabad', 700, 'Sitting');
insert into PASSENGER(Passenger_name ,Category,Gender ,Boarding_City,Destination_City , Distance ,Bus_Type) values('Pallavi', 'AC',' F', 'Panaji' ,'Bengaluru', 600, 'Sleeper');
insert into PASSENGER(Passenger_name ,Category,Gender ,Boarding_City,Destination_City , Distance ,Bus_Type) values('Khusboo', 'AC', 'F', 'Chennai' ,'Mumbai', 1500, 'Sleeper');
insert into PASSENGER(Passenger_name ,Category,Gender ,Boarding_City,Destination_City , Distance ,Bus_Type) values('Udit', 'Non-AC', 'M', 'Trivandrum' ,'panaji', 1000,'Sleeper');
insert into PASSENGER(Passenger_name ,Category,Gender ,Boarding_City,Destination_City , Distance ,Bus_Type) values('Ankur', 'AC', 'M' ,'Nagpur','Hyderabad', 500, 'Sitting');
insert into PASSENGER(Passenger_name ,Category,Gender ,Boarding_City,Destination_City , Distance ,Bus_Type) values('Hemant', 'Non-AC', 'M','panaji' ,'Mumbai', 700, 'Sleeper');
insert into PASSENGER(Passenger_name ,Category,Gender ,Boarding_City,Destination_City , Distance ,Bus_Type) values('Manish', 'Non-AC', 'M' ,'Hyderabad', 'Bengaluru', 500, 'Sitting');
insert into PASSENGER(Passenger_name ,Category,Gender ,Boarding_City,Destination_City , Distance ,Bus_Type) values('Piyush', 'AC','M' ,'Pune' ,'Nagpur', 700 ,'Sitting');
select * from PASSENGER;
insert into PRICE(Bus_Type,Distance,Price)values('Sleeper', 350, 770);
insert into PRICE(Bus_Type,Distance,Price)values('Sleeper', 500, 1100);
insert into PRICE(Bus_Type,Distance,Price)values('Sleeper', 600, 1320);
insert into PRICE(Bus_Type,Distance,Price)values('Sleeper', 700, 1540);
insert into PRICE(Bus_Type,Distance,Price)values('Sleeper', 1000, 2200);
insert into PRICE(Bus_Type,Distance,Price)values('Sleeper', 1200, 2640);
insert into PRICE(Bus_Type,Distance,Price)values('Sleeper', 1500, 2700);
insert into PRICE(Bus_Type,Distance,Price)values('Sitting', 500, 620);
insert into PRICE(Bus_Type,Distance,Price)values('Sitting', 600, 744);
insert into PRICE(Bus_Type,Distance,Price)values('Sitting', 700, 868);
insert into PRICE(Bus_Type,Distance,Price)values('Sitting',1000, 1240);
insert into PRICE(Bus_Type,Distance,Price)values('Sitting', 1200, 1488);
insert into PRICE(Bus_Type,Distance,Price)values('Sitting', 1500, 1860);
select * from PRICE;

/*3)How many females and how many male passengers travelled for a minimum distance of
600 KM s?*/
select count(p.gender) ,p.gender from passenger p,price pc where p.distance=pc.distance and p.distance=600 ;


/*4)Find the minimum ticket price for Sleeper Bus. */

select min(pc.price)from price pc where pc.bus_type='sleeper';

/*5) Select passenger names whose names start with character 'S' */
select p.passenger_name from passenger p where  p.passenger_name like 'S%';

/*6) Calculate price charged for each passenger displaying Passenger name, Boarding City,
Destination City, Bus_Type, Price in the output
*/

select p.passenger_name,p.boarding_city,p.destination_city,pc.bus_type,pc.price from passenger p,price pc where p.bus_type=pc.bus_type and p.distance=pc.distance ;

/*7) What are the passenger name/s and his/her ticket price who travelled in the Sitting bus
for a distance of 1000 KM s */

select p.passenger_name,pc.price from passenger p,price pc where  p.bus_type='Sitting'and p.distance=1000 and p.bus_type=pc.bus_type and p.distance=pc.distance ;


/*8)What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to
Panaji?*/
select sum(pc.price) from passenger p,price pc where p.bus_type=pc.bus_type and p.distance=pc.distance  and p.passenger_name='Pallavi';

/*9) List the distances from the "Passenger" table which are unique (non-repeated
distances) in descending order.*/

select distinct p.distance from passenger p order by  p.distance desc ;

/*10) Display the passenger name and percentage of distance travelled by that passenger
from the total distance travelled by all passengers without using user variables */

select p.passenger_name,  p.distance*100/(select sum(p.distance) from passenger p) as percentage from passenger p ;

/*11) Display the distance, price in three categories in table Price
a) Expensive if the cost is more than 1000
b) Average Cost if the cost is less than 1000 and greater than 500
c) Cheap otherwise
*/
 
DELIMITER &&
CREATE PROCEDURE myproc()
BEGIN
select price.distance,price.price,
CASE 
   WHEN price.price>1000 THEN 'Expensive'
   WHEN price.price<1000 and price.price>500 THEN 'Average Cost'
   ELSE 'Cheap '
END AS Verdict from price ;
END &&
DELIMITER ;

CALL myproc();

 



