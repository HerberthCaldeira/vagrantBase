#!/bin/bash

# MySQL
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'
sudo apt-get -y install mysql-server
sudo mysqladmin -uroot -proot create dbapp

sudo service mysql restart
sudo mysql -uroot -proot -e "CREATE USER 'dbking'@'%' IDENTIFIED BY 'dbking';"
sudo mysql -uroot -proot -e "GRANT ALL PRIVILEGES ON dbking.* TO 'dbking'@'%' WITH GRANT OPTION;"
