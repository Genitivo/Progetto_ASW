##!/usr/bin/env bash

sudo apt-get update
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password 1234'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password 1234'
sudo apt-get install -y vim curl python-software-properties
sudo apt-get update
sudo apt-get -y install mysql-server

echo "Creating new database libreria_asw";
mysql -uroot -p1234 --execute "CREATE DATABASE libreria_asw";
mysql -uroot -p1234 --execute "USE libreria_asw";
sudo mysql -u root -p1234 --execute "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '1234' with GRANT OPTION"
sudo mysql -u root -p1234 --execute "FLUSH PRIVILEGES"

sudo sed -i "s/.*bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/my.cnf

sudo service mysql restart
mysql -uroot -p1234 --execute "USE libreria_asw";
