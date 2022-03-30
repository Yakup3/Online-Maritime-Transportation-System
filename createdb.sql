-- ####################################################################################################
-- CREATE TABLES
-- ####################################################################################################

create table Country(
ID int,
name varchar(50),
primary key(ID)
);

create table City(
ID int,
name varchar(50),
Country int,
primary key(ID),
foreign key(Country) references Country(ID)
);

create table Sector(
ID int,
name varchar(50),
primary key(ID)
);

create table Company_Shipping(
ID int,
name varchar(50),
City int,
Country int,
Foundation_Date date,
primary key(ID),
foreign key(City) references City(ID),
foreign key(Country) references Country(ID)
);

create table Company(
ID int,
name varchar(50),
City int,
Phone_Number varchar(25),
Employer_Name varchar(50),
email varchar(50),
Sector int,
primary key(ID),
foreign key(City) references City(ID),
foreign key(Sector) references Sector(ID)
);

create table Cruise(
ID int,
Departure_Date date,
Ship_Wreck varchar(10),
From_City int,
To_City int,
Arrival_Date date,
primary key(ID),
foreign key(From_City) references City(ID),
foreign key(To_City) references City(ID)
);

create table Ship(
ID int,
name varchar(50),
Production_Date date,
Code varchar(20),
Capacity int,
primary key(ID)
);

create table Cruise_Detail(
ID int,
Company int,
Insurance_Cost varchar(10),
Container_Count int,
primary key(ID),
foreign key(Company) references Company(ID)
);

create table Has(
Shipping_ID int,
Ship_ID int,
primary key(Ship_ID),
foreign key(Shipping_ID) references Company_Shipping(ID),
foreign key(Ship_ID) references Ship(ID)
);

create table Related_To(
Ship_ID int,
Cruise_ID int,
primary key(Cruise_ID),
foreign key(Ship_ID) references Ship(ID),
foreign key(Cruise_ID) references Cruise(ID)
);

create table Includes(
Cruise_ID int, 
Cruise_Detail_ID int,
primary key(Cruise_Detail_ID),
foreign key(Cruise_ID) references Cruise(ID),
foreign key(Cruise_Detail_ID) references Cruise_Detail(ID)
);

-- ####################################################################################################
-- Adding Is_Full Column to Table
-- ####################################################################################################

alter table cruise
add column Is_Full varchar(3);

-- ####################################################################################################
-- INSERTION
-- ####################################################################################################

insert into Country(ID, name) values (1, 'Turkey');
insert into Country(ID, name) values (2, 'France');
insert into Country(ID, name) values (3, 'Netherlands');
insert into Country(ID, name) values (4, 'USA');
insert into Country(ID, name) values (5, 'Greece');
insert into Country(ID, name) values (6, 'UK');
insert into Country(ID, name) values (7, 'Ireland');
insert into Country(ID, name) values (8, 'Spain');
insert into Country(ID, name) values (9, 'Italy');
insert into Country(ID, name) values (10,'Norway');
insert into Country(ID, name) values (11,'Sweden');
insert into Country(ID, name) values (12,'Denmark');
insert into Country(ID, name) values (13,'Germany');
insert into Country(ID, name) values (14,null);

insert into City(ID, name, Country) values (1,'Izmir', 1);
insert into City(ID, name, Country) values (2,'Chicago', 4);
insert into City(ID, name, Country) values (3,'Dublin', 7);
insert into City(ID, name, Country) values (4,'Liverpool', 6);
insert into City(ID, name, Country) values (5,'Istanbul', 1);
insert into City(ID, name, Country) values (6,'Samsun', 1);
insert into City(ID, name, Country) values (7,'Antalya',1);
insert into City(ID, name, Country) values (8,'Canakkale', 1);
insert into City(ID, name, Country) values (9,'Stockholm', 11);
insert into City(ID, name, Country) values (10,'Oslo', 10);
insert into City(ID, name, Country) values (11,'Copenhagen', 12);
insert into City(ID, name, Country) values (12,'Barcelona', 8);
insert into City(ID, name, Country) values (13,'Seville', 8);
insert into City(ID, name, Country) values (14,'Rome', 9);
insert into City(ID, name, Country) values (15,'Naples', 9);
insert into City(ID, name, Country) values (16,'Artvin', 1);
insert into City(ID, name, Country) values (17,'Hamburg', 13);
insert into City(ID, name, Country) values (18,'Bremen', 13);
insert into City(ID, name, Country) values (19,'Nantes', 2);
insert into City(ID, name, Country) values (20,'Thessaloniki', 5);
insert into City(ID, name, Country) values (21,'Amsterdam', 3);
insert into City(ID, name, Country) values (22,'Buenos Aires', null);

insert into Sector(ID, name) values (1, 'Food');
insert into Sector(ID, name) values (2, 'Textile');
insert into Sector(ID, name) values (3, 'Electronics');
insert into Sector(ID, name) values (4, 'Automotive');
insert into Sector(ID, name) values (5, 'Agriculture');
insert into Sector(ID, name) values (6, 'Natural Resources');
insert into Sector(ID, name) values (7, 'Chemistry and Oil');
insert into Sector(ID, name) values (8, 'Health and Social Services');
insert into Sector(ID, name) values (9,'Production');
insert into Sector(ID, name) values (10,'Glass Cement Oil');
insert into Sector(ID, name) values (11,'Information Technologies');

insert into Company_Shipping(ID, name, City, Country, Foundation_Date) values (1, 'Company_Shipping1', 1, 1, '01-04-2006');
insert into Company_Shipping(ID, name, City, Country, Foundation_Date) values (2, 'Company_Shipping2', 5, 1, '10-17-2008');
insert into Company_Shipping(ID, name, City, Country, Foundation_Date) values (3, 'Company_Shipping3', 8, 1, '10-12-2019');
insert into Company_Shipping(ID, name, City, Country, Foundation_Date) values (4, 'Company_Shipping4', 7, 1, '01-09-2013');
insert into Company_Shipping(ID, name, City, Country, Foundation_Date) values (5, 'Company_Shipping5', 19, 2, '04-04-2004');
insert into Company_Shipping(ID, name, City, Country, Foundation_Date) values (6, 'Company_Shipping6', 20, 3, '10-11-2010');
insert into Company_Shipping(ID, name, City, Country, Foundation_Date) values (7, 'Company_Shipping7', 2, 4, '07-24-2001');
insert into Company_Shipping(ID, name, City, Country, Foundation_Date) values (8, 'Company_Shipping8', 17, 13, '12-31-2015');
insert into Company_Shipping(ID, name, City, Country, Foundation_Date) values (9, 'Company_Shipping9', 13, 5, '01-15-2018');
insert into Company_Shipping(ID, name, City, Country, Foundation_Date) values (10, 'Company_Shipping10', 18, 13, '11-10-2020');
insert into Company_Shipping(ID, name, City, Country, Foundation_Date) values (11,'CompanyShipping-11', 15, 9, '12-21-2005');
insert into Company_Shipping(ID, name, City, Country, Foundation_Date) values (12,'CompanyShipping-12', 5, 1, '01-05-1989');
insert into Company_Shipping(ID, name, City, Country, Foundation_Date) values (13,'CompanyShipping-13', 9, 11, '06-16-2020');
insert into Company_Shipping(ID, name, City, Country, Foundation_Date) values (14,'CompanyShipping-14', 11, 12, '10-10-2010');
insert into Company_Shipping(ID, name, City, Country, Foundation_Date) values (15,'CompanyShipping-15', 20, 5, '01-07-2007');
insert into Company_Shipping(ID, name, City, Country, Foundation_Date) values (16,'CompanyShipping-16', 21, 3, '08-24-1998');
insert into Company_Shipping(ID, name, City, Country, Foundation_Date) values (17,'CompanyShipping-17', 10, 10, '09-30-2012');
insert into Company_Shipping(ID, name, City, Country, Foundation_Date) values (18,'CompanyShipping-18', 11, 12, '11-14-2014');
insert into Company_Shipping(ID, name, City, Country, Foundation_Date) values (19,'CompanyShipping-19', 16, 1, '12-02-2002');
insert into Company_Shipping(ID, name, City, Country, Foundation_Date) values (20,'CompanyShipping-20', 18, 13, '01-05-2001');

insert into Company(ID, name, City, phone_number, email, employer_name, Sector) values (1,'Colour', 6, '+90509 876 8854', 'colourcompany@gmail.com', 'Saadet Ekin',1);
insert into Company(ID, name, City, phone_number, email, employer_name, Sector) values (2,'Company-B', 10, '+47509 867 4774', 'company-B@gmail.com', 'Bob White',2);
insert into Company(ID, name, City, phone_number, email, employer_name, Sector) values (3,'Company-C', 9, '+46509 873 4336', 'company-C@gmail.com', 'Catharine Musk',1);
insert into Company(ID, name, City, phone_number, email, employer_name, Sector) values (4,'Company-D', 8, '+90533 850 1243', 'company-D@gmail.com', 'Ali Ersoy',5);
insert into Company(ID, name, City, phone_number, email, employer_name, Sector) values (5,'Company-E', 17, '+49509 345 9878', 'company-E@gmail.com', 'Gizem Güngör',6);
insert into Company(ID, name, City, phone_number, email, employer_name, Sector) values (6,'Company-F', 21, '+90507 624 8798', 'company-F@gmail.com', 'Poyraz Y?lmaz',4);
insert into Company(ID, name, City, phone_number, email, employer_name, Sector) values (7,'Company-G', 12, '+34509 874 3443', 'company-G@gmail.com', 'James Johnson',2);
insert into Company(ID, name, City, phone_number, email, employer_name, Sector) values (8,'Company-H', 18, '+49509 875 4994', 'company-H@gmail.com', 'Tom Park',7);
insert into Company(ID, name, City, phone_number, email, employer_name, Sector) values (9,'Company-I', 7, '+90543 234 6753', 'company-I@gmail.com', 'Can Bahar',7);
insert into Company(ID, name, City, phone_number, email, employer_name, Sector) values (10,'Company-J', 14, '+39509 879 8154', 'company-J@gmail.com', 'Lucy Monroe',1);
insert into Company(ID, name, City, phone_number, email, employer_name, Sector) values (11,'Company-K', 20, '+30509 870 3003', 'company-K@gmail.com', 'Jack Berry',3);
insert into Company(ID, name, City, phone_number, email, employer_name, Sector) values (12,'Company-L', 11, '+45509 870 4554', 'company-L@gmail.com', 'Charlie Weber',4);
insert into Company(ID, name, City, phone_number, email, employer_name, Sector) values (13,'Company-M', 10, '+47509 877 8754', 'company-M@gmail.com', 'Sheila Brown',2);
insert into Company(ID, name, City, phone_number, email, employer_name, Sector) values (14,'Company-N', 20, '+30509 876 2854', 'company-N@gmail.com', 'Connor Gold',4);
insert into Company(ID, name, City, phone_number, email, employer_name, Sector) values (15,'Company-O', 4, '+44507 897 4324', 'company-O@gmail.com', 'Ahmet Ak?n',5);
insert into Company(ID, name, City, phone_number, email, employer_name, Sector) values (16,'Company-P', 13, '+34533 126 2345', 'company-P@gmail.com', 'Cem Bahar',6);
insert into Company(ID, name, City, phone_number, email, employer_name, Sector) values (17,'Company-S', 16, '+90530 780 9080', 'company-S@gmail.com', 'P?nar Eren',1);

insert into Cruise(ID, Departure_Date, Ship_Wreck, From_City, To_City, Arrival_Date, Is_Full) values (1, '04-02-2021', 'No', 5, 1,'05-02-2021', 'Yes');
insert into Cruise(ID, Departure_Date, Ship_Wreck, From_City, To_City, Arrival_Date) values (2, '10-03-2021', 'No', 5, 20,'11-03-2021');
insert into Cruise(ID, Departure_Date, Ship_Wreck, From_City, To_City, Arrival_Date) values (3, '01-25-2021', 'Yes', 21, 2, null);
insert into Cruise(ID, Departure_Date, Ship_Wreck, From_City, To_City, Arrival_Date, Is_Full) values (4, '11-30-2020', 'No', 19, 21,'05-12-2020', 'Yes');
insert into Cruise(ID, Departure_Date, Ship_Wreck, From_City, To_City, Arrival_Date) values (5, '12-31-2020', 'Yes', 20, 1, null);
insert into Cruise(ID, Departure_Date, Ship_Wreck, From_City, To_City, Arrival_Date) values (6, '05-01-2021', 'No', 3, 4, '06-01-2021');
insert into Cruise(ID, Departure_Date, Ship_Wreck, From_City, To_City, Arrival_Date, Is_Full) values (7, '03-31-2021', 'No', 4, 1, '05-04-2021', 'Yes');
insert into Cruise(ID, Departure_Date, Ship_Wreck, From_City, To_City, Arrival_Date, Is_Full) values (8, '12-02-2021', 'Yes', 12, 11, null, 'No');
insert into Cruise(ID, Departure_Date, Ship_Wreck, From_City, To_City, Arrival_Date, Is_Full) values (9, '12-23-2020', 'No', 3, 19, '01-01-2021', 'No');
insert into Cruise(ID, Departure_Date, Ship_Wreck, From_City, To_City, Arrival_Date) values (10, '03-18-2021', 'No', 4, 21, '06-04-2021');
insert into Cruise(ID, Departure_Date, Ship_Wreck, From_City, To_City, Arrival_Date) values (11, '04-04-2021', 'No', 17, 11, '05-04-2021');
insert into Cruise(ID, Departure_Date, Ship_Wreck, From_City, To_City, Arrival_Date, Is_Full) values (12, '02-21-2021', 'No', 16, 8, '02-27-2021', 'No');
insert into Cruise(ID, Departure_Date, Ship_Wreck, From_City, To_City, Arrival_Date, Is_Full) values (13, '03-30-2021', 'No', 9, 10, '03-04-2021', 'Yes');
insert into Cruise(ID, Departure_Date, Ship_Wreck, From_City, To_City, Arrival_Date) values (14, '12-13-2020', 'No', 11, 21, '12-17-2020');
insert into Cruise(ID, Departure_Date, Ship_Wreck, From_City, To_City, Arrival_Date) values (15, '11-30-2020', 'Yes', 14, 13, null);
insert into Cruise(ID, Departure_Date, Ship_Wreck, From_City, To_City, Arrival_Date) values (16, '03-24-2021', 'No', 6, 7, '03-26-2021');
insert into Cruise(ID, Departure_Date, Ship_Wreck, From_City, To_City, Arrival_Date, Is_Full) values (17, '12-24-2020', 'Yes', 7, 12, null, 'No');
insert into Cruise(ID, Departure_Date, Ship_Wreck, From_City, To_City, Arrival_Date, Is_Full) values (18, '12-30-2020', 'Yes', 12, 17, null, 'No');
insert into Cruise(ID, Departure_Date, Ship_Wreck, From_City, To_City, Arrival_Date) values (19, '10-30-2020', 'No', 18, 21, '10-30-2020');
insert into Cruise(ID, Departure_Date, Ship_Wreck, From_City, To_City, Arrival_Date, Is_Full) values (20, '08-01-2021', 'No', 21, 18, '08-01-2021', 'No');

insert into Ship(ID, name, Production_Date, Code, Capacity) values (1, 'Old James', '01-05-2010', '001', 580);
insert into Ship(ID, name, Production_Date, Code, Capacity) values (2, 'Golden Jewel', '08-03-2003', '062', 4500);
insert into Ship(ID, name, Production_Date, Code, Capacity) values (3, 'BlueBone', '10-08-2013', '012', 2500);
insert into Ship(ID, name, Production_Date, Code, Capacity) values (4, 'Your Fate', '11-24-2010', '015', 3300);
insert into Ship(ID, name, Production_Date, Code, Capacity) values (5, 'Carol', '05-30-2017', '023', 1800);
insert into Ship(ID, name, Production_Date, Code, Capacity) values (6, 'Island Angel', '03-02-2019', '017', 2000);
insert into Ship(ID, name, Production_Date, Code, Capacity) values (7, 'Sea Horse', '05-04-2021', '005', 6000);
insert into Ship(ID, name, Production_Date, Code, Capacity) values (8, 'Beagle', '11-07-2001', '004', 4000);
insert into Ship(ID, name, Production_Date, Code, Capacity) values (9, 'Olympic', '12-10-2012', '009', 1500);
insert into Ship(ID, name, Production_Date, Code, Capacity) values (10, 'Carpathia', '12-10-2003', '007', 1250);
insert into Ship(ID, name, Production_Date, Code, Capacity) values (11,'White Goddess', '02-21-2000', '056',1598);
insert into Ship(ID, name, Production_Date, Code, Capacity) values (12,'Blue Mood', '06-30-2009', '312', 2000 );
insert into Ship(ID, name, Production_Date, Code, Capacity) values (13,'Watership', '04-05-2013', '546', 4500);
insert into Ship(ID, name, Production_Date, Code, Capacity) values (14,'Turtle Drive', '05-07-2019', '019', 5690);
insert into Ship(ID, name, Production_Date, Code, Capacity) values (15,'Blue Affair', '07-08-2005', '018', 3000);
insert into Ship(ID, name, Production_Date, Code, Capacity) values (16,'Mad Whale', '02-03-2012', '311', 3600);
insert into Ship(ID, name, Production_Date, Code, Capacity) values (17,'The Boat Story', '12-12-2012', '145', 6000);
insert into Ship(ID, name, Production_Date, Code, Capacity) values (18,'Blue Breaker', '07-14-2013', '167', 4600);
insert into Ship(ID, name, Production_Date, Code, Capacity) values (19,'Excited', '09-25-2018', '675', 2300);
insert into Ship(ID, name, Production_Date, Code, Capacity) values (20,'Crystal Cruise', '10-31-2008', '098' , 4500);
insert into Ship(ID, name, Code, Capacity) values (24,'Sample Ship', '071' , 4500);

-- ####################################################################################################
-- Dropping Production_Date Column from Ship Table
-- ####################################################################################################

alter table Ship
drop column Production_Date;

-- ####################################################################################################
-- INSERTION
-- ####################################################################################################

insert into Cruise_Detail(ID, Company, Container_Count, Insurance_Cost) values (1,1, 500 , 'No');
insert into Cruise_Detail(ID, Company, Container_Count, Insurance_Cost) values (2,2, 1250, 'Yes');
insert into Cruise_Detail(ID, Company, Container_Count, Insurance_Cost) values (3,3, 5000, 'Yes');
insert into Cruise_Detail(ID, Company, Container_Count, Insurance_Cost) values (4,4, 1500 , 'No');
insert into Cruise_Detail(ID, Company, Container_Count, Insurance_Cost) values (5,5, 1919 , 'Yes');
insert into Cruise_Detail(ID, Company, Container_Count, Insurance_Cost) values (6,6, 400 , 'Yes');
insert into Cruise_Detail(ID, Company, Container_Count, Insurance_Cost) values (7,7, 780 , 'No');
insert into Cruise_Detail(ID, Company, Container_Count, Insurance_Cost) values (8,8, 1800 , 'Yes');
insert into Cruise_Detail(ID, Company, Container_Count, Insurance_Cost) values (9,9, 2300 , 'Yes');
insert into Cruise_Detail(ID, Company, Container_Count, Insurance_Cost) values (10,10, 1200 , 'Yes');
insert into Cruise_Detail(ID, Company, Container_Count, Insurance_Cost) values (11,11, 3200 , 'Yes');
insert into Cruise_Detail(ID, Company, Container_Count, Insurance_Cost) values (12,12, 950, 'No');
insert into Cruise_Detail(ID, Company, Container_Count, Insurance_Cost) values (13,13, 650, 'No');
insert into Cruise_Detail(ID, Company, Container_Count, Insurance_Cost) values (14,14, 2450, 'Yes');
insert into Cruise_Detail(ID, Company, Container_Count, Insurance_Cost) values (15,15, 2300, 'Yes');
insert into Cruise_Detail(ID, Company, Container_Count, Insurance_Cost) values (16,16, 3290, 'Yes');
insert into Cruise_Detail(ID, Company, Container_Count, Insurance_Cost) values (17,17, 1260, 'No');
insert into Cruise_Detail(ID, Company, Container_Count, Insurance_Cost) values (18,1, 1260, 'No');

insert into Has values (1, 5);
insert into Has values (12, 3);
insert into Has values (15, 6);
insert into Has values (20, 12);
insert into Has values (1, 1);
insert into Has values (2, 4);
insert into Has values (7, 9);
insert into Has values (13, 19);
insert into Has values (16, 11);
insert into Has values (8, 10);
insert into Has values (14, 17);
insert into Has values (17, 2);

insert into Related_To values (5, 4);
insert into Related_To values (3, 8);
insert into Related_To values (6, 12);
insert into Related_To values (12, 17);
insert into Related_To values (1, 1);
insert into Related_To values (4, 9);
insert into Related_To values (9, 20);
insert into Related_To values (19, 13);
insert into Related_To values (11, 18);
insert into Related_To values (10, 7);
insert into Related_To values (17, 2);
insert into Related_To values (8, 10);
insert into Related_To values (null, 11);

insert into Includes values (4, 8);
insert into Includes values (8, 10);
insert into Includes values (12, 17);
insert into Includes values (17, 18);
insert into Includes values (1, 3);
insert into Includes values (9, 6);
insert into Includes values (20, 12);
insert into Includes values (13, 15);
insert into Includes values (18, 7);
insert into Includes values (7, 2);
insert into Includes values (2, 13);
insert into Includes values (14, 16);
insert into Includes values (null, 14);

-- ####################################################################################################
-- VIEWS
-- ####################################################################################################

create view v_Non_Accident_Ships as
select Ship.name, Cruise.*
from Cruise, Ship, Related_To
where cruise.ship_wreck = 'No' and Cruise.ID = Related_To.Cruise_ID and Ship.ID = Related_To.Ship_ID;

create view v_ships_capacity as
select id, name, capacity 
from Ship;

insert into v_ships_capacity values (21,'Midilli', 4300);
insert into v_ships_capacity values (22, 'Köri', 5000);
insert into v_ships_capacity values (23, 'Cenitin', 4000);

-- ####################################################################################################
-- UPDATE
-- ####################################################################################################

update ship 
set code = '0054' 
where id = 22;

update ship 
set code = '0059' 
where id = 23;

update Country 
set name= 'Argentina' 
where ID= 14;

update City 
set Country = 14 
where ID=22;


update Sector 
set name = null 
where ID= 8;

update company_shipping
set country = 8
where name = 'Company_Shipping9';

update company
set name = 'Layer Mark'
where id = 17;

update cruise 
set is_full = 'Yes'
where cruise.id = 2 ;

update ship 
set  capacity = 5000
where ship.name = 'Old James';

update cruise_detail 
set  Container_Count = 6000
where id = 13;

update has 
set ship_id = 8 
where shipping_id= 17;


update related_to 
set ship_id = 2 
where cruise_id =11;

update Includes 
set cruise_id = 3 
where cruise_detail_id =14;

update v_ships_capacity
set capacity = 5500 
where name = 'Köri';

-- ####################################################################################################
-- DELETION
-- ####################################################################################################

delete from v_ships_capacity where name = 'Midilli';
delete from has where shipping_id = 17;
delete from related_to where ship_id = 2;
delete from includes where cruise_detail_id = 14;
delete from city where name = 'Buenos Aires';
delete from country where name = 'Argentina';
delete from sector where ID = 8;
delete from company_shipping where name = 'CompanyShipping-17';
delete from cruise_detail where ID = 14;
delete from company where name = 'Company-N';
delete from cruise where ID = 3;
delete from ship where ID = 2;















