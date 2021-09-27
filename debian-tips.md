

## Key problem
```
apt-get install debian-archive-keyring
```
## PHP install
```
sudo apt-get install -y php7.4-{bcmath,bz2,intl,gd,mbstring,mysql,zip,common,xml,curl}
```
## The metadata storage is not up to date, please run the sync-metadata-storage 
Get mariadb version and put in your configuration file
```
DATABASE_URL="mysql://heniroger:heni1234@127.0.0.1:3306/pif?serverVersion=mariadb-10.3.29"
```
