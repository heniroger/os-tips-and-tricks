

## Key problem
```
apt-get install debian-archive-keyring
```
## PHP install
```
sudo apt-get install -y php7.4-{bcmath,bz2,intl,gd,mbstring,mysql,zip,common,xml,curl,cgi}
```
## The metadata storage is not up to date, please run the sync-metadata-storage 
Get mariadb version and put in your configuration file
```
DATABASE_URL="mysql://heniroger:heni1234@127.0.0.1:3306/padf?serverVersion=mariadb-10.3.29"
```

## Apache php conflict
```
sudo a2dismod php7.2
sudo a2enmod php7.4
sudo service apache2 restart
```
