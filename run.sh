#!/bin/bash

# temp. start mysql to do all the install stuff
/usr/bin/mysqld_safe > /dev/null 2>&1 &

# ensure mysql is running properly
sleep 20 

# install pimcore if needed
if [ ! -d /var/www/pimcore ]; then
  # download & extract
  cd /var/www
  rm -r /var/www/*
  sudo -u www-data wget https://www.pimcore.org/download-5/pimcore-unstable.zip -O /tmp/pimcore.zip
  sudo -u www-data unzip /tmp/pimcore.zip -d /var/www/
  rm /tmp/pimcore.zip 

  echo "CREATE DATABASE project_database charset=utf8mb4;" | mysql
  echo "GRANT ALL PRIVILEGES ON *.* TO 'project_user'@'%' IDENTIFIED BY 'secretpassword' WITH GRANT OPTION;" | mysql

  sudo -u www-data /var/www/bin/console cache:clear
fi

# stop temp. mysql service
mysqladmin -uroot shutdown

exec supervisord -n
