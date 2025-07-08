create table employee
(
SSN int Primary key,
Birth_Date date default getdate(),
Gender NVARCHAR(10) CHECK (Gender IN (N'Male', N'Female')),
Fname varchar (20) not null,
) 


create table department 
(
Dname varchar (20) not null,
Dnum int primary key,
location varchar(30),
)

create table project 
(
Pname varchar (20) not null,
Pnum int primary key,
location_city varchar(30),
)

alter table employee add Lname varchar(20)


alter table employee add supervisor int
foreign key (supervisor) references employee(SSN)

alter table employee add Dnum int
foreign key (Dnum) references department(Dnum)

alter table department add ManagerSSN int
foreign key (ManagerSSN) references employee(SSN)

alter table project add Dnum int
foreign key (Dnum) references department(Dnum)

alter table department add ManagerSSN int
foreign key (ManagerSSN) references employee(SSN)

alter table dependant add ESSN int
foreign key (ESSN) references employee(SSN)

create table work
(
ESSN int foreign key (ESSN) references employee(SSN),
PNumber int foreign key (PNumber) references project(Pnum),
working_hour int not null,

)



insert into employee (SSN, Birth_Date, Gender, Fname, Lname, supervisor)
values 
(101, '1990-05-15', 'Male', 'John', 'Smith', null),
(102, '1992-07-20', 'Female', 'Sarah', 'Johnson', 101),
(103, '1988-11-10', 'Male', 'Michael', 'Brown', 101),
(104, '1995-03-05', 'Female', 'Emily', 'Davis', 102),
(105, '1993-09-12', 'Male', 'David', 'Wilson', 103);
