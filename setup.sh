minikube stop
minikube delete
minikube start --vm-driver=virtualbox --cpus=4 --memory=4G --disk-size=50G
minikube addons enable metallb

eval $(minikube docker-env)
docker build -t nginx-image srcs/nginx
docker build -t wordpress-image srcs/wordpress
docker build -t mysql-image srcs/mysql
docker build -t phpmyadmin-image srcs/phpmyadmin

kubectl apply -f ./srcs/metallb.yaml
kubectl apply -f ./srcs/nginx/nginx.yaml
kubectl apply -f ./srcs/wordpress/wordpress.yaml
kubectl apply -f ./srcs/mysql/mysql.yaml
kubectl apply -f ./srcs/phpmyadmin/phpmyadmin.yaml

minikube dashboard
