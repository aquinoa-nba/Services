minikube stop
minikube delete
minikube start --vm-driver=virtualbox --cpus=4 --memory=4G --disk-size=50G

eval $(minikube docker-env)
minikube addons enable metallb

docker build -t nginx-image srcs/nginx
kubectl apply -f ./srcs/metallb.yaml
kubectl apply -f ./srcs/nginx/nginx.yaml

minikube dashboard
