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
## Get Database size in Mo
```sql
SELECT table_schema "database_name",
        ROUND(SUM(data_length + index_length) / 1024 / 1024, 1) "DB Size in MB" 
FROM information_schema.tables 
GROUP BY table_schema; 
```
