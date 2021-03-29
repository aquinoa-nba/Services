FROM	alpine:3.12
EXPOSE	3306

RUN		echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories

RUN		apk update && apk upgrade
RUN		apk add openrc mysql mysql-client telegraf

COPY	./my.cnf /etc/my.cnf
COPY	./create_db.sql ./
COPY	./mysql-service.sql ./
COPY	./telegraf.conf /etc/

COPY	./start_mysql.sh /
COPY	./check.sh /

CMD		sh start_mysql.sh