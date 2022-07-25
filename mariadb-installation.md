# Mariadb Installation 

## Installation
```bash
$ sudo apt-get update
$ sudo apt-get install mariadb-server
$ sudo systemctl status mariadb
```
## Mysql secure installation 
```bash
$ sudo mysql_secure_installation
```
After configuring your mysql , type :
```bash
$ mysql -uroot -p
```
Another way to connect to database
```bash
$ mysql -u<username> -p<password> <database_name>
$ # Examples
$ mysql -uroot -proot my_db # With password
$ mysql -uroot -p my_db # With password but type in next prompt
$ mysql -uroot my_db # Without password


```
## Mysql 8 Native password (For docker)
```sql
CREATE USER 'username'@'localhost'IDENTIFIED WITH mysql_native_password BY 'password';
-- OR 
CREATE USER 'username'@'%'IDENTIFIED WITH mysql_native_password BY 'password';
```
In my.cnf file :
```ini
[mysqld]
default-authentication-plugin = mysql_native_password
```
## Mysql grant all privileges to a new user
Create a new user : **username**
```sql
CREATE USER 'username'@'%' IDENTIFIED BY 'password';
```
Grant all privileges
```sql
GRANT ALL PRIVILEGES ON *.* TO 'username'@'%';
FLUSH PRIVILEGES;
```
Revoke all privileges
```sql
REVOKE ALL PRIVILEGES ON *.* FROM 'username'@'%';
FLUSH PRIVILEGES;
```
## Get Database size in Mo
```sql
SELECT table_schema "database_name",
        ROUND(SUM(data_length + index_length) / 1024 / 1024, 1) "DB Size in MB" 
FROM information_schema.tables 
GROUP BY table_schema; 
```
## Export Database
```bash
 $ mysqldump db_name > backup_file.sql
```
## Import Database
- UNIX
```bash
$  mysql db_name < backup_file.sql
```
- SQL Query
```sql
USE db_name;
SOURCE backup_file.sql;
```
## Execute Shell Command via Mysql prompt
```bash
mysql> \! ls -l
# OR
mysq> SYSTEM ls -l
```
## Update query with INSERT INTO
```sql
INSERT INTO `notification` (`id`, `title`,  `created_at`, `updated_at`) VALUES
(7, 'Title update #1', '2021-01-09 20:29:28', '2021-01-09 20:29:28'),
(8, 'Title update #2',  '2021-01-09 20:29:28', '2021-01-09 20:29:28'),
(9, 'Title update #3',  '2021-01-09 20:29:28', '2021-01-09 20:29:28'),
(10, 'Title update #4',  '2021-01-09 20:29:28', '2021-01-09 20:29:28')
ON DUPLICATE KEY UPDATE 
        `id` = VALUES(`id`),  -- field 1 to update foreach row
        `title` = VALUES(`title`), -- field 2 to update foreach row
        `created_at` = VALUES(`created_at`), -- field 3 to update foreach row
        `updated_at` = VALUES(`updated_at`);-- field 4 to update foreach row
```
