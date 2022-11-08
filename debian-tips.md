

## Key problem
```
apt-get install debian-archive-keyring
```
## PHP install
```
sudo apt-get install -y php7.4-{bcmath,bz2,intl,gd,mbstring,mysql,zip,common,xml,curl,cgi,cli,fpm,imap,ldap,mongodb,soap}
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
### Python dependency conflict

```
sudo rm /usr/share/python3/runtime.d/*
sudo rm /usr/lib/valgrind/*
sudo apt purge  python3
sudo apt-get -f install
sudo apt install python3 --fix-missing
sudo apt-get update && sudo apt-get upgrade && sudo apt-get autoremove
```

### Terminal powerline pyhton problem
- Error
```
bash: /usr/local/bin/powerline-daemon: python: bad interpreter: No such file or directory
bash: /usr/local/bin/powerline-config: python: bad interpreter: No such file or directory
bash: /usr/local/bin/powerline-config: python: bad interpreter: No such file or directory

```
- Solution

```
pip3 uninstall powerline_shell
pip3 install powerline_shell
```

### Screen cast video Gnome 3
```
gsettings set org.gnome.settings-daemon.plugins.media-keys max-screencast-length 60
```
With value 60 , it sets video screen cast duration to 60 second \
Without value 60, it displays current value. 

**Shortcut : CTRL+ALT+SHIFT+R**
