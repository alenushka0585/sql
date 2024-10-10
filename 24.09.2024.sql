-- https://github.com/annykh/GT220124-e/tree/main
use hr;

-- SELF JOIN это когда таблица ссылается на саму себя
-- Вывести имена и фамилии сотрудников, а также имена и фамилии их менеджеров
select emp.first_name as emp_first_name, emp.last_name as emp_ast_name, 
mng.first_name as mng_first_name, mng.last_name as mng_last_name
from employees emp
join employees mng
on emp.manager_id = mng.employee_id;


-- Вывести имена и фамилии сотрудников, а также имена и фамилии их менеджеров, если сотрудник 
-- зарабатывает больше менеджера.
select emp.first_name as emp_first_name, emp.last_name as emp_ast_name, 
mng.first_name as mng_first_name, mng.last_name as mng_last_name
from employees emp
join employees mng
on emp.manager_id = mng.employee_id
where emp.salary > mng.salary;


-- АГРЕГАТНЫЕ ФУНКЦИИ - нельзя выводит поля, 
-- к которым не применяюся агрегатные функции в случае, 
-- если мы воводим саму агригатную функцию
-- AVG: вычисляет среднее значение
-- SUM: вычисляет сумму значений
-- MIN: вычисляет наименьшее значение
-- MAX: вычисляет наибольшее значение
-- COUNT: вычисляет количество строк в запросе

-- вывести максимальную зп из всех сотрудников
select max(salary)
from employees;

-- вывести мнимальную зп из всех сотрудников
select min(salary)
from employees;

-- вывести мнимальную зп из всех сотрудников
select max(salary) as max_salary, min(salary) as min_salary
from employees;

-- Bad practice
select first_name, last_name, min(salary), max(salary)
from employees;

-- вывести сумму зарплат всех сотрудников компании
select sum(salary)
from employees;

-- вывести среднюю зарплату сотрудников компании
select avg(salary)
from employees;

-- вывести кол-во сотрудников компании
select count(employee_id)
from employees;

-- вывести кол-во строк в таблице (или запросе)
select count(*)
from employees;

-- Найти максимальную зарплату среди сотрудников из департамента Sales
select max(t1.salary)
from employees t1
join departments t2
on t1.department_id = t2.department_id
where t2.department_name = 'Sales';

-- Найти средную зарплату среди сотрудников из департамента IT.
select avg(t1.salary)
from employees t1
join departments t2
on t1.department_id = t2.department_id
where t2.department_name = 'IT';

-- Найти кол/во сотрудников из департамента 'Shipping', которые зарабатывают больше 5000.
select count(*)
from employees t1
join departments t2
on t1.department_id = t2.department_id
where t2.department_name = 'Shipping'
and t1.salary > 5000;


-- SUBSELECT/ПОДЗОПРОСЫ

-- select <column_name>, ...
-- from (
--     	select <column_name, ...
--     	  from <tabele_name>
--        ...
-- ) t1


-- select <column_name>, ...
-- from <table_name>
-- ...
-- where <column_name> = (
-- 		select aggregate(<column_name>)
-- 		from <table_name>
-- )


-- Вывести имя и фамилию сотрудника с максимальной зарплатой
select first_name, last_name, salary
from employees
where salary = (
	select max(salary)
    from employees
);


-- Найти сотрудников, у которых зарплата меньше средней зарплаты по компании
-- Вывести имя, фамилию и зарплату.
select first_name, last_name, salary
from employees
where salary < (
	select avg(salary)
    from employees
);


-- Найти кол/во сотрудников, у которых зарплата меньше средней зарплаты по компании
select count(*)
from employees
where salary < (
	select avg(salary)
    from employees
);

-- Найти количество сотрудников из департамента IT, 
-- которые зарабатывают больше средней зарплаты по компании
select count(*)
from employees t1
join departments t2
on t1.department_id = t2.department_id
where t2.department_name = 'IT' and
 salary > (
	select avg(salary)
    from employees
);

-- Найти количество департаментов, в которых никто не работает
select count(t1.department_id)
from departments t1
left join employees t2
on t1.department_id = t2.department_id
where t2.department_id is null;


-- Вывести список сотрудников с должностью "Programmer", 
-- которые получают зарплату выше средней зарплаты среди всех сотрудников с такой же должностью.
select t1.first_name, t1.last_name, t2.job_title, t1.salary
from employees t1
join jobs t2
on t1.job_id = t2.job_id
where t2.job_title = 'Programmer' and t1.salary > (
	select avg(t1.salary)
	from employees t1
	join jobs t2
	on t1.job_id = t2.job_id
	where t2.job_title = 'Programmer'
);



-- Д/З                                                    
-- Создать новую базу данных oe.

-- Скачать файл бд:
-- https://github.com/annykh/GT301023-e/blob/main/oe.sql

-- Имортировать базу:
-- Из меню workbench-а выбрать Server -> Data Import.
-- Выбрать Import from Dump Project Folder, нажать на ... и выбрать папку, где хранится база. После нажать на Start Import и обновить SCHEMAS.

-- ЗАДАЧИ:

-- Таблица - customers
-- 1. Вывести максимальный и минимальный credit_limit.
select max(CREDIT_LIMIT), min(CREDIT_LIMIT)
from customers;

-- 2. Вывести покупателей у которых credit_limit выше среднего credit_limit.
select CUST_FIRST_NAME, CUST_LAST_NAME, CREDIT_LIMIT
from customers
where CREDIT_LIMIT > (
		select avg(CREDIT_LIMIT)
        from customers);

-- 3. Найти кол/во покупателей имя которых начинается на букву 'D' и credit_limit больше 500.
select count(*)
from customers
where CUST_FIRST_NAME like ('D%') and CREDIT_LIMIT > 500;



-- Таблица - order_items
-- 4. Найти среднее значение unit_price
select avg(UNIT_PRICE)
from order_items;

-- Таблицы - order_items, product_information
-- 5. Вывести имена продуктов(PRODUCT_NAME), кол/во(QUANTITY) которых меньше среднего.
select t2.PRODUCT_NAME, t1.QUANTITY
from order_items t1
join product_information t2
on t1.PRODUCT_ID = t2.PRODUCT_ID
where t1.QUANTITY < (
			select avg(QUANTITY)
			from order_items
            );


-- Таблицы - orders, customers
-- 6. Вывести имя и фамилию покупателя с максимальной общей суммой покупки(ORDER_TOTAL).
select t1.CUST_FIRST_NAME, t1.CUST_LAST_NAME, t2.ORDER_TOTAL
from customers t1
join orders t2
on t1.CUSTOMER_ID = t2.CUSTOMER_ID
where t2.ORDER_TOTAL = (
					select max(ORDER_TOTAL)
                    from orders
                    );


-- 7. Найти сумму общей суммы покупок(ORDER_TOTAL) всех мужчин покупателей.
select sum(t1.ORDER_TOTAL)
from orders t1
join customers t2
on t1.CUSTOMER_ID = t2.CUSTOMER_ID
where GENDER = 'M';