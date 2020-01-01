#!/bin/bash

# MySQL
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'
sudo apt-get -y install mysql-server
sudo mysqladmin -uroot -proot create dbapp

echo "Updating mysql configs in /etc/mysql/my.cnf."
sudo sed -i "s/.*bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/my.cnf
echo "Updated mysql bind address in /etc/mysql/my.cnf to 0.0.0.0 to allow external connections."

sudo service mysql restart
sudo mysql -uroot -proot -e "CREATE USER 'dbking'@'%' IDENTIFIED BY 'dbking';"
sudo mysql -uroot -proot -e "GRANT ALL PRIVILEGES ON dbking.* TO 'dbking'@'%' WITH GRANT OPTION;"
