openrc
touch /run/openrc/softlevel

rc-service -v php-fpm7 start

/etc/init.d/telegraf start

nginx -g 'daemon off;'