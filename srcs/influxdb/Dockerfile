FROM	alpine:3.12

RUN		echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories

RUN 	apk update && apk upgrade
RUN		apk add openrc influxdb telegraf

COPY	./telegraf.conf /etc/

COPY	./check.sh /
COPY	./start_influxdb.sh /

CMD		sh start_influxdb.sh