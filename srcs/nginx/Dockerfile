FROM	alpine:3.12
EXPOSE	80 443

RUN		echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories

RUN		apk update && apk upgrade
RUN		apk add nginx openrc openssl telegraf

RUN 	mkdir -p /run/nginx

COPY	./nginx.conf /etc/nginx/conf.d/default.conf
COPY	./telegraf.conf /etc/

RUN		openssl req -newkey rsa:4096 \
    	-x509 \
    	-sha256 \
    	-days 365 \
    	-nodes \
    	-keyout /etc/ssl/private/localhost.key \
    	-out /etc/ssl/certs/localhost.crt \
		-subj "/C=RU/ST=Tatarstan/L=Kazan/O=21school/OU=Evolution/CN=localhost"

COPY	./start_nginx.sh /
COPY	./check.sh /

CMD		sh start_nginx.sh