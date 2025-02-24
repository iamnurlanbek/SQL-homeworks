Create database F21_class4
Use F21_class4
-- Create the SampleData table
CREATE TABLE SampleData (
    ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    Country VARCHAR(50),
    SignupDate DATE
);

-- Insert 20 rows of sample data
INSERT INTO SampleData (ID, Name, Age, Country, SignupDate) VALUES
(1, 'Alice', 30, 'USA', '2024-01-01'),
(2, 'Bob', 28, 'Canada', '2024-01-05'),
(3, 'Charlie', 35, 'UK', '2024-01-10'),
(4, 'Diana', 22, 'USA', '2024-01-15'),
(5, 'Edward', 40, 'Germany', '2024-01-20'),
(6, 'Fiona', 29, 'Australia', '2024-01-25'),
(7, 'George', 31, 'USA', '2024-02-01'),
(8, 'Hannah', 27, 'Canada', '2024-02-05'),
(9, 'Ian', 36, 'UK', '2024-02-10'),
(10, 'Julia', 33, 'USA', '2024-02-15'),
(11, 'Kevin', 26, 'USA', '2024-02-20'),
(12, 'Laura', 38, 'Canada', '2024-02-25'),
(13, 'Michael', 42, 'UK', '2024-03-01'),
(14, 'Nina', 24, 'USA', '2024-03-05'),
(15, 'Oliver', 39, 'Germany', '2024-03-10'),
(16, 'Paula', 30, 'Australia', '2024-03-15'),
(17, 'Quincy', 37, 'USA', '2024-03-20'),
(18, 'Rachel', 28, 'Canada', '2024-03-25'),
(19, 'Steve', 45, 'UK', '2024-03-30'),
(20, 'Tina', 32, 'USA', '2024-04-01');

select * from SampleData

 ---- top -->
 Select top 10 name from SampleData
 Select top 10 *  from SampleData

 Select * from SampleData order by Age desc

 Select top 5 * from SampleData order by Age desc

 Select top 10 percent *
 from SampleData order by Age desc

 Select top 13 percent *
 from SampleData order by Age desc

 Select top 11 percent *
 from SampleData order by Age desc


 -- Offset fetch -->  qator tashlab ketish uchun ishlatiladi
 Select * from  SampleData
 order by Age desc
 offset 5 rows

 Select * from SampleData
 order by age desc
 offset 5 rows
 fetch next 10 rows only

 Select top 3 * from SampleData --> top xxx
 order by Age desc
 offset 2 rows

  Select * from SampleData --> top xxx
 order by Age desc
 offset 2 rows
 fetch next 1 rows only

 -- Distinct --> unique qiymatlar
 Select * from SampleData

 Select distinct country from SampleData

 Select distinct age from SampleData	

  Select distinct age, country from SampleData

  -- isnull --
  INSERT INTO SampleData (ID, Name, Age, Country, SignupDate) VALUES
(21, null, 30, 'USA', '2024-01-01'),
(22, 'Bob', null, null, '2024-01-05')

Select isnull (name, 'Not available') from SampleData

create table emails ( email1 varchar(30), alternative_email varchar(30))
insert into emails values ('bob@gmail.com','alex@gmail.com')
insert into emails values (null,'apex@gmail.com')
insert into emails values ('bobby@gmail.com',null)
insert into emails values (null,'dele@gmail.com')
insert into emails values ('bob@gmail.com',null)

drop table emails

Select coalesce(email1, alternative_email, 'No email found')