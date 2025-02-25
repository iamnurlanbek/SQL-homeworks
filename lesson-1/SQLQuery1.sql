create database F21_lesson1
use F21_lesson1 -- This makes us work on the database F21_lesson

--create table SD2 (id int)
--select * from SD
-- Comment Out --
/* 
Comment Out 
*/

/* SQL Command, There are 5 commands */

-- DQL - Data Query Language
--1. Select
select 1+3
select 'Hello World'
select 'Hello ' + ' World'

--select * ((*)barcha ma'lumotlarni olib beradi) from SD
--select id from SD (*) = id, name, age, salary

Select @@SERVERNAME -- Qaysi Server bilan ishlayotganimni olib chiqb beradi
select 5*5/5+5-5

select 'Asadbek' as (optioanl) FirstName
select 'Nasriddinov' SecondName, 'ALi' FirstName  --Server yaratilmayapti, faqat resultda chiqyapti


-- Case insensitive - katta yoki kichik harf bilan yozish axamiyatsiz --
--SeLecT 

--10-5+8

select GETDATE() -- Hozirgi vaqtni olib beradi

-- DDl - Data Definition Language --
--1. Create - Databasa, table, object yaratish u-n
--2. Alter - Tablitsaga ustun qo'shish, o'zgartirish yoki ochirish u-n ishlatiladi.
--3. Truncate -TRUNCATE buyrug‘i jadval ichidagi barcha qatorlarni o‘chiradi, lekin jadval tuzilmasi o‘zgarishsiz qoladi.
--4. Drop - DROP buyrug‘i jadval, ma’lumotlar bazasi yoki indeksni butunlay o‘chiradi. ❗ Muhim: DROP buyruği barcha ma’lumotlarni qayta tiklash imkoni bo‘lmagan holda o‘chiradi!

--1. Create
create table Students (id int, [name] varchar(10), age int)
select * from Students

--2. Alter
Select * from Students

Alter table Students 
add Salary int

Alter table Students
add age int

Alter table Students
drop column age

sp_rename 'Students.name', 'FullName', 'Column' -- tabledagi columni nomini ishlatish uchun ishlatiladi.


--3. Truncate
select * from Students

insert into Students values (1, 'John Wick', 10)
insert into Students values (2, 'Black Rock', 13)

truncate table Students

--4. Drop 
Drop table Students

-- DMl - Data Manipulation Language --
--1. Insert -- Jadvalga yangi ma’lumot qo‘shish. ⚠️ Eslatma: Ustunlar jadvaldagi tartib bilan to‘g‘ri mos kelishi kerak!
--2. Update -- Mavjud yozuvni o‘zgartirish. ⚠️ Agar WHERE sharti bo‘lmasa, barcha qatorlar o‘zgaradi!
--3. Delete -- Ma’lumotni o‘chirish. ⚠️ Bu butun jadvalni tozalaydi! Agar faqat ba’zi yozuvlarni o‘chirish kerak bo‘lsa, WHERE shartini ishlatish muhim!

--1. Insert
select * from Students

insert into Students values (3, 'John Bob', 10)
insert into Students values (2, 'Harry Jack', 15)

insert into Students values (5, 'Dale', 18), (6, 'Eriksen', 21)

select * into Copy_students from Students -- Tabledan copy oladi, strukturasini oladi

drop table Copy_students

select * from Copy_students

--3. Delete
select * from Copy_students

delete from Copy_students 
where age = 10

delete from Copy_students
where age = 18

delete from Copy_students
where age = 21

delete from (optional) Copy_students -- faqat buni o'zini o'chirsak column siz hammasini o;chirib tashlaydi. truncate ni ishini qiladi.
where id = 7

--3. Update --> UPDATE operatori SQLda jadvaldagi mavjud ma'lumotlarni yangilash uchun ishlatiladi. U faqat tanlangan qatorlarni yoki butun ustunni yangilashi mumkin
select * from Copy_students

insert into Copy_students values (7, 'Bop', 12)
insert into Copy_students values (7, 'Bob', 12)

update copy_students
set name = 'Bob'
where name = 'Bop'

delete  Copy_students -- faqat buni o'zini o'chirsak column siz hammasini o;chirib tashlaydi. truncate ni ishini qiladi.
where id = 7

delete copy_Students
where id = 5

delete copy_Students
where id = 6

-- DCL - Data Control Language --
--1. Grant
--2. Revoke

---- TCl - Transaction Control Language --
--1. Begin -- Bu buyruq tranzaksiyani boshlaydi, lekin o‘zgarishlarni darhol saqlamaydi. ✅ Ma’lumotlar bazasi hali o‘zgarmaydi, chunki COMMIT bajarilmagan.
--2. Rollback --  tranzaksiyani bekor qilish. Bu buyruq barcha o‘zgarishlarni bekor qiladi, ya’ni UPDATE bajaringan bo‘lsa ham, avvalgi holat tiklanadi.
--3. Commit -- o‘zgarishlarni saqlash. Shundan so‘ng, barcha o‘zgarishlar butunlay bazada saqlanadi va ROLLBACK ishlatib bo‘lmaydi.


select * from Copy_students

Begin tran
delete from copy_students
where age <= 15

rollback tran

begin tran
delete from copy_students
where age < 15
commit tran

select * from Students
where id <> 3

select * from Students
where id != 3




