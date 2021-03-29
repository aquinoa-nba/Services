minikube stop
minikube delete
minikube start --vm-driver=virtualbox --cpus=4 --memory=4G --disk-size=50G
minikube addons enable metallb
minikube addons enable dashboard

eval $(minikube docker-env)
docker build -t nginx-image srcs/nginx
docker build -t wordpress-image srcs/wordpress
docker build -t mysql-image srcs/mysql
docker build -t phpmyadmin-image srcs/phpmyadmin
docker build -t ftps-image srcs/ftps
docker build -t grafana-image srcs/grafana
docker build -t influxdb-image srcs/influxdb

kubectl apply -f ./srcs/metallb.yaml
kubectl apply -f ./srcs/nginx/nginx.yaml
kubectl apply -f ./srcs/wordpress/wordpress.yaml
kubectl apply -f ./srcs/mysql/mysql.yaml
kubectl apply -f ./srcs/phpmyadmin/phpmyadmin.yaml
kubectl apply -f ./srcs/ftps/ftps.yaml
kubectl apply -f ./srcs/grafana/grafana.yaml
kubectl apply -f ./srcs/influxdb/influxdb.yaml

minikube addons list
minikube dashboard
