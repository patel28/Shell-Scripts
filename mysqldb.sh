#!/bin/sh

echo -n "Mysql User:"
read user
echo -n "Password:"
read -s password
echo 
mysql -uroot -e "show databases;"
echo -n "Database name:"
read db_name

echo "1. Backup"
echo "2. Restore"
echo -n "Enter Your Choice:"
read cmd


if [ $cmd == "1" ]
then
        if [ -z $password ]
        then
        mysqldump -u${user} --databases ${db_name} > ${db_name}.sql
        else
        mysqldump -u${user} -p${password} ${db_name} > ${db_name}.sql
        fi
else
        echo "Restore Code"
fi
