# ft_services

echo -e "\033[37;1;41m MAKING DIRECTORIES \033[0m"
mkdir -p ~/goinfre/docker

echo -e "\033[37;1;41m BREW INSTALLING \033[0m"
curl -fsSL https://rawgit.com/kube/42homebrew/master/install.sh | zsh

echo -e "\033[37;1;41m BREW MOVE TO GOINFRE \033[0m"
mv .brew ./goinfre
ln -s ./goinfre/.brew .brew

echo -e "\033[37;1;41m MINIKUBE INSTALLING \033[0m"
brew remove minikube
rm -rf .minikube
rm -rf .kube
brew install minikube

удаляешь докер и виртуал машин
rm -rf ~/Library/Containers/com.docker.docker
ln -s ~/goinfre/docker ~/Library/Containers/com.docker.docker
качаешь докер и вирт машину

этим стартишь вирт машину
minikube start --vm-driver=virtualbox --memory 4096

mv .minikube ./goinfre/
ln -s ./goinfre/.minikube/ .minikube

brew install kubectl
