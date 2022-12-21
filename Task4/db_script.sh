#!/bin/bash

sudo apt-get update -y
sudo apt install mysql-client mysql-server -y

sudo mysql -u root -proot << EOF
CREATE DATABASE moodle DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
create user 'moodledude'@'%' IDENTIFIED BY 'passwordformoodledude';
GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,CREATE TEMPORARY TABLES,DROP,INDEX,ALTER ON moodle.* TO 'moodledude'@'%';
EOF

sudo ufw allow 3306
sudo chmod -R 777 /etc/mysql
sudo echo "[mysqld]
bind-address = 0.0.0.0" >> /etc/mysql/my.cnf
sudo service mysql restart
