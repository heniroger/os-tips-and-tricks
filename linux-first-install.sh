#!/bin/bash


# Php version
PHP_VERSION=8.2

# Docker stable name , uncomment the next line to load your current  debian version name
#DOCKER_CODE_NAME=$(. /etc/os-release && echo "$VERSION_CODENAME")
DOCKER_CODE_NAME=bookworm

#DEBIAN_STABLE_VERSION=$(lsb_release -cs)
DEBIAN_STABLE_VERSION=bookworm


printf '\033[32m =================UPGRADE SYSTEM ================ \033[0;39m \n' 
sudo apt-get update  -y  
sudo apt-get upgrade  -y
sudo apt-get full-upgrade  -y

printf '\033[32m =================APT TRANSPORT AND CERTIFICATES ================ \033[0;39m \n' 
sudo apt-get install software-properties-common apt-transport-https curl ca-certificates  gpg -y

printf '\033[32m =================BUILD ESSENTIAL ================ \033[0;39m \n' 
sudo apt-get install -y build-essential  libssl-dev 
printf '\033[32m =================FLEX ================ \033[0;39m \n' 
sudo apt-get install -y flex
printf '\033[32m =================CURL================ \033[0;39m \n' 
sudo apt-get install -y curl
printf '\033[32m =================WGET================ \033[0;39m \n'
sudo apt-get install -y wget
printf '\033[32m =================GIT================ \033[0;39m \n'
sudo apt-get install -y git
printf '\033[32m =================SVN================ \033[0;39m \n'
sudo apt-get install -y subversion
printf '\033[32m =================SSH================ \033[0;39m \n'
sudo apt-get install -y openssh-server
printf '\033[32m =================APACHE2================ \033[0;39m \n'
sudo apt-get install -y apache2


printf '\033[32m =================PHP ================ \033[0;39m \n'
sudo add-apt-repository -y ppa:ondrej/php
sudo apt-get -y update
sudo apt install apt-transport-https lsb-release ca-certificates wget -y
sudo wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
PHP_REPOS="deb https://packages.sury.org/php/ $DEBIAN_STABLE_VERSION main"
sudo sh -c "echo $PHP_REPOS > /etc/apt/sources.list.d/php.list"
sudo apt-get-y update
sudo apt-get install -y php$PHP_VERSION-{bcmath,bz2,intl,gd,mbstring,mysql,zip,common,xml,curl,cgi,cli,fpm,imap,ldap,mongodb,soap,pcov,xdebug,readline}
sudo apt-get install -y libapache2-mod-php$PHP_VERSION
sudo apt-get install -y libapache2-mod-fcgid
sudo a2enmod php$PHP_VERSION
sudo a2enconf php$PHP_VERSION-fpm
sudo a2enmod rewrite
sudo a2enmod proxy_fcgi setenvif
sudo service apache2 restart
sudo apachectl configtest

printf '\033[32m =================COMPOSER ================ \033[0;39m \n'
sudo apt-get install composer -y
printf '\033[32m =================SYMFONY CLI ================ \033[0;39m \n'
curl -1sLf 'https://dl.cloudsmith.io/public/symfony/stable/setup.deb.sh' | sudo -E bash
sudo apt-get update -y
sudo apt-get install -y symfony-cli

printf '\033[32m =================PHP-CS FIXER================ \033[0;39m \n'
composer global require friendsofphp/php-cs-fixer --dev
export PATH="$PATH:$HOME/.composer/vendor/bin"

printf '\033[32m =================PHP UNIT================ \033[0;39m \n'
composer global require phpunit/phpunit --dev

printf '\033[32m =================MYSQL ================ \033[0;39m \n'
sudo apt-get install -y mariadb-server
sudo systemctl start mariadb
sudo systemctl enable mariadb
sudo systemctl status mariadb
printf '\033[32m =================PHPMYADMIN ================ \033[0;39m \n'
sudo apt-get install -y phpliteadmin phpmyadmin adminer

printf '\033[32m =================NVM ================ \033[0;39m \n'
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash 
source ~/.bashrc
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
command -v nvm
printf '\033[32m =================NODE JS ================ \033[0;39m \n'
nvm install --lts
printf '\033[32m =================YARN ================ \033[0;39m \n'
curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor | sudo tee /usr/share/keyrings/yarnkey.gpg >/dev/null
echo "deb [signed-by=/usr/share/keyrings/yarnkey.gpg] https://dl.yarnpkg.com/debian stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update -y
sudo apt-get install -y yarn 

printf '\033[32m =================POSTGRES ================ \033[0;39m \n'
sudo apt-get install postgresql postgresql-contrib -y
sudo systemctl status postgresql
printf '\033[32m =================PHPGADMIN4 ================ \033[0;39m \n'
sudo echo "deb [arch=amd64 signed-by=/usr/share/keyrings/pgadmin4.gpg] https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$DEBIAN_STABLE_VERSION pgadmin4 main"\
| sudo tee /etc/apt/sources.list.d/pgadmin4.list
curl -fsSL https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo gpg --dearmor -o /usr/share/keyrings/pgadmin4.gpg
sudo apt-get update -y
sudo apt-get install -y pgadmin4-web

printf '\033[32m =================MONGODB ================ \033[0;39m \n'
sudo apt-get install -y gnupg curl
curl -fsSL https://www.mongodb.org/static/pgp/server-7.0.asc | \
   sudo gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg \
   --dearmor
echo "deb [ signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] http://repo.mongodb.org/apt/debian bullseye/mongodb-org/7.0 main" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list
sudo apt-get update -y
sudo apt-get install -y mongodb-org

printf '\033[32m =================REDIS ================ \033[0;39m \n'
sudo apt-get install redis -y
printf '\033[32m =================RABBIT MQ ================ \033[0;39m \n'
sudo apt-get -y install rabbitmq-server 
printf '\033[32m =================STRIPE================ \033[0;39m \n'
curl -s https://packages.stripe.dev/api/security/keypair/stripe-cli-gpg/public | gpg --dearmor | sudo tee /usr/share/keyrings/stripe.gpg
echo "deb [signed-by=/usr/share/keyrings/stripe.gpg] https://packages.stripe.dev/stripe-cli-debian-local stable main" | sudo tee -a /etc/apt/sources.list.d/stripe.list
sudo apt update -y
sudo apt install stripe -y
printf '\033[32m =================DOCKER ================ \033[0;39m \n'
for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do sudo apt-get remove $pkg; done
sudo apt-get update
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $DOCKER_CODE_NAME stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update -y
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo docker --version

printf '\033[32m =================KUBERNETES ================ \033[0;39m \n'

# INSTALL KUBECTL
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
# INSTALL MINIKUBE
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube

# INSTALL KUBE ADM
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.29/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.29/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update -y
sudo apt-get install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl 

# INSTALL KIND
# For AMD64 / x86_64
[ $(uname -m) = x86_64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.22.0/kind-linux-amd64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind

printf '\033[32m =================FILEZILLA ================ \033[0;39m \n'
sudo apt-get -y install filezilla filezilla-common
