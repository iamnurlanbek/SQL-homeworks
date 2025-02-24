create database F21_class2
use F21_class2

create table students (name varchar(20), age int, salary int)

insert into students values ('Alex', 24, 1300)
insert into students values ('Bob', 23) -- ishlamaydi, chunki bizdan 3 ta qiymat kutadi
insert into students(name, age) values ('Bob', 23)
select * from students -- Salary NULL chiqadi chunki salaryga qiymat bermadik.
insert into students values ('Linda',19, 500)
insert into students values ('George',20, 900)
select * from students

-- SQL da filter qilish uchun WHERE ishlatiladi --
Select * from students
where age > 20

select * from students	
where salary < 1200

select * from students
where salary < 1200 and age < 20

select * from students
where salary > 1200 or age > 20

-- Schema --> Schema – bu SQL bazasidagi jadvallar, funksiyalar va boshqa obyektlarni guruhlash uchun ishlatiladigan mantiqiy tuzilma.
--✅ Ma’lumotlarni tartibga soladi (masalan, HR.Employees, Sales.Orders).
--✅ Xavfsizlikni boshqaradi – kim qaysi ma’lumotga kira olishini belgilash mumkin.
--✅ Katta bazalarni boshqarishga yordam beradi.

create schema Finance -- Bo'limlarga scheam yaratib berildi. ular shu schema bo'yicha table yaratishadi ya'ni ishlashadi
create schema HR

create table employee (name varchar(10)) -- buni yaratsak, dbo yaratiladi ya'ni asosiy admin tarafidan
create table Finance.employee (name varchar(10))
create table HR.employee (name varchar(10))

-- CSV file ni olib kelish --
create table Salary (id varchar(20), month int, salary int)
Bulk insert Salary
from 'C:\Users\EcoRestart\OneDrive\Desktop\Data Analyst\EmpID,month,salary.csv'
 with (
	fieldterminator = ',', -- 2 ta column nima bn ajralyapti
	rowterminator = '\n', -- 2 qator nims bn ajralyapti
	firstrow = 2 -- birinchi qator boshlanishi
)
select * from salary
 truncate table salary

 Create table Salary1 (id varchar(20), month int, salary int)
 Bulk insert Salary1
 from 'C:\Users\EcoRestart\OneDrive\Desktop\Data Analyst\EmpID,month,salary.csv'
 with ( 
	fieldterminator = '@',
	rowterminator = '/',
	firstrow = 2
)
select * from Salary1
truncate table Salary1

-- Constraints --> SQLda jadval ustunlariga qoʻyiladigan cheklovlar bo‘lib, ma’lumotlarning yaxlitligi, aniqligi va xavfsizligini ta’minlash uchun ishlatiladi.
--1. not null
create table Const1
(PassportSerie int not null, Salary int)
insert into Const1 values (1333356, 1350) --ishlaydi chunki null qqiymat yo'q
insert into Const1(Salary) values (1250) -- ishlamaydi chunli PassportSerie not null qabul qilmaydi
--insert into Const1 values (null,1250)  = insert into Const1(Salary) values (1250)


-- Unique --> Ustundagi barcha qiymatlar yagona (noyob) bo‘lishini talab qiladi.
create table const2 
select * from Const2
(ID int unique, name varchar(50))
insert into Const2 values (1,'Bob') -- ishlaydi
insert into Const2 values (2,null) -- ishlaydi
insert into Const2 values (1,'Rich') -- Xatolik bo'ladi chunki ID unique hisoblanadi
insert into Const2 values (3,'Bob') -- ishlaydi

alter table const2
add constraint UK_name unique (name ) --> ishlamaydi, biz name ni unique qilmoqchimiz lekin Bob name 2 ta.
delete from Const2 --> birinchi 2 ta bir xil name dan 1 tasini o'xhiramiz.
where id = 3

alter table const2
add constraint UK_name unique (name ) 

select 
	case when null = null then 'yes' else 'no' end

insert into Const2 values (4,'George')
insert into Const2 values (5,null)  --> ishlamaydi null ni faqat bir martta ishlatish mumkin Unique Key da.
insert into Const2 values (3,'Bob')

Alter table Const2
drop constraint [UK_name]
select * from Const2
insert into Const2 values (5,null)  --> check qilamiz --> ishladi

Alter table Const2
drop constraint [UQ__const2__3214EC26DE0564AE]
select * from Const2
insert into Const2 values (4,'Bob') --> check qilamiz --> ishladi


 -- Ham ID va ham Name ni unique qilish kerak, 1. Bob deganni unique qilishimiz kerak.
Alter table const2
add constraint UK_name_and_id unique (id, name)
insert into Const2 values (1,'George') -- ishlaydi chunki name bir xil lekin id bir xil emas.
insert into Const2 values (1,'Bob') -- ishlamaydi chunki id va name unique bo'lgan.
insert into Const2 values (null,null) --> ishladi
insert into Const2 values (null,null) --> ishlamaydi, chunki id va name bir xil, unique

 select * from Const2


 -- Primary Key ~ (unique + Not null) -  Jadvaldagi har bir yozuvni noyob tarzda aniqlash uchun ishlatiladi.
 create table const3 (U_id int primary key, dep_id int)
 select * from Const3
 insert into const3 values (23, 1)
 insert into const3 values (24,1)
 insert into const3 values (23,2) --> ishlamaydi, chunki U_id primary key yani unique
 insert into const3 values (25,2)
 insert into const3 values (null,2) --> ishlamaydi chunki primary key null ni qabul qilmaydi, unique key esa faqat 1 ta null ni qabul qiladi.

 Alter table Const3
 add constraint UK_depid primary key (dep_id) --> ishlamaydi chunki const3 table da duplicate dep_id lar borr.

 delete from const3
 where U_id = 24  --> 1 ta dublicate ni o'chiramiz.

 
 Alter table Const3
 add constraint UK_depid primary key (dep_id) --> Primary key ni kirita ololmaymiz chunki 1 ta table da 1 ta primary key bo'lishi mumkin.

 Alter table Const3
 drop constraint [PK__const3__5A396513933D54DD] --> Primary key ni o'chiramiz keyin id va dep birlashmasiga umumin primary key berishimiz mumkin.

 Alter table Const3
 add constraint PK_depid primary key (dep_id)--> qo'sha olmaymiz chunki dep_id ni table yaratganimizda null qabul qiladigan qilib yaratganmiz.

 Alter table [Const3] --> 1)
 Alter column dep_id integer not null ---> 2) Dep_id column ni null qabul qilmaydiganga o'zgartirish.

 Drop table Const3
 create table const3 (U_id int primary key, dep_id int  not null)
 select * from Const3

Delete from Const3
where U_id = 24

 Alter table Const3
 add constraint PK_depid primary key (dep_id)

 Alter table Const3
 drop constraint [PK__const3__5A39651365A5BA4E]

 Alter table Const3
 add constraint PK_uid_depid primary key (U_id, dep_id)
 insert into Const3 values  (21,1)
 insert into Const3 values  (25,3)
 insert into Const3 values  (21,1) --> Primary key U_id va dep_id bir duplicate bo'lishi mumkin emas.
 insert into Const3 values  (25,null) --> primary key null qabul qilmaydi.
