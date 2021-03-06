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
	sudo apt install php libapache2-mod-php php-mcrypt php-mysql php-curl
	echo -e "\n\n************++ Installing PhpMyAdmin ++***********\n\n"
	sudo apt install phpmyadmin php-mbstring php-gettext
	sudo phpenmod mcrypt
	sudo phpenmod mbstring
	sudo service apache2 restart
elif [ "$SERVER" = "2" ]
then
	echo -e "\n\n************++ Installing Nginx ++***********\n\n"
	sudo apt install nginx -y
	echo -e "\n\n************++ Installing MySQL ++***********\n\n"
	sudo apt install mysql-server -y 
	mysql_secure_installation -y
	echo -e "\n\n************++ Installing PHP ++***********\n\n"
	sudo apt install php-fpm php-mysql php-zip php-curl php-mcrypt php-mbstring php-common php-cli php-json -y
	echo -e "\n\n************++ Installing PhpMyAdmin ++***********\n\n"
	sudo apt install phpmyadmin -y
	echo -e "\n\n************++ Adding Softlink ++***********\n\n"
	rand_str=$(date |  md5sum | cut -d"-" -f1 -)
	sudo    ln -s /usr/share/phpmyadmin/ /var/www/html/$rand_str
        echo -e "\n\n************++ PMA url ++***********\n\n"
        echo $rand_str
else 
	echo "Invalid Input"
	exit 1
fi







