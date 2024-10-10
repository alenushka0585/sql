-- ALTER TABLE
-- Используется для:
-- 1. для удаления, добавления и изменения полей (столбцов) в таблицеa
-- 2. для добавления и удаления существующих ограничений (констрейнтов) в таблице

-- Добавить новое полеa
alter table products
add column country varchar(128) default 'Germany';

alter table products
add column country varchar(128);

-- Удалить поле
alter table products
drop column country;

-- Переименовать поле
alter table products
rename column country to product_country;

-- Переименовать поле и возможно поменять тип данных
alter table products
change product_country country varchar(128);

-- Изменить поле (тип данных, дефолтное значение, добавить constrain и все без переименования)
alter table products
modify column quantity int;

-- Добавить Check
alter table products
add check (price >= 5);

-- Удалить check
alter table products
drop check products_chk_2;

-- ПРАКТИКА 1

/*
1) необходимо создать таблицу students с полями

— id первичный ключ автоинкремент
- name строка 128 байт (не null)
- lastname строка 128 байт  (не null)
- avg_mark (от 0 до 5)
- gender varchar(128) (или “M” или “F”)


2) добавить 5 записей студентов

Олег Петров 4.3 M
Семен Степанов 3.1 M 
Ольга Семенова 4.7 F 
Игорь Романов 3.1 M 
Ирина Иванова 2.2 F

*/

-- 3) Проверить содержимое таблицы
create table students (
	id int primary key auto_increment,
	name varchar(128) not null,
    last_name varchar(128) not null,
	avg_mark numeric(2, 1) check(avg_mark between 0 and 5),
    gender varchar(128) check(gender in ("M","F"))
    );
    
insert into students(firstname, lastname, avg_mark, gender) values ("Олег", "Петров", 4.3,    "M");
insert into students(firstname, lastname, avg_mark, gender) values ("Семен", "Степанов", 3.1, "M");
insert into students(firstname, lastname, avg_mark, gender) values ("Ольга", "Семенова", 4.7, "F");
insert into students(firstname, lastname, avg_mark, gender) values ("Игорь", "Романов", 3.1,  "M");
insert into students(firstname, lastname, avg_mark, gender) values ("Ирина", "Иванова", 2.2,  "F");

-- 4. Переименовать поле name на firstname

alter table students
rename column last_name to lastname;

select * from students;

-- 5. У поля gender изменить тип данных на char(1)
alter table students
modify column gender char(1);


-- 6. Всем учащимся увеличить оценку avg_mark в 10 раз
set sql_safe_updates = 0;

alter table students
modify column avg_mark numeric(3, 1);

alter table students
drop check students_chk_1;

update students
set avg_mark = avg_mark * 10;

-- 7. У Олега Петрова сменить фамилию на Сидоров
update students
set lastname = 'Сидоров'
where firstname ='Олег' and lastname = 'Петров';

-- 8. У всех, у кого оценка не больше 31 увеличить оценку на 10
update students
set avg_mark = avg_mark + 10
where avg_mark <=31;

-- ПРАКТИКА 2

use airport;

-- 1. Аналитическое подразделение решило уточнить у авиакомпании количество билетов не бизнес-класса.
-- Напишите запрос, который выведет id билетов, класс обслуживания в которых отличен от бизнес-класса (Business).
-- В выборке должен присутствовать один атрибут —  id.

select
	id
from tickets
where service_class != 'Business';

-- 2. Напишите запрос, который выведет id клиентов, чье значение атрибута name начинается на Daria.
-- В выборке должен присутствовать один атрибут — id.

select
	id
from clients
where name like 'Daria%';


-- 3. Определите id рейсов, которые должны были вылететь из аэропорта Домодедово (DME), но были отменены.
-- В выборке должен присутствовать один атрибут — id.

select
	id
from trips
where departure = 'DME' and status = 'Cancelled';


-- 4. Определите имена и фамилии пассажиров, чьи идентификаторы заканчиваются на RCB или FCV, а номера телефонов не начинаются на +705.
-- В выборке должен присутствовать один атрибут — name.

select
	name
from clients
where (id like '%RCB' or id like '%FCV') 
and phone not like '+705%';


-- 5. Найдите коды всех рейсов, которые прибыли в пункт назначения и идентификатор которых начинаются на 'Y'. 
-- Название столбца в выборке должно быть flight. Отсортируйте выборку по коду рейса в порядке возрастания.
-- В выборке должен присутствовать один атрибут — flight.

select
	trip_code as flight
from trips
where status = 'Arrived' and id like 'Y%'
order by trip_code desc; 

-- orderd by ---- desc (убывание) или asc (возрастание)


-- 6. Выведите различные коды аэропортов, для перелетов в которые используется воздушное судно с идентификатором 00095579. 
-- Отсортируйте выборку по возрастанию.
-- В выборке должен присутствовать один атрибут — arrival.

select distinct
	arrival
from trips
where airliner_id = '00095579'
order by arrival; 


