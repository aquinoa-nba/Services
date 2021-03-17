FROM	alpine:3.12

RUN		apk update && apk upgrade

RUN		apk add nginx openssl openrc bash vim
RUN 	mkdir -p /run/nginx
#RUN		rm /etc/nginx/conf.d/default.conf
COPY	./nginx.conf /etc/nginx/conf.d/default.conf

RUN		openssl req -newkey rsa:4096 \
    	-x509 \
    	-sha256 \
    	-days 365 \
    	-nodes \
    	-keyout /etc/ssl/private/localhost.key \
    	-out /etc/ssl/certs/localhost.crt \
		-subj "/C=RU/ST=Tatarstan/L=Kazan/O=21school/OU=Evolution/CN=localhost"

EXPOSE	80 443

#WORKDIR /
#COPY	./start_nginx.sh /
#CMD		start_nginx.sh
CMD		["nginx","-g", "daemon off;"]
#ENTRYPOINT	nginx -g 'daemon off;'