openrc
touch /run/openrc/softlevel

rc-service -v php-fpm7 start
nginx -g 'daemon off;'