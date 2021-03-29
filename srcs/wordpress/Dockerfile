FROM	alpine:3.12
EXPOSE	5050

RUN		echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories

RUN		apk update && apk upgrade

RUN		apk add nginx openrc telegraf \
		php7 php7-fpm php7-mysqli php7-xml php7-simplexml php7-json \
    	php7-iconv php7-tokenizer php7-xmlwriter php7-session php7-mbstring

RUN 	mkdir -p /run/nginx

WORKDIR /var/www/
RUN		wget http://wordpress.org/latest.tar.gz && \
		tar -xzvf latest.tar.gz && rm -rf latest.tar.gz

COPY	wordpress.conf /etc/nginx/conf.d/default.conf
COPY	wp-config.php /var/www/wordpress
COPY	telegraf.conf /etc/

WORKDIR	/
COPY	./check.sh .
COPY	./start_wp.sh .

CMD		sh start_wp.sh