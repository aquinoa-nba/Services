openrc default
mysql_install_db

rc-service mariadb start

mysql < create_db.sql
mysql wordpress_db < mysql-service.sql

rc-service mariadb stop

/usr/bin/mysqld --datadir=/var/lib/mysql
