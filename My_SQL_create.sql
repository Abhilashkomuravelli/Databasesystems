# Creating database

create database project
use project;


-- tables
-- Table: AdvertisingProperty
CREATE TABLE AdvertisingProperty (
    ID int NOT NULL,
    Location varchar(50) NOT NULL,
    Address varchar(50) NOT NULL,
    Customer_ID int NOT NULL,
    CONSTRAINT AdvertisingProperty_pk PRIMARY KEY (ID)
);

desc AdvertisingProperty;

-- Table: Agent
CREATE TABLE Agent (
    ID int NOT NULL,
    Name varchar(20) NOT NULL,
    Address varchar(50) NOT NULL,
    PhoneNumber int NOT NULL,
    Branch_Code int NOT NULL,
    CONSTRAINT Agent_pk PRIMARY KEY (ID)
);

desc Agent;

-- Table: Branch
CREATE TABLE Branch (
    Code int NOT NULL,
    Address varchar(50) NOT NULL,
    PhoneNumber int NOT NULL,
    CONSTRAINT Branch_pk PRIMARY KEY (Code)
);

desc branch;

-- Table: Customer
CREATE TABLE Customer (
    ID int NOT NULL,
    Name varchar(20) NOT NULL,
    Address varchar(50) NOT NULL,
    BirthDate date NOT NULL,
    Gender varchar(10) NOT NULL,
    PhoneNumber int NOT NULL,
    Type varchar(20) NOT NULL,
    Branch_Code int NOT NULL,
    CONSTRAINT Customer_pk PRIMARY KEY (ID)
);

desc Customer;

-- Table: PropertyRented
CREATE TABLE PropertyRented (
    ID int NOT NULL,
    RentAmount int NOT NULL,
    DepositAmount int NOT NULL,
    Commission int NOT NULL,
    StartDate date NOT NULL,
    EndDate date NOT NULL,
    DepositScheme int NOT NULL,
    AdvertisingProperty_ID int NOT NULL,
    CONSTRAINT PropertyRented_pk PRIMARY KEY (ID)
);

desc PropertyRented;

-- Table: PropertySold
CREATE TABLE PropertySold (
    ID int NOT NULL,
    Address varchar(50) NOT NULL,
    Location varchar(50) NOT NULL,
    Description varchar(60) NOT NULL,
    AccommodationDetails varchar(50) NOT NULL,
    SellingPrice int NOT NULL,
    NoOfRooms int NOT NULL,
    StampDuty int NOT NULL,
    CommissionPaid int NOT NULL,
    AdvertisingProperty_ID int NOT NULL,
    CONSTRAINT PropertySold_pk PRIMARY KEY (ID)
);

desc PropertySold;

-- Table: PropertyVisit
CREATE TABLE PropertyVisit (
    ID int NOT NULL,
    Date int NOT NULL,
    Time varchar(10) NOT NULL,
    Remarks varchar(60) NOT NULL,
    AdvertisingProperty_ID int NOT NULL,
    CONSTRAINT PropertyVisit_pk PRIMARY KEY (ID)
);

desc PropertyVisit;

-- Table: Staff
CREATE TABLE Staff (
    ID int NOT NULL,
    Name varchar(20) NOT NULL,
    Address varchar(50) NOT NULL,
    PhoneNumber int NOT NULL,
    Branch_Code int NOT NULL,
    CONSTRAINT Staff_pk PRIMARY KEY (ID)
);

desc Staff;

-- foreign keys
-- Reference: AdvertisingProperty_Customer (table: AdvertisingProperty)
ALTER TABLE AdvertisingProperty ADD CONSTRAINT AdvertisingProperty_Customer FOREIGN KEY AdvertisingProperty_Customer (Customer_ID)
    REFERENCES Customer (ID);

desc AdvertisingProperty;

-- Reference: Agent_Branch (table: Agent)
ALTER TABLE Agent ADD CONSTRAINT Agent_Branch FOREIGN KEY Agent_Branch (Branch_Code)
    REFERENCES Branch (Code);

desc Agent;

-- Reference: Customer_Branch (table: Customer)
ALTER TABLE Customer ADD CONSTRAINT Customer_Branch FOREIGN KEY Customer_Branch (Branch_Code)
    REFERENCES Branch (Code);

desc Customer;

-- Reference: PropertyRented_AdvertisingProperty (table: PropertyRented)
ALTER TABLE PropertyRented ADD CONSTRAINT PropertyRented_AdvertisingProperty FOREIGN KEY PropertyRented_AdvertisingProperty (AdvertisingProperty_ID)
    REFERENCES AdvertisingProperty (ID);

desc PropertyRented;

-- Reference: PropertySold_AdvertisingProperty (table: PropertySold)
ALTER TABLE PropertySold ADD CONSTRAINT PropertySold_AdvertisingProperty FOREIGN KEY PropertySold_AdvertisingProperty (AdvertisingProperty_ID)
    REFERENCES AdvertisingProperty (ID);

desc PropertySold;

-- Reference: PropertyVisit_AdvertisingProperty (table: PropertyVisit)
ALTER TABLE PropertyVisit ADD CONSTRAINT PropertyVisit_AdvertisingProperty FOREIGN KEY PropertyVisit_AdvertisingProperty (AdvertisingProperty_ID)
    REFERENCES AdvertisingProperty (ID);

desc PropertyVisit;

-- Reference: Staff_Branch (table: Staff)
ALTER TABLE Staff ADD CONSTRAINT Staff_Branch FOREIGN KEY Staff_Branch (Branch_Code)
    REFERENCES Branch (Code);

desc Staff;

# Load Data Infile

-- Table: Branch

LOAD DATA LOCAL INFILE 'C:\\Program Files\\MariaDB 10.6\\data\\project\\Branch.csv'
INTO TABLE Branch
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(code, Address, PhoneNumber);


select * from branch;

-- Table: Agent

LOAD DATA LOCAL INFILE 'C:\\Program Files\\MariaDB 10.6\\data\\project\\Agent.csv'
INTO TABLE Agent
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(ID, Name, Address, PhoneNumber, Branch_Code);

select * from Agent;

-- Table: Customer

LOAD DATA LOCAL INFILE 'C:\\Program Files\\MariaDB 10.6\\data\\project\\Customer.csv'
INTO TABLE Customer
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(ID, Name, Address, BirthDate, Gender, PhoneNumber, Type, Branch_Code);

select * from Customer;

-- Table: AdvertisingProperty

LOAD DATA LOCAL INFILE 'C:\\Program Files\\MariaDB 10.6\\data\\project\\AdvertisingProperty.csv'
INTO TABLE AdvertisingProperty
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(ID, Location, Address, Customer_ID);

select * from AdvertisingProperty;

-- Table: PropertyRented

LOAD DATA LOCAL INFILE 'C:\\Program Files\\MariaDB 10.6\\data\\project\\PropertyRented.csv'
    -> INTO TABLE PropertyRented
    -> FIELDS TERMINATED BY ','
    -> LINES TERMINATED BY '\r\n'
    -> IGNORE 1 LINES
    -> (ID, RentAmount, DepositAmount, Commission, StartDate, EndDate, DepositScheme, AdvertisingProperty_ID);

select * from PropertyRented;

-- Table: PropertySold

LOAD DATA LOCAL INFILE 'C:\\Program Files\\MariaDB 10.6\\data\\project\\PropertySold.csv'
    -> INTO TABLE PropertySold
    -> FIELDS TERMINATED BY ','
    -> LINES TERMINATED BY '\r\n'
    -> IGNORE 1 LINES
    -> (ID, Address, Location, Description, AccommodationDetails, SellingPrice, NoOfRooms, StampDuty, CommissionPaid, AdvertisingProperty_ID);

select * from PropertySold;

-- Table: PropertyVisit

LOAD DATA LOCAL INFILE 'C:\\Program Files\\MariaDB 10.6\\data\\project\\PropertyVisit.csv'
INTO TABLE PropertyVisit
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(ID, Date, Time, Remarks, AdvertisingProperty_ID);

select * from PropertyVisit;

-- Table: Staff

LOAD DATA LOCAL INFILE 'C:\\Program Files\\MariaDB 10.6\\data\\project\\Staff.csv'
INTO TABLE Staff
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(ID, Name, Address, PhoneNumber, Branch_Code);

select * from Staff;

# multi-table query

select p.Id, p.Address, A.ID, A.Address
from propertysold p, advertisingproperty a
where p.Id = A.Id;

# joining tables

select customer.Id, customer.Name, branch.code, branch.address
from branch
inner join customer on
branch.code = customer.branch_code;

select staff.id, staff.name, branch.code
from staff
left join
branch on
staff.branch_code = branch.code
order by staff.name;

# Updating tables
# PropertyVisit

update propertyvisit
set remarks = 'excellent'
where id = 1;

select * from propertyvisit;

# Staff

update staff
set name = 'Elle'
where id = 3;

select * from staff;

# Deleting a row from a table

delete from staff where name = 'Tom';

select * from staff;

-- End of file.

