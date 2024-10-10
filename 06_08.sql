-- 1. Вывести имя и фамилию пользователей старше 24 (>) и чье имя содержит букву o

select 
	first_name, 
    last_name
from customers
where first_name like '%o%' and age > 24;


-- 2. Найти всех сотрудников (имя, фамилию, job_id) c job_id = IT_PROG

select
	first_name,
	last_name,
	job_id
from employees
where job_id = 'IT_PROG';

-- 3. Найти всех сотрудников (имя, фамилию, зп) с зп больше 10 000

select
	first_name,
	last_name,
	salary
from employees
where salary > 10000;


-- 4. Найти всех сотрудников (имя, фамилию, зп) с зп от 10 000 до 20 000 (включая концы)

select
	first_name,
	last_name,
	salary
from employees
where salary between 10000 and 20000;


select
	first_name,
	last_name,
	salary
from employees
where salary >= 10000 and salary <= 20000;


-- 5. Найти всех сотрудников (имя, фамилию, айди департамента) 
-- не из 60, 30 и 100 департаментов

select
	first_name,
	last_name,
	department_id
from employees
where department_id not in (60, 30, 100);


-- 6. Найти всех сотрудников (имя, фамилию), 
-- у которых есть две буквы ll подряд в середине имени

select 
	first_name,
    last_name
from employees
where first_name like '%_ll_%';


select 
	first_name,
    last_name
from customers
where last_name like '_o%';


-- 7. Найти всех сотрудников (имя, фамилию), у которых фамилия кончается на a
 
select 
	first_name,
    last_name
from employees
where last_name like '%a';


-- 8. Вывести всех сотрудников (имя, фамилию, manager_id), у которых в manager_id null

select 
	first_name,
    last_name,
    manager_id
from employees
where manager_id is null;


-- 9. Из таблицы Customers достать список уникальных имен

select distinct
	first_name
from customers;


-- 10. Из таблицы Customers достать список уникальных имен + фамилий

select distinct
	first_name,
    last_name
from customers;


-- 11. Найти все имеющиеся job_id

select distinct
	job_id
from employees;


-- 12. Найти job_id у которых нет COMMISSION_PCT или зп у сотрудника меньше 3000
 
select distinct
	job_id
from employees
where COMMISSION_PCT is null or salary < 3000;







