FROM	alpine:3.12

RUN		apk update && apk upgrade

RUN		apk add nginx wget openrc \
		php7 php7-fpm php7-mysqli php7-xml php7-simplexml php7-json \
    	php7-iconv php7-tokenizer php7-xmlwriter php7-session php7-mbstring

RUN 	mkdir -p /run/nginx
COPY	./phpmyadmin.conf /etc/nginx/conf.d/default.conf

WORKDIR /var/www/
RUN		wget https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.tar.gz && \
		tar -xzvf phpMyAdmin-latest-all-languages.tar.gz && \
		rm -rf phpMyAdmin-latest-all-languages.tar.gz && \
		mv phpMyAdmin-5.1.0-all-languages phpmyadmin

COPY	./config.inc.php /var/www/phpmyadmin

WORKDIR	/
COPY	./start_phpmyadm.sh ./
RUN		chmod +x start_phpmyadm.sh

EXPOSE	5000

CMD		sh start_phpmyadm.sh