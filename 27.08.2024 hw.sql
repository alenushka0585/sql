-- ДЗ:

use airport;

-- 1. Выведите идентификаторы билетов бизнес-класса дешевле 65 000 и экономкласса дороже 15 000. 
-- Исключите из выборки билеты рейсов VR5SF5YIWN, OZAO28DLFP и LL4S1G8PQW, так как для них ценовая политика не меняется.
-- В выборке должен присутствовать один атрибут — id.

select
	id
from tickets
where (service_class = 'Business' and price < 65000)
or (service_class = 'Economy' and price < 15000)
and trip_id not in ('VR5SF5YIWN', 'OZAO28DLFP', 'LL4S1G8PQW');


-- 2. Найдите данные обо всех билетах с классом обслуживания не Economy и не Business. 
-- Таблица tickets может содержать значения NULL. 
-- В выборке должны присутствовать два атрибута — id, trip_id.

select
	id,
    trip_id
from tickets
where service_class not in ('Economy', 'Business')
or service_class is null;

-- 3. Номера некоторых билетов рейса RL6EC4YWB1 внесены в базу некорректно: два последних символа билетов серии UE01H8UCJQXX введены неправильно. 
-- То есть на месте символов XX находятся некорректные значения. 
-- Номера некоторых билетов имеют значение NULL. 
-- Найдите идентификаторы пассажиров всех некорректно введенных билетов.
-- В выборке должен присутствовать один атрибут — client_id.

select
	client_id
from tickets
where trip_id = 'RL6EC4YWB1'
and (id like 'UE01H8UCJQ__' or id is null);

