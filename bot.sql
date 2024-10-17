GRANT ALL PRIVILEGES ON bot.* TO 'root'@'localhost';

FLUSH PRIVILEGES;

ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'Yarina1512';

truncate table user_subscriptions;
truncate table user_roles;
SET FOREIGN_KEY_CHECKS = 0;  -- Отключаем проверку внешних ключей
truncate table users;
truncate table subscriptions;
truncate table roles;
SET FOREIGN_KEY_CHECKS = 1;  -- Включаем проверку внешних ключей