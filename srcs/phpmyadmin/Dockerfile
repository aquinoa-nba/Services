FROM	alpine:3.12
EXPOSE	5000

RUN		echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories

RUN		apk update && apk upgrade

RUN 	mkdir -p /run/nginx

RUN		apk add nginx openrc openssl telegraf \
		php7 php7-fpm php7-mysqli php7-xml php7-simplexml php7-json \
    	php7-iconv php7-tokenizer php7-xmlwriter php7-session php7-mbstring

COPY	./phpmyadmin.conf /etc/nginx/conf.d/default.conf
COPY	./telegraf.conf /etc/

WORKDIR /var/www/
RUN		wget https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.tar.gz && \
		tar -xzvf phpMyAdmin-latest-all-languages.tar.gz && \
		rm -rf phpMyAdmin-latest-all-languages.tar.gz && \
		mv phpMyAdmin-5.1.0-all-languages phpmyadmin

COPY	./config.inc.php /var/www/phpmyadmin

RUN		openssl req -newkey rsa:4096 \
    	-x509 \
    	-sha256 \
    	-days 365 \
    	-nodes \
    	-keyout /etc/ssl/private/localhost.key \
    	-out /etc/ssl/certs/localhost.crt \
		-subj "/C=RU/ST=Tatarstan/L=Kazan/O=21school/OU=Evolution/CN=localhost"

WORKDIR	/
COPY	./start_phpmyadm.sh .
COPY	./check.sh .

CMD		sh start_phpmyadm.sh