-- Однострочный комментарийalter
/* 
Многострочный
комментарий
*/ 

-- Работа с БД

-- Создать БД

create database group_260324;

-- Удалить БДalter
drop database group_260324;

-- Выбрать БД в качестве текущейalter
use group_260324;

-- РАБОТА С ТАБЛИЦАМИ

-- Типы данных
/*
int / integer
decimal / numeric дробное число (всего, кол-во после запятой)
varchar - строка (длина строки в байтах)
char - строка с определенным количеством символов ()
*/

-- Ограничения на поля / констрейнты (constraints)
/*
NOT NULL
UNIQUE
PRIMARY KEY - поле или сочетание полей, 
по которому можно однозначно идентифицировать строку в таблице (NOT NULL + UNIQUE)
CHECK - значение соответствует условию

*/

-- Создать таблицу
create table users (
	id int primary key,
	first_name varchar(64) check (first_name like 'o%'),
	last_name varchar(64),
	age int check(age >= 18 and age !=30),
	score numeric(5,2),
	gender char(1) check (gender in ('m', 'f'))
);

-- Удалить таблицу
drop table users;

-- Добавить строку в таблицу
insert into users 
(id, first_name, last_name, age, score) values 
(1, 'Oleg', 'Ivanov', 43, 123.09);

insert into users 
(id, first_name, last_name, age, score) values 
(2, 'Onna', 'Petrova', 31, 333.000);

insert into users 
values 
(3, 'Irina', 'Ushanova', 32, 4.17);

insert into users 
(id, first_name, last_name, age) values 
(4, 'Igor', 'Sidorov', 55);

-- Проверить содержание таблицы
select * from users;

-- ПРАКТИКА

/*
1.Создать таблицу goods (товары) с полями:

- id (первичный ключ)
- title (cтрока максимум 30 символов)
- quantity (целое число больше или равно 0)
- price дробное число - 6 цифр, две после запятой, not null
- in_stock (символ (Y/N))

2. Заполните созданную таблицу данными, минимум 10 строк.
*/
create table goods (
	id int primary key,
	title varchar (30),
	quantity int check (quantity >= 0),
	price numeric(6,2) not null,
	in_stock char(1) check (in_stock in ('Y', 'N'))
);

insert into goods (id, title, quantity, price, in_stock) values (1, 'Table', 5, 250, 'Y');
insert into goods (id, title, quantity, price, in_stock) values (2, 'Lamp', 0, 20.5, 'N');
insert into goods (id, title, quantity, price, in_stock) values (3, 'Book', 10, 10.55, 'Y');
insert into goods (id, title, quantity, price, in_stock) values (4, 'Pen', 45, 1, 'Y');
insert into goods (id, title, quantity, price, in_stock) values (5, 'Apple', 10, 3.2, 'Y');
insert into goods (id, title, quantity, price, in_stock) values (6, 'Pineapple', 25, 4.8, 'Y');
insert into goods (id, title, quantity, price, in_stock) values (7, 'Bed', 0, 500, 'N');
insert into goods (id, title, quantity, price, in_stock) values (8, 'Desk', 25, 255, 'N');
insert into goods (id, title, quantity, price, in_stock) values (9, 'Banana', 55, 2.6, 'Y');
insert into goods (id, title, quantity, price, in_stock) values (10, 'Orange', 35, 22.6, 'Y');


-- 4. Вывести все товары, цена которых больше или равна 100
select 
	* 
from goods
where price >= 100;

-- 5. Вывести все товары, в названии которых есть буква a и цена которых меньше или равна 70
select 
	* 
from goods
where title like '%a%' and price <=70;

-- 6. Вывести название и цену всех товаров, которые есть на складе
select 
	title, 
    price 
from goods
where in_stock = 'Y';

drop table goods;