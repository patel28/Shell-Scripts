#!/bin/bash
echo -e "#############################################";
echo -e "\n\n************++ Updating Repos ++***********\n\n"
sudo apt update
echo -e "\n\n************++ Repos Updated ++***********\n\n"
echo -e "\n\n************++ Installing Server ++***********\n\n"

echo "Which Server You Want to Install?"
echo "1. Apache"
echo "2. NGINX"
read SERVER
if [ "$SERVER" = "1" ]
then
	echo -e "\n\n************++ Installing Apache ++***********\n\n"
	sudo apt install apache2
	echo -e "\n\n************++ Installing Mysql ++***********\n\n"
	sudo apt install mysql-server
	echo -e "\n\n************++ Securing Mysql ++***********\n\n"
	mysql_secure_installation
	echo -e "\n\n************++ Installing PHP ++***********\n\n"
	sudo apt install php libapache2-mod-php php-mcrypt php-mysql
	echo -e "\n\n************++ Installing PhpMyAdmin ++***********\n\n"
	sudo apt install phpmyadmin php-mbstring php-gettext
	sudo phpenmod mcrypt
	sudo phpenmod mbstring
elif [ "$SERVER" = "2" ]
then
	echo -e "\n\n************++ Installing Nginx ++***********\n\n"
	sudo apt install nginx
	sudo apt install mysql-server
	mysql_secure_installation
	sudo apt install php-fpm php-mysql
	sudo apt install phpmyadmin
else 
	echo "Invalid Input"
	exit 1
fi







