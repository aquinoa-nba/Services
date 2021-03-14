FROM	alpine:3.12

RUN		apk update
RUN		apk upgrade

RUN		apk add nginx openssl
RUN 	mkdir -p /run/nginx
COPY	./nginx.conf /etc/nginx/conf.d/default.conf

RUN		openssl req -newkey rsa:4096 \
		-x509 \
		-sha256 \
		-days 365 \
		-nodes \
		-keyout /etc/ssl/private/localhost.key \
		-out /etc/ssl/certs/localhost.crt

EXPOSE	80 443

CMD		start_nginx.sh
#ENTRYPOINT	nginx -g 'daemon off;'