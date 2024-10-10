create database group_220124;
use group_220124;

-- Cоздать таблицу с первичным ключом с автоинкрементом

create table products (
	id int primary key auto_increment,
	title varchar(128) not null,
	quantity int check (quantity >=0),
    price numeric (5,2) default 10.33
);

insert into products (title, quantity, price) value ('Aple', 3, 55.01);
insert into products (title, quantity, price) value ('Orange', 8, 102.06);
insert into products (title, quantity, price) value ('Kiwi', 1, 87.09);
insert into products (title, quantity, price) value ('Banana', 9, 32.98);
insert into products (title, quantity) value ('Lemon', 6);
insert into products (title) value ('Lime');
insert into products (title) value ('Pineapple');

select * from products;

drop table products;

-- Удалить строку 4
delete from products
where id = 4;

-- Удалить все продукты, количесто которых >=5
delete from products
where quantity >=5;

-- Отключить безопасный режим, подключается обратоно после перезагрузки
set sql_safe_updates = 0;
 
-- Подключить безопасный режим
set sql_safe_updates = 1;

-- Удалить все строки из таблицы
delete from products;

-- Сбросить таблицу до исходного состояния + обнуление автоинкремента
truncate products;


-- У продукта с Id 6 в gоле quantity добавить значение 5
update products
set quantity = 5
where id = 6;

-- Всем продуктам дороже 80 увеличить quantity на 10
update products
set quantity = quantity + 10
where price >= 80;

create database hr;

use hr;

-- найти всех работников (имя, фамилия, зарплата), зарабатывающих >= 10 000employeesemployees
select 
	first_name, 
    last_name,
    salary
from employees
where salary >= 10000;

-- найти всех работников (имя, фамилия, commission_pct), у которых commission_pct отсутствуетalter
select 
	first_name, 
    last_name,
    commission_pct
from employees
where commission_pct is null;

-- найти всех работников (имя, фамилия, зарплата), зарабатывающих между 5 и 10 тыщ и в чьих фамилиях есть буква O
select 
	first_name, 
    last_name,
    salary
from employees
where salary between 5000 and 10000 
and last_name like '%o%';

create database airport;

use airport;

-- клиент имеет билеты из точки А в точку Б. Однако есть важное условие - стоимость билета не должна превышать 13200.
-- Напишите запрос, который выведет id билетов стоимость которых меньше или равна 13200
-- в выборке должен присутствовать один атрибут id

select
	id
from tickets
where price <= 13200;


-- 2. Выведите коды всех рейсов, в рамках которых воздушные судна вылетели из Москвы и в данный момент находятся в воздухе (статус таких рейсов —  departed). 
-- Коды аэропортов Москвы: SVO, VKO, DME.
-- В выборке должен присутствовать один атрибут — trip_code.

select
	trip_code
from trips
where departure in ('SVO', 'VKO', 'DME')
and status = 'Departed';


-- 3. Выведите бортовые номера и дальность полета всех ближне- и дальнемагистральных самолетов. 
-- Примечание: ближнемагистральными считайте те, дальность полета которых > 1000 км и <= 2500 км. 
-- Дальнемагистральными — с дальностью полета >= 6000 км.
-- В выборке должны присутствовать два атрибута — side_number и range.

select
	side_number,
    range_
from airliners
where (range_ > 1000 and range_<= 2500) 
or range_ >= 6000;


-- 4. В таблице tickets повреждена часть данных, из-за этого идентификаторы некоторых рейсов приняли значение NULL. 
-- Выведите все номера билетов с измененными номерами рейсов.
-- В выборке должен присутствовать один атрибут — id.

select
	id
from tickets
where trip_id is null;

-- ДЗ:
-- 1. Выведите идентификаторы билетов бизнес-класса дешевле 65 000 и экономкласса дороже 15 000. 
-- Исключите из выборки билеты рейсов VR5SF5YIWN, OZAO28DLFP и LL4S1G8PQW, так как для них ценовая политика не меняется.
-- В выборке должен присутствовать один атрибут — id.

-- 2. Найдите данные обо всех билетах с классом обслуживания не Economy и не Business. 
-- Таблица tickets может содержать значения NULL. 
-- В выборке должны присутствовать два атрибута — id, trip_id.

-- 3. Номера некоторых билетов рейса RL6EC4YWB1 внесены в базу некорректно: два последних символа билетов серии UE01H8UCJQXX введены неправильно. 
-- То есть на месте символов XX находятся некорректные значения. 
-- Номера некоторых билетов имеют значение NULL. 
-- Найдите идентификаторы пассажиров всех некорректно введенных билетов.
-- В выборке должен присутствовать один атрибут — client_id.

