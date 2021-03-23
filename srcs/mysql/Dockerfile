FROM	alpine:3.12

#RUN echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories

RUN		apk update && apk upgrade

RUN		apk add openrc mysql mysql-client \
		php7 php7-fpm php7-mysqli php7-xml php7-simplexml php7-json \
    	php7-iconv php7-tokenizer php7-xmlwriter php7-session php7-mbstring

#RUN		mkdir -p /run/mysqld

COPY	./my.cnf /etc/my.cnf
COPY	./create_db.sql ./
COPY	./mysql-service.sql ./

COPY	./start_mysql.sh ./
RUN		chmod +x start_mysql.sh

EXPOSE	3306

CMD		sh start_mysql.sh