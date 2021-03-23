FROM	alpine:3.12

RUN		apk update && apk upgrade

RUN		apk add nginx wget openrc \
		php7 php7-fpm php7-mysqli php7-xml php7-simplexml php7-json \
    	php7-iconv php7-tokenizer php7-xmlwriter php7-session php7-mbstring

RUN 	mkdir -p /run/nginx
COPY	./wordpress.conf /etc/nginx/conf.d/default.conf

WORKDIR /var/www/
RUN		wget http://wordpress.org/latest.tar.gz && \
		tar -xzvf latest.tar.gz && rm -rf latest.tar.gz
#		ln -s /usr/share/webapps/wordpress/ /var/www/localhost/htdocs/wordpress

COPY	./wp-config.php /var/www/wordpress

WORKDIR	/
COPY	./start_wp.sh ./
RUN		chmod +x start_wp.sh

EXPOSE	5050

CMD		sh start_wp.sh