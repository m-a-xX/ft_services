# install a new minikube
minikube delete
minikube start
eval $(minikube docker-env)

# enable kubernetes dashboard
minikube addons enable dashboard

# install metallb and creaate deployment and speaker deamon
sh srcs/metallb/install.sh
kubectl create -f srcs/metallb/metallb.yaml

# deploy nginx cluster
docker build -t nginx srcs/nginx
kubectl apply -f srcs/nginx/nginx.yaml

# deploy ftps
docker build -t ftps srcs/ftps
kubectl apply -f srcs/ftps/ftps.yaml

docker build -t mysql srcs/mysql
kubectl apply -f srcs/mysql/mysql.yaml
