openrc
touch /run/openrc/softlevel

/etc/init.d/telegraf start
/etc/init.d/mariadb setup
/etc/init.d/mariadb start
mysql < create_db.sql
mysql wordpress_db < mysql-service.sql
sh usr/share/mariadb/mysql.server start
tail -f /dev/null