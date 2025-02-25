CREATE DATABASE F21_class3
USE F21_class3

CREATE TABLE Uk_example (ID int, Name varchar(20), CONSTRAINT Uk_id UNIQUE(ID))
ALTER TABLE Uk_example 
ADD CONSTRAINT combine_idname UNIQUE(ID, NAME) -- id va name ga umumiy unique berdik 

SELECT * FROM Uk_example
INSERT INTO Uk_example VALUES
(1,'Linda'),(2,'Alexia')

INSERT INTO Uk_example VALUES -- ishlamaydi chunki bizda Uni_id bor.
(1,'Bob')  

INSERT INTO Uk_example VALUES -- ishlaydi
(3,'Bob')

ALTER TABLE Uk_example --- Uni_id no o'chiramiz
DROP CONSTRAINT Uk_id 

INSERT INTO Uk_example VALUES -- ishlaydi chunki Uk_id ni o'chirdik
(1,'Bob')

INSERT INTO Uk_example VALUES -- ishlamaydi chunki combine_idname bor
(3,'Bob')

INSERT INTO Uk_example VALUES -- ishlaydi
(1,'Bobby')

INSERT INTO Uk_example VALUES -- ishlaydi
(4,'Bobby')


-- Primary Key --
create table Pk_example 
(Depid int, TotalSalary int, post varchar(10), 
constraint Pk_depID primary key(DepId))
select * from Pk_example

Alter table Pk_example
drop constraint [PK__Pk_examp__DB6585870665897C] -- Primary key ni o'chirdik

drop table Pk_example -- table ni o'chirdik va qayta yaratamiz/

create table Pk_example 
(Depid int, TotalSalary int, post varchar(10))

Alter table Pk_example
add constraint Pk_id primary key (DepID) -- ishlmaydi, chunki boshida null qiymat qabul qilinadigan qilib yaratilgan
                                         -- DepID ni not null holatiga keltirishimiz kerak.
Alter table Pk_example
alter column DepID int not null -- DepID not null holatiga keltirdik.
                                -- Endi constraint ni qo'sha olamiz.

--- Foreign Key --- Foreign keyda bir nechta id bo'lishi mumkin 
                --- lekin Primary keyda faqat bitta id bo'ladi.
Select * from Pk_example
insert into Pk_example values
(1, 1300, 'Hr'), (2, 124000, 'it'), (3, 18400, 'Finance')

create table Employee
(EmpID int, Salary int, dep_id int, constraint Fk_toDEp foreign key(dep_id)
references Pk_example(Depid))


Select * from Pk_example
Select * from Employee

insert into employee values (100, 134, 1) -- ishlaydi  chunki 1 bor
insert into employee values(101, 650, 3) -- ishlaydi  chunki 3 bor
insert into employee values (102, 130,4) -- ishlamaydi chunki Depid da 4 yo'q
insert into employee values (105, 134,1) -- ishlaydi chunki 1 bor
insert into employee values (108, 134,2) -- ishlaydi chunki 1 bor


create table  emp_info
(EmpId int primary key,
firstname varchar(10),
lastname varchar(10))

Alter table employee 
add constraint Fk_toinfo  foreign key (EmpID)
references emp_info(EmpId) ---- ishlamaydi, chunki emp_info da ma'lumot yo'q

Select * from Pk_example
Select * from Employee
Select * from emp_info

truncate table employee --- truncate qilamiz keyin references qilishimiz mumkin
Alter table employee 
add constraint Fk_toinfo  foreign key (EmpID)
references emp_info(EmpId)       ----- ishladi

insert into emp_info values (101, 'Alex', 'John')
insert into emp_info values (102, 'Peter', 'Griffin')
insert into emp_info values (103, 'George', 'Washington')
insert into emp_info values (104, 'Harry', 'Kane')

insert into employee values (101, 1300, 5) --ishlamaydi chunki Pk_example(Depid) da 5 yo'q.
insert into employee values (101, 1300, 2) -- ishlaydi chunki Pk_example(Depid) da 2 bor va emp_info(Empid) da 101 bor.
insert into employee values (101, 1100, 2) -- ishlaydi chunli employee foreign key.


drop table Pk_example -- o'chmaydi chunki foreign key bn boglangan.

Alter table employee
drop constraint Fk_toinfo

Alter table employee
drop constraint Fk_toDEp

insert into employee values (102, 1000, 5)


-- Check constraint --
create table sales 
(sale_Id int, price int check (price>0))
select * from sales
drop table sales

create table sales 
(sale_Id int, price int check (price>0))
select * from sales

insert into sales values (1, 12000)
insert into sales values (2, 1250)
insert into sales values (3, 5600)
insert into sales values (4, -12500) -- ishlamaydi chunki price > 0.

create table sales2 
(sale_Id int, price int)

select * from sales2
insert into sales2 values (1, 12000)
insert into sales2 values (2, 1250)
insert into sales2 values (3, 5600)
insert into sales2 values (4, -12500)
insert into sales2 values (4, -1500)

Alter table sales2
add constraint CH_pricepos check (price>0) -- xato, chunki manfiy qiymat bor 

select * from sales2
delete from sales2
where not (price>0) -- manfiy qiymatlarni o'chirib tashlaydi.

Alter table sales2
add constraint CH_pricepos check (price>0) -- ishlaydi, undan keyin manfiy qiymat kirgizb bo'lmaydi.

insert into sales2 values (4, -12500) -- ishlamaydi
insert into sales2 values (4, -1500)  -- ishlamaydi

-- default constraint -- odatdagi(basic) holati
select * from sales

alter table sales
drop constraint [CK__sales__price__571DF1D5] -- o'chiriladi

alter table sales
add constraint Dc_price100 default 1000 for Price -- 1000 basic hisoblanadi.

insert into sales values (4, 1250) -- kiritiladi
insert into sales values (5, 1000) -- kiritiladi
insert into sales values (5) -- ishlamaydi, chunki specify qilinmayapti
insert into sales(sale_Id) values (5) -- ishlaydi chunki specify qildik va price ga 1000(default) ni oladi.

Alter table sales
add customer_id int

alter table sales
add constraint Def_cust default 100 for customer_id

insert into sales(sale_Id) values (5) -- customer_id 100(default) oladi
insert into sales(sale_Id) values (6) -- customer_id 100(default) oladi

--not null
--unique
--primary
--foreign
--check
--default


-- Identity -- SQL Serverda avtomatik tartibda ortib boruvchi ID yaratish uchun ishlatiladi
create table students 
(id int identity, name varchar(15))

select * from students
insert into students values (1, 'bob') -- ishlamaydi, chunki insert on(yoniq), id ga o'zi qiymat berib boradi.
insert into students values ('bob') -- ishlaydi, specify shart emas, chunki identity berildi.
insert into students values ('maride') -- ishlaydi
insert into students values ('lena') -- ishlaydi

drop table students

create table students 
(id int identity(100, 10), name varchar(15)) -- 100 dan boshlanadi va 10 dan qo'shiladi. 
											 -- bermasak (1,1) default holatini olib ketadi.
select * from students
insert into students values ('bob')
insert into students values ('maride')


-- How to stop identity? delete this constraint?.
-- create table with identity column, fill it.
-- use delete and truncate see the difference if there are any.


create table people (id int identity, name varchar(20))
select * from people

insert into people values (1, 'Bob') -- ishlamaydi
insert into people values ('Bob')
insert into people values ('Jack')
insert into people values ('John')

Alter table people
drop constraint 

drop table people

create table people (id int identity(10,5),name varchar(20))
select * from people

insert into people values ('Bob')
insert into people values ('Jack')
insert into people values ('John')


-- identity -- 
create table people (id int, salary int)
select * from people

drop table people

alter table people
add constraint Min_salary default 1000 for salary

insert into people values (1, 1200)
insert into people values (2,3000)
insert into people values (3, 2000)
insert into people(id) values (4)
insert into people(id) values (5)


create table people (id int, salary int default 1000)
select * from people

drop table people

insert into people(id) values (1)
insert into people(id) values (2)
insert into people(id) values (3)

create table people (id int, salary int)
select* from people

alter table people
add constraint def_salary default 1000 for salary

drop table people

insert into people(id) values (1)
insert into people(id) values (2)
insert into people(id) values (3)

create table people (id int identity, name varchar(20))
select * from people

insert into people values (1, 'Bob') -- ishlamaydi
insert into people values ('Bob')
insert into people values ('Jack')
insert into people values ('John')

delete from people
where id = 5
delete from people
where id = 4


truncate table people
delete people