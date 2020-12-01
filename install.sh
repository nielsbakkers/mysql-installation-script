#!/usr/bin/env bash

devide=$' \n'"---------------------------------------------------------------------"$'\n'

echo "$devide"

sudo apt update
sudo apt install mysql-server -y
sudo mysql_secure_installation
sudo apt install php libapache2-mod-php php-mysql -y

sudo apt update
sudo apt install phpmyadmin php-mbstring php-zip php-gd php-json php-curl -y
sudo phpenmod mbstring
sudo systemctl restart apache2

sudo mysql --execute='CREATE USER "*"@"%" IDENTIFIED WITH mysql_native_password BY "*";'
sudo mysql --execute='GRANT ALL PRIVILEGES ON *.* TO "*"@"%" WITH GRANT OPTION;'
